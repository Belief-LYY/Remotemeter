<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<body>
	<div class="container">
		<div class="demo-headline">
			<a href="#lableLogin"> <img
				style="text-align: center; width: 500px; margin-top: 10px"
				src="/Remotemeter/img/1.jpg"></a>
		</div>

		<div class="login" style="margin-top: 100px">

			<a id="lableLogin"></a>
			<div class="login-screen">
				<div class="login-form"
					style="width: 360px; height: 360px text-align:center;">

					<div class="form-group">
						<input type="text" class="form-control login-field" value=""
							placeholder="邮箱" name="email" id="email" /> <label
							class="login-field-icon fui-user" for="login-name"></label>
					</div>

					<div class="form-group">
						<input type="password" class="form-control login-field" value=""
							placeholder="请输入密码" name="password" id="password" /> <label
							class="login-field-icon fui-lock" for="login-pass"></label>
					</div>

					<a style="background-color: #7AC5B2;"
						class="btn btn-primary btn-lg btn-block" onClick="link();">L O
						G I N</a> <a class="login-link"
						style="font-size: 15px; margin-top: 20px; color: #999"
						href="/Remotemeter/account/index.jsp">注 册 | REGISTER</a> <a
						class="login-link" href="/Remotemeter/account/FindPassword.jsp">Lost
						your password?</a>

				</div>
			</div>
		</div>
	</div>

	<footer>
		<div class="container">
			<div class="row">
				<p align="center"
					style="text-align: center; color: #999; vertical-align: middle; margin-top: 2px; font-size: 14px">@
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
	function IsEmail(str) {
		var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
		return reg.test(str);
	}
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

		var email = document.getElementById("email").value;
		var password = document.getElementById("password").value;
		console.log("email:" + email + ";password:" + password);
		if (email.length == 0)
			alert("请输入邮箱！");
		else if (!IsEmail(email))
			alert("邮箱地址非法！");
		else if (password.length == 0)
			alert("请输入密码！");
		else {
			xmlhttp.open("POST", "/Remotemeter/servlet/LoginServlet?email="
					+ email + "&password=" + password + "&type=0", true);
			xmlhttp.send();

			xmlhttp.onreadystatechange = function() {
				console.log(xmlhttp.response);

				if (xmlhttp.readyState == 4) {
					if (xmlhttp.status == 200) {
						console.log(xmlhttp.response);
						var objJson = JSON.parse(xmlhttp.response);
						if (objJson != null && objJson != "") {
							alert("用户" + objJson + "您好！登陆成功！");
							self.location = '/Remotemeter/user/index/index.jsp';
						} else {
							alert("用户名或密码错误！请重新输入！");
						}
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
