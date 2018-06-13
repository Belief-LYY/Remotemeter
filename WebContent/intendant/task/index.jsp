<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="com.imooc.dao.meterDao"%>
<%@ page import="com.imooc.model.meter"%>

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
<script type="text/javascript"
	src="/Remotemeter/js/jquery/jquery-1.7.min.js"></script>
<script type="text/javascript"
	src="/Remotemeter/js/json/json-minified.js"></script>

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
			<li><a style="color: #4F4F4F;" href="#">采 集 任 务 管 理 ></a></li>
		</ol>

		<div class="col-xs-3"
			style="margin-left: 0px; letter-spacing: 3px; font-size: 20px; margin-top: 40px; width: 100%">

			<form action="/Remotemeter/servlet/taskServlet" method="post">

				<div class="col-xs-3"
					style="float: left; margin-left: 50px; letter-spacing: 3px; width: 0px; font-size: 20px; margin-top: -50px;">
					<select name="province" id="province"
						onchange="onSelectChange(this,'city');" style="width: 170px"
						class="form-control select select-primary" data-toggle="select">
					</select>
				</div>
				<!-- /.col-xs-3 -->

				<div class="col-xs-3"
					style="float: left; margin-left: 250px; letter-spacing: 3px; width: 0px; font-size: 20px; margin-top: -50px;">
					<select name="city" id="city"
						onchange="onSelectChange(this,'area');" style="width: 170px"
						class="form-control select select-primary" data-toggle="select">
					</select>
				</div>
				<!-- /.col-xs-3 -->

				<div class="col-xs-3"
					style="float: left; margin-left: 450px; letter-spacing: 3px; width: 0px; font-size: 20px; margin-top: -50px;">
					<select name="area" id="area" style="width: 250px"
						class="form-control select select-primary" data-toggle="select">
					</select>
				</div>
				<!-- /.col-xs-3 -->
				<div class="col-xs-3"
					style="float: left; margin-left: 850px; letter-spacing: 3px; width: 200px; font-size: 20px; margin-top: -50px;">
					<a href="/Remotemeter/intendant/task/sch.jsp"
						style="font-size: 20px; background-color: #4A708B;"
						class="btn btn-primary btn-lg btn-block">方案库</a>
				</div>
				<div class="col-xs-3"
					style="float: left; margin-left: 50px; letter-spacing: 3px; width: 200px; font-size: 20px; margin-top: 15px;">
					<div class="form-group">
						<%if(request.getParameter("id")!=null&&!request.getParameter("id").equals("")) {%>
						<input id="id" name="id" type="text"
							value="<%=request.getParameter("id")%>" placeholder="用户ID"
							class="form-control" />
						<%}else{ %>
						<input id="id" name="id" type="text" value="" placeholder="用户ID"
							class="form-control" />
						<%} %>
					</div>
				</div>

				<div class="col-xs-3"
					style="float: left; margin-left: 0px; letter-spacing: 3px; width: 200px; font-size: 20px; margin-top: 15px;">
					<div class="form-group">
						<%if(request.getParameter("meter_id")!=null&&!request.getParameter("meter_id").equals("")) {%>
						<input id="meter_id" name="meter_id" type="text"
							value="<%=request.getParameter("meter_id")%>" placeholder="电表编号"
							class="form-control" />
						<%}else{ %>
						<input id="meter_id" name="meter_id" type="text" value=""
							placeholder="电表编号" class="form-control" />
						<%} %>
					</div>
				</div>
				<div class="col-xs-3"
					style="float: left; margin-left: 400px; letter-spacing: 3px; width: 200px; font-size: 20px; margin-top: 15px;">
					<input id="action" name="action" type="submit"
						style="font-size: 20px;" class="btn btn-block btn-lg btn-default"
						value="查询" />
				</div>
			</form>
		</div>


		<div>
			<div
				style="padding-left: 50px; margin-right: 0px; margin-top: 20px; color: #888; font-weight: 200; font-size: 22px; letter-spacing: 1px; overflow-y: auto; overflow-x: hidden; width: 1100px; height: 520px">

				<div class="table-responsive">
					<table class="table table-hover"
						style="text-align: center; color: #666; font-weight: 300; font-size: 18px">
						<thead>
							<tr>
								<th scope="col">电表编号</th>
								<th scope="col">用户ID</th>
								<th scope="col">类型</th>
								<th scope="col">位置</th>
								<th scope="col">采集方案</th>
								<th scope="col">状态</th>
								<th scope="col"><nobr>余额</nobr></th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<!-- 电表循环开始 -->
							<%
								meterDao meterdao = new meterDao();
								ArrayList<meter> list = null;
								meterdao.upprotectmeter();
								if (request.getParameter("meter_id") != null && !request.getParameter("meter_id").equals("")) {
									list = meterdao.ismeters(request.getParameter("meter_id"));
									request.setAttribute("meter_id", request.getParameter("meter_id"));
								} else if (request.getParameter("id") != null && !request.getParameter("id").equals("")) {
									list = meterdao.mymeters(Integer.parseInt(request.getParameter("id")));
									request.setAttribute("id", request.getParameter("id"));
								} else if (request.getParameter("area") != null && !request.getParameter("area").equals("")) {
									list = meterdao.getmetersbyarea(request.getParameter("area"));
									request.setAttribute("area", request.getParameter("area"));
								} else if (request.getParameter("city") != null && !request.getParameter("city").equals("")) {
									list = meterdao.getmetersbycity(request.getParameter("city"));
									request.setAttribute("city", request.getParameter("city"));
								} else if (request.getParameter("province") != null && !request.getParameter("province").equals("")) {
									list = meterdao.getmetersbyprovince(request.getParameter("province"));
									request.setAttribute("province", request.getParameter("province"));
								}
								if (list != null && list.size() > 0) {
									for (int i = 0; i < list.size(); i++) {
										meter imeter = list.get(i);
										String type = "民用";
										if (imeter.getTypen() == 2)
											type = "商用";
										if (imeter.getSche() != 0) {
							%>
							<tr>

								<td><a style="color: #73BAA9;"
									href="/Remotemeter/servlet/taskServlet?meter_id=<%=imeter.getMeter_id()%>&action=meter"><%=imeter.getMeter_id()%></a></td>
								<td><a style="color: #73BAA9;"
									href="/Remotemeter/servlet/MeterServlet?id=<%=imeter.getId()%>&action=user"><%=imeter.getId()%></a></td>
								<td><%=type%></td>
								<td><%=imeter.getRemark()%></td>
								<td><%=imeter.getSche()%></td>
								<td><%=imeter.getState()%></td>
								<td><%=imeter.getBalance()%></td>
								<td style="width: 0px;">
									<div align="center">
										<label class="checkbox" for="checkbox<%=i%>"> <input
											type="checkbox"
											onClick="isdelete('<%=imeter.getMeter_id()%>');" style=""
											value="" id="checkbox<%=i%>" data-toggle="checkbox">
										</label>
									</div>
								</td>
							</tr>
							<!-- 商品循环结束 -->
							<%
								}
									}
								}else
								{%>
								<tr>
								<td>未查到……</td>
								<td>未查到……</td>
								<td>未查到……</td>
								<td>未查到……</td>
								<td>未查到……</td>
								<td>未查到……</td>
								<td>未查到……</td>
								</tr>
								<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div class="col-xs-3"
		style="float: left; margin-left: 50px; letter-spacing: 3px; width: 250px; font-size: 20px; margin-top: -50px;">
		<a href="/Remotemeter/intendant/task/add.jsp" style="font-size: 20px;"
			class="btn btn-block btn-lg btn-default">新增采集任务</a>
	</div>
	<div class="col-xs-3"
		style="float: left; margin-left: 800px; letter-spacing: 3px; width: 250px; font-size: 20px; margin-top: -50px;">
		<a onClick="delcfm();" style="font-size: 20px;"
			class="btn btn-block btn-lg btn-default">删除采集任务</a>
	</div>

	<footer>
		<div class="container">
			<div class="row">
				<p align="center"
					style="height: 10px; text-align: center; color: #999; letter-spacing: 1px; vertical-align: middle; margin-top: 20px; font-size: 14px; z-index: 99">
					<nobr>@ 2017 All Rights Reserved 远程抄表系统 | Intelligent Remote
						Meter Reading System</nobr>
				</p>
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
	function isdelete(meter_id) {
		jQuery.ajax({
			url : "/Remotemeter/servlet/MeterServlet",
			cache : false,
			data : {
				"meter_id" : meter_id,
				"action" : "isdelete"
			},
		});
	}
</script>

<script type="text/javascript">
	function delcfm() {
		if (!confirm("确认要删除勾选的采集任务？")) {
			window.event.preventDefault();
			//window.event.returnValue = false;
		} else {
			jQuery
					.ajax({
						url : "/Remotemeter/servlet/schemeServlet",
						cache : false,
						data : {
							"action" : "delete"
						},
						success : function(data) {
							alert(data);
							window.location.href = '/Remotemeter/intendant/task/index.jsp';
						}
					});
		}
	}
</script>

</html>