package com.flaming.Service;

import com.flaming.Dao.CategoryDao;
import com.flaming.Entity.Category;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

    public Set<Category> getDistinctSet(String[] categoryArr){
        Set<Category> categorySet = new HashSet<Category>();
        for(String categoryStr : categoryArr){
            Category categoryFind = this.findByContent(categoryStr);
            if(null == categoryFind){
                categoryFind = new Category(categoryStr);
            }
            categorySet.add(categoryFind);
        }
        return categorySet;
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
