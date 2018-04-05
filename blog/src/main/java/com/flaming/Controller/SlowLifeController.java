package com.flaming.Controller;


import com.flaming.Entity.Article;
import com.flaming.Entity.Page;
import com.flaming.Service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/slowlife")
public class SlowLifeController {

    @Autowired
    private ArticleService articleService;

    @Value("${article.pageSize}")
    private String ARTICLE_PAGESIZE;
    @Value("${article.indexSize}")
    private String ARTICLE_INDEXSIZE;
    @Value("${slowlife.blockName}")
    private String SLOWLIFE_BLOCKNAME;

    @RequestMapping
    public String prolist(HttpServletRequest request){
        String strPageNum = request.getParameter("pageNum");
        int pageNum = (null == strPageNum) ? 1 : Integer.valueOf(strPageNum);
        Page<Article> pageArticle = articleService.findByPageNum(SLOWLIFE_BLOCKNAME, pageNum , Integer.valueOf(ARTICLE_PAGESIZE),
                Integer.valueOf(ARTICLE_INDEXSIZE));
        request.setAttribute("pageArticle", pageArticle);
        return "slowLife";
    }

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String show(HttpServletRequest request){
        String id = request.getParameter("id");
        articleService.updateTotalClick(id);
        Article article = articleService.findById(id);
        Article articleLast = articleService.findBySortIndex(SLOWLIFE_BLOCKNAME,article.getSortIndex()-1);
        Article articleNext = articleService.findBySortIndex(SLOWLIFE_BLOCKNAME,article.getSortIndex()+1);
        request.setAttribute("article",article);
        request.setAttribute("articleLast",articleLast);
        request.setAttribute("articleNext",articleNext);
        return "slowLife_article";
    }
}
