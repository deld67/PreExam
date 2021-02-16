package ru.geekbrains.preexample.lesson5;

import java.io.Serializable;
import java.util.List;

public class AbstractDaoCrud<T, ID extends Serializable> implements DaoCrud {
    protected Class<T> typeClass;
    protected Class<ID> idClass;

    public AbstractDaoCrud(Class<T> typeClass, Class<ID> idClass) {
        this.typeClass = typeClass;
        this.idClass = idClass;
    }
    
    @Override
    public Object indById(Long Id) {
        return null;
    }

    @Override
    public List findAll() {
        return null;
    }

    @Override
    public Integer countAll() {
        return null;
    }

    @Override
    public void delete(Long Id) {

    }

    @Override
    public void create(Object element) {

    }

    @Override
    public void modify(Long Id, Object el) {

    }
}
