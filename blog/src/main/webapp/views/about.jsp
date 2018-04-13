<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/16
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="head.jsp"%>
<link href="<%=contextPath%>/css/about.css" rel="stylesheet">
<html>
<body>
<%@ include file="bodyHead.jsp"%>
<article>
    <div class="container">
        <div class="banner">
            <p data-scroll-reveal="enter top over 2s">终于明白 那些约好同行的人</p>
            <p data-scroll-reveal="enter left over 2s after 1s">一起相伴雨季 走过华年</p>
            <p data-scroll-reveal="enter bottom over 2s after 2s">但终究 会在某个渡口离散</p>
        </div>
        <div class="memorial_day">
            <div class="time_axis"></div>
            <ul>
                <li class="n1"><a href="/">软件入门</a>
                    <div class="dateview">2015</div>
                </li>
                <li class="n2"><a href="/">探索项目成功</a>
                    <div class="dateview">2016-03</div>
                </li>
                <li class="n3"><a href="/">工作室创业</a>
                    <div class="dateview">2016-09</div>
                </li>
                <li class="n4"><a href="/">架设云服务器</a>
                    <div class="dateview">2017-10</div>
                </li>
                <li class="n5"><a href="/">创建个人博客</a>
                    <div class="dateview">2018-02-14</div>
                </li>
            </ul>
        </div>
        <div class="about left">
            <h2>Just about me</h2>
            <ul>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;唐小麟，Flaming，现就读于大连理工大学软件学院，一名菜鸟级编程爱好者。</p>
                <p>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第一次接触软件时我还是个初中生。作为一名玩了六七年游戏的骨灰级小玩家，不再满足于活在别人的游戏世界里，这便是我接触软件的动机。在那个C语言横行霸道的时代，我却先接触到了VB，Visual式的编程对于一个懵懵懂懂的小孩子来说再合适不过了，那时的我没有知识基础没有老师指导，硬生生靠百度写出了一堆小程序，印象最深的应该是QQ炸弹吧，一秒发1000条消息把同学的帐号直接轰炸掉线。
                </p>
                <p>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;然而没过多久，作为一名连IDE上的英文都要查百度翻译的初中生，编码遇到了无数的瓶颈，渴望得到别人指导的我最终也没能如愿以偿，不到一年，翻看过几本VB入门书籍的我后便停下了脚步。那个时候我要是继续学下去说不定就能成为一名少年黑客了哈哈
                </p>
                <p>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;再一次正式接触软件就是大学了。我如愿以偿来到了第一志愿专业，这比考上985都要兴奋的多。我总觉得代码是很有魅力的生命体，用它们创造出来的世界都是鲜活的，栩栩如生的。感谢学校带我踏入了软件世界的大门，让我看到了这个世界里广阔无际的知识海洋，给我机会亲手创造自己的世界。从C++到Java，从MFC到C#到javafx，从JVM到SSH，代码伴随着我一路成长。
                </p>
                <p>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;以上便是一名菜鸟级程序员的成长历程了。如果你对我感兴趣或同样深爱着代码，不如一起交个朋友！：）
                </p>
            </ul>
            <h2>About my blog</h2>
            <p>域&nbsp;&nbsp;&nbsp;&nbsp;名：www.flamingjsxn.xin &nbsp;&nbsp;创建于2017年11月17日 </p>
            <p>域&nbsp;&nbsp;&nbsp;&nbsp;名：www.tangxiaolin.com &nbsp;&nbsp;创建于2018年4月3日 </p>
            <p>服务器：阿里云ECS</p>
            <p>架&nbsp;&nbsp;&nbsp;&nbsp;构：SQL Server + Tomcat + SSH</p>
            <p>源&nbsp;&nbsp;&nbsp;&nbsp;码：https://github.com/Flaming-Lin/blog</p>
        </div>
    </div>
</article>
<%@include file="tail.jsp"%>
</body>
</html>