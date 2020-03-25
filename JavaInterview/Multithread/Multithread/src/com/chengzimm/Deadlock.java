package com.chengzimm;

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
