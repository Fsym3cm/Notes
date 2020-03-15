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

![](..\Photo\JavaRAM.png)

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

![](..\Photo\LifeCycle.png)

线程在生命周期中并不是固定处于某一个状态而是随着代码的执行在不同状态之间切换。

![](..\Photo\StateChange.png)

由上图可以看出：线程创建之后它将会处于NEW(新建状态)，调用start()方法后开始运行，线程这时候处于READY(可运行状态)。可运行状态的线程获得了CPU时间片后就处于RUNNING(运行)状态。

操作系统隐藏Java虚拟机(`JVM`)中的RUNNABLE和RUNNING状态，它只能看到RUNNABLE状态，所以Java系统一般将这两个状态统称为RUNNABLE(运行中)状态。

当线程执行wait()方法之后，线程进入WAITING(等待)状态。进入等待状态的线程需要依靠其他线程的通知才能返回运行状态，而TIME_WAITING(超市等待)状态相当于在等待的基础上增加了超时限制，比如通过`sleep(long millis)`方法或`wait(long milis)`方法可以将Java线程置于TIME_WAITING状态。当超时时间到达后Java线程将会返回到RUNNABLE状态。当线程调用同步方法时，在没有获取到锁的情况下，线程将会进入带BLOCKED(阻塞)状态。线程在执行Runnable的run()方法之后将会进入到TERMINATED(终止)状态。

### 五，线程优先级