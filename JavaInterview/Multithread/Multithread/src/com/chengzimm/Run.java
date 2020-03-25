package com.chengzimm;

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
    public static void main(String[] args) throws InterruptedException {
        MyThread myThread = new MyThread();
        myThread.start();

        MyRunnable runnable = new MyRunnable();
        Thread thread = new Thread(runnable);
        thread.start();

//        new Thread(runnable).start();
        System.out.println("运行结束");
    }
}
