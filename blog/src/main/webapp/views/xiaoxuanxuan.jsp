<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/24
  Time: 23:27
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
        <div class="bannerQQRobot">
            <p data-scroll-reveal="enter top over 2s">┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓</p>
            <p data-scroll-reveal="enter left over 2s after 1s">剑网三 —— QQ机器人：小轩轩</p>
            <p data-scroll-reveal="enter left over 3s after 1s">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作者：Flaming</p>
            <p data-scroll-reveal="enter bottom over 2s">┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛</p>
        </div>
        <div class="about left">
            <h2>小轩轩介绍</h2>
            <ul>
                <p>
                    <img src = "<%=contextPath%>/images/QQRobot_introduction.png">
                </p>
            </ul>
            <h2>免费领养小轩轩</h2>
            <p><br/>领养条件：1、必须是与剑网三有关的群<br/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、群人数大于等于80 群内人员较为活跃<br/><br/>
                领养步骤：1、在下方评论区按如下格式留言：<br/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;【请严格按如下格式留言 带有个人QQ号或群号的评论会自动被禁止】<br/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;昵称：xxxx<br/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;群人数：xx<br/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区服（选填）：xxxx-xxxx<br/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、申请加入QQ群：575631620 &nbsp;&nbsp;备注：昵称+欲申请的QQ群<br/><br/>
            </p>
            <h2>评论区</h2>
            <div class="gbko">
                <!--高速版-->
                <div id="SOHUCS" sid="<%="xiaoxuanxuan"%>"></div>
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
</article>
<%@include file="tail.jsp"%>
</body>
</html>

