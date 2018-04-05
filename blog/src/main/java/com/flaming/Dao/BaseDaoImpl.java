package com.flaming.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

public class BaseDaoImpl<T> implements BaseDao<T> {

    @SuppressWarnings("SpringJavaAutowiredMembersInspection")
    @Autowired
    SessionFactory sessionFactory;

    private Class<T> clazz;

    @SuppressWarnings("unchecked")
    BaseDaoImpl(){
        ParameterizedType pt=(ParameterizedType)this.getClass().getGenericSuperclass();
        clazz=(Class<T>)pt.getActualTypeArguments()[0];
    }

    Session getCurrentSession(){
        return this.sessionFactory.getCurrentSession();
    }

    public String add(T t){
        return (String)this.getCurrentSession().save(t);
    }

    public void delete(T t){
        this.getCurrentSession().delete(t);
    }

    public void update(T t){
        this.getCurrentSession().update(t);
    }

    public T findOne(Serializable id){
        return this.getCurrentSession().get(clazz,id);
    }

    @SuppressWarnings("unchecked")
    public List<T> findAll(){
        return this.getCurrentSession().createQuery("from "+clazz.getSimpleName()).list();
    }
}
