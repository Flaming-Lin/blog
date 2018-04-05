package com.flaming.Service;

import com.flaming.Entity.Article;
import com.flaming.Entity.Page;

import java.util.List;

public interface ArticleService {

    String save(Article article);

    void delete(Article article);

    void update(Article article);

    void updateTotalClick(String id);

    Article findById(String id);

    Article findBySortIndex(String block, int sortIndex);

    List<Article> findByBlock(String block);

    Page<Article> findByPageNum(String block, int pageNum, int pageSize, int indexSize);

    List<Article> findByTotalClickTop3();

    List<Article> findAll();
}
