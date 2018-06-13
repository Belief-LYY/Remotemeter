<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		style="float: left; width: 85%; margin-top: -30px; background-color: #fafafa">
		<ol class="breadcrumb" style="font-size: 15px;">
			<li><a style="color: #4F4F4F; margin-left: 60px;"
				href="/Remotemeter/intendant/index/index.jsp"> 首 页 ></a></li>
		</ol>
		<img src="/Remotemeter/img/AdHomepage1.jpg"
			style="width:1160px; margin-left: 0px; margin-top: -20px; margin-right: 0px;"></img>


	</div>


	<script src="/Remotemeter/dist/js/vendor/jquery.min.js"></script>
	<script src="/Remotemeter/dist/js/vendor/video.js"></script>
	<script src="/Remotemeter/dist/js/flat-ui.min.js"></script>
	<script src="/Remotemeter/docs/assets/js/application.js"></script>

</body>
</html>