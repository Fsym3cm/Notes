# Java 并发基础知识

### 一，进程和线程

#### 1.1，何为进程？

进程是程序的异常执行过程，是系统运行程序的基本单位，因此进程是动态的。系统运行一个程序即是一个进程从创建，运行到消亡的过程。

在Java中，当我们启动main函数就是启动了一个`JVM`的进程，而main函数所在的的线程就是这个进程中的一个线程，也称主线程。

#### 1.2，何为线程？

线程和进程相似，但线程是一个比进程更小的执行单位。一个进程在其执行的过程中可以产生多个线程。与进程不同是同类的**多个线程共享进程的堆和方法区和资源**，但每个线程有自己的**程序计数器，虚拟机栈和本地方法栈**，所以系统在产生一个线程，或者是在各个线程之间切换工作时，负担要比进程小得多，也正因为如此，线程也被称为轻量级进程。

我们可以通过`JMX`来查看一个普通的Java程序有哪些线程，代码如下：

```java
public class MultiThread  {
    public static void main(String[] args) {
        // 获取 Java 线程管理 MXBean
        ThreadMXBean threadMXBean = ManagementFactory.getThreadMXBean();
        // 不需要获取同步的 monitor 和 synchronizer 信息，仅获取线程和线程堆栈信息
        ThreadInfo[] threadInfos = threadMXBean.dumpAllThreads(false, false);
        for (ThreadInfo threadInfo : threadInfos){
            System.out.println(threadInfo.getThreadId() + ": " + threadInfo.getThreadName());
        }
    }
}
```

运行结果：

```java
6: Monitor Ctrl-Break //监听中断信号（idea才会产生）
5: Attach Listener    //添加监听器
4: Signal Dispatcher  //分发处理给 JVM 信号的线程
3: Finalizer          //调用对象 finalize 方法的线程
2: Reference Handler  //清除 reference 线程
1: main               //main 线程,程序入口
```

从输出结果可以看出：**一个Java程序的运行是main线程和多个其他线程同时运行**。

#### 1.3，从`JVM`角度说线程和进程之间的关系

##### 1.31，图解进程和线程的关系

![](../Photo/JavaRAM.png)

从上图可以看出：**一个进程中可以有多个线程，多个线程共享进程的堆和方法区(`JDK1.8`之后的元空间)资源，但是每个线程都有自己的程序计数器，虚拟机栈和本地方法栈**。

##### 1.3.2，程序计数器为什么是私有的？

程序计数器主要有下面两个作用：

1. 字节码解释器通过改变程序计数器来依次读取指令，从而实现代码的流程控制，如：顺序执行，选择，循环，异常处理。
2. 在多线程的情况下，程序计数器用于记录当前线程执行的位置，从而当线程被切换回来的时候能够知道该线程上次运行到哪儿了。

如果执行的是native方法，那么程序计数器记录的是undefined地址，只有执行的是Java代码是程序计数器记录的才是下一条指令的地址。

所以，程序器私有主要是为了**线程切换后能恢复到正确的执行位置**。

##### 1.3.3，虚拟机栈和本地方法栈为什么是私有的？

- 虚拟机栈：每个Java方法在执行的同时会创建一个栈帧用于存储局部变量表，操作数栈，常量池引用等信息。从方法调用直到执行完成的过程，就对应着一个栈帧在Java虚拟机栈中入栈和出栈的过程。
- 本地方法栈：和虚拟机栈所发挥的作用非常相似，区别是：**虚拟机栈为虚拟机执行Java方法(也就是字节码)服务，而本地方法栈则为虚拟机使用到的Native方法服务**。

所以，为了**保证线程中局部变量不被别的线程访问到**，虚拟机栈和本地方法栈是线程私有化的。

##### 1.3.4，一句话简单概括堆和方法区

堆和方法区是所有线程共享的资源，其中堆是进程中最大的一块内存，主要用于存放新创建的对象(所有的对象都在这里分配内存)，方法区主要用于存放已被加载的类信息，常量，静态变量，即时编译器编译后的代码等数据。

### 二，多线程并发编程

#### 2.1，并发与并行概念解读

- 并发：同一时间段内，多个任务都在执行(单位时间内不一定同时执行)。
- 并行：单位时间内，多个任务同时执行。

