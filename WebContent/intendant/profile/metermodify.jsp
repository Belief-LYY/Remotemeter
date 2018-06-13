<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="com.imooc.dao.meterDao"%>
<%@ page import="com.imooc.model.meter"%>
<%@ page import="com.imooc.dao.MyaccountDAO"%>
<%@ page import="com.imooc.model.personal"%>
<%@ page import="com.imooc.model.company"%>
<%@ page import="com.imooc.dao.SchemeDAO"%>
<%@ page import="com.imooc.model.scheme"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>远程抄表系统 |Remote Meter Reading System</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--<link rel="stylesheet" type="text/css" href="styles.css">-->

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
<script type="text/javascript"
	src="/Remotemeter/js/jquery/jquery-1.7.min.js"></script>
<script type="text/javascript"
	src="/Remotemeter/js/json/json-minified.js"></script>

<script type="text/javascript">
	function delcfm() {
		if (!confirm("确认要删除？")) {
			window.event.preventDefault();
			//window.event.returnValue = false;
		}
	}
</script>

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
		style="margin-left: -1px; text-align: center; margin-top: -30px; font-size: 16px; float: left; max-width: 15%; height: 740px; background-color: #73BAAA; box-shadow: inset;">

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
			<li><a style="color: #4F4F4F;"
				href="/Remotemeter/intendant/profile/meter.jsp">电 表></a></li>
			<li><a style="color: #4F4F4F;" href="#">修 改></a></li>
		</ol>
		<h2
			style="color: #efefef; font-weight: 700; letter-spacing: 2px; padding-top: 4px; padding-left: 12px;">&nbsp;&nbsp;／电表信息／</h2>


		<div class="col-xs-3"
			style="float: right; margin-right: 120px; letter-spacing: 3px; width: 220px; font-size: 20px; margin-top: -50px;">
			<a
				onClick="link('<%=request.getSession().getAttribute("meter_id")%>');"
				style="font-size: 19px;" class="btn btn-block btn-lg btn-default">提交
				| Submit</a>
		</div>

		<div>
			<div
				style="padding-left: 150px; padding-top: 22px; color: #888; font-weight: 200; font-size: 22px; letter-spacing: 1px">
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
					%>
					*地&nbsp;&nbsp;&nbsp;&nbsp;区：
				<div class="col-xs-3"
					style="float: left; margin-left: 90px; letter-spacing: 3px; width: 0px; font-size: 20px; margin-top: -55px">
					<select name="province" id="province"
						onchange="onSelectChange(this,'city');" style="width: 170px"
						class="form-control select select-primary" data-toggle="select">
					</select>
				</div>
				<!-- /.col-xs-3 -->

				<div class="col-xs-3"
					style="float: left; margin-left: 300px; letter-spacing: 3px; width: 0px; font-size: 20px; margin-top: -55px">
					<select name="city" id="city"
						onchange="onSelectChange(this,'area');" style="width: 170px"
						class="form-control select select-primary" data-toggle="select">
					</select>
				</div>
				<!-- /.col-xs-3 -->

				<div class="col-xs-3"
					style="float: left; margin-left: 500px; letter-spacing: 3px; width: 0px; font-size: 20px; margin-top: -55px">
					<select name="area" id="area" style="width: 200px"
						class="form-control select select-primary" data-toggle="select">
					</select>
				</div>
				<!-- /.col-xs-3 -->
				<hr>

				<nobr>
					*类&nbsp;&nbsp;&nbsp;&nbsp;型： <select name="typen" id="typen"
						class="form-control select select-primary" data-toggle="select">
						<%
							if (imeter.getTypen() == 1) {
						%>
						<option value="1" selected>个人</option>
						<option value="2">企业</option>
						<%
							} else {
						%>
						<option value="1">个人</option>
						<option value="2" selected>企业</option>
						<%
							}
						%>
					</select>
				</nobr>
				<hr>
				<nobr>
					*状&nbsp;&nbsp;&nbsp;&nbsp;态： <select name="state" id="state"
						class="form-control select select-primary" data-toggle="select">
						<%
							if (imeter.getState() != null && imeter.getState().equals("通电")) {
						%>
						<option value="0" selected>通电</option>
						<option value="1">断电</option>
						<%
							} else {
						%>
						<option value="0">通电</option>
						<option value="1" selected>断电</option>
						<%
							}
						%>
					</select>
				</nobr>
				<hr>
				<nobr>
					*方&nbsp;&nbsp;&nbsp;&nbsp;案： <select name="sche" id="sche"
						class="form-control select select-primary" data-toggle="select">
						<%
							SchemeDAO schemedao = new SchemeDAO();
										ArrayList<scheme> listss = null;
										schemedao.protectscheme();
										listss = schemedao.getscheme();
										if (listss != null && listss.size() > 0) {
											for (int j = 0; j < listss.size(); j++) {
												scheme ischeme = listss.get(j);
												if (imeter.getSche() == ischeme.getSche()) {
						%>
						<option value="<%=ischeme.getSche()%>" selected>方案<%=ischeme.getSche()%></option>
						<%
							} else {
						%>
						<option value="<%=ischeme.getSche()%>">方案<%=ischeme.getSche()%></option>
						<!-- 商品循环结束 -->
						<%
							}
											}
										}
						%>
					</select>
				</nobr>
				<hr>
				<nobr>
					*用户ID：<input type="text" id="id" name="id"
						style="display: inline; width: 260px;" value="<%=imeter.getId()%>"
						placeholder="请输入用户ID" class="form-control" />
				</nobr>
				<hr>
				<nobr>
					-备&nbsp;&nbsp;&nbsp;&nbsp;注： <input type="text" id="remark"
						name="remark" style="display: inline; width: 600px;"
						value="<%=imeter.getRemark()%>" placeholder="请输入备注"
						class="form-control" />
				</nobr>
				<hr>
				<nobr>
					*电表编号：<a type="text" style="display: inline; width: 260px;"
						class="form-control"><%=imeter.getMeter_id()%></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*型&nbsp;&nbsp;&nbsp;&nbsp;号：<a
						type="text" style="display: inline; width: 260px;"
						class="form-control"><%=imeter.getSort()%></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*余&nbsp;&nbsp;&nbsp;&nbsp;额：<a
						type="text" style="display: inline; width: 260px;"
						class="form-control"><%=imeter.getBalance()%></a>
				</nobr>
				<br> <br>
			</div>
			<%
				}
					}
				}
			%>
		</div>
	</div>

	<footer>
		<div class="container">
			<div class="row">
				<p align="center"
					style="height: 15px; margin-top: 15px; color: #999; letter-spacing: 1px; vertical-align: middle; font-size: 14px; z-index: 99">@
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
var isisisis=0;
function onSelectChange(obj, toSelId) {
	//alert(obj.value);
    isisisis=1;
	setSelect(obj.value, toSelId);

}

