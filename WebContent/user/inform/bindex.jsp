<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="com.imooc.dao.MyaccountDAO"%>
<%@ page import="com.imooc.model.personal"%>
<%@ page import="com.imooc.model.company"%>
<%@ page import="com.imooc.model.meter"%>

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
		style="margin-left: -1px; margin-top: -30px; text-align: center; font-size: 16px; float: left; width: 15%; height: 780px; background-color: #73BAAA; box-shadow: inset;">


		<ul style="font-size: 19px; font-weight: 400; letter-spacing: 1px">
			<li><a href="/Remotemeter/user/mymeter/index.jsp">我的电表 | <Br>My
					Ammeters
			</a></li>
			<li><a href="/Remotemeter/user/inform/bindex.jsp">我的信息 | <Br>Personal
					Info
			</a></li>
			<li><a href="/Remotemeter/user/bill/index.jsp">我的账单 | <Br>My
					Bills
			</a></li>
			<li><a href="/Remotemeter/user/buyonline/index.jsp">在线购电 | <Br>Purchase
					Online
			</a></li>
			<li><a href="/Remotemeter/account/ModifyPassword.jsp">密码修改 |
					<Br>Password Modification
			</a></li>
		</ul>


	</div>

	<div
		style="float: left; margin-top: -30px; height: 780px; width: 85%; background-color: #fafafa">
		<ol class="breadcrumb" style="font-size: 15px;">
			<li><a style="color: #4F4F4F; margin-left: 60px;"
				href="/Remotemeter/user/index/index.jsp"> 用 户 首 页 ></a></li>
			<li><a style="color: #4F4F4F;" href="#"> 我 的 信 息 ></a></li>
		</ol>
		<h2
			style="color: #efefef; font-weight: 700; letter-spacing: 2px; padding-top: 4px; padding-left: 12px;">&nbsp;&nbsp;／个人信息／</h2>
		<div class="col-xs-3"
			style="float: right; margin-right: 120px; letter-spacing: 3px; width: 220px; font-size: 20px; margin-top: -50px;">
			<a href="/Remotemeter/user/inform/bmodify.jsp"
				style="font-size: 19px;" class="btn btn-block btn-lg btn-default">修
				改 | Modify</a>
		</div>
		<%
			int id = (int) request.getSession().getAttribute("id");
			String type = (String) request.getSession().getAttribute("type");
			System.out.println(id);
			MyaccountDAO idao = new MyaccountDAO();
			ArrayList<personal> listp;
			ArrayList<company> listc;
			if (type.equals("0")) {
				listp = idao.personalinfo(id);
				if (listp != null && listp.size() > 0) {
					for (int i = 0; i < listp.size(); i++) {
						personal ipersonal = listp.get(i);
						String types = "个人";
						if (ipersonal.getType().equals("1"))
							type = "商户";
		%>
		<div>
			<hr>
			<div
				style="padding-left: 150px; padding-right: 150px; padding-top: 18px; color: #888; font-weight: 200; font-size: 20px; letter-spacing: 1px">
				- 邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<a type="text"
					style="display: inline; width: 260px;" class="form-control"><%=ipersonal.getEmail()%></a>
				<hr>
				- 类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：<a type="text"
					style="display: inline; width: 260px;" class="form-control"><%=types%></a>
				<hr>
				- 性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<a type="text"
					style="display: inline; width: 260px;" class="form-control"><%=ipersonal.getSex()%></a>
				<hr>
				- 地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：<a type="text"
					style="display: inline; width: 600px;" class="form-control"><%=ipersonal.getAddress()%></a>
				<hr>
				- 身份证 ：<a type="text" style="display: inline; width: 260px;"
					class="form-control"><%=ipersonal.getIdcard()%></a>
				<hr>
				- 电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：<a type="text"
					style="display: inline; width: 260px;" class="form-control"><%=ipersonal.getPhone()%></a>
				<hr>
				- 姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<a type="text"
					style="display: inline; width: 260px;" class="form-control"><%=ipersonal.getName()%></a>
				<hr>
				- 银行卡 ：<a type="text" style="display: inline; width: 260px;"
					class="form-control"><%=ipersonal.getBankcard()%></a>
				<hr>
				<!-- 商品循环结束 -->
				<%
					}
						}
					}
					if (type.equals("1")) {
						listc = idao.companyinfo(id);
						if (listc != null && listc.size() > 0) {
							for (int i = 0; i < listc.size(); i++) {
								company icompany = listc.get(i);
				%>
				<div>
					<hr>
					<div
						style="padding-left: 150px; padding-right: 150px; padding-top: 18px; color: #888; font-weight: 200; font-size: 20px; letter-spacing: 1px">
						- 邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<a type="text"
							style="display: inline; width: 260px;" class="form-control"><%=icompany.getEmail()%></a>
						<hr>
						- 类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：<a type="text"
							style="display: inline; width: 260px;" class="form-control"><%=icompany.getType()%></a>
						<hr>
						- 公&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;司：<a type="text"
							style="display: inline; width: 260px;" class="form-control"><%=icompany.getCompany()%></a>
						<hr>
						- 地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：<a type="text"
							style="display: inline; width: 600px;" class="form-control"><%=icompany.getAddress()%></a>
						<hr>
						- 身份证 ：<a type="text" style="display: inline; width: 260px;"
							class="form-control"><%=icompany.getIdcard()%></a>
						<hr>
						- 电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：<a type="text"
							style="display: inline; width: 260px;" class="form-control"><%=icompany.getPhone()%></a>
						<hr>
						- 姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<a type="text"
							style="display: inline; width: 260px;" class="form-control"><%=icompany.getCompany()%></a>
						<hr>
						- 银行卡 ：<a type="text" style="display: inline; width: 260px;"
							class="form-control"><%=icompany.getBankcard()%></a>
						<hr>
						<!-- 商品循环结束 -->
						<%
							}
								}
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>


	<footer>
		<div class="container">
			<div class="row">
				<p align="center"
					style="height: 15px; text-align: center; color: #999; letter-spacing: 1px; vertical-align: middle; margin-top: 6px; font-size: 14px; z-index: 99">@
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
