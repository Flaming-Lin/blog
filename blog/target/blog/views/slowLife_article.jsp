<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/18
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.flaming.Entity.Article" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String contextPath = request.getContextPath();
    Article article = (Article)request.getAttribute("article");
    Article articleLast = (Article)request.getAttribute("articleLast");
    Article articleNext = (Article)request.getAttribute("articleNext");
%>
<html>
<head>
    <meta charset="gb2312">
    <title><%=article.getTitle()%></title>
    <meta name="keywords" content="" />
    <meta name="description" content="<%=article.getTitle()%>" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=contextPath%>/css/baseArticleDetail.css">
    <link rel="stylesheet" href="<%=contextPath%>/css/articleDetail.css">
    <link rel="stylesheet" href="<%=contextPath%>/css/m.css">
    <link rel="stylesheet" href="<%=contextPath%>/editormd/css/editormd.preview.min.css" />
    <link rel="stylesheet" href="<%=contextPath%>/editormd/css/editormd.css" />
    <!--[if lt IE 9]>
    <script src="<%=contextPath%>/js/modernizr.js"></script>
    <![endif]-->
    <script src="<%=contextPath%>/js/scrollReveal.js"></script>
    <!-- 返回顶部调用 begin -->
    <link href="<%=contextPath%>/css/lrtk.css" rel="stylesheet" />
    <script src="<%=contextPath%>/editormd/jquery.min.js"></script>
    <script src="<%=contextPath%>/js/js.js"></script>
    <script src="<%=contextPath%>/editormd/lib/marked.min.js"></script>
    <script src="<%=contextPath%>/editormd/lib/prettify.min.js"></script>
    <script src="<%=contextPath%>/editormd/editormd.min.js"></script>
    <!-- 返回顶部调用 end-->
</head>
<body>
<%@include file="bodyHead.jsp"%>
<article>
    <aside>
    <div class="container">
        <div class="about left">
            <ul>
                <h4 class="atitle"><span><%=article.getPublish().toString().substring(0,10)%></span><%=article.getTitle()%></h4>
                <p class="newsnav">您现在的位置是 : <a href="<%=contextPath%>/index">首页</a>&nbsp;>&nbsp;<a href="<%=contextPath%>/slowlife">慢生活</a>&nbsp;>&nbsp;<a href="<%=contextPath%>/slowlife/show?id=<%=article.getId()%>"><%=article.getTitle()%></a></p>
            </ul>

            <!-- class = "content editormd-preview-theme-dark" -->
            <br/>
            <div id="doc-content">
                <textarea style="display:none;"><%=article.getMdContent()%></textarea>
            </div>
            <br/><br/><br/>
            <div class="keybq">
                <p><span>关键字词</span>：</p>
            </div>
            <div class="nextinfo">
                <% if( null == articleLast ){%>
                <p>上一篇：<a href="<%=contextPath%>/slowlife">返回列表</a></p>
                <% } else { %>
                <p>上一篇：<a href="<%=contextPath%>/slowlife/show?id=<%=articleLast.getId()%>"><%=articleLast.getTitle()%></a></p>
                <% } %>
                <% if( null == articleNext ){%>
                <p>下一篇：<a href="<%=contextPath%>/slowlife">返回列表</a></p>
                <% } else { %>
                <p>下一篇：<a href="<%=contextPath%>/slowlife/show?id=<%=articleNext.getId()%>"><%=articleNext.getTitle()%></a></p>
                <% } %>
            </div>
            <div class="otherlink">
                <h2>相关文章</h2>
                <ul>无相关信息</ul>
            </div>
            <div class="gbko">
                <!--高速版-->
                <div id="SOHUCS" sid="<%=article.getId()%>"></div>
                <script charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/changyan.js" ></script>
                <script type="text/javascript">
                    window.changyan.api.config({
                        appid: 'cytu06kG7',
                        conf: 'prod_fc8a930863552cb0c785435bdc376be8'
                    });
                </script>
            </div>
        </div>
    </div>
    </aside>
</article>
<%@include file="tail.jsp"%>
</body>
<script type="text/javascript">
    var testEditor;
    $(function () {
        testEditor = editormd.markdownToHTML("doc-content", {//注意：这里是上面DIV的id
            htmlDecode: "style,script,iframe",
            emoji: true,
            taskList: true,
            tex: true, // 默认不解析
            flowChart: true, // 默认不解析
            sequenceDiagram: true, // 默认不解析
            codeFold: true
        });});
</script>
</html>
