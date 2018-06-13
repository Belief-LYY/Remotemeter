<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="com.imooc.dao.MyaccountDAO"%>
<%@ page import="com.imooc.model.personal"%>
<%@ page import="com.imooc.model.company"%>
<%@ page import="com.imooc.model.meter"%>
<%@ page import="com.imooc.model.records"%>

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
		style="margin-left: -1px; margin-top: -30px; text-align: center; font-size: 16px; float: left; width: 15%; height: 720px; background-color: #73BAAA; box-shadow: inset;">


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
		style="float: left; margin-top: -30px; height: 720px; width: 85%; background-color: #fafafa">
		<ol class="breadcrumb" style="font-size: 15px;">
			<li><a style="color: #4F4F4F; margin-left: 60px;"
				href="/Remotemeter/user/index/index.jsp"> 用 户 首 页 ></a></li>
			<li><a style="color: #4F4F4F;"
				href="/Remotemeter/user/buyonline/index.jsp"> 在 线 购 电 ></a></li>
			<li><a style="color: #4F4F4F;" href="#"> 支 付 历 史 ></a></li>
		</ol>
		<h2
			style="color: #efefef; font-weight: 700; letter-spacing: 2px; padding-top: 4px; padding-left: 12px;">&nbsp;&nbsp;／支付历史／</h2>
		<div class="col-xs-3"
			style="float: right; margin-right: 120px; letter-spacing: 3px; width: 220px; font-size: 20px; margin-top: -50px;">

		</div>
		<div>
			<div
				style="padding-left: 160px; padding-right: 100px; padding-top: 30px; color: #888; font-weight: 200; font-size: 22px; letter-spacing: 1px; overflow-y: auto; overflow-x: hidden; width: 920px; height: 410px">

				<div
					style="padding-left: 30px; padding-top: 10px; color: #888; font-weight: 200; font-size: 22px; letter-spacing: 1px; overflow-y: auto; overflow-x: hidden; width: 920px; height: 400px">

					<div class="table-responsive">
						<table class="table table-hover"
							style="text-align: center; color: #666; font-weight: 300; font-size: 18px">
							<thead>
								<tr>
									<th scope="col">我的电表</th>
									<th scope="col">电表编号</th>
									<th scope="col">时 间</th>
									<th scope="col">交易状态</th>
									<th scope="col">交易金额</th>
									<th scope="col">交易后余额</th>
								</tr>

								<%
									int id = (int) request.getSession().getAttribute("id");
									String type = (String) request.getSession().getAttribute("type");
									System.out.println(id);
									MyaccountDAO idao = new MyaccountDAO();
									ArrayList<records> list;
									list = idao.getrecordsbyid(id);
									if (list != null && list.size() > 0) {
										for (int i = 0; i < list.size(); i++) {
											records irecord = list.get(i);
								%>
								<tr>
									<td>记录<%=i%></td>
									<td><%=irecord.getMeter_id()%></td>
									<td><%=irecord.getTime()%></td>
									<td>成功</td>
									<td><%=irecord.getMoney()%>¥</td>
									<td><%=irecord.getBalance()%>¥</td>
								</tr>
								<%
									}
									}
								%>
							
						</table>
					</div>
				</div>
			</div>
			<hr>
			<a href="/Remotemeter/user/buyonline/index.jsp"
				style="display: inline; font-size: 23px; margin-left: 750px; margin-top: 50px; width: 150px;"
				class="btn btn-block btn-lg btn-default">返 回 </a>
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
