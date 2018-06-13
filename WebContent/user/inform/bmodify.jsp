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
		style="margin-left: -1px; margin-top: -30px; text-align: center; font-size: 16px; float: left; width: 15%; height: 820px; background-color: #73BAAA; box-shadow: inset;">
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
	<%
		int id = (int) request.getSession().getAttribute("id");
		String type = (String) request.getSession().getAttribute("type");
	%>
	<div
		style="float: left; margin-top: -30px; height: 820px; width: 85%; background-color: #fafafa">
		<ol class="breadcrumb" style="font-size: 15px;">
			<li><a style="color: #4F4F4F; margin-left: 60px;"
				href="/Remotemeter/user/index/index.jsp"> 用 户 首 页 ></a></li>
			<li><a style="color: #4F4F4F;"
				href="/Remotemeter/user/inform/bindex.jsp"> 我 的 信 息 ></a></li>
			<li><a style="color: #4F4F4F;" href="#"> 修 改 ></a></li>
		</ol>
		<h2
			style="color: #efefef; font-weight: 700; letter-spacing: 2px; padding-top: 4px; padding-left: 12px;">&nbsp;&nbsp;／个人信息／</h2>
		<div class="col-xs-3"
			style="float: right; margin-right: 120px; letter-spacing: 3px; width: 220px; font-size: 20px; margin-top: -50px;">
			<a onClick="link(<%=id%>,<%=type%>);" style="font-size: 19px;"
				class="btn btn-block btn-lg btn-default">提交| Submit</a>
		</div>
		<%
			System.out.println(id);
			MyaccountDAO idao = new MyaccountDAO();
			ArrayList<personal> listp;
			ArrayList<company> listc;
			if (type.equals("0")) {
				listp = idao.personalinfo(id);
				if (listp != null && listp.size() > 0) {
					for (int i = 0; i < listp.size(); i++) {
						personal ipersonal = listp.get(i);
		%>
		<div>
			<hr>
			<div
				style="padding-left: 150px; padding-right: 150px; padding-top: 18px; color: #888; font-weight: 200; font-size: 20px; letter-spacing: 1px">
				* 邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<a id="email" type="text"
					style="display: inline; width: 260px;" class="form-control"><%=ipersonal.getEmail()%></a>
				<hr>
				* 类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：<select name="type" id="type"
					class="form-control select select-primary" data-toggle="select">
					<option value="0">个人</option>
				</select>
				<hr>
				* 性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<select name="sex" id="sex"
					class="form-control select select-primary" data-toggle="select">
					<%
						if (ipersonal.getSex() == null || ipersonal.getSex().equals("")) {
					%>
					<option value="男">男</option>
					<option value="女">女</option>
					<%
						} else if (ipersonal.getSex().equals("男")) {
					%>
					<option value="男" selected>男</option>
					<option value="女">女</option>
					<%
						} else if (ipersonal.getSex().equals("女")) {
					%>
					<option value="男">男</option>
					<option value="女" selected>女</option>
					<%
						} else {
					%>
					<option value="男">男</option>
					<option value="女">女</option>
					<%
						}
					%>
				</select>
				<hr>
				- 地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：<input id="address"
					name="address" type="text" style="display: inline; width: 600px;"
					value="<%=ipersonal.getAddress()%>" class="form-control" />
				<hr>
				- 身份证 ：<input id="idcard" name="idcard" type="text"
					style="display: inline; width: 260px;"
					value="<%=ipersonal.getIdcard()%>" class="form-control" />
				<hr>
				- 电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：<input id="phone" name="phone"
					type="text" style="display: inline; width: 260px;"
					value="<%=ipersonal.getPhone()%>" class="form-control" />
				<hr>
				- 姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input id="name" name="name"
					type="text" style="display: inline; width: 260px;"
					value="<%=ipersonal.getName()%>" class="form-control" />
				<hr>
				- 银行卡 ：<input id="bankcard" name="bankcard" type="text"
					style="display: inline; width: 260px;"
					value="<%=ipersonal.getBankcard()%>" class="form-control" />
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
						* 邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<a id="email" type="text"
							style="display: inline; width: 260px;" class="form-control"><%=icompany.getEmail()%></a>
						<hr>
						* 类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：<select name="type" id="type"
							class="form-control select select-primary" data-toggle="select">
							<option value="0">商户</option>
						</select>
						<hr>
						- 公&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;司：<input id="company"
							name="company" type="text" style="display: inline; width: 260px;"
							value="<%=icompany.getCompany()%>" class="form-control" />
						<hr>
						- 地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：<input id="address"
							name="address" type="text" style="display: inline; width: 600px;"
							value="<%=icompany.getAddress()%>" class="form-control" />
						<hr>
						- 身份证 ：<input id="idcard" name="idcard" type="text"
							style="display: inline; width: 260px;"
							value="<%=icompany.getIdcard()%>" class="form-control" />
						<hr>
						- 电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：<input id="phone" name="phone"
							type="text" style="display: inline; width: 260px;"
							value="<%=icompany.getPhone()%>" class="form-control" />
						<hr>
						- 姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input id="name" name="name"
							type="text" style="display: inline; width: 260px;"
							value="<%=icompany.getName()%>" class="form-control" />
						<hr>
						- 银行卡 ：<input id="bankcard" name="bankcard" type="text"
							style="display: inline; width: 260px;"
							value="<%=icompany.getBankcard()%>" class="form-control" />
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

<script type="text/javascript">
	function link(id,type) {
        if (!confirm("确认修改？")) {
            window.event.preventDefault();
            //window.event.returnValue = false;
        }
		console.log("开始提交数据");
		var xmlhttp;
		
		if (window.XMLHttpRequest) {
			//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
			xmlhttp = new XMLHttpRequest();
		} else {
			// IE6, IE5 浏览器执行代码
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		var address = document.getElementById("address").value;
		var name = document.getElementById("name").value;
		var idcard = document.getElementById("idcard").value;
		var bankcard = document.getElementById("bankcard").value;
		var phone = document.getElementById("phone").value;
		if(type==0)
		{
			var sex = document.getElementById("sex").value;
	        if(sex.length==0) alert("请将信息填写完整！");
	        else if(!valiphone(phone)) alert("电话号码格式错误！");
	        else if(address.length>25) alert("地址超长！");
	        else if(name.length>15) alert("姓名超长！");
	        else if(!/^\d{16,25}$/.test(bankcard)&&bankcard!=null&&bankcard!=''&&bankcard!="") alert("银号卡号非法！");
	        else if(checkCard(idcard)){
		        xmlhttp.open("POST", "/Remotemeter/servlet/userServlet?address=" + address + "&id=" + id + "&type=" + type + "&name=" + name+ "&idcard=" + idcard+ "&bankcard=" + bankcard+ "&phone=" + phone+ "&sex=" + sex+ "&action=bmodify", true);
				xmlhttp.send(); 	
	        }
		}
		else
		{
			var company = document.getElementById("company").value;
	        if(!valiphone(phone)) alert("电话号码格式错误！");
	        else if(address.length>25) alert("地址超长！");
	        else if(name.length>15) alert("姓名超长！");
	        else if(!/^\d{16,25}$/.test(bankcard)&&bankcard!=null&&bankcard!=''&&bankcard!="") alert("银号卡号非法！");
	        else if(checkCard(idcard)){
				xmlhttp.open("POST", "/Remotemeter/servlet/userServlet?address=" + address + "&id=" + id + "&type=" + type + "&name=" + name+ "&idcard=" + idcard+ "&bankcard=" + bankcard+ "&phone=" + phone+ "&company=" + company + "&action=bmodify", true);
				xmlhttp.send();      	
	        }
		}
			
		xmlhttp.onreadystatechange = function() {
			console.log(xmlhttp.response);
			    if (xmlhttp.readyState == 4) {
					if (xmlhttp.status == 200) {
						console.log(xmlhttp.response);
						var objJson= JSON.parse(xmlhttp.response);
						if(objJson=="success"){
							alert("修改成功！");		
						}else {
							alert(objJson);
						}
					}else {
						console.log(xmlhttp.response);
						alert("ERROR! Ajax 错误！请检查网络！");
					}
				}
			}		
	}

	//身份证号码判断
	var vcity = {
		11 : "北京",
		12 : "天津",
		13 : "河北",
		14 : "山西",
		15 : "内蒙古",
		21 : "辽宁",
		22 : "吉林",
		23 : "黑龙江",
		31 : "上海",
		32 : "江苏",
		33 : "浙江",
		34 : "安徽",
		35 : "福建",
		36 : "江西",
		37 : "山东",
		41 : "河南",
		42 : "湖北",
		43 : "湖南",
		44 : "广东",
		45 : "广西",
		46 : "海南",
		50 : "重庆",
		51 : "四川",
		52 : "贵州",
		53 : "云南",
		54 : "西藏",
		61 : "陕西",
		62 : "甘肃",
		63 : "青海",
		64 : "宁夏",
		65 : "新疆",
		71 : "台湾",
		81 : "香港",
		82 : "澳门",
		91 : "国外"
	};

	checkCard = function(card) {
		//是否为空
		if (card === '') {
			//alert('请输入身份证号，身份证号不能为空');
			document.getElementById('idcard').focus;
			return true;
		}
		//校验长度，类型
		if (isCardNo(card) === false) {
			alert('您输入的身份证号码不正确，请重新输入');
			document.getElementById('idcard').focus;
			return false;
		}
		//检查省份
		if (checkProvince(card) === false) {
			alert('您输入的身份证号码不正确,请重新输入');
			document.getElementById('idcard').focus;
			return false;
		}
		//校验生日
		if (checkBirthday(card) === false) {
			alert('您输入的身份证号码生日不正确,请重新输入');
			document.getElementById('idcard').focus();
			return false;
		}
		//检验位的检测
		if (checkParity(card) === false) {
			alert('您的身份证校验位不正确,请重新输入');
			document.getElementById('idcard').focus();
			return false;
		}
		return true;
	};

	//检查号码是否符合规范，包括长度，类型
	isCardNo = function(card) {
		//身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
		var reg = /(^\d{15}$)|(^\d{17}(\d|X)$)/;
		if (reg.test(card) === false) {
			return false;
		}

		return true;
	};

	//取身份证前两位,校验省份
	checkProvince = function(card) {
		var province = card.substr(0, 2);
		if (vcity[province] == undefined) {
			return false;
		}
		return true;
	};

	//检查生日是否正确
	checkBirthday = function(card) {
		var len = card.length;
		//身份证15位时，次序为省（3位）市（3位）年（2位）月（2位）日（2位）校验位（3位），皆为数字
		if (len == '15') {
			var re_fifteen = /^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/;
			var arr_data = card.match(re_fifteen);
			var year = arr_data[2];
			var month = arr_data[3];
			var day = arr_data[4];
			var birthday = new Date('19' + year + '/' + month + '/' + day);
			return verifyBirthday('19' + year, month, day, birthday);
		}
		//身份证18位时，次序为省（3位）市（3位）年（4位）月（2位）日（2位）校验位（4位），校验位末尾可能为X
		if (len == '18') {
			var re_eighteen = /^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/;
			var arr_data = card.match(re_eighteen);
			var year = arr_data[2];
			var month = arr_data[3];
			var day = arr_data[4];
			var birthday = new Date(year + '/' + month + '/' + day);
			return verifyBirthday(year, month, day, birthday);
		}
		return false;
	};

	//校验日期
	verifyBirthday = function(year, month, day, birthday) {
		var now = new Date();
		var now_year = now.getFullYear();
		//年月日是否合理
		if (birthday.getFullYear() == year
				&& (birthday.getMonth() + 1) == month
				&& birthday.getDate() == day) {
			//判断年份的范围（3岁到100岁之间)
			var time = now_year - year;
			if (time >= 3 && time <= 100) {
				return true;
			}
			return false;
		}
		return false;
	};

	//校验位的检测
	checkParity = function(card) {
		//15位转18位
		card = changeFivteenToEighteen(card);
		var len = card.length;
		if (len == '18') {
			var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5,
					8, 4, 2);
			var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4',
					'3', '2');
			var cardTemp = 0, i, valnum;
			for (i = 0; i < 17; i++) {
				cardTemp += card.substr(i, 1) * arrInt[i];
			}
			valnum = arrCh[cardTemp % 11];
			if (valnum == card.substr(17, 1)) {
				return true;
			}
			return false;
		}
		return false;
	};

	//15位转18位身份证号
	changeFivteenToEighteen = function(card) {
		if (card.length == '15') {
			var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5,
					8, 4, 2);
			var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4',
					'3', '2');
			var cardTemp = 0, i;
			card = card.substr(0, 6) + '19' + card.substr(6, card.length - 6);
			for (i = 0; i < 17; i++) {
				cardTemp += card.substr(i, 1) * arrInt[i];
			}
			card += arrCh[cardTemp % 11];
			return card;
		}
		return card;
	};

	function valiphone(phone) {
		var reg = /^[1][3,4,5,7,8][0-9]{9}$/;
		var myreg = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
		if (reg.test(phone)) {
			return true;
		}
		if (myreg.test(phone)) {
			return true;
		}
		if(phone==null||phone==''){
			return true;
		}
		return false;
	}
</script>
</html>


