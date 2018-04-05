package com.flaming.Controller;

import com.flaming.Entity.Article;
import com.flaming.Entity.Category;
import com.flaming.Entity.Page;
import com.flaming.Service.ArticleService;
import com.flaming.Service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/learn")
public class LearnController {

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ArticleService articleService;

    @Value("${article.pageSize}")
    private String ARTICLE_PAGESIZE;
    @Value("${article.indexSize}")
    private String ARTICLE_INDEXSIZE;
    @Value("${learn.blockName}")
    private String LEARN_BLOCKNAME;

    @SuppressWarnings("unused")
    @RequestMapping
    public String prolist(HttpServletRequest request, HttpServletResponse response){
        String strPageNum = request.getParameter("pageNum");
        int pageNum = (null == strPageNum) ? 1 : Integer.valueOf(strPageNum);
        List<Category> listCategory = categoryService.findAll();
        Page<Article> pageArticle = articleService.findByPageNum(LEARN_BLOCKNAME, pageNum , Integer.valueOf(ARTICLE_PAGESIZE),
                Integer.valueOf(ARTICLE_INDEXSIZE));
        request.setAttribute("listCategory",listCategory);
        request.setAttribute("pageArticle", pageArticle);
        return "learn";
    }

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String show(HttpServletRequest request){
        String id = request.getParameter("id");
        articleService.updateTotalClick(id);
        Article article = articleService.findById(id);
        Article articleLast = articleService.findBySortIndex(LEARN_BLOCKNAME,article.getSortIndex()-1);
        Article articleNext = articleService.findBySortIndex(LEARN_BLOCKNAME,article.getSortIndex()+1);
        request.setAttribute("article",article);
        request.setAttribute("articleLast",articleLast);
        request.setAttribute("articleNext",articleNext);
        return "learn_article";
    }

    @RequestMapping(value = "/category", method = RequestMethod.GET)
    public String category(HttpServletRequest request) throws UnsupportedEncodingException{
        String category = new String(request.getParameter("category").getBytes("iso-8859-1"), "utf-8")
                .replace(" ","+");
        List<Category> listCategory = categoryService.findAll();
        request.setAttribute("listCategory",listCategory);
        request.setAttribute("pageArticle", new Page<Article>(1, Integer.valueOf(ARTICLE_PAGESIZE),
                new ArrayList<Article>(categoryService.findByContent(category).getArticles()),Integer.valueOf(ARTICLE_INDEXSIZE)));
        return "learn";
    }
}
