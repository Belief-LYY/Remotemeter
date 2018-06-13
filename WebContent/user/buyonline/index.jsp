<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.imooc.dao.MyaccountDAO"%>
<%@ page import="com.imooc.model.personal"%>
<%@ page import="com.imooc.model.company"%>
<%@ page import="com.imooc.model.meter"%>
<%@ page import="com.imooc.dao.meterDao"%>
<%@ page import="com.imooc.model.standard"%>
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
<body background="#fafafa;" onload="changePrice()">

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
			<li><a style="color: #4F4F4F;" href="#"> 在 线 购 电 ></a></li>
		</ol>
		<h2
			style="color: #efefef; font-weight: 700; letter-spacing: 2px; padding-top: 4px; padding-left: 12px;">&nbsp;&nbsp;／在线购电／</h2>
		<div class="col-xs-3"
			style="float: right; margin-right: 120px; letter-spacing: 3px; width: 220px; font-size: 20px; margin-top: -50px;">
		</div>
		<div>
			<%
				meterDao meterdao = new meterDao();
				ArrayList<meter> list = null;
				int id = (int) request.getSession().getAttribute("id");
				String type = (String) request.getSession().getAttribute("type");
				list = meterdao.mymeters(id);
				StandardDAO istandarddao = new StandardDAO();
				ArrayList<standard> istandards = new ArrayList<standard>();
				istandards = istandarddao.getstandard();
				float price;
				if (istandards.get(0).getType().equals(type)) {
					price = istandards.get(0).getPrice();
				} else {
					price = istandards.get(1).getPrice();
				}
			%>


			<div
				style="padding-left: 160px; padding-right: 100px; padding-top: 30px; color: #888; font-weight: 200; font-size: 22px; letter-spacing: 1px; overflow-y: auto; overflow-x: hidden; width: 920px; height: 400px">

				&nbsp;电 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;表 ：<select id="listmeter"
					onchange="changePrice()" class="form-control select select-primary"
					data-toggle="select" style="margin-left: 10px; margin-right: 40px;">
					<%
						if (list != null && list.size() > 0) {
							int i;
							for (i = 0; i < list.size(); i++) {
								meter imeter = list.get(i);
					%>

					<option value="<%=i%>"><%=imeter.getMeter_id()%></option>
					<%
						}
							i++;
					%>
					<option id="allmeter" value="<%=i%>" selected>全部电表</option>
					<%
						}
					%>
				</select>
				<hr>
				选择电量：<select id="meternumber" onchange="changePrice()"
					style="margin-left: 10px; margin-right: 40px;"
					class="form-control select select-primary" data-toggle="select">
					<option value="0" selected> 50 度  </option>
					<option value="1"> 100 度  </option>
					<option value="2"> 150 度  </option>
					<option value="3"> 200 度  </option>
					<option value="4"> 250 度  </option>
					<option value="5"> 300 度  </option>
					<option value="6"> 350 度  </option>
					<option value="7"> 400 度  </option>
					<option value="8"> 450度  </option>
					<option value="9"> 500 度  </option>
					<option value="10"> 550 度  </option>
					<option value="11"> 600 度  </option>
					<option value="12"> 650 度  </option>
					<option value="13"> 700 度  </option>
					<option value="14"> 750 度  </option>
					<option value="15"> 800 度  </option>
					<option value="16"> 850 度  </option>
					<option value="17"> 900 度  </option>
					<option value="18"> 950 度  </option>
					<option value="19"> 1000 度  </option>
				</select>


				<script>
					function changePrice() {
						var Select1Value = document.getElementById("listmeter").value;
						var Select2Value = document
								.getElementById("meternumber").value;
						var option1Value = document.getElementById("allmeter").value;

						var p = new Array("50", "100", "150", "200", "250",
								"300", "350", "400", "450", "500", "550",
								"600", "650", "700", "750", "800", "850",
								"900", "950", "1000");
						var q = "应付金额 ：";
						if (Select1Value == option1Value) {
							q = q + p[Select2Value] * (option1Value - 1) * <%=price%>;
						} else {
							q = q + p[Select2Value] * <%=price%>;
						}
						document.getElementById("nowchange").innerHTML = q; //div的html是now这个字符串 
						//setTimeout("show()",1000); //设置过1000毫秒就是1秒，调用show方法
					}
				</script>

				<hr>
				<p id="nowchange"></p>
				<hr>
				<a href="/Remotemeter/user/buyonline/history.jsp"
					style="display: inline; font-size: 19px; color: #096; width: 120px;">支付历史
					>> </a> <a href="/Remotemeter/user/buyonline/payment.jsp"
					style="display: inline; font-size: 23px; margin-left: 370px; width: 150px;"
					class="btn btn-block btn-lg btn-default">去支付 </a>


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
