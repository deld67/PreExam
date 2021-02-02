package ru.geekbrains.preexample.lesson1;

/*Написать пример кода, который реализует принцип полиморфизма, на примере фигур — круг, квадрат, треугольник.*/
public class Query3 {
    class Shape{
        public void drow(){}
    }

    public class Circle extends Shape{
        @Override
        public void drow(){
            System.out.println("Drow Circle");
        }
    }
    public class Square extends Shape{
        @Override
        public void drow(){
            System.out.println("Drow Square");
        }
    }
    public class Triangle extends Shape{
        @Override
        public void drow() {
            System.out.println("Drow Triangle");
        }
    }
}
