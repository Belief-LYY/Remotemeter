<%@page import="org.omg.CORBA.FloatHolder"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="com.imooc.model.meter"%>
<%@ page import="com.imooc.model.reading"%>
<%@ page import="com.imooc.model.standard"%>
<%@ page import="com.imooc.dao.meterDao"%>
<%@ page import="com.imooc.dao.StandardDAO"%>
<%@ page import="java.math.BigDecimal"%>
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
			<li><a style="color: #4F4F4F;" href="#"> 我 的 账 单 ></a></li>
		</ol>
		<h2
			style="color: #efefef; font-weight: 700; letter-spacing: 2px; padding-top: 4px; padding-left: 12px;">&nbsp;&nbsp;／我的账单／</h2>
		<div class="col-xs-3"
			style="float: right; margin-right: 120px; letter-spacing: 3px; width: 220px; font-size: 20px; margin-top: -50px;">

		</div>
		<div>

			<div
				style="padding-left: 80px; padding-right: 100px; color: #888; font-weight: 200; font-size: 22px; letter-spacing: 1px; overflow-y: auto; overflow-x: hidden; width: 100%; height: 500px">

				<form action="/Remotemeter/servlet/MeterServlet" method="post">
					<nobr>
						时 间 ： <select id="year" name="year"
							class="form-control select select-primary"
							style="margin-left: 10px;" data-toggle="select">
							<option value="2018">2018年</option>
							<option value="2017">2017年 </option>
							<option value="2016">2016年 </option>
							<option value="2015">2015年 </option>
							<option value="2014">2014年 </option>
							<option value="2013">2013年 </option>
							<option value="2012">2012年 </option>
							<option value="2011">2011年 </option>
							<option value="2010">2010年 </option>
							<option value="2009">2009年 </option>
							<option value="2008">2008年 </option>
						</select> &nbsp; <select id="month" name="month"
							style="margin-left: 10px; margin-right: 50px;"
							class="form-control select select-primary" data-toggle="select">
							<option value="1"> 1 月  </option>
							<option value="2"> 2 月  </option>
							<option value="3"> 3 月  </option>
							<option value="4"> 4 月  </option>
							<option value="5"> 5 月  </option>
							<option value="6"> 6 月  </option>
							<option value="7"> 7 月  </option>
							<option value="8"> 8 月  </option>
							<option value="9"> 9 月  </option>
							<option value="10"> 10 月  </option>
							<option value="11"> 11 月  </option>
							<option value="12"> 12 月  </option>
						</select> 电 表：<select id="meter_id" name="meter_id"
							class="form-control select select-primary" data-toggle="select"
							style="margin-left: 10px; margin-right: 200px;">

							<%
								meterDao meterdao = new meterDao();
								ArrayList<meter> list = null;
								int id = (int) request.getSession().getAttribute("id");
								String type = (String) request.getSession().getAttribute("type");
								list = meterdao.mymeters(id);
								if (list != null && list.size() > 0) {
									for (int i = 0; i < list.size(); i++) {
										meter imeter = list.get(i);
										if (request.getParameter("meter_id") != null && !request.getParameter("meter_id").equals("")
												&& request.getParameter("meter_id").equals(imeter.getMeter_id())) {
							%>
							<option value="<%=imeter.getMeter_id()%>" selected><%=imeter.getMeter_id()%></option>
							<%
								} else {
							%>
							<option value="<%=imeter.getMeter_id()%>"><%=imeter.getMeter_id()%></option>
							<%
								}
									}
								}
							%>
						</select> <input id="action" name="action" type="submit"
							style="display: inline; font-size: 19px; width: 120px;"
							class="btn btn-block btn-lg btn-default" value="查看账单" />
					</nobr>
				</form>
				<br>
				<div class="table-responsive">
					<table class="table table-hover"
						style="text-align: center; color: #666; font-weight: 300; font-size: 18px">
						<thead>
							<tr>
								<th scope="col">电表编号</th>
								<th scope="col">起始时间</th>
								<th scope="col">结束时间</th>
								<th scope="col">所用电量</th>
								<th scope="col">账单</th>
							</tr>
						</thead>
						<tbody>
							<%
								ArrayList<reading> lists = null;
								if (request.getParameter("meter_id") != null && !request.getParameter("meter_id").equals("")
										&& request.getParameter("year") != null && !request.getParameter("year").equals("")
										&& request.getParameter("month") != null && !request.getParameter("month").equals("")) {
									String start = request.getParameter("year") + "-" + request.getParameter("month") + "-01 00:00:00";
									String end = request.getParameter("year") + "-" + request.getParameter("month") + "-31 23:59:59";
									String meter_id = request.getParameter("meter_id");
									lists = meterdao.getreading(meter_id, start, end);
									double bill = 0;
									float use = 0;
									if (lists != null && lists.size() > 0) {
										for (int i = 0; i < lists.size(); i++) {
											reading ireading = lists.get(i);
											if (i == 0) {
												use -= ireading.getReading();
											}
											if (i == lists.size() - 1) {
												use += ireading.getReading();
											}

										}
										StandardDAO istandarddao = new StandardDAO();
										ArrayList<standard> istandards = new ArrayList<standard>();
										istandards = istandarddao.getstandard();
										float price;
										if (istandards.get(0).getType().equals(type)) {
											price = istandards.get(0).getPrice();
										} else {
											price = istandards.get(1).getPrice();
										}
										BigDecimal bg = new BigDecimal(use);
										double f1 = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
										bill = use * price;
										BigDecimal bgs = new BigDecimal(bill);
										double f2 = bgs.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
							%>
							<tr>
								<td><%=meter_id%></td>
								<td><%=start%></td>
								<td><%=end%></td>
								<td><%=f1%></td>
								<td><%=f2%></td>
							</tr>
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
	<script type="text/javascript">
		if (
	<%=request.getParameter("year")%>
		!= null) {
			document.getElementById("year").value =
	<%=request.getParameter("year")%>
		;
		} else {
			document.getElementById("year").value = "2018";
		}
		if (
	<%=request.getParameter("month")%>
		!= null) {
			document.getElementById("month").value =
	<%=request.getParameter("month")%>
		;
		} else {
			document.getElementById("month").value = "1";
		}
	</script>
</body>
</html>
