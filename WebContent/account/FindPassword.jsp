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
	<div class="container" style="padding-top: 30px">
		<div class="register">
			<div class="register-screen">
				<div class="register-form"
					style="float: left; width: 520px; height: 380px">


					<div style="float: left; width: 160px">

						<h3 style="font-weight: 200; color: #666; margin-bottom: 40px"
							class="demo-panel-title">/ 用户类型 /</h3>

						<label class="radio" style="color: #666; font-size: 16px;">
							<input type="radio" name="optionsRadios" id="optionsRadios1"
							data-toggle="radio" style="font-weight: 100; color: #666;"
							checked>个 人 业 主
						</label> <label class="radio" style="color: #666; font-size: 16px">
							<input type="radio" name="optionsRadios" id="optionsRadios2"
							data-toggle="radio" style="font-weight: 100; color: #666;">企
							业 用 户
						</label>

					</div>

					<div class="register-form1">

						<div class="form-group">
							<input type="text" class="form-control login-field" name="email"
								id="email" placeholder="- 邮箱" />
						</div>

						<div class="form-group">
							<input type="password" class="form-control login-field"
								name="pass" id="pass" placeholder="- 请输入新密码" />
						</div>

						<div class="form-group">
							<input type="password" class="form-control login-field"
								name="passs" id="passs" placeholder="- 确认密码" />
						</div>

						<div class="form-group">
							<input type="text" class="form-control login-field" name="verify"
								id="verify" placeholder="- 验证码" />
						</div>

						<a class="login-link"
							style="font-size: 15px; margin-bottom: 8px; color: #aaa"
							onClick="verifys();" href="#">验 证 码 | Verification Code </a> <a
							onClick="findpassword()" style="background-color: #7AC5B2;"
							class="btn btn-primary btn-lg btn-block" id="loginfield">
							找回密码 </a>
					</div>
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
	/*是否带有小数*/
	function isDecimal(strValue) {
		var objRegExp = /^\d+\.\d+$/;
		return objRegExp.test(strValue);
	}

	/*校验是否中文名称组成 */
	function ischina(str) {
		var reg = /^[\u4E00-\u9FA5]{2,4}$/; /*定义验证表达式*/
		return reg.test(str); /*进行验证*/
	}

	/*校验是否全由8位数字组成 */
	function isStudentNo(str) {
		var reg = /^[0-9]{8}$/; /*定义验证表达式*/
		return reg.test(str); /*进行验证*/
	}

	/*校验电话码格式 */
	function isTelCode(str) {
		var reg = /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
		return reg.test(str);
	}

	/*校验邮件地址是否合法 */
	function IsEmail(str) {
		var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
		return reg.test(str);
	}
	function findpassword() {

		console.log("开始提交数据");
		var xmlhttp;
		if (window.XMLHttpRequest) {
			//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
			//XMLHttpRequest 对象用于幕后与服务器交换数据。
			//   XMLHttpRequest 对象是开发者的梦想，因为您可以：
			//   在不重新加载页面的情况下更新网页
			//   在页面已加载后从服务器请求数据
			//   在页面已加载后从服务器接收数据
			//   在后台向服务器发送数据
			xmlhttp = new XMLHttpRequest();
		} else {
			// IE6, IE5 浏览器执行代码
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		var optionsRadios1 = document.getElementById("optionsRadios1").checked;
		var optionsRadios2 = document.getElementById("optionsRadios2").checked;
		var email = document.getElementById("email").value;
		var pass = document.getElementById("pass").value;
		var passs = document.getElementById("passs").value;
		var verify = document.getElementById("verify").value;
		if (optionsRadios1 == false && optionsRadios2 == false)
			alert("请选择用户类型！");
		if (email.length == 0)
			alert("请输入邮箱！");
		else if (!IsEmail(email))
			alert("邮箱地址非法！");
		else if (pass.length == 0)
			alert("请输入密码！");
		else if (pass.length < 6)
			alert("密码不能少于6位！")
		else if (passs.length == 0)
			alert("请再次输入密码！");
		else if (pass != passs)
			alert("两次密码输入不一致！");
		else if (verify.length == 0)
			alert("请输入验证码！");
		else {
			var type;
			if (optionsRadios1 == true)
				type = 0;
			else
				type = 1;
			xmlhttp.open("POST", "/Remotemeter/servlet/PasswordFind?email="
					+ email + "&pass=" + pass + "&type=" + type + "&verify="
					+ verify, true);
			xmlhttp.send();

			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4) {
					if (xmlhttp.status == 200) {
						//JSON.parse() 方法用于将一个 JSON 字符串转换为对象。
						var objJson = JSON.parse(xmlhttp.response);
						if (objJson != "" && objJson != null) {
							alert(objJson);
							self.location = '/Remotemeter/account/FindSuccess.jsp?t='
									+ type;
						} else {
							alert("未知错误，请联系管理员！");
						}
					} else {
						console.log(xmlhttp.response);
						alert("ERROR! Ajax 错误！请检查网络！");
					}
				}
			}
		}
	}

	function verifys() {
		console.log("开始获取验证码!");
		var xmlhttp;

		if (window.XMLHttpRequest) {
			//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
			xmlhttp = new XMLHttpRequest();
		} else {
			// IE6, IE5 浏览器执行代码
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		var optionsRadios1 = document.getElementById("optionsRadios1").checked;
		var optionsRadios2 = document.getElementById("optionsRadios2").checked;
		var email = document.getElementById("email").value;
		var pass = document.getElementById("pass").value;
		var passs = document.getElementById("passs").value;
		if (email.length == 0)
			alert("请输入邮箱！");
		else if (!IsEmail(email))
			alert("邮箱地址非法！");
		else if (pass.length == 0)
			alert("请输入密码！");
		else if (pass.length < 6)
			alert("密码不能少于6位！")
		else if (passs.length == 0)
			alert("请再次输入密码！");
		else if (pass != passs)
			alert("两次密码输入不一致！");
		else {
			var type;
			if (optionsRadios1 == true)
				type = 0;
			else
				type = 1;
			xmlhttp.open("POST", "/Remotemeter/servlet/verifysServlet?email="
					+ email + "&pass=" + pass + "&type=" + type, true);
			xmlhttp.send();
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4) {
					if (xmlhttp.status == 200) {
						//JSON.parse() 方法用于将一个 JSON 字符串转换为对象。
						var objJson = JSON.parse(xmlhttp.response);
						if (objJson != "" && objJson != null) {
							if (objJson == "success") {
								alert("获取验证码成功！");
							} else
								alert(objJson);
						} else {
							alert("获取验证码失败，请联系管理员！");
						}
					} else {
						console.log(xmlhttp.response);
						alert("获取验证码失败，请联系管理员！");
					}
				}
			}
		}
	}
</script>
</html>
