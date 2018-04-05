<%@ page import="com.flaming.Entity.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="com.flaming.Entity.Page" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/16
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="head.jsp"%>
<%
    @SuppressWarnings("unchecked")
    Page<Article> pageArticle = (Page<Article>)request.getAttribute("pageArticle");
    int currentPage = pageArticle.getCurrentPage();
    List<Article> listArticle = pageArticle.getDataList();
%>
<link href="<%=contextPath%>/css/msh.css" rel="stylesheet">
<html>
<body>
<%@ include file="bodyHead.jsp"%>
<article>
    <aside>
    <div class="container">
        <h2 class="ctitle"><b>慢生活</b> <span>“慢生活”不是懒惰，放慢速度不是拖延时间，而是让我们在生活中寻找到平衡。 </span></h2>
                    <div class="photowall">
                        <ul class="wall_a">
                            <li><a href="/"><img src="<%=contextPath%>/images/p01.jpg">
                                <figcaption>
                                    <h2>不再因为别人过得好而焦虑，在没有人看得到你的时候依旧能保持节奏 </h2>
                                </figcaption>
                            </a></li>
                            <li><a href="/"><img src="<%=contextPath%>/images/p02.jpg">
                                <figcaption>
                                    <h2>不再因为别人过得好而焦虑，在没有人看得到你的时候依旧能保持节奏 </h2>
                                </figcaption>
                            </a></li>
                            <li><a href="/"><img src="<%=contextPath%>/images/p03.jpg">
                    <figcaption>
                        <h2>不再因为别人过得好而焦虑，在没有人看得到你的时候依旧能保持节奏 </h2>
                    </figcaption>
                </a></li>
                <li>
                    <p class="text_a"><a href="/">一个人最好的模样大概是平静一点，坦然接受自己所有的弱点，不再因为别人过得好而焦虑，在没有人看得到你的时候依旧能保持节奏......</a></p>
                </li>
                <li><a href="/"><img src="<%=contextPath%>/images/p04.jpg">
                    <figcaption>
                        <h2>不再因为别人过得好而焦虑，在没有人看得到你的时候依旧能保持节奏 </h2>
                    </figcaption>
                </a></li>
                <li>
                    <p class="text_b"><a href="/">逃避自己的人，最终只能导致自己世界的崩塌，而变得越来越没有安全感。</a></p>
                </li>
                <li><a href="/"><img src="<%=contextPath%>/images/p05.jpg">
                    <figcaption>
                        <h2>不再因为别人过得好而焦虑，在没有人看得到你的时候依旧能保持节奏 </h2>
                    </figcaption>
                </a></li>
                <li><a href="/"><img src="<%=contextPath%>/images/p06.jpg">
                    <figcaption>
                        <h2>不再因为别人过得好而焦虑，在没有人看得到你的时候依旧能保持节奏 </h2>
                    </figcaption>
                </a></li>
            </ul>
        </div>
        <ul class="cbp_tmtimeline">
            <%
                for(Article article : listArticle)
                {
            %>
                <li>
                    <time class="cbp_tmtime"><span><%=article.getPublish().toString().substring(5,16)%></span> <span><%=article.getPublish().getYear() + 1900%></span></time>
                    <div class="cbp_tmicon"></div>
                    <div class="cbp_tmlabel" data-scroll-reveal="enter right over 1s" >
                        <h2><%=article.getTitle()%><span><%="点击次数：" + article.getTotal_click()%></span></h2>
                        <p><span class="blogpic"><a href="<%=contextPath%>/slowlife/show?id=<%=article.getId()%>"><img src="<%=contextPath + article.getPicUrl()%>"></a></span><%=article.getIntroduction()%></p>
                        <a href="<%=contextPath%>/slowlife/show?id=<%=article.getId()%>" target="_blank" class="readmore">阅读全文&gt;&gt;</a> </div>
                </li>
            <%
                }
            %>

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