function setSelect(fromSelVal, toSelId) {
	//alert(fromSelVal);
	//alert(toSelId);
	document.getElementById(toSelId).innerHTML = "";
	jQuery.ajax({
		url : "/Remotemeter/DropdownServlet/Dropdown",
		cache : false,
		async : false,
		data : {
			"code" : fromSelVal,
			"grade" : toSelId
		},
		success : function(data) {
			createSelectObj(data, toSelId);
		}
	});
}

function createSelectObj(data, toSelId) {
	var arr = jsonParse(data);
	if (arr != null && arr.length > 0) {
		var obj = document.getElementById(toSelId);
		obj.innerHTML = "";
		var nullOp = document.createElement("option");
		nullOp.setAttribute("value", "");
		obj.appendChild(nullOp);
		for ( var o in arr) {
			var op = document.createElement("option");
			op.setAttribute("value", arr[o].code);
			//op.text=arr[o].name;//这一句在ie下不起作用，用下面这一句或者innerHTML
			op.appendChild(document.createTextNode(arr[o].name));
			obj.appendChild(op);
		}

	}
	if (toSelId == 'province') {
		$('#province')[0].selectedIndex = 1;
	    if (<%=request.getParameter("province")%>!= null&&isisisis==0)
		    document.getElementById("province").value =<%=request.getParameter("province")%>;
		setSelect(document.getElementById("province").value, 'city');
	}
	if (toSelId == 'city') {
		$('#city')[0].selectedIndex = 1;
		if (<%=request.getParameter("city")%>!= null&&isisisis==0)
			document.getElementById("city").value =<%=request.getParameter("city")%>;
		setSelect(document.getElementById("city").value, 'area');
	}
	if (toSelId == 'area') {
		$('#area')[0].selectedIndex = 1;
		if (<%=request.getParameter("area")%>!= null&&isisisis==0)
			document.getElementById("area").value =<%=request.getParameter("area")%>;
	}

	/*document.getElementById(toSelId).value=110000;
	 document.getElementById(toSelId).value='110000';
	 document.getElementById(toSelId).value="110000";
	 $("#province").get(0).selectedIndex = 1;
	 $('#province')[0].selectedIndex = 1;
	 $("#city").get(0).selectedIndex = 1;
	 $('#province')[0].selectedIndex = 1;
	 $('#area')[0].selectedIndex = 1;
	 document.getElementById("province").options[1].selected = true;
	 $('select').prop('selectedIndex', 0);*/
}
setSelect('110000', 'province');
</script>

