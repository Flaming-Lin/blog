package com.flaming.Service;

import com.flaming.Entity.Category;

import java.util.List;

public interface CategoryService {

    String save(Category category);

    void delete(Category category);

    void update(Category category);

    Category findByContent(String content);

    Category findOne(int id);

    List<Category> findAll();
}
