package ru.geekbrains.preexample.lesson3;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Lock;

/*Реализовать потокобезопасный счетчик с помощью интерфейса Lock.*/
public class Query2 implements Runnable{
    private Lock lock;
    private int counter = 0;

    @Override
    public void run() {
        try {
            if (lock.tryLock(10, TimeUnit.SECONDS)){
                counter++;
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }finally {
            lock.unlock();
        }
        System.out.println("Counter = "+counter);
    }
}
