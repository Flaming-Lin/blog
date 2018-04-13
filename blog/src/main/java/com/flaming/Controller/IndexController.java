package com.flaming.Controller;

import com.flaming.Entity.Article;
import com.flaming.Service.ArticleService;
import com.flaming.Service.CategoryService;
import com.flaming.Utils.MarkdownUtil;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.*;
import org.slf4j.Logger;

@Controller
public class IndexController {

    private final static Logger logger = LoggerFactory.getLogger(IndexController.class.getPackage().getName());

    @Autowired
    private ArticleService articleService;
    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "/index")
    public String index(HttpServletRequest request) {
        logger.debug("enter the requestMapping '/index'");
        List<Article> listArticle = articleService.findAll();
        List<Article> listByTotalClick = articleService.findByTotalClickTop3();
        request.setAttribute("listArticle", listArticle);
        request.setAttribute("listByTotalClick",listByTotalClick);
        logger.debug("exit the requestMapping '/index'");
        return "index";
    }

    @SuppressWarnings("unused")
    @RequestMapping(value = "/admin_addArticle", method = RequestMethod.POST)
    public String admin_addArticle(HttpServletRequest request, HttpServletResponse response,
                                   @RequestParam(value = "uploadPic", required = false) MultipartFile picFile) {
        try {
            logger.debug("enter the requestMapping '/admin_addArticle'");
            request.setCharacterEncoding("UTF-8");
            String rootPath = request.getSession().getServletContext().getRealPath("");
            Article article = new Article();

            // upload the picture resource
            if(null != picFile && !picFile.isEmpty()){
                String uuid = UUID.randomUUID().toString().replaceAll("-","");
                String contentType = picFile.getContentType();
                String imgName = contentType.substring(contentType.indexOf("/")+1);
                String imgURI = "/upload/" + uuid + "." + imgName;
                picFile.transferTo(new File(rootPath + imgURI));
                article.setPicUrl(imgURI);
            }

            article.setBlock(new String(request.getParameter("block").getBytes("iso-8859-1"), "utf-8"));
            String[] categoryArr = (new String(request.getParameter("category").getBytes("iso-8859-1"), "utf-8")).split(";");
            article.setCategories(categoryService.getDistinctSet(categoryArr));
            article.setIntroduction(new String(request.getParameter("introduction").getBytes("iso-8859-1"),"utf-8"));
            article.setMdContent(MarkdownUtil.getTransferredText(
                    new String(request.getParameter("article-editormd-markdown-doc").getBytes("iso-8859-1"),"utf-8")));
            article.setPublish(new Date());
            article.setTitle(new String(request.getParameter("title").getBytes("iso-8859-1"), "utf-8"));
            articleService.save(article);
            logger.debug("exit the requestMapping '/admin_addArticle'");
        } catch (Exception e){
            logger.error(e.getMessage());
        }

        return "forward:index";
    }

    @SuppressWarnings("unused")
    @RequestMapping(value = "/admin_getArticle", method = RequestMethod.GET)
    public String admin_getArticle(HttpServletRequest request, HttpServletResponse response){
        logger.debug("enter the requestMapping '/admin_getArticle'");
        String id = request.getParameter("id");
        Article article = articleService.findById(id);
        request.setAttribute("article", article);
        logger.debug("exit the requestMapping '/admin_getArticle'");
        return "admin_editArticle";
    }

    @SuppressWarnings("unused")
    @RequestMapping(value = "/admin_editArticle", method = RequestMethod.POST)
    public String admin_editArticle(HttpServletRequest request, HttpServletResponse response){
        try {
            logger.debug("enter the requestMapping '/admin_editArticle'");
            String id = request.getParameter("id");
            Article article = articleService.findById(id);
            article.setBlock(new String(request.getParameter("block").getBytes("iso-8859-1"), "utf-8"));
            String[] categoryArr = (new String(request.getParameter("category").getBytes("iso-8859-1"), "utf-8")).split(";");
            article.setCategories(categoryService.getDistinctSet(categoryArr));
            article.setIntroduction(new String(request.getParameter("introduction").getBytes("iso-8859-1"),"utf-8"));
            article.setMdContent(MarkdownUtil.getTransferredText(
                    new String(request.getParameter("article-editormd-markdown-doc").getBytes("iso-8859-1"),"utf-8")));
            article.setTitle(new String(request.getParameter("title").getBytes("iso-8859-1"), "utf-8"));
            articleService.update(article);
            logger.debug("exit the requestMapping '/admin_editArticle'");
        } catch (Exception e){
            logger.error(e.getMessage());
        }
        return "forward:index";
    }

//    @RequestMapping(value = "/show_test", method = RequestMethod.GET)
//    public String show_test(HttpServletRequest request){
//        String id = request.getParameter("id");
//        Article article = articleService.findById(id);
//        request.setAttribute("article",article);
//        return "show_test";
//    }
}
