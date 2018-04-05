<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/15
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.flaming.Entity.Article" %>
<%@ include file="head.jsp"%>
<%
    @SuppressWarnings("unchecked")
    List<Article> listArticle = (List<Article>)request.getAttribute("listArticle");
    @SuppressWarnings("unchecked")
    List<Article> listByTotalClick = (List<Article>)request.getAttribute("listByTotalClick");
%>
<link href="<%=contextPath%>/css/index.css" rel="stylesheet">
<html>
<body>
<%@ include file="bodyHead.jsp"%>
<article>
    <div class="container">
        <div class="blog" data-scroll-reveal="enter top" >
            <%
                for(Article article : listByTotalClick){
            %>
            <figure>
                <ul>
                    <a href="<%=contextPath + '/' + article.getBlock() + "/show?id=" + article.getId()%>"><img src="<%=contextPath + article.getPicUrl()%>"><span><%="点击次数：" + article.getTotal_click()%></span></a>
                </ul>
                <p><a href="<%=contextPath + '/' + article.getBlock() + "/show?id=" + article.getId()%>"><%=article.getTitle()%></a></p>
                <figcaption><%=article.getIntroduction()%></figcaption>
            </figure>
            <% } %>
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
                    <p><span class="blogpic"><a href="<%=contextPath + '/' + article.getBlock() + "/show?id=" + article.getId()%>"><img src="<%=contextPath + article.getPicUrl()%>"></a></span><%=article.getIntroduction()%></p>
                    <a href="<%=contextPath + '/' + article.getBlock() + "/show?id=" + article.getId()%>" target="_blank" class="readmore">阅读全文&gt;&gt;</a>
                </div>
            </li>
            <% } %>
        </ul>
    </div>
</article>
<%@include file="tail.jsp"%>
</body>
</html>
