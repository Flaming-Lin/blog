package com.flaming.Service;

import com.flaming.Dao.CategoryDao;
import com.flaming.Entity.Category;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Comparator;
import java.util.List;

@Service("categoryService")
@Transactional
public class CategoryServiceImpl implements CategoryService{

    @Resource
    private CategoryDao categoryDao;

    public String save(Category category){
        return categoryDao.add(category);
    }

    public void delete(Category category){
        categoryDao.delete(category);
    }

    public void update(Category category){
        categoryDao.update(category);
    }

    public Category findByContent(String content){
        return categoryDao.findByContent(content);
    }

    public Category findOne(int id) {
        return categoryDao.findOne(id);
    }

    public List<Category> findAll(){
        List<Category> categoryList = categoryDao.findAll();
        categoryList.sort(new Comparator<Category>() {
            public int compare(Category o1, Category o2) {
                return o2.getArticles().size() - o1.getArticles().size();
            }
        });
        return categoryList;
    }
}
