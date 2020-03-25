package com.chengzimm;

import java.util.Date;
import java.util.concurrent.*;

//  这是一个简单的Runnable类，需要大约5秒钟来执行其任务。
class MyRunnable1 implements Runnable{

    private String command;

    public MyRunnable1(String s){
        this.command = s;
    }

    @Override
    public void run() {
        System.out.println(Thread.currentThread().getName() + " 开始时间：" + new Date());
        ProcessCommand();
        System.out.println(Thread.currentThread().getName() + " 结束时间：" + new Date());
    }

    public void ProcessCommand(){
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String toString() {
        return this.command;
    }
}

public class ThreadPoolExecutorDemo {

    private static final int CORE_POOL_SIZE = 5;//核心线程数
    private static final int MAX_POOL_SIZE = 10;//最大线程数
    private static final int QUEUE_CAPACITY = 100;//任务队列容量为 100;
    private static final Long KEEP_ALIVE_TIME = 1L;//等待时间为1L
    public static void main(String[] args) {
        // 通过ThreadPoolExecutor构造函数自定义参数创建
        ThreadPoolExecutor executor = new ThreadPoolExecutor(
                CORE_POOL_SIZE,
                MAX_POOL_SIZE,
                KEEP_ALIVE_TIME,
                TimeUnit.SECONDS,//等待时间的单位为 TimeUnit.SECONDS。
                new ArrayBlockingQueue<>(QUEUE_CAPACITY),
                new ThreadPoolExecutor.CallerRunsPolicy());

        for (int i = 0; i < 10; i++){
            // 创建Worker对象（WorkerThread类实现了Runnable 接口）
            Runnable worker = new MyRunnable1("" + i);
            // 执行Runnable
            executor.execute(worker);

        }
        // 终止线程池
        executor.shutdown();
        while (!executor.isTerminated()){
        }
        System.out.println("所有线程执行完毕");
    }

}
