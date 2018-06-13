<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="com.imooc.dao.meterDao"%>
<%@ page import="com.imooc.model.meter"%>
<%@ page import="com.imooc.dao.MyaccountDAO"%>
<%@ page import="com.imooc.model.personal"%>
<%@ page import="com.imooc.model.company"%>
<%@ page import="com.imooc.model.standard"%>
<%@ page import="com.imooc.dao.StandardDAO"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>远程抄表系统 |Remote Meter Reading System</title>
<meta name="description"
	content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version." />

<meta name="viewport"
	content="width=1000, initial-scale=1.0, maximum-scale=1.0">

<!-- Loading Bootstrap -->
<link
	href="/Remotemeter/dist/css/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Loading Flat UI -->
<link href="/Remotemeter/dist/css/flat-ui.css" rel="stylesheet">
<link href="/Remotemeter/docs/assets/css/demo.css" rel="stylesheet">

<link rel="shortcut icon" href="/Remotemeter/img/favicon.ico">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
<!--[if lt IE 9]>
      <script src="/Remotemeter/dist/js/vendor/html5shiv.js"></script>
      <script src="/Remotemeter/dist/js/vendor/respond.min.js"></script>
    <![endif]-->
</head>

<body background="#fafafa;">

	<nav class="navbar navbar-default" role="navigation">
		<ul class="nav navbar-nav navbar-left">
			<li><a href="/Remotemeter/account/index.jsp"><span
					class="glyphicon glyphicon-home"></span> <nobr>主页</nobr></a></li>
		</ul>
		<div class="container-fluid">
			<div class="navbar-header">
				<div style="text-align: center;">
					<img src="/Remotemeter/img/bar.png"
						style="width: 60%; text-align: center">
				</div>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a
					href="http://wpa.qq.com/msgrd?v=3&uin=296293760&site=qq&menu=yes"><span
						class="glyphicon glyphicon-user"></span> <nobr>联系我们</nobr></a></li>
				<li><a href="/Remotemeter/servlet/LoginServlet?type=exit"><span
						class="glyphicon glyphicon-log-in"></span> <nobr>退出</nobr></a></li>
			</ul>
		</div>
	</nav>

	<div class="footer-banner"
		style="margin-left: -1px; text-align: center; margin-top: -30px; font-size: 16px; float: left; max-width: 15%; height: 100%; background-color: #73BAAA; box-shadow: inset;">

		<ul style="font-size: 19px; font-weight: 400; letter-spacing: 1px">
			<li><a href="/Remotemeter/intendant/profile/index.jsp"
				style="color: #F0F0F0;">用户档案管理 | <Br>Profile Manage
			</a></li>
			<li><a href="/Remotemeter/intendant/task/index.jsp"
				style="color: #F0F0F0;">采集任务管理 | <Br>Task Management
			</a></li>
			<li><a href="/Remotemeter/intendant/standard/index.jsp"
				style="color: #F0F0F0;">资费标准修改 | <Br>Expense Standard
			</a></li>
			<li><a href="/Remotemeter/intendant/poweroff/index.jsp"
				style="color: #F0F0F0;">通断电控制 | <Br>Power Off Control
			</a></li>
			<li><a href="/Remotemeter/account/ModifyPassword.jsp"
				style="color: #F0F0F0;">密码修改 | <Br>Modify Password
			</a></li>
		</ul>
	</div>

	<div
		style="float: left; height:100%; width: 85%; background-color: #fafafa; margin-top: -30px;">
		<ol class="breadcrumb" style="font-size: 15px;">
			<li><a style="color: #4F4F4F; margin-left: 60px;"
				href="/Remotemeter/intendant/index/index.jsp"> 首 页 ></a></li>
			<li><a style="color: #4F4F4F;" href="#">资 费 标 准 修 改></a></li>
		</ol>
		<h5
			style="color: #efefef; font-weight: 700; letter-spacing: 2px; padding-top: 20px; padding-left: 40px;">&nbsp;&nbsp;／资费标准／</h5>
		<div class="col-xs-3"
			style="float: left; margin-left: 800px; letter-spacing: 3px; width: 220px; font-size: 20px; margin-top: 0px;">
			<a href="/Remotemeter/intendant/standard/standardmodify.jsp"
				style="font-size: 19px;" type= "button" class="btn btn-block btn-lg btn-default">修改
				| Modify</a>
		</div>
		<div
			style="padding-left: 50px; margin-top: 20px; color: #888; font-weight: 200; font-size: 22px; letter-spacing: 1px; overflow-y: auto; overflow-x: hidden; width: 1000px; height: 100%; min-height: 520px">
			<!-- 电表循环开始 -->
			<%
				StandardDAO standarddao = new StandardDAO();
				ArrayList<standard> list = null;
				list = standarddao.getstandard();
				if (list != null && list.size() > 0) {
					for (int i = 0; i < list.size(); i++) {
						standard istandard = list.get(i);
						String type;
						if (istandard.getType().equals("0")) {
			%>
			<div class="col-xs-3"
				style="float: left; color: #555; font-weight: 200; margin-left: 20px; font-size: 30px; margin-top: 10px;">
				<a style="color: #555;">•民用</a>
			</div>

			<div class="col-xs-3"
				style="float: left; margin-left: -165px; font-size: 20px; margin-top: 70px;">
				<a class="demo-panel-title" style="color: #2F4F4F;">阈值提醒</a>
			</div>

			<div class="col-xs-3"
				style="float: left; margin-left: 550px; font-size: 20px; margin-top: -40px;">
				<a class="demo-panel-title" style="color: #2F4F4F;">资费标准</a>
			</div>

			<div class="col-xs-3"
				style="float: left; margin-left: 90px; letter-spacing: 3px; width: 220px; font-size: 20px; margin-top: 10px;">
				<div class="form-group has-success">
					<a type="text" class="form-control"><%=istandard.getThreshold()%></a>
				</div>
			</div>

			<div class="col-xs-3"
				style="float: left; margin-left: 240px; letter-spacing: 3px; width: 220px; font-size: 20px; margin-top: 10px;">
				<div class="form-group has-success">
					<a type="text" class="form-control"><%=istandard.getPrice()%></a>
				</div>
			</div>
			<!-- 商品循环结束 -->
			<%
				} else {
			%>
			<div class="col-xs-3"
				style="float: left; font-weight: 200; margin-left: 20px; font-size: 30px; margin-top: 30px;">
				<hr>
				<a style="color: #555;">•商用</a>
			</div>

			<div class="col-xs-3"
				style="float: left; margin-left: -165px; font-size: 20px; margin-top: 130px;">
				<a class="demo-panel-title" style="color: #2F4F4F;">阈值提醒</a>
			</div>

			<div class="col-xs-3"
				style="float: left; margin-left: 550px; font-size: 20px; margin-top: -40px;">
				<a class="demo-panel-title" style="color: #2F4F4F;">资费标准</a>
			</div>

			<div class="col-xs-3"
				style="float: left; margin-left: 90px; letter-spacing: 3px; width: 220px; font-size: 20px; margin-top: 10px;">
				<div class="form-group has-success">
					<a type="text" class="form-control"><%=istandard.getThreshold()%></a>
				</div>
			</div>

			<div class="col-xs-3"
				style="float: left; margin-left: 240px; letter-spacing: 3px; width: 220px; font-size: 20px; margin-top: 10px;">
				<div class="form-group has-success">
					<a type="text" class="form-control"><%=istandard.getPrice()%></a>
				</div>
			</div>
			<!-- 商品循环结束 -->

			<%
				}
					}
				}
			%>

		</div>
	</div>

	<footer>
		<div class="container">
			<div class="row">
				<p align="center"
					style="height: 10px; text-align: center; color: #999; letter-spacing: 1px; vertical-align: middle; margin-top: 20px; font-size: 14px; z-index: 99">
					<nobr>@ 2017 All Rights Reserved 远程抄表系统 | Intelligent Remote
						Meter Reading System</nobr>
				</p>
			</div>
		</div>
	</footer>
	<script src="/Remotemeter/dist/js/vendor/jquery.min.js"></script>
	<script src="/Remotemeter/dist/js/vendor/video.js"></script>
	<script src="/Remotemeter/dist/js/flat-ui.min.js"></script>
	<script src="/Remotemeter/docs/assets/js/application.js"></script>

</body>
</html>