package com.chengzimm;

class Singleton {
    private static volatile Singleton singleton;

    private Singleton(){

    }

    public static Singleton getSingleton(){
        //先判断对象是否已经实例化，没有实例化再进入加锁代码块
        if (singleton == null){
            //类对象加锁
            synchronized (Singleton.class){
                if (singleton == null)
                    singleton = new Singleton();
            }
        }
        return singleton;
    }

    public static void main(String[] args) {
        System.out.println(getSingleton() == getSingleton());
    }
}
