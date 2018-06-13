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
		<div class="login" style="margin-top: 100px">
			<div class="login-screen">
				<div class="login-form"
					style="width: 400px; height: 400px; text-align: center; margin-top: -30px">

					<div class="form-group" style="margin-top: -30px;">
						<input type="text" class="form-control login-field" value=""
							placeholder="邮箱" name="email" id="email" /> <label
							class="login-field-icon fui-user" for="login-name"></label>
					</div>

					<div class="form-group">
						<input type="password" class="form-control login-field" value=""
							placeholder="请输入密码" name="pass" id="pass" /> <label
							class="login-field-icon fui-lock" for="login-pass"></label>
					</div>
					<div class="form-group">
						<input type="password" class="form-control login-field" value=""
							placeholder="请再次输入密码" name="passs" id="passs" /> <label
							class="login-field-icon fui-lock" for="login-pass"></label>
					</div>
					<div class="form-group">
						<input type="text" class="form-control login-field" value=""
							placeholder="验证码" name="verify" id="verify" /> <label
							class="login-field-icon fui-lock" for="login-pass"></label>
					</div>
					<a class="btn btn-primary btn-lg btn-block"
						style="font-size: 15px; margin-top: 0px; margin-bottom: 20px; color: #aaa"
						onClick="verifys();">获取验 证 码 | Verification Code</a> <input
						type="button" class="btn btn-primary btn-lg btn-block" value="注 册"
						onClick="link();" />

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
		var pass = document.getElementById("pass").value;
		var passs = document.getElementById("passs").value;
		var verify = document.getElementById("verify").value;
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
			xmlhttp.open("POST", "/Remotemeter/servlet/RegisterServlet?email="
					+ email + "&pass=" + pass + "&passs=" + passs + "&verify="
					+ verify + "&type=1", true);
			xmlhttp.send();

			xmlhttp.onreadystatechange = function() {
				console.log(xmlhttp.response);

				if (xmlhttp.readyState == 4) {
					if (xmlhttp.status == 200) {
						console.log(xmlhttp.response);
						var objJson = JSON.parse(xmlhttp.response);
						if (objJson != null && objJson != "") {
							if (objJson == "false") {
								alert("验证码错误！");
							} else if (objJson == "havent") {
								alert("请先获取验证码！");
							} else if (objJson == "should") {
								alert("您已修改邮箱，需要重新获取验证码！");
							} else if (objJson == "had") {
								alert("该邮箱已注册！");
							} else {
								alert(objJson);
								self.location = '/Remotemeter/account/RegisterSuccess.jsp?t=c';
							}
						} else
							alert("未知错误！请联系管理员！");
					} else {
						console.log(xmlhttp.response);
						alert("ERROR! Ajax 错误！请检查网络权限！");
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
			xmlhttp.open("POST", "/Remotemeter/servlet/verifyServlet?email="
					+ email + "&pass=" + pass + "&passs=" + passs + "&type=1",
					true);
			xmlhttp.send();
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4) {
					if (xmlhttp.status == 200) {
						//JSON.parse() 方法用于将一个 JSON 字符串转换为对象。
						var objJson = JSON.parse(xmlhttp.response);
						if (objJson != "" && objJson != null) {
							alert(objJson);
						} else {
							alert("未知错误！请联系管理员！");
						}
					} else {
						console.log(xmlhttp.response);
						alert("未知错误！请联系管理员！");
					}
				}
			}
		}
	}
</script>
</html>
