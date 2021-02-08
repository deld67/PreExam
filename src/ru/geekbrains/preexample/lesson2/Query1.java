package ru.geekbrains.preexample.lesson2;



/*1.	Реализовать основные методы связанного списка.*/

/*Метод добавления элеменат в заданную позицию. */

import java.util.List;

public class Query1 {
    class Node {
        String data;
        Node next;

        public Node(String data)
        {
            this.data = data;
        }

    }
    class LinkedList {

        Node h;
        public Node addByPos(int pos, String val){
            if (h == null && pos !=  0 ){
                return null;
            }


            if (h==null && pos == 0){
                h.data = val;
            }else{

                if (pos = 0){
                    Node tmp = h;
                    h.data = val;
                    h.next = tmp;
                }else{
                    for (int i = 0; h != null && i <pos-1; i++ )
                        h = h.next;
                        Node tmp = h;
                        tmp.data = val;
                        tmp.next = h.next;
                        h.next = tmp;
                }
            }
            return h;
        }
    }

}