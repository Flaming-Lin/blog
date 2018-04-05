package com.flaming.Dao;

import com.flaming.Entity.Category;

import java.util.List;

public interface CategoryDao extends BaseDao<Category>{

    Category findByContent(String content);

    List<Category> findAll();
}
