<%@ page import="com.flaming.Entity.Article" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/18
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String contextPath = request.getContextPath();
    Article article = (Article)request.getAttribute("article");
%>
<html>
<head>
    <meta charset="gb2312">
    <title><%=article.getTitle()%></title>
    <meta name="keywords" content="" />
    <meta name="description" content="<%=article.getTitle()%>" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=contextPath%>/editormd/css/editormd.preview.min.css" />
    <link rel="stylesheet" href="<%=contextPath%>/editormd/css/editormd.css" />
    <script src="<%=contextPath%>/editormd/jquery.min.js"></script>
    <script src="<%=contextPath%>/editormd/lib/marked.min.js"></script>
    <script src="<%=contextPath%>/editormd/lib/prettify.min.js"></script>
    <script src="<%=contextPath%>/editormd/editormd.min.js"></script>
    <!-- 返回顶部调用 end-->
</head>
<body>
<article>
    <!-- class = "content editormd-preview-theme-dark" -->
    <div class = "content editormd-preview-theme-dark" id="doc-content">
        <textarea style="display:none;"><%=article.getContent()%></textarea>
    </div>
</article>
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
            codeFold: true,
        });});
</script>
</html>

