<%@ page import="com.flaming.Entity.Article" %>
<%@ page import="com.flaming.Entity.ArticleTmp" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/21
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String contextPath = request.getContextPath();
    ArticleTmp article = (ArticleTmp)request.getAttribute("article");
%>
<link rel="stylesheet" href="<%=contextPath%>/editormd/css/editormd.min.css" />
<script src="<%=contextPath%>/editormd/jquery.min.js"></script>
<script src="<%=contextPath%>/editormd/editormd.min.js"></script>
<html>
<head>
    <title>editArticle</title>
</head>
<body>

</form>
<form action="<%=contextPath%>/admin_ArticleTmpPost" method="post">
    文章id：<input type="text" name="id" value="<%=article.getId()%>"/><br/>
    文章板块：<input type="text" list="block_list" name="block" value="<%=article.getBlock()%>"/>
    <datalist id="block_list">
        <option label="慢生活" value="slowlife" />
        <option label="学无止境" value="learn" />
    </datalist><br/>
    文章标题：<input type="text" name="title" value="<%=article.getTitle()%>"/><br/>
    图片路径：<input type="text" name="uploadPic" value="<%=article.getPicUrl()%>"/><br/>
    文章分类：<input type="text" name="category" value="<%=article.getCategory()%>"/><br/>
    文章简介：<input type="text" name="introduction" value="<%=article.getIntroduction()%>"/><br/>
    文章简介：<input type="text" name="total_click" value="<%=article.getTotal_click()%>"/><br/>
    文章内容：<br/>
    <div class="editormd" id="article-editormd" >
        <textarea class="editormd-markdown-textarea" name="article-editormd-markdown-doc"><%=article.getMdContent()%></textarea>
    </div>
    <%--<textarea name="content" id="" cols="300" rows="30"></textarea><br/>--%>

    <input type="submit" value="提交">
</form>
</body>
<script type="text/javascript">
    $(function() {
        editormd("article-editormd", {
            width   : "90%",
            height  : 640,
            syncScrolling : "single",
            path    : "<%=contextPath%>/editormd/lib/",
            saveHTMLToTextarea : true,
            emoji   : true,
            //previewTheme : "dark",

            /**上传图片相关配置如下*/
            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "<%=contextPath%>/upload/picUpload"
        });
    });
    //editor.md期望得到一个json格式的上传后的返回值，格式是这样的：
    /*
    {
        success : 0 | 1,           // 0 表示上传失败，1 表示上传成功
        message : "提示的信息，上传成功或上传失败及错误信息等。",
        url     : "图片地址"        // 上传成功时才返回
    }
    */
</script>
</html>
