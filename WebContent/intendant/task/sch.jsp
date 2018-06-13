<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="com.imooc.dao.meterDao"%>
<%@ page import="com.imooc.model.meter"%>
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
			<li><a style="color: #4F4F4F;" href="#">方 案 库></a></li>
		</ol>
		<h2
			style="color: #efefef; font-weight: 700; letter-spacing: 2px; padding-top: 0px; padding-left: 60px;">/方案库/&nbsp;&nbsp;</h2>
		<div class="col-xs-3"
			style="float: right; margin-right: 220px; letter-spacing: 3px; width: 220px; font-size: 20px; margin-top: -35px;">

			<div class="col-xs-3"
				style="float: right; margin-right: 100px; letter-spacing: 3px; width: 200px; font-size: 20px; margin-top: px;">
				<a href="/Remotemeter/intendant/task/schadd.jsp"
					style="font-size: 20px;" class="btn btn-block btn-lg btn-inverse">新增</a>
			</div>

			<div class="col-xs-3"
				style="float: right; margin-right: -100px; letter-spacing: 3px; width: 200px; font-size: 20px; margin-top: -50px;">
				<a onClick="delcfm();" style="font-size: 20px;"
					class="btn btn-block btn-lg btn-danger">删除</a>
			</div>
		</div>


		<div>
			<div
				style="padding-left: 80px; padding-right: 0px; padding-top: 20px; color: #888; font-weight: 200; font-size: 22px; letter-spacing: 1px; overflow-y: auto; overflow-x: hidden; width: 1000px; height: 540px">
				<div class="table-responsive">
					<table class="table table-hover"
						style="text-align: center; color: #666; font-weight: 300; font-size: 18px">
						<thead>
							<tr>
								<th scope="col">采集方案编号</th>
								<th scope="col">采集频率（次/时）</th>
								<th scope="col">起始时间</th>
								<th scope="col">终止时间</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<!-- 电表循环开始 -->
							<%
								SchemeDAO schemedao = new SchemeDAO();
								ArrayList<scheme> list = null;
								schemedao.protectscheme();
								list = schemedao.getscheme();
								if (list != null && list.size() > 0) {
									for (int i = 0; i < list.size(); i++) {
										scheme ischeme = list.get(i);
							%>
							<tr>
								<td><a style="color: #73BAA9;"
									href="/Remotemeter/servlet/taskServlet?sche=<%=ischeme.getSche()%>&action=sche&rate=<%=ischeme.getRate()%>&start=<%=ischeme.getStart()%>&end=<%=ischeme.getEnd()%>"><%=ischeme.getSche()%></a></td>
								<td><%=ischeme.getRate()%></td>
								<td><%=ischeme.getStart()%></td>
								<%
									if (ischeme.getEnd() == null) {
								%>
								<td></td>
								<%
									} else {
								%>
								<td><%=ischeme.getEnd()%></td>
								<%
									}
								%>
								<td style="width: 0px;">
									<div align="center">
										<label class="checkbox" for="checkbox<%=i%>"> <input
											type="checkbox" onClick="isdelete('<%=ischeme.getSche()%>');"
											style="" value="" id="checkbox<%=i%>" data-toggle="checkbox">
										</label>
									</div>
								</td>
							</tr>
							<!-- 商品循环结束 -->
							<%
								}
								}
							%>
						</tbody>
					</table>
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

<script type="text/javascript">
	function isdelete(sche) {
		jQuery.ajax({
			url : "/Remotemeter/servlet/schemeServlet",
			cache : false,
			data : {
				"sche" : sche,
				"action" : "isdelete"
			},
		});
	}
</script>

<script type="text/javascript">
	function delcfm() {
		if (!confirm("确认要删除？")) {
			window.event.preventDefault();
			//window.event.returnValue = false;
		} else {
			jQuery
					.ajax({
						url : "/Remotemeter/servlet/schemeServlet",
						cache : false,
						type : "post",
						dataType : "json",
						async : false,//同步  
						data : {
							"action" : "deletesche"
						},
						success : function(data) {
							alert(data);
							window.location.href = '/Remotemeter/intendant/task/sch.jsp';
						},
						failure : function() {
							alert("该方案正在使用，无法删除！");
						}
					});
		}
	}
</script>
</html>
