package java.ru.geekbrains.preexample.lesson5;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.io.Serializable;
import java.util.List;

public class AbstractDaoCrud<T, ID extends Serializable> implements DaoCrud {
    protected Class<T> typeClass;
    protected Class<ID> idClass;
    protected SessionFactory factory;
    protected String qstring;
    protected Session session;


    public AbstractDaoCrud(Class<T> typeClass, Class<ID> idClass ) {
        this.typeClass = typeClass;
        this.idClass = idClass;
        this.factory = getSessionFactory();
        this.qstring = "from "+typeClass.getSimpleName();
        this.session = factory.getCurrentSession();
    }

    private SessionFactory getSessionFactory(){
        return new Configuration()
                .configure("hibernate.cfg.xml")
                .buildSessionFactory();
    }

    @Override
    public Object indById(Long Id ) {
        try {
            session.beginTransaction();
            return session.get( this.typeClass, Id );
        }finally {
            session.getTransaction().commit();
        }
    }

    @Override
    public List findAll() {
        try {
            session.beginTransaction();
            Query query =  session.createQuery( this.qstring );
            return query.list();
        }finally {
            session.getTransaction().commit();
        }

    }

    @Override
    public Integer countAll() {
        try {
            session.beginTransaction();
            Query query =  session.createQuery( this.qstring );
            return query.list().size();
        }finally {
            session.getTransaction().commit();
        }
    }

    @Override
    public void delete(Long Id) {
        try {
            session.beginTransaction();
            session.delete( session.get( this.typeClass, Id ) );
            return;
        }finally {
            session.getTransaction().commit();
        }
    }

    @Override
    public void create(Object element) {
        try {
            session.beginTransaction();
            session.saveOrUpdate( element );
            return;
        }finally {
            session.getTransaction().commit();
        }
    }

    @Override
    public void modify(Long Id, Object el) {
        try {
            session.beginTransaction();
            Object o = session.get( this.typeClass, Id );
            o = el;
            session.saveOrUpdate( o );
            return;
        }finally {
            session.getTransaction().commit();
        }
    }
}
