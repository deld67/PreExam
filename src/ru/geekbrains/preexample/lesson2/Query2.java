package ru.geekbrains.preexample.lesson2;

import java.util.ArrayList;
import java.util.LinkedList;

/*2.	Реализовать основные методы ArrayList.*/
/*удаление элемента с позицией pos  */
public class Query2 {

    private T[] array;

    public void  deleNfromPos( int pos){
        if ( array.length < pos ){
            return ;
        }
        for (int i = pos; i < array.length-1; i++ ){
            array[i] = array[i++];
        }
        array[array.length] = null;
    }

}
