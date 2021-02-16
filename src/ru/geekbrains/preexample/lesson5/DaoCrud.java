package ru.geekbrains.preexample.lesson5;

import java.util.List;

public interface DaoCrud<T> {
    public  T indById(Long Id);
    public List<T> findAll();
    public Integer countAll();
    public void delete(Long Id);
    public void create(T element);
    public void modify(Long Id, T el);
}