#### 2.2，为什么要使用多线程？

先从整体来说：

- 从计算机底层来说：线程可以比作是轻量级的进程，是程序执行的最小单位，线程简单切换和调度的成本远远小于进程。另外，多核CPU时代意味着多个线程可以同时运行，这减小了线程上下文切换的开销。
- 从当代换联网发展趋势来说：现在的系统动不动就要求百万级甚至千万级的并发量，而多线程并编程正是开发高并发系统的基础，利用好多线程机制可以大大提高系统整体的并发能力以及性能。

再深入到计算机底层来探讨：

- 单核时代：在单核时代多线程主要是为了提高CPU和IO设备的总和利用率。举个例子：当只有一个线程的时候会导致 CPU 计算时，IO 设备空闲；进行 IO 操作时，CPU 空闲。我们可以简单地说这两者的利用率目前都是 50%左右。但是当有两个线程的时候就不一样了，当一个线程执行 CPU 计算时，另外一个线程可以进行 IO 操作，这样两个的利用率就可以在理想情况下达到 100%了。
- 多核时代：多核时代多线程主要是为了提高CPU利用率。举个例子：假如我们要计算一个复杂的任务，我们只用一个线程的话，CPU 只会一个 CPU 核心被利用到，而创建多个线程就可以让多个 CPU 核心被利用到，这样就提高了 CPU 的利用率。

2.3，使用多线程可能带来的问题

并发编程的目的九十为了提高程序的执行效率提高程序运行速度，但是并发编程并不总是能提高程序运行速度点，而且并发编程可能会遇到很多问题，比如：内存泄漏，上下文切换，死锁还有受限于硬件和软件的资源闲置问题。

### 三，线程的创建与运行

前面两种实际很少用到，一般都是用线程池的方式比较多一点。

#### 3.1 继承Thread类和实现Runnable 的方式

```java
class MyThread extends Thread{

    @Override
    public void run() {
        super.run();
        System.out.println("MyThread");
    }
}

class MyRunnable implements Runnable{

    @Override
    public void run() {
        System.out.println("MyRunnable");
    }
}

public class Run{
    public static void main(String[] args) {
        MyThread myThread = new MyThread();
        myThread.start();

        MyRunnable runnable = new MyRunnable();
        Thread thread = new Thread(runnable);
        thread.start();
//        new Thread(runnable).start();
        
        System.out.println("运行结束");
    }
}

```

运行结果：

```java
运行结束
MyThread
MyRunnable
```

#### 3.2，使用线程池的方式

使用线程池的方式也是最推荐的一种方式，另外，《阿里巴巴 Java 开发手册》在第一章第六节并发处理这一部分也强调到“线程资源必须通过线程池提供，不允许在应用中自行显示创建线程”。

### 四，线程的生命周期和状态

Java线程在运行的生命周期中的指定时刻只可能处于下面6种不同状态的其中一种状态。

![](../Photo/LifeCycle.png)

线程在生命周期中并不是固定处于某一个状态而是随着代码的执行在不同状态之间切换。

![](../Photo/StateChange.png)

由上图可以看出：线程创建之后它将会处于NEW(新建状态)，调用start()方法后开始运行，线程这时候处于READY(可运行状态)。可运行状态的线程获得了CPU时间片后就处于RUNNING(运行)状态。

操作系统隐藏Java虚拟机(`JVM`)中的RUNNABLE和RUNNING状态，它只能看到RUNNABLE状态，所以Java系统一般将这两个状态统称为RUNNABLE(运行中)状态。

当线程执行wait()方法之后，线程进入WAITING(等待)状态。进入等待状态的线程需要依靠其他线程的通知才能返回运行状态，而TIME_WAITING(超市等待)状态相当于在等待的基础上增加了超时限制，比如通过`sleep(long millis)`方法或`wait(long milis)`方法可以将Java线程置于TIME_WAITING状态。当超时时间到达后Java线程将会返回到RUNNABLE状态。当线程调用同步方法时，在没有获取到锁的情况下，线程将会进入带BLOCKED(阻塞)状态。线程在执行Runnable的run()方法之后将会进入到TERMINATED(终止)状态。

### 五，线程优先级

