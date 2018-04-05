package com.flaming.Dao;

import com.flaming.Entity.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("categoryDao")
public class CategoryDaoImpl extends BaseDaoImpl<Category> implements CategoryDao{

    public Category findByContent(String content) {
        return (Category)this.getCurrentSession().createQuery("from Category where content = :content")
                .setParameter("content",content).uniqueResult();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Category> findAll(){
        return this.getCurrentSession().createQuery("from Category where content <> 'diary'").list();
    }
}
