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
		style="float: left; height: 720px; width: 85%; background-color: #fafafa; margin-top: -30px;">
		<ol class="breadcrumb" style="font-size: 15px;">
			<li><a style="color: #4F4F4F; margin-left: 60px;"
				href="/Remotemeter/intendant/index/index.jsp"> 首 页 ></a></li>
			<li><a style="color: #4F4F4F;"
				href="/Remotemeter/intendant/task/index.jsp">采 集 任 务 管 理 ></a></li>
			<li><a style="color: #4F4F4F;"
				href="/Remotemeter/intendant/task/sch.jsp">方 案 库></a></li>
			<li><a style="color: #4F4F4F;" href="#">修 改></a></li>
		</ol>

		<h2
			style="color: #efefef; font-weight: 700; letter-spacing: 2px; padding-top: 4px; padding-left: 12px;">&nbsp;&nbsp;</h2>

		<div class="col-xs-3"
			style="float: right; margin-right: 120px; letter-spacing: 3px; width: 220px; font-size: 20px; margin-top: -50px;">
			<a style="font-size: 19px;" class="btn btn-block btn-lg btn-warning"
				onClick="link(<%=request.getSession().getAttribute("sche")%>);">修改
				| Modify</a>
		</div>

		<div
			style="float: right; padding-right: 280px; height: 500px; color: #888; font-size: 20px; letter-spacing: 1px">
			<br>
			<div class="col-xs-3"
				style="float: right; margin-right: 580px; letter-spacing: 3px; width: 200px; font-size: 20px; margin-top: 0px;">
				<nobr>
					*方案编号： <a type="text" style="display: inline; width: 260px;"
						class="form-control"><%=request.getSession().getAttribute("sche")%></a>
				</nobr>
				<hr>
			</div>
			<br> <br> <br>

			<div class="col-xs-3"
				style="float: right; margin-right: 580px; letter-spacing: 3px; width: 200px; font-size: 20px; margin-top: 0px;">
				<nobr>
					*类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型： <select id="type"
						name="type" style="width: 250px"
						class="form-control select select-primary" data-toggle="select">
						<option value="1">民</option>
						<option value="2">商</option>
					</select>
				</nobr>
				<hr>
			</div>
			<br> <br> <br>

			<div class="col-xs-3"
				style="float: right; margin-right: 580px; letter-spacing: 3px; width: 200px; font-size: 20px; margin-top: 0px;">
				<nobr>
					*采集频率： <select name="rate" id="rate" style="width: 250px"
						class="form-control select select-primary" data-toggle="select">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						<option value="31">31</option>
						<option value="32">32</option>
						<option value="33">33</option>
						<option value="34">34</option>
						<option value="35">35</option>
						<option value="36">36</option>
						<option value="37">37</option>
						<option value="38">38</option>
						<option value="39">39</option>
						<option value="40">40</option>
						<option value="41">41</option>
						<option value="42">42</option>
						<option value="43">43</option>
						<option value="44">44</option>
						<option value="45">45</option>
						<option value="46">46</option>
						<option value="47">47</option>
						<option value="48">48</option>
						<option value="49">49</option>
						<option value="50">50</option>
						<option value="51">51</option>
						<option value="52">52</option>
						<option value="53">53</option>
						<option value="54">54</option>
						<option value="55">55</option>
						<option value="56">56</option>
						<option value="57">57</option>
						<option value="58">58</option>
						<option value="59">59</option>
						<option value="60" selected>60</option>
						<option value="61">61</option>
						<option value="62">62</option>
						<option value="63">63</option>
						<option value="64">64</option>
						<option value="65">65</option>
						<option value="66">66</option>
						<option value="67">67</option>
						<option value="68">68</option>
						<option value="69">69</option>
						<option value="70">70</option>
						<option value="71">71</option>
						<option value="72">72</option>
						<option value="73">73</option>
						<option value="74">74</option>
						<option value="75">75</option>
						<option value="76">76</option>
						<option value="77">77</option>
						<option value="78">78</option>
						<option value="79">79</option>
						<option value="80">80</option>
						<option value="81">81</option>
						<option value="82">82</option>
						<option value="83">83</option>
						<option value="84">84</option>
						<option value="85">85</option>
						<option value="86">86</option>
						<option value="87">87</option>
						<option value="88">88</option>
						<option value="89">89</option>
						<option value="90">90</option>
						<option value="91">91</option>
						<option value="92">92</option>
						<option value="93">93</option>
						<option value="94">94</option>
						<option value="95">95</option>
						<option value="96">96</option>
						<option value="97">97</option>
						<option value="98">98</option>
						<option value="99">99</option>
						<option value="100">100</option>
					</select> (次/时)
				</nobr>
				<hr>
			</div>
			<br> <br> <br>

			<div class="col-xs-3"
				style="float: right; margin-right: 580px; letter-spacing: 3px; width: 200px; font-size: 20px; margin-top: 0px;">
				<nobr>
					*起始时间： <input type="text" id="start" name="start"
						style="display: inline; width: 260px;"
						value="<%=request.getParameter("start")%>" placeholder=""
						class="sang_Calender" />
				</nobr>
				<hr>
			</div>
			<%
				String end = "";
				if (request.getParameter("end") != null && !request.getParameter("end").equals("null")) {
					end = request.getParameter("end");
				}
			%>
			<br> <br> <br>
			<div class="col-xs-3"
				style="float: right; margin-right: 580px; letter-spacing: 3px; width: 200px; font-size: 20px; margin-top: 0px;">
				<nobr>
					-终止时间： <input type="text" id="end" name="end"
						style="display: inline; width: 260px;" value="<%=end%>"
						placeholder="" class="sang_Calender" />
				</nobr>
				<hr>
			</div>
		</div>
	</div>
	<footer>

		<div class="container">
			<div class="row">
				<p align="center"
					style="height: 15px; text-align: center; color: #999; letter-spacing: 1px; vertical-align: middle; margin-top: 100px; font-size: 14px; z-index: 99">@
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

