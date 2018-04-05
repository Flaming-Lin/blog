package com.flaming.Service;

import com.flaming.Dao.ArticleDao;
import com.flaming.Entity.Article;
import com.flaming.Entity.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("articleService")
@Transactional
public class ArticleServiceImpl implements ArticleService{

    @Resource
    private ArticleDao articleDao;

    public String save(Article article){
        return articleDao.add(article);
    }

    public void delete(Article article){
        articleDao.delete(article);
    }

    public void update(Article article){
        articleDao.update(article);
    }

    public void updateTotalClick(String id){
        articleDao.updateTotalClick(id);
    }

    public Article findById(String id) {
        return articleDao.findOne(id);
    }

    public Article findBySortIndex(String block, int sortIndex){
        return articleDao.findBySortIndex(block, sortIndex);
    }

    public Page<Article> findByPageNum(String block, int pageNum, int pageSize, int indexSize){
        return articleDao.findByPageNum(block, pageNum, pageSize, indexSize);
    }

    public List<Article> findByBlock(String block){
        return articleDao.findByBlock(block);
    }

    public List<Article> findByTotalClickTop3(){
        List<Article> list = articleDao.findByTotalClick();
        if(list.size() >= 3){
            List<Article> listRet = new ArrayList<Article>();
            listRet.add(list.get(0));
            listRet.add(list.get(1));
            listRet.add(list.get(2));
            return listRet;
        } else {
            return null;
        }
    }

    public List<Article> findAll() {
        return articleDao.findAll();
    }


}