<script type="text/javascript">
	function link(meter_id) {
		console.log("开始提交数据");
		var xmlhttp;

		if (window.XMLHttpRequest) {
			//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
			xmlhttp = new XMLHttpRequest();
		} else {
			// IE6, IE5 浏览器执行代码
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		var province = document.getElementById("province").value;
		var city = document.getElementById("city").value;
		var area = document.getElementById("area").value;
		var typen = document.getElementById("typen").value;
		var id = document.getElementById("id").value;
		var sche = document.getElementById("sche").value;
		var remark = document.getElementById("remark").value;
		var state = document.getElementById("state").value;
		var reg = /\A\d{6}$/;
		var regg = /^\d{8}$/;
		if (province.length == 0 || city.length == 0 || area.length == 0
				|| typen.length == 0 || id.length == 0 || state.length == 0)
			alert("请将信息填写完整！");
		else if (!reg.test(meter_id))
			alert("电表编号格式错误！");
		else if (!regg.test(id))
			alert("用户ID格式错误！");
		else if (remark.length > 50)
			alert("备注过长！");
		else if (!confirm("确认修改？")) {
			window.event.preventDefault();
			//window.event.returnValue = false;
		} else {
			console.log("province:" + province + ";city:" + city + ";area:"
					+ area + ";meter_id:" + meter_id);
			xmlhttp.open("POST", "/Remotemeter/servlet/MeterServlet?area="
					+ area + "&sche=" + sche + "&typen=" + typen + "&meter_id="
					+ meter_id + "&id=" + id + "&remark=" + remark + "&state="
					+ state + "&action=metermodify", true);
			xmlhttp.send();
		}
		xmlhttp.onreadystatechange = function() {
			console.log(xmlhttp.response);

			if (xmlhttp.readyState == 4) {
				if (xmlhttp.status == 200) {
					console.log(xmlhttp.response);
					var objJson = JSON.parse(xmlhttp.response);
					if (objJson == "success") {
						alert("修改成功！");
					} else {
						alert(objJson);
					}
				} else {
					console.log(xmlhttp.response);
					alert("ERROR! Ajax 错误！请检查网络！");
				}
			}
		}
	}
</script>
</html>