</body>
<script type="text/javascript">
    document.getElementById("rate").value=<%=request.getParameter("rate")%>;
	function link(sche) {
		console.log("开始提交数据");
		var xmlhttp;
		
		if (window.XMLHttpRequest) {
			//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
			xmlhttp = new XMLHttpRequest();
		} else {
			// IE6, IE5 浏览器执行代码 
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		var type = document.getElementById("type").value;
		var rate = document.getElementById("rate").value;
		var start = document.getElementById("start").value;
		var end = document.getElementById("end").value;
        if(type.length==0) alert("请选择类型！");
		else if(rate.length==0) alert("请选择采集频率！");
		else if(start.length==0) alert("请选择起始时间！");
		else if(start>=end&&end.length!=0) alert("起始时间应小于终止时间！");
		else if (!confirm("确认修改？")) {
            window.event.preventDefault();
            //window.event.returnValue = false;
        }
		else{
			console.log("rate:" + rate + ";start:" + start+ ";end:" + end+ ";sche:" + sche);
			xmlhttp.open("POST", "/Remotemeter/servlet/taskServlet?rate=" 
					+ rate+ "&start=" + start+ "&end=" + end+ "&action=schemodify"+"&sche="+sche, true);
			xmlhttp.send();

			xmlhttp.onreadystatechange = function() {
				console.log(xmlhttp.response);
				if (xmlhttp.readyState == 4) {
					if (xmlhttp.status == 200) {
						console.log(xmlhttp.response);
						var objJson= JSON.parse(xmlhttp.response);
						if(objJson=="success"){
							alert("修改成功！");		
						}else if(objJson=="false"){
							alert("方案编号重复！");
						}
					}else {
						//console.log(xmlhttp.response);
						alert("ERROR! Ajax 错误！请检查网络！");
					}
				}
			}	
		}
	}
</script>
</html>