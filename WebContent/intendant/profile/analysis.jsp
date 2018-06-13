<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="com.imooc.model.meter"%>
<%@ page import="com.imooc.dao.meterDao"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>远程抄表系统 |Remote Meter Reading System</title>

<script src="/Remotemeter/js/Chart.js"></script>
<meta name="viewport" content="initial-scale = 1, user-scalable = no">
<meta charset="UTF-8">
<style>
canvas {
	
}
</style>
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
				href="/Remotemeter/intendant/profile/index.jsp">用 户 档 案 管 理 ></a></li>
			<li><a style="color: #4F4F4F;" href="#">用 电 分 析></a></li>
		</ol>
		<h2
			style="color: #efefef; font-weight: 700; letter-spacing: 2px; padding-top: 2px; padding-left: 12px;">&nbsp;&nbsp;／用电分析／</h2>
		<div class="col-xs-3"
			style="float: right; margin-right: 120px; letter-spacing: 3px; width: 220px; font-size: 20px; margin-top: -50px;">

		</div>
		<div>
			<div
				style="padding-left: 100px; padding-right: 100px; padding-top: 8px; color: #888; font-weight: 200; font-size: 22px; letter-spacing: 1px; width: 920px; height:100%">
				<nobr>
					当 前 电 表：<select id="meter_id" name="meter_id"
						class="form-control select select-primary" data-toggle="select"
						style="margin-left: 10px;" onChange="funn();">
						<option value="<%=request.getParameter("meter_id")%>" selected><%=request.getParameter("meter_id")%></option>
					</select><select id="year1" name="year1"
						class="form-control select select-primary"
						style="margin-left: 100px;" data-toggle="select"
						onChange="funn();">
						<option value=2018>2018年</option>
						<option value=2017 selected>2017年 </option>
						<option value=2016>2016年 </option>
						<option value=2015>2015年 </option>
						<option value=2014>2014年 </option>
						<option value=2013>2013年 </option>
						<option value=2012>2012年 </option>
						<option value=2011>2011年 </option>
						<option value=2010>2010年 </option>
						<option value=2009>2009年 </option>
						<option value=2008>2008年 </option>
					</select> &nbsp; <select id="month1" name="month1"
						class="form-control select select-primary" data-toggle="select"
						onChange="funn();">
						<option value=01> 1 月  </option>
						<option value=02> 2 月  </option>
						<option value=03> 3 月  </option>
						<option value=04> 4 月  </option>
						<option value=05> 5 月  </option>
						<option value=06> 6 月  </option>
						<option value=07> 7 月  </option>
						<option value=08> 8 月  </option>
						<option value=09> 9 月  </option>
						<option value=10> 10 月  </option>
						<option value=11> 11 月  </option>
						<option value=12 selected> 12 月  </option>
					</select> &nbsp; &nbsp; 至 <select id="year2" name="year2"
						class="form-control select select-primary"
						style="margin-left: 20px;" data-toggle="select" onChange="funn();">
						<option value=2018 selected>2018年</option>
						<option value=2017>2017年 </option>
						<option value=2016>2016年 </option>
						<option value=2015>2015年 </option>
						<option value=2014>2014年 </option>
						<option value=2013>2013年 </option>
						<option value=2012>2012年 </option>
						<option value=2011>2011年 </option>
						<option value=2010>2010年 </option>
						<option value=2009>2009年 </option>
						<option value=2008>2008年 </option>
					</select> &nbsp; <select id="month2" name="month2"
						class="form-control select select-primary" data-toggle="select"
						onChange="funn();">
						<option value=01 selected> 1 月  </option>
						<option value=02> 2 月  </option>
						<option value=03> 3 月  </option>
						<option value=04> 4 月  </option>
						<option value=05> 5 月  </option>
						<option value=06> 6 月  </option>
						<option value=07> 7 月  </option>
						<option value=08> 8 月  </option>
						<option value=09> 9 月  </option>
						<option value=10> 10 月  </option>
						<option value=11> 11 月  </option>
						<option value=12> 12 月  </option>
					</select>
				</nobr>
				<hr>
				<canvas id="canvas" height="429" width="900"
					style="margin-top: 18px;"></canvas>

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
	<script type="text/javascript" src="/Remotemeter/js/datetime.js"></script>


	<script>
		var meter_id = document.getElementById("meter_id").value;
		var year1 = document.getElementById("year1").value;
		var year2 = document.getElementById("year2").value;
		var month1 = document.getElementById("month1").value;
		var month2 = document.getElementById("month2").value;
		if (year1 > year2 || (year1 == year2 && month1 > month2)) {
			alert("起始日期必须小于终止日期！");
			window.event.preventDefault();
		} else if (year2 - year1 > 1
				|| (year1 == year2 - 1 && month1 <= month2)) {
			alert("时间跨度不得大于一年！");
			window.event.preventDefault();
		} else {

			jQuery.ajax({
				url : "/Remotemeter/servlet/MeterServlet",
				cache : false,
				type : "post",
				dataType : "json",
				data : {
					meter_id : meter_id,
					year1 : year1,
					year2 : year2,
					month1 : month1,
					month2 : month2,
					"action" : "analysis"
				},
				success : function(data) {
					var lineChartData = {
						labels : [ "1", "2", "3", "4", "5", "6", "7", "8", "9",
								"10", "11", "12" ],
						datasets : [ {
							fillColor : "rgba(141,200,192,0.5)",
							strokeColor : "rgba(220,220,220,1)",
							pointColor : "rgba(220,220,220,1)",
							pointStrokeColor : "#fff",
							data : [ data[0], data[1], data[2], data[3],
									data[4], data[5], data[6], data[7],
									data[8], data[9], data[10], data[11] ]
						} ]
					}

					var myLine = new Chart(document.getElementById("canvas")
							.getContext("2d")).Line(lineChartData);
				}
			});

		}

		function funn() {
			var meter_id = document.getElementById("meter_id").value;
			var year1 = document.getElementById("year1").value;
			var year2 = document.getElementById("year2").value;
			var month1 = document.getElementById("month1").value;
			var month2 = document.getElementById("month2").value;
			if (year1 > year2 || (year1 == year2 && month1 > month2)) {
				alert("起始日期必须小于终止日期！");
				window.event.preventDefault();
			} else if (year2 - year1 > 1
					|| (year1 == year2 - 1 && month1 <= month2)) {
				alert("时间跨度不得大于一年！");
				window.event.preventDefault();
			} else {

				jQuery.ajax({
					url : "/Remotemeter/servlet/MeterServlet",
					cache : false,
					type : "post",
					dataType : "json",
					data : {
						meter_id : meter_id,
						year1 : year1,
						year2 : year2,
						month1 : month1,
						month2 : month2,
						"action" : "analysis"
					},
					success : function(data) {
						var lineChartData = {
							labels : [ "1", "2", "3", "4", "5", "6", "7", "8",
									"9", "10", "11", "12" ],
							datasets : [ {
								fillColor : "rgba(141,200,192,0.5)",
								strokeColor : "rgba(220,220,220,1)",
								pointColor : "rgba(220,220,220,1)",
								pointStrokeColor : "#fff",
								data : [ data[0], data[1], data[2], data[3],
										data[4], data[5], data[6], data[7],
										data[8], data[9], data[10], data[11] ]
							} ]
						}

						var myLine = new Chart(document
								.getElementById("canvas").getContext("2d"))
								.Line(lineChartData);
					}
				});
			}
		}
	</script>
</body>
</html>
