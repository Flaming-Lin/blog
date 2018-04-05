package com.flaming.Dao;

import com.flaming.Entity.Article;
import com.flaming.Entity.Page;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository("articleDao")
public class ArticleDaoImpl extends BaseDaoImpl<Article> implements ArticleDao {

    @Override
    public String add(Article article){
        Object resMaxSortIndex = this.getCurrentSession().createQuery("select Max(sortIndex) from Article where block = :block")
                .setParameter("block",article.getBlock()).uniqueResult();
        if(null == resMaxSortIndex){
            article.setSortIndex(0);
        } else {
            article.setSortIndex((Integer)resMaxSortIndex + 1);
        }
        return (String)this.getCurrentSession().save(article);
    }

    public void updateTotalClick(String id){
        this.getCurrentSession().createQuery("update Article set total_click = total_click + 1 where id = :id")
                .setParameter("id",id).executeUpdate();
    }

    public Article findBySortIndex(String block, int sortIndex) {
        List list = this.getCurrentSession().createQuery("from Article where block = :block and sortIndex = :sortIndex")
                .setParameter("block",block).setParameter("sortIndex",sortIndex).list();
        if(list.isEmpty()){
            return null;
        } else{
            return (Article)list.get(0);
        }
    }

    @SuppressWarnings("unchecked")
    public List<Article> findByBlock(String block){
        List list = this.getCurrentSession().createQuery("from Article where block = :block order by sortIndex DESC")
                .setParameter("block",block).list();
        if(list.isEmpty()){
            return null;
        } else {
            return (List<Article>)list;
        }
    }

    @SuppressWarnings("unchecked")
    public Page<Article> findByPageNum(String block, int pageNum, int pageSize, int indexSize){
        List list = this.getCurrentSession().createQuery("from Article where block = :block order by sortIndex DESC")
                .setParameter("block",block).list();
        if(list.isEmpty()){
            return null;
        } else {
            return new Page<Article>(pageNum, pageSize, (List<Article>)list, indexSize);
        }
    }

    @SuppressWarnings("unchecked")
    public List<Article> findByTotalClick(){
        List list = this.getCurrentSession().createQuery("from Article order by total_click DESC").list();
        if(list.isEmpty()){
            return null;
        } else {
            return (List<Article>)list;
        }
    }

    @SuppressWarnings("unchecked")
    public List<Article> findAll(){
        return this.getCurrentSession().createQuery("from Article order by publish DESC").list();
    }
}