理论上来说系统会根据优先级来决定首先是哪个线程进入运行状态。当CPU比较闲的时候，设置线程优先级几乎不会有任何作用，而且很多操作系统压根不会理会你设置的线程优先级，所以不要让让业务过度依赖于线程的优先级。

另外，现场优先级具有继承特性比如A线程启动B线程，则B线程的优先级和A是一样的。线程优先级还具有随机性也就是说线程优先级高的不一定每一次斗仙执行完。

Thread类中包含的成员变量代表了线程的某些优先级。比如`Thread.MIN_PRIORITY`(常数1),`Thread.NORM_PRIORITY`(常数1),`Thread.MAX_PRIORITY`(常数1)。其中每个线程的优先级都在1到10之间，默认情况下优先级都是`Thread.NORM_PRIORITY`(常数5)。

**一般情况下，不会对象池设定优先级别，更不会让某些严重地依赖线程的优先级别，比如权重，借助优先级设定某个任务的权重吗，这种方式是不可取的，一般定义线程的时候使用默认的优先级就好了。**

相关方法：

```java
public final void setPriority(int newPriority) //为线程设定优先级
public final int getPriority() //获取线程的优先级
```

设置线程优先级方法源码：

```java
public final void setPriority(int newPriority) {
    ThreadGroup g;
    checkAccess();
    // 线程优先级不能小于1也不能大于10，否则会抛出异常
    if (newPriority > MAX_PRIORITY || newPriority < MIN_PRIORITY) {
        throw new IllegalArgumentException();
    }
    // 如果指定的线程优先级大于该线程所在现场组的最大优先级，那么该线程的优先级设为该线程组的最大优先级
    if((g = getThreadGroup()) != null) {
        if (newPriority > g.getMaxPriority()) {
            newPriority = g.getMaxPriority();
        }
        setPriority0(priority = newPriority);
    }
}
```

### 六，守护线程和用户线程

#### 守护线程和用户线程简介：

- 用户线程：运行在前台，执行具体的任务，比如程序的主线程，连接网络的子线程等都是用户线程。
- 守护线程：运行在后台，为其他前台线程服务，也可以说守护线程是`JVM`中非守护现代的“佣人”。一旦所有用户线程都结束运行，守护线程会随`JVM`一起结束工作。

main函数所在的线程就是一个用户线程，main函数启动的同时在`JVM`的内部同时还启动了很多守护线程，比如说垃圾回收线程。

#### 那么守护线程和用户线程有什么区别？

比较明显的区别之一是用户线程结束，`JVM`退出，不管这个时候有没有守护线程运行。而守护线程不会影响`JVM`的退出。

#### 注意事项：

1. `setDaemon(true)`必须在`start()`方法前执行，否则会抛出`IllegalThreadStateException`异常。
2. 在守护线程中产生的新线程也是守护线程。
3. 不是所有的任务都可以分配给守护线程来执行，比如读写操作或者计算逻辑。
4. 守护(Daemon)线程中不能依靠finally块的内容来确保执行关闭或者清理资源的逻辑。因为一旦所有的用户线程都结束运行，守护线程会随`JVM`一起结束工作，所以守护线程中的finally语句块可能无法被执行。

### 七，上下文切换

多线程编程中一般线程的个数都大于CPU核心的个数，而一个CPU核心在任意时刻只能被一个线程使用，为了让这些线程都能得到有效执行，CPU采取的策略是为每个线程分配时间片并轮转的形式。当一个线程的时间片用完的时候就会重新处于就绪状态让其他线程使用，这个过程就属于一次上下文切换。

概括来说就是：当任务在执行完CPU时间片切换到另一个任务之前会先保存自己的状态，以便下次再切换回这个任务时，可以再加载这人任务的状态。**任务从保存到在加载的过程就是一次上下文切换**。

上下文切换通常是计算密集型的。也就是说，他需要相当客观的处理器时间，在每秒几十上百次的切换中，每次切换都需要纳秒量级的时间。所以，上下文切换对系统来说意味着消耗大量的CPU时间，事实上，可能是操作系统中时间消耗最大的操作。

Linux相比于其他的操作系统(包括其他类Unix系统)有很多优点，其中一项就是，去上下文切换和模式切换的时间消耗非常少。

### 八，线程死锁

#### 认识线程死锁

