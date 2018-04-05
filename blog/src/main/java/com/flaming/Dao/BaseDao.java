package com.flaming.Dao;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<T> {

    String add(T t);

    void delete(T t);

    void update(T t);

    T findOne(Serializable id);

    List<T> findAll();
}
