<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/16
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="head.jsp"%>
<link href="<%=contextPath%>/css/book.css" rel="stylesheet">
<html>
<body>
<%@ include file="bodyHead.jsp"%>
<article>
    <div class="container">
        <h2 class="ctitle"><b>留言板</b> <span>你，生命中最重要的过客，之所以是过客，因为你未曾为我停留。</span></h2>
        <div class="gbook">
            <div class="about">
                <div id="fountainG">
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </div>
                <div class="about_girl"><span><a href="/"><img src="<%=contextPath%>/images/girl.jpg"></a></span>
                    <p>当您驻足停留过，从此便注定我们的缘分。站在时间的尽头，我们已是朋友，前端的路上我再也不用一个人独自行走。</p>
                </div>
            </div>
        </div>
        <div class="gbko">
            <!--高速版-->
            <div id="SOHUCS" sid=messageBoard"></div>
            <script charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/changyan.js" ></script>
            <script type="text/javascript">
                window.changyan.api.config({
                    appid: 'cytu06kG7',
                    conf: 'prod_fc8a930863552cb0c785435bdc376be8'
                });
            </script>

        </div>
    </div>
    </aside>
</article>
<%@include file="tail.jsp"%>
</body>
</html>