多个线程同时被阻塞，他们中的一个或者全部都在等待某个资源被释放。由于线程被无限期的阻塞，因此程序不可能正常终止。

如下图所示，线程A持有资源2，线程B持有资源1，他们同时都想申请对方的资源，所以这两个线程就会像等待而进入死锁状态。

![](../Photo/Deadlock.png)

下面这个例子模拟上图死锁的情况。

```java
public class Deadlock {

    private static Object resource1 = new Object();//资源 1
    private static Object resource2 = new Object();//资源 2

    /*必须要写sleep*/
    public static void main(String[] args) {
        new Thread(() ->{
            synchronized (resource1){
                System.out.println(Thread.currentThread() + "得到资源一");
                try {
                    Thread.sleep(1000);
//                    resource1.wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println(Thread.currentThread() + "等待资源二");
                synchronized (resource2){
//                    resource2.notify();
                    System.out.println(Thread.currentThread() + "得到资源二");
                }
            }
        }, "线程一").start();

        new Thread(() -> {
            synchronized (resource2){
                System.out.println(Thread.currentThread() + "得到资源二");
                try {
                    Thread.sleep(1000);
//                    resource2.wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println(Thread.currentThread() + "等待资源一");
                synchronized (resource1){
//                    resource1.notify();
                    System.out.println(Thread.currentThread() + "得到资源一");
                }
            }
        }, "线程二").start();
    }
}

```

运行结果：

```java
Thread[线程二,5,main]得到资源二
Thread[线程一,5,main]得到资源一
Thread[线程一,5,main]等待资源二
Thread[线程二,5,main]等待资源一
```

线程A通过`synchronized(resource1)`获得`resource1`的监视器锁，然后通过`Thread.sleep(1000)`；让线程休眠`1s`，为的是让线程B得到执行然后或缺到`resource2`的监视器锁。线程A和线程B休眠都结束了都开始试图请求获取对方的资源，然后然后两个线程就会陷入互相等待的状态，这也就产生了死锁。上面例子符合产生死锁的四个必要条件。

1. 互斥条件：该资源任意一个时刻只由一个线程占用。
2. 请求与保持条件：一个进程因请求资源而阻塞时，对已获得的资源保持不放。
3. 不剥夺条件：线程已获得的资源在未使用完之前不能被其他线程强行剥夺，只有自己使用完毕后才释放资源。
4. 循环等待条件：若干进程之间形成一种头尾相接的循环等待资源关系。

#### 如何预防线程死锁？

我们只要破坏产生死锁的四个条件中的其中一个就可以了。

**破坏互斥条件**

这个条件我们没有办法破坏，以为内我们用锁本来就是想让他们互斥(临界资源需要互斥访问)。

**破坏请求与保持条件**

一次性申请所有的条件。

**破坏不剥夺条件**

占用部分资源的线程进一步申请其他资源时，如果申请不到，可以主动释放它占有的资源。

**破坏循环等待条件**

靠按序申请资源来预防。按某一顺序申请资源，释放资源则反序释放。

```java
public class Deadlock {

    private static Object resource1 = new Object();//资源 1
    private static Object resource2 = new Object();//资源 2

    /*必须要写sleep*/
    public static void main(String[] args) {
        new Thread(() ->{
            synchronized (resource1){
                System.out.println(Thread.currentThread() + "得到资源一");
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println(Thread.currentThread() + "等待资源二");
                synchronized (resource2){
                    System.out.println(Thread.currentThread() + "得到资源二");
                }
            }
        }, "线程一").start();

        new Thread(() -> {
            synchronized (resource1){
                System.out.println(Thread.currentThread() + "得到资源一");
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println(Thread.currentThread() + "等待资源二");
                synchronized (resource2){
                    System.out.println(Thread.currentThread() + "得到资源二");
                }
            }
        }, "线程二").start();
    }
}
```

运行结果：

```java
Thread[线程一,5,main]得到资源一
Thread[线程一,5,main]等待资源二
Thread[线程一,5,main]得到资源二
Thread[线程二,5,main]得到资源一
Thread[线程二,5,main]等待资源二
Thread[线程二,5,main]得到资源二
```

或者使用`wait()`和`notif()`使资源访问安装规定顺序来访问(详见上份代码注释)。