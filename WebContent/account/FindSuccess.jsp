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
<%
	String t = (String) request.getParameter("t");
	String type = "p";
	if (t != null) {
		if (t.equals("0"))
			type = "p";
		else
			type = "c";
	}
%>
<body>
	<div class="container" style="padding-top: 30px">
		<div class="register">
			<img src="/Remotemeter/img/FindSuccs.jpg" style="width: 870px"></img>
			<div
				style="text-align: center; color: #666; height: 80px; margin-top: -130px;">
				<a
					style="color: #666; width: 160px; z-index: 999; font-size: 15px; font-weight: 300"
					href="/Remotemeter/account/Login<%=type%>.jsp"> 点 我 登 陆 |
					Getting Start >> </a>
			</div>
		</div>
	</div>
	<footer>
		<div class="container">
			<div class="row">
				<p align="center"
					style="text-align: center; color: #999; vertical-align: middle; margin-top: 2px; font-size: 14px">@
					2017 All Rights Reserved 远程抄表系统 | Intelligent Remote Meter Reading
					System</p>
			</div>
		</div>
	</footer>


	<script src="/Remotemeter/dist/js/vendor/jquery.min.js"></script>
	<script src="/Remotemeter/dist/js/vendor/video.js"></script>
	<script src="/Remotemeter/dist/js/flat-ui.min.js"></script>
	<script src="/Remotemeter/docs/assets/js/application.js"></script>

</body>
</html>
