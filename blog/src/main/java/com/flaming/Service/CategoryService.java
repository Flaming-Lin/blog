package com.flaming.Service;

import com.flaming.Entity.Category;

import java.util.List;
import java.util.Set;

public interface CategoryService {

    String save(Category category);

    void delete(Category category);

    void update(Category category);

    Category findByContent(String content);

    Category findOne(int id);

    Set<Category> getDistinctSet(String[] categoryArr);

    List<Category> findAll();
}
