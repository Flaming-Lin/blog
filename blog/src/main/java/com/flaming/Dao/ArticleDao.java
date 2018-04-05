package com.flaming.Dao;

import com.flaming.Entity.Article;
import com.flaming.Entity.Page;

import java.util.List;

public interface ArticleDao extends BaseDao<Article>{

    String add(Article article);

    void updateTotalClick(String id);

    Article findBySortIndex(String block, int sortIndex);

    List<Article> findByBlock(String block);

    Page<Article> findByPageNum(String block, int pageNum, int pageSize, int indexSize);

    List<Article> findByTotalClick();

    List<Article> findAll();

}
