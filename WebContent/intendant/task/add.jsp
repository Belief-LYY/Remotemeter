<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="com.imooc.dao.SchemeDAO"%>
<%@ page import="com.imooc.model.scheme"%>
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
		style="float: left; height: 100%; width: 85%; background-color: #fafafa; margin-top: -30px;">
		<ol class="breadcrumb" style="font-size: 15px;">
			<li><a style="color: #4F4F4F; margin-left: 60px;"
				href="/Remotemeter/intendant/index/index.jsp"> 首 页 ></a></li>
			<li><a style="color: #4F4F4F;"
				href="/Remotemeter/intendant/task/index.jsp">采 集 任 务 管 理 ></a></li>
			<li><a style="color: #4F4F4F;" href="#">新 增 采 集 任 务></a></li>
		</ol>
		<h2
			style="color: #efefef; font-weight: 700; letter-spacing: 2px; padding-top: 4px; padding-left: 12px;">&nbsp;&nbsp;</h2>

		<div
			style="padding-left: 150px; padding-right: 150px; padding-top: 10px; color: #888; font-weight: 200; font-size: 20px; letter-spacing: 1px">
			<hr>
			* 电表编号：<input type="text" id="meter_id" name="meter_id"
				style="display: inline; width: 500px;" value=""
				placeholder="请输入电表编号" class="form-control" />
			<hr><nobr>
			* 采集方案：<select name="sche" id="sche" style="width: 500px;"
				class="form-control select select-primary" data-toggle="select">
				<%
					SchemeDAO schemedao = new SchemeDAO();
					ArrayList<scheme> listss = null;
					schemedao.protectscheme();
					listss = schemedao.getscheme();
					if (listss != null && listss.size() > 0) {
						for (int j = 0; j < listss.size(); j++) {
							scheme ischeme = listss.get(j);
				%>
				<option value="<%=ischeme.getSche()%>">方案<%=ischeme.getSche()%></option>
				<!-- 商品循环结束 -->
				<%
					}
					}
				%>
			</select></nobr>
			<hr>
			- 备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：<input
				type="text" id="remark" name="remark"
				style="display: inline; width: 500px;" value=""
				placeholder="请输入备注信息" class="form-control" />
			<hr>

		</div>
		<div class="col-xs-3"
			style="float: left; margin-left: 300px; margin-bottom: 200px; letter-spacing: 3px; width: 400px; font-size: 20px">
			<a onClick="link();" style="font-size: 19px;"
				class="btn btn-block btn-lg btn-warning">提交 | Submit</a>
		</div>
	</div>

	<footer>
		<div class="container">
			<div class="row">
				<p align="center"
					style="height: 15px; text-align: center; color: #999; letter-spacing: 1px; vertical-align: middle; margin-top: 100px; font-size: 14px; z-index: 99">@
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
<script type="text/javascript">
	function link() {
		console.log("开始提交数据");
		var xmlhttp;

		if (window.XMLHttpRequest) {
			//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
			xmlhttp = new XMLHttpRequest();
		} else {
			// IE6, IE5 浏览器执行代码
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		var meter_id = document.getElementById("meter_id").value;
		var sche = document.getElementById("sche").value;
		var remark = document.getElementById("remark").value;
		var reg = /\A\d{6}$/;
		var regg = /^\d{8}$/;
		if (meter_id.length == 0)
			alert("请输入电表编号！");
		else if (sche.length == 0)
			alert("请选择采集方案！");
		else if (!reg.test(meter_id))
			alert("电表编号格式错误！");
		else if (!confirm("确认添加？")) {
			window.event.preventDefault();
			//window.event.returnValue = false;
		} else {
			console.log("meter_id:" + meter_id + ";remark:" + remark + ";sche:"
					+ sche);
			xmlhttp.open("POST", "/Remotemeter/servlet/MeterServlet?sche="
					+ sche + "&meter_id=" + meter_id + "&action=addsche", true);
			xmlhttp.send();

			xmlhttp.onreadystatechange = function() {
				console.log(xmlhttp.response);

				if (xmlhttp.readyState == 4) {
					if (xmlhttp.status == 200) {
						console.log(xmlhttp.response);
						var objJson = JSON.parse(xmlhttp.response);
						if (objJson == "success") {
							alert("添加成功！");
						} else
							alert(objJson);
					} else {
						console.log(xmlhttp.response);
						alert("ERROR! Ajax 错误！请检查网络！");
					}
				}
			}

		}

	}
</script>
</html>