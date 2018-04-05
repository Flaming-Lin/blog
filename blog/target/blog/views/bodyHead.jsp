<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/16
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<header>
    <div class="logo" data-scroll-reveal="enter right over 1s"><a href="<%=contextPath%>/index"><img src="<%=contextPath%>/images/index-header.png"></a></div>
    <nav class="topnav" data-scroll-reveal="enter bottom over 1s after 1s">
        <a href="<%=contextPath%>/index"><span>首页</span><span class="en">Home</span></a>
        <a href="<%=contextPath%>/views/about.jsp"><span>关于我</span><span class="en">About</span></a>
        <a href="<%=contextPath%>/slowlife"><span>慢生活</span><span class="en">Life</span></a>
        <%--<a href="<%=contextPath%>/views/%5Bnot%20in%20use%5Dshare.jsp"><span>资源分享</span><span class="en">Share</span></a>--%>
        <a href="<%=contextPath%>/learn"><span>学无止境</span><span class="en">Learn</span></a>
        <a href="<%=contextPath%>/views/xiaoxuanxuan.jsp"><span>小轩轩</span><span class="en">QQ_Robot</span></a>
        <a href="<%=contextPath%>/views/messageBoard.jsp"><span>留言</span><span class="en">Saying</span></a></nav>
</header>