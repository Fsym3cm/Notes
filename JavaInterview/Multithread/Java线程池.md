# Java线程池

### 一，使用线程池的好处

池化技术的思想就是减少每次获取资源的消耗，提高对资源的利用率。

线程池提供了一种限制和管理资源(包括执行一个任务)。每个线程池还维护一些基本统计信息，例如已完成任务的数量。其好处如下：

- **降低资源消耗**：通过重复利用已创建的线程降低线程创建和销毁造成的消耗。
- **提高响应速度：**当任务到达时，任务可以不需要等到线程创建就能执行。
- **提高线程的可管理性：**线程是稀缺资源，如果无限制的创建，不仅会消耗系统资源，还会降低系统的稳定性，使用线程池可以进行统一的分配，调优和监控。

### 二，Executor框架

#### 2.1，简介

Executor框架是`Java5`之后引进的，在Java 5之后，通过Executor来启动线程比使用Thread的start方法更好，除了更易管理，效率更好(用线程池实现，节约开销)外，还有助于避免this逃逸问题。

this逃逸是指在构造函数返回之前其他线程就持有该对象的引用，调用尚未构造完全的对象的方法可能引发令人疑惑的问题。

Executor框架不仅包括了线程池的管理，还提供了线程工厂，队列以及拒绝策略等，简化了并发编程的难度。

#### 2.2，Executor框架结构(三大部分组成)

1. **任务**

   执行任务需要实现的Runnable接口或Callable接口，它们的实现类都可以被`ThreadPoolExecutor`或`ScheduledThreadPoolExecutor`执行。

2. **任务的执行**

   如下图所示，包括任务执行机制的核心接口Executor，以及继承Executor接口的`ExecutorService`接口。`ThreadPoolExecutor`或`ScheduledThreadPoolExecutor`这两个关键类实现了`ExecutorService`接口。

   **在实际开发中，我们需要关注`ThreadPoolExecutor`类。**

   ![](..\Photo\Executor.png)

3. **异步计算的结果(Future)**

   Future接口以及Future接口的实现类`FutureTask`类都可以代表异步计算的结果。

   当我们把Runnable接口或Callable接口的实现类提交给`ThreadPoolExecutor`或`ScheduledThreadPoolExecutor`执行。(调用submit()方法时会返回一个`FutureTask`对象)

#### 2.3，Executor框架的使用示意图

![](../Photo/Executor.jfif)

1. **主线程首先要创建实现Runnable或者Callable接口的任务对象。**

2. **把创建完成的实现Runnable/Callable接口的对象直接交给`ExecutorService`执行。**

   `ExecutorService.execute（Runnable command）`）或者也可以把 `Runnable` 对象或`Callable` 对象提交给 `ExecutorService` 执行（`ExecutorService.submit（Runnable task）`或 `ExecutorService.submit（Callable  task）`）。

3. **如果执行`ExecutorService.submit（…）`，`ExecutorService`将返回一个实现Future接口的对象**。`submit()`会返回一个 `FutureTask 对象）。由于 FutureTask` 实现了 `Runnable`，我们也可以创建 `FutureTask`，然后直接交给 `ExecutorService` 执行

4. **最后，主线程可以执行`FutureTask.get()`方法来等待任务执行完成。主线程也可以执行`FutureTask.cancel（boolean mayInterruptIfRunning）`来取消此任务的执行。**

### 三，(重要)`ThreadPoolExecutor`类简单介绍

**线程池实现类`ThreadPoolExecutor`是Executor框架最核心的类。**

#### 3.1，`ThreadPoolExecutor`类分析

`ThreadPoolExecutor`类中提供四个构造方法。我们来看最长的那个，其余三个都是在这个构造方法的基础上产生（其他几个构造方法说白点都是给定某些默认参数的构造方法比如默认制定拒绝策略是什么）。

