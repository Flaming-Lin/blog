<%@ page import="com.flaming.Entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="com.flaming.Entity.Article" %>
<%@ page import="com.flaming.Entity.Page" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/16
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="head.jsp"%>
<%
    @SuppressWarnings("unchecked")
    List<Category> listCategory = (List<Category>)request.getAttribute("listCategory");
    @SuppressWarnings("unchecked")
    Page<Article> pageArticle = (Page<Article>)request.getAttribute("pageArticle");
    int currentPage = pageArticle.getCurrentPage();
    List<Article> listArticle = pageArticle.getDataList();
%>
<link href="<%=contextPath%>/css/learn.css" rel="stylesheet">
<html>
<body>
<%@ include file="bodyHead.jsp"%>
<article>
    <aside>
    <div class="container">
        <h2 class="ctitle"><b>学无止境</b> <span>不要轻易放弃。学习成长的路上，我们长路漫漫，只因学无止境。</span></h2>
        <div class="rnav">
            <ul>
                <% for(Category category:listCategory){ %>
                <li><a href="<%=contextPath%>/learn/category?category=<%=category.getContent()%>"><%=category.toString()%></a></li>
                <% } %>
            </ul>
        </div>
        <ul class="cbp_tmtimeline">
            <%
                for(Article article : listArticle){
            %>
            <li>
                <time class="cbp_tmtime"><span><%=article.getPublish().toString().substring(5,16)%></span> <span><%=article.getPublish().getYear() + 1900%></span></time>
                <div class="cbp_tmicon"></div>
                <div class="cbp_tmlabel" data-scroll-reveal="enter right over 1s" >
                    <h2><%=article.getTitle()%><span><%="点击次数：" + article.getTotal_click()%></span></h2>
                    <p><span class="blogpic"><a href="<%=contextPath%>/learn/show?id=<%=article.getId()%>"><img src="<%=contextPath%><%=article.getPicUrl()%>"></a></span><%=article.getIntroduction()%></p>
                    <a href="<%=contextPath%>/learn/show?id=<%=article.getId()%>" target="_blank" class="readmore">阅读全文&gt;&gt;</a> </div>
            </li>
            <% } %>
        </ul>
        <div class="page">
            <a title="Total record">
                <b><%=pageArticle.getTotalPage()%></b>
            </a>&nbsp;&nbsp;&nbsp;&nbsp;
            <% if(pageArticle.isLeftForward()){%>
                <a href="<%=contextPath%>/learn">&lt;&lt;</a>
                <a href="<%=contextPath%>/learn?pageNum=<%=currentPage - pageArticle.getIndexSize()%>">&lt;</a>
            <%  }
                for(int i : pageArticle.getIndexList()){
                    if(i == currentPage){   %>
                        <b><%=currentPage%></b>
            <%      continue;
                    }   %>
                    <a href="<%=contextPath%>/learn?pageNum=<%=i%>"><%=i%></a>
            <%  }
                if(pageArticle.isRightFoward()){%>
                    <a href="<%=contextPath%>/learn?pageNum=<%=currentPage + pageArticle.getIndexSize()%>">&gt;</a>
                    <a href="<%=contextPath%>/learn?pageNum=<%=pageArticle.getTotalPage()%>">&gt;&gt;</a>
            <%  }%>
        </div>
    </div>
    </aside>
</article>
<%@include file="tail.jsp"%>
</body>
</html>
