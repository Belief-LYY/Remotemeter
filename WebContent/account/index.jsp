<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>远程抄表系统 |Remote Meter Reading System</title>

<!-- Loading Bootstrap -->
<link
	href="/Remotemeter/dist/css/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="shortcut icon" href="/Remotemeter/img/favicon.ico">
<script src="/Remotemeter/js/jquery.min.js"></script>
<script src="/Remotemeter/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function GetQueryString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	}
	function myfunction() {
		var fiter = GetQueryString("action");
		if (fiter == "fiter")
			alert("违规操作！请先登录！");
	}
</script>
</head>

<body onload="myfunction()">

	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" style="float: left;" href="#">水电气热综合能源远程抄表系统</a>
			</div>

			<div class="container" style="height: 0px;">
				<!-- 按钮：用于打开模态框 -->
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#myModal" style="margin-top: 8px;">联系我们</button>

				<!-- 模态框 -->
				<div class="modal fade" id="myModal">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">

							<!-- 模态框头部 -->
							<div class="modal-header">
								<h4 class="modal-title">尊敬的客户</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!-- 模态框主体 -->
							<div class="modal-body">
								<a target="_blank"
									href="http://wpa.qq.com/msgrd?v=3&uin=296293760&site=qq&menu=yes"><img
									border="0" src="http://wpa.qq.com/pa?p=2:296293760:51"
									alt="点击这里给我发消息" title="点击这里给我发消息" /></a>
							</div>

							<!-- 模态框底部 -->
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">关闭</button>
							</div>

						</div>
					</div>
				</div>
			</div>

			<!--向右对齐-->
			<ul class="nav navbar-nav navbar-right">


				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>
						注册<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="/Remotemeter/account/Registerp.jsp">个人用户</a></li>
						<li><a href="/Remotemeter/account/Registerc.jsp">企业用户</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><span class="glyphicon glyphicon-log-in"></span>
						登陆 <b class="caret"></b> </a>
					<ul class="dropdown-menu">
						<li><a href="/Remotemeter/account/Loginp.jsp">个人用户</a></li>
						<li><a href="/Remotemeter/account/Loginc.jsp">企业用户</a></li>
						<li class="divider"></li>
						<li><a href="/Remotemeter/account/Loginm.jsp">管理员</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>

	<div id="myCarousel" class="carousel slide" style="margin-top: -20px;">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
		</ol>
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="/Remotemeter/img/20171213223554.png" alt="First slide">
			</div>
			<div class="item">
				<img src="/Remotemeter/img/20171213223544.png" alt="Second slide">
			</div>
			<div class="item">
				<img src="/Remotemeter/img/20171213223558.png" alt="Third slide">
			</div>
			<div class="item">
				<img src="/Remotemeter/img/20171213223543.png" alt="Fourth slide">
			</div>

		</div>
		<!-- 轮播（Carousel）导航 -->
		<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
	</div>
	<div class="progress">
		<div class="progress-bar" style="width: 100%; height: 5px"></div>
	</div>





	<DIV class="col-sm-4" style="margin-left: 100px;">
		<DIV class="app-box">

			<H5>企业信息</H5>
			<DIV class="clearfix">
				<SPAN class="pull-left"><IMG
					src="/Remotemeter/img/sms-logo.png"></SPAN>

				<DIV>
					<H4 style="padding-left: 90px;">安全保证</H4>
					<P style="padding-left: 90px;">十余年岁月锤炼、值得您信赖的抄表系统供应商</P>
				</DIV>
			</DIV>
			<DIV style="padding-top: 15px;">
				<A class="btn btn-info btn-sm pull-left" href="#lableLogin"
					target="_parent">产品展示</A>
				<P class="marginb0" style="line-height: 30px; padding-left: 90px;">
					新闻：<SPAN id="sms_num" style="cursor: pointer;"
						onclick="get_num('sms');">0</SPAN> 条
				</P>
			</DIV>
		</DIV>
	</DIV>
	<DIV class="col-sm-3">
		<DIV class="ibox">
			<DIV class="ibox-title">
				<H5>商务</H5>
			</DIV>
			<DIV class="ibox-content">
				<DIV class="mk-height">
					<DIV class="clearfix">
						<DIV class="pull-left text-center"
							style="width: 80px; margin-right: 15px;">
							<IMG width="100%" class="img-circle" alt="image"
								src="/Remotemeter/img/sms-logo5.png">
						</DIV>
						<DIV class="kefu">
							<H3>Jerry</H3>
							<P class="mb0">
								<I class="fa fa-phone" style="font-size: 16px;"></I>18327653303<BR>
								<I class="fa fa-mobile" style="font-size: 18px;"></I>88888888<BR>
								<I class="fa fa-qq" style="font-size: 14px;"></I><SPAN
									style="position: absolute;"><a target="_blank"
									href="http://wpa.qq.com/msgrd?v=3&uin=296293760&site=qq&menu=yes"><img
										border="0" src="http://wpa.qq.com/pa?p=2:296293760:51"
										alt="点击这里给我发消息" title="点击这里给我发消息" /></a></SPAN><BR>
							</P>
						</DIV>
					</DIV>
				</DIV>
			</DIV>
		</DIV>
	</DIV>


	<DIV class="col-sm-4">
		<DIV class="ibox">
			<DIV class="ibox-title">
				<H5>远程抄表公众号</H5>
			</DIV>
			<DIV class="ibox-content">
				<DIV class="mk-height clearfix">
					<DIV class="pull-left"
						style="margin-right: 20px; margin-bottom: 10px;">
						<IMG height="100" src="/Remotemeter/img/qian.png">
					</DIV>
					<DIV class="pull-left">
						<H4 style="padding-top: 8px;">扫码关注</H4>
						<P style="padding-top: 0px;">
							● 接收账户异常报警<BR>● 查询余额
						</P>
					</DIV>
				</DIV>
			</DIV>
		</DIV>
	</DIV>




	<DIV class="col-sm-4" style="margin-left: 100px; margin-top: 20px;">
		<DIV class="app-box">

			<H5>线上服务</H5>
			<DIV class="clearfix">
				<SPAN class="pull-left"><IMG
					src="/Remotemeter/img/sms-logo6.png"></SPAN>

				<DIV>
					<H4 style="padding-left: 90px;">线上服务</H4>
					<P style="padding-left: 90px;">再也不用每家每户上门贴电费催缴单、</P>
					<P style="padding-left: 90px;">客户也可直接在线完成支付，即时到帐、方便快捷</P>
				</DIV>
			</DIV>
			<DIV style="padding-top: -10px;">
				<a href="http://wpa.qq.com/msgrd?v=3&uin=296293760&site=qq&menu=yes"
					title="点击这里" data-toggle="popover" data-trigger="hover"
					data-placement="bottom"><button type="button"
						class="btn btn-primary" data-toggle="modal" data-target="#myModal"
						style="margin-top: -30px;">联系我们</button></a>
			</DIV>
		</DIV>
	</DIV>

	<DIV class="col-sm-3" style="margin-top: 20px;">
		<DIV class="ibox">
			<DIV class="ibox-title">
				<H5>资讯通知</H5>
			</DIV>
			<DIV class="ibox-content">
				<DIV class="mk-height">
					<DIV class="clearfix">
						<DIV class="pull-left text-center"
							style="width: 80px; margin-right: 15px; margin-top: 20px;">
							<IMG width="100%" class="img-circle" alt="image"
								src="/Remotemeter/img/sms-logo3.png">
						</DIV>
						<DIV class="kefu">
							<H3>资讯通知</H3>
							<P class="mb0">
								<I class="fa fa-phone" style="font-size: 16px;"></I>消息资讯即时推送<BR>
								<I class="fa fa-mobile" style="font-size: 18px;"></I>电力通知早知道<BR>
								<I class="fa fa-qq" style="font-size: 14px;"></I><SPAN
									style="position: absolute;"></SPAN><BR>
							</P>
						</DIV>
					</DIV>
				</DIV>
			</DIV>
		</DIV>
	</DIV>


	<DIV class="col-sm-4" style="margin-top: 20px;">
		<DIV class="ibox">
			<DIV class="ibox-title">
				<H5>全网联通</H5>
			</DIV>
			<DIV class="ibox-content">
				<DIV class="mk-height clearfix">
					<DIV class="pull-left"
						style="margin-right: 20px; margin-top: 10px;">
						<IMG height="100" src="/Remotemeter/img/sms-logo4.png">
					</DIV>
					<DIV class="pull-left" style="margin-top: 20px;">
						<H4 style="padding-top: 8px;">全网联通</H4>
						<P style="padding-top: 0px;">● 有网的地方，就有我们~</P>
					</DIV>
				</DIV>
			</DIV>
		</DIV>
	</DIV>



	<div class="progress" style="margin-top: 390px; margin-bottom: 0px;">
		<div class="progress-bar" style="width: 100%; height: 5px"></div>
	</div>








	<script>
		$(document).ready(function() {
			$('[data-toggle="popover"]').popover();
		});
	</script>


	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>

	<div class="col-sm-2" id="lableLogin">
		<IMG width="176" height="145"
			src="/Remotemeter/img/20154318384685103.jpg">
	</div>
	<div class="col-sm-2">
		<IMG width="176" height="145"
			src="/Remotemeter/img/2015431944954247.jpg">
	</div>
	<div class="col-sm-2">
		<IMG width="176" height="145"
			src="/Remotemeter/img/20154319492816901.jpg">
	</div>
	<div class="col-sm-2">
		<IMG width="176" height="145"
			src="/Remotemeter/img/20154319192421972.jpg">
	</div>
	<div class="col-sm-2">
		<IMG width="176" height="145"
			src="/Remotemeter/img/20154319182471935.jpg">
	</div>
	<div class="col-sm-2">
		<IMG width="176" height="145"
			src="/Remotemeter/img/20154319262983297.jpg">
	</div>

	<div class="col-sm-2" style="background-color: orange;">
		<a href="#" data-toggle="tooltip" data-placement="top"
			title="光电直读立式水表">光电直读立式水表</a>
	</div>
	<div class="col-sm-2" style="background-color: orange;">
		<a href="#" data-toggle="tooltip" data-placement="top"
			title="光电直读远传冷水表">光电直读远传冷水表</a>
	</div>
	<div class="col-sm-2" style="background-color: orange;">
		<a href="#" data-toggle="tooltip" data-placement="top"
			title="光电直读远传热水表">光电直读远传热水表</a>
	</div>
	<div class="col-sm-2" style="background-color: orange;">
		<a href="#" data-toggle="tooltip" data-placement="top"
			title="光电直读大口径水表">光电直读大口径水表</a>
	</div>
	<div class="col-sm-2" style="background-color: orange;">
		<a href="#" data-toggle="tooltip" data-placement="top"
			title="光电直读阀控水表">光电直读阀控水表</a>
	</div>
	<div class="col-sm-2" style="background-color: orange;">
		<a href="#" data-toggle="tooltip" data-placement="top"
			title="IC卡智能热水表（感应式）">IC卡智能热水表（感应式）</a>
	</div>

	<div id="qqonline"
		style="position: absolute; top: 40%; left: 40%; background: url(/Remotemeter/img/kfBoxBg.jpg) no-repeat left top; height: 180px; width: 402px;">
		<div style="text-align: right;" onclick="$('#qqonline').hide();">
			<img src="/Remotemeter/img/kfCloseBtn.gif"
				style="margin-top: 2px; margin-right: 5px; cursor: pointer;" />
		</div>
		<div style="margin-top: 100px; text-align: right; margin-right: 30px;">
			<a target="_blank"
				href="http://wpa.qq.com/msgrd?v=3&uin=296293760&site=qq&menu=yes"><img
				src="/Remotemeter/img/kfOnlinebtn.gif"
				style="margin-top: 2px; margin-right: 5px; cursor: pointer;"
				onclick="$('#qqonline').hide();" /></a>&nbsp; <img
				src="/Remotemeter/img/kfNextbtn.gif"
				style="margin-top: 2px; margin-right: 5px; cursor: pointer;"
				onclick="$('#qqonline').hide();" />
		</div>
	</div>
	<!--Footer start -->
	<div id="FooterLine" style="margin-top: -25px;"></div>
	<ul id="FooterInfo">
		<li class="rightBox" style="text-align: center;"><img
			src="/Remotemeter/img/StateGridLogo02.gif" /> 法律声明 | 联系我们 | 帮助信息 |
			网站地图 &nbsp; &nbsp; &nbsp; <img alt=""
			src="/Remotemeter/img/gongshang.gif" style="vertical-align: middle;" />湘ICP:备********号|湖南省湖南大学
			&nbsp; &nbsp; 技术支持：水电气热综合能源远程抄表系统小组</li>
	</ul>
	<!--Footer end -->

</body>
</html>