```java
// 用给定的初始参数创建一个新的ThreadPoolExecutor
public ThreadPoolExecutor(int corePoolSize,//线程池的核心线程数量
                          int maximumPoolSize,//线程池的最大线程数
                          long keepAliveTime,//当线程数大于核心线程数时，多余的空闲线程存活的最长时间
                          TimeUnit unit,//时间单位
                          BlockingQueue<Runnable> workQueue,//任务队列，用来储存等待执行任务的队列
                          ThreadFactory threadFactory,//线程工厂，用来创建线程，一般默认即可
                          RejectedExecutionHandler handler//拒绝策略，当提交的任务过多而不能及时处理时，我们可以定制策略来处理任务
                         ) {
    if (corePoolSize < 0 ||
        maximumPoolSize <= 0 ||
        maximumPoolSize < corePoolSize ||
        keepAliveTime < 0)
        throw new IllegalArgumentException();
    if (workQueue == null || threadFactory == null || handler == null)
        throw new NullPointerException();
    this.corePoolSize = corePoolSize;
    this.maximumPoolSize = maximumPoolSize;
    this.workQueue = workQueue;
    this.keepAliveTime = unit.toNanos(keepAliveTime);
    this.threadFactory = threadFactory;
    this.handler = handler;
}
```

**`ThreadPoolExecutor`三个最重要的参数：**

- `corePoolSize`：核心线程数，它定义了最小可以同时运行的线程数量。
- `maximumPoolSize`：当队列中存放的任务达到队列容量时，当前可以同时运行的线程数量的最大数量。
- `workQueue`：当新任务来的时候会先判断当前运行的线程数量是否达到核心线程数，如果达到的话，线程就会被存放在队列中。

`ThreadPoolExecutor`其他常见参数:

1. `keepAliveTime`:当线程池中的线程数量大于 `corePoolSize` 的时候，如果这时没有新的任务提交，核心线程外的线程不会立即销毁，而是会等待，直到等待的时间超过了 `keepAliveTime`才会被回收销毁；
2. `unit` : `keepAliveTime` 参数的时间单位。
3. `threadFactory` :executor 创建新线程的时候会用到。
4. `handler` :饱和策略。详细见下文。

线程池中各个参数的相互关系

![](../Photo/ThreadPoolExecutor.jfif)

**`ThreadPoolExecutor`饱和策略定义**

如果同时运行的线程数量达到最大线程数量并且队列也已经被放满时，`ThreadPoolExecutor`定义的一些策略：

- `ThreadPoolExecutor.AbortPolicy`：抛出`RejectedExecutionException`来拒绝新任务的处理。
- `ThreadPoolExecutor.CallerRunsPolicy`：调用执行自己的线程运行任务，也就是直接在调用execute()方法的线程中运行被拒绝的任务，如果执行程序已关闭，则会丢弃该任务。因此这种策略会降低对于新任务提交速度，影响程序的整体性能。另外，这个策略能够增加队列容量。如果设计的应用程序可以承受此延迟并且你不能丢弃任何一个任务请求的话，可以选择该策略。
- `ThreadPoolExecutor.DiscardPolicy`：不处理新任务，直接丢弃掉。
- `ThreadPoolExecutor.DiscardOldestPolicy`：此策略将丢弃最早未处理的任务请求。

例如：Spring 通过 `ThreadPoolTaskExecutor` 或者我们直接通过 `ThreadPoolExecutor` 的构造函数创建线程池的时候，当我们不指定 `RejectedExecutionHandler` 饱和策略的话来配置线程池的时候默认使用的是 `ThreadPoolExecutor.AbortPolicy`。在默认情况下，`ThreadPoolExecutor` 将抛出 `RejectedExecutionException` 来拒绝新来的任务 ，这代表你将丢失对这个任务的处理。 对于可伸缩的应用程序，建议使用 `ThreadPoolExecutor.CallerRunsPolicy`。当最大池被填满时，此策略为我们提供可伸缩队列。

#### 3.2，推荐使用`ThreadPoolExecutor` 构造函数创建线程池

