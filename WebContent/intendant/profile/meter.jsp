<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="com.imooc.dao.meterDao"%>
<%@ page import="com.imooc.model.meter"%>
<%@ page import="com.imooc.dao.MyaccountDAO"%>
<%@ page import="com.imooc.model.personal"%>
<%@ page import="com.imooc.model.company"%>
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
<script type="text/javascript" src="/Remotemeter/js/Region.js"></script>

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
		style="float: left; height: 100%; width: 85%; background-color: #fafafa; margin-top: -30px;">
		<ol class="breadcrumb" style="font-size: 15px;">
			<li><a style="color: #4F4F4F; margin-left: 60px;"
				href="/Remotemeter/intendant/index/index.jsp"> 首 页 ></a></li>
			<li><a style="color: #4F4F4F;"
				href="/Remotemeter/intendant/profile/index.jsp">用 户 档 案 管 理 ></a></li>
			<li><a style="color: #4F4F4F;" href="#">电 表></a></li>
		</ol>
		<h2
			style="color: #efefef; font-weight: 700; letter-spacing: 2px; padding-top: 4px; padding-left: 12px;">&nbsp;&nbsp;／电表信息／</h2>


		<div class="col-xs-3"
			style="float: right; margin-right: 120px; letter-spacing: 3px; width: 220px; font-size: 20px; margin-top: -50px;">
			<a
				href="/Remotemeter/servlet/MeterServlet?action=modifymeter&meter_id=<%=request.getSession().getAttribute("meter_id")%>"
				style="font-size: 19px;" class="btn btn-block btn-lg btn-default">修
				改 | Modify</a>
		</div>

		<div>
			<div
				style="padding-left: 150px; padding-right: 150px; padding-top: 22px; color: #888; font-weight: 200; font-size: 22px; letter-spacing: 1px">
				<p>
					<!-- 电表循环开始 -->
					<%
						meterDao meterdao = new meterDao();
						ArrayList<meter> list = null;
						// System.out.println(request.getParameter("meter_id")+"2222");
						if (request.getSession().getAttribute("meter_id") != null
								&& !request.getSession().getAttribute("meter_id").equals(""))
							;
						{
							String meter_id = (String) request.getSession().getAttribute("meter_id");
							list = meterdao.ismeters(meter_id);
							if (list != null && list.size() > 0) {
								for (int i = 0; i < list.size(); i++) {
									meter imeter = list.get(i);
									String types = "民用";
									if (imeter.getTypen() == 2)
										types = "商用";
					%>
					-电表编号：<%=imeter.getMeter_id()%>
				<hr>
				-用 户 ID：<%=imeter.getId()%><hr>
				-类 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 型：<%=types%><hr>
				-地 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 址：<%=imeter.getRemark()%><hr>
				<!-- 电表循环开始 -->
				<%
					MyaccountDAO userdao = new MyaccountDAO();
								int id = imeter.getId();
								String type = userdao.getusertypebyid(id);
								ArrayList<personal> infop = null;
								ArrayList<company> infoc = null;
								if (type.equals("0")) {
									infop = userdao.personalinfo(id);
									if (infop != null && infop.size() > 0) {
										for (int j = 0; j < infop.size(); j++) {

											personal ipersonal = infop.get(j);
											out.println("-用户姓名：" + ipersonal.getName() + "<hr>" + "-用户电话："
													+ ipersonal.getPhone() + "<hr>" + "-用户邮箱：" + ipersonal.getEmail() + "<hr>");
										}
									}

								}

								if (type.equals("1")) {
									infoc = userdao.companyinfo(id);
									if (infoc != null && infoc.size() > 0) {
										for (int j = 0; j < infoc.size(); j++) {

											company icompany = infoc.get(j);
											out.println("-用户姓名：" + icompany.getName() + "<hr>" + "-用户电话：" + icompany.getPhone()
													+ "<hr>" + "-用户邮箱：" + icompany.getEmail() + "<hr>");
										}
									}

								}
							}
						}
					}
				%>
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