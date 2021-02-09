package ru.geekbrains.preexample.lesson3;
/*Реализовать программу, в которой два потока поочередно пишут ping и pong.*/
public class Query1 {
    synchronized void print(String value){
        System.out.println(value);
    }

    public static void main(String[] args) {
        Query1 q = new Query1();

        new Thread(new Runnable() {
            @Override
            public void run() {
                while(true) {
                    q.print( "Ping" );
                    try {
                        Thread.sleep(100);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }

                }
            }
        }).start();

        new Thread(new Runnable() {
            @Override
            public void run() {
                while(true) {
                    q.print( "Pong" );
                    try {
                        Thread.sleep(100);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }

                }
            }
        }).start();


    }
}
