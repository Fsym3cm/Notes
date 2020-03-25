package com.chengzimm;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.*;

class MyCallable implements Callable<String>{

    @Override
    public String call() throws Exception {
        Thread.sleep(5000);
        return Thread.currentThread().getName();
    }
}

public class CallableDemo {

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

        Callable<String> callable = new MyCallable();
        List<Future> futureList = new ArrayList<>();
        for (int i = 0; i < 10; i++){
            // 提交任务到线程池
            Future<String> future = executor.submit(callable);
            // 将返回的结果添加到list里面
            futureList.add(future);
        }
        for (Future<String> future : futureList){
            try {
                System.out.println(future.get() + " :: " + new Date());
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }
        }
        // 关闭线程池
        executor.shutdown();
        System.out.println("所有线程执行完毕");
    }
}
