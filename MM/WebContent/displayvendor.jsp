<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="mm.bean.Vendor"%>
<%@ page import="mm.bean.DownList"%>
<%
	ArrayList<DownList> reconacct = (ArrayList<DownList>) request.getAttribute("reconacct");
	ArrayList<DownList> paymentterms = (ArrayList<DownList>) request.getAttribute("paymentterms");
	ArrayList<DownList> currency = (ArrayList<DownList>) request.getAttribute("currency");
	ArrayList<DownList> language = (ArrayList<DownList>) request.getAttribute("language");
	Vendor v = (Vendor) request.getAttribute("vendor");
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>查询供应商</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/plugins/chosen/chosen.css" rel="stylesheet">
</head>

<body>

	<div id="wrapper">

		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav metismenu" id="side-menu">
					<li class="nav-header">
						<div class="dropdown profile-element">
							<span> <img height="48px" width="48px" alt="image"
								class="img-circle" src="<%=session.getAttribute("uportrait")%>" />
							</span> <a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<span class="clear"> <span class="block m-t-xs"> <strong
										class="font-bold"><%=session.getAttribute("uid")%></strong>
								</span> <span class="text-muted text-xs block">管理员 <b
										class="caret"></b></span>
							</span>
							</a>
							<ul class="dropdown-menu animated fadeInRight m-t-xs">
								<li><a href="profile.html">个人信息</a></li>
								<li><a href="contacts.html">联系方式</a></li>
								<li><a href="mailbox.html">邮箱</a></li>
								<li class="divider"></li>
								<li><a href="Login">退出登录</a></li>
							</ul>
						</div>
						<div class="logo-element">IN+</div>
					</li>
					<li><a href="Home"><i class="fa fa-home"></i> <span
							class="nav-label">主页</span></a></li>
					<li><a href="layouts.html"><i class="fa fa-diamond"></i> <span
							class="nav-label">供应商管理</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="CreateVendor">创建供应商</a></li>
							<li><a href="graph_morris.html">维护供应商</a></li>
						</ul></li>
					<li><a href="#"><i class="fa fa-shopping-cart"></i> <span
							class="nav-label">采购</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="form_basic.html"></a></li>
							<li><a href="form_advanced.html">高级插件</a></li>
							<li><a href="form_wizard.html">分步引导</a></li>
							<li><a href="form_file_upload.html">文件上传</a></li>
							<li><a href="form_editors.html">富文本编辑</a></li>
							<li><a href="form_markdown.html">Markdown</a></li>
						</ul></li>

					<li><a href="#"><i class="fa fa-files-o"></i> <span
							class="nav-label">收货</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="search_results.html">搜索结果</a></li>
							<li><a href="lockscreen.html">锁屏</a></li>
							<li><a href="invoice.html">发票</a></li>
							<li><a href="login.html">登录</a></li>
							<li><a href="login_two_columns.html">登录 v.2</a></li>
							<li><a href="forgot_password.html">忘记密码</a></li>
							<li><a href="register.html">注册</a></li>
							<li><a href="404.html">404</a></li>
							<li><a href="500.html">500</a></li>
							<li><a href="empty_page.html">空白页面</a></li>
						</ul></li>
				</ul>

			</div>
		</nav>

		<div id="page-wrapper" class="gray-bg">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation"
					style="margin-bottom: 0">
					<div class="navbar-header">
						<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
							href="#"><i class="fa fa-bars"></i> </a>
						<form role="search" class="navbar-form-custom"
							action="search_results.html">
							<div class="form-group">
								<input type="text" placeholder="Search for something..."
									class="form-control" name="top-search" id="top-search">
							</div>
						</form>
					</div>
					<ul class="nav navbar-top-links navbar-right">
						<li><span class="m-r-sm text-muted welcome-message">欢迎回来！</span></li>
						<li class="dropdown"><a class="dropdown-toggle count-info"
							data-toggle="dropdown" href="#"> <i class="fa fa-envelope"></i>
								<span class="label label-warning">16</span>
						</a></li>
						<li><a href="Login"> <i class="fa fa-sign-out"></i> 退出登录
						</a></li>
					</ul>
				</nav>
			</div>
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<h2>
						查询供应商-<%=v.getVcode()%></h2>
					<ol class="breadcrumb">
						<li><a href="Home">主页</a></li>
						<li>供应商管理</li>
						<li class="active"><strong>查询供应商</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>
			<form class="m-t" role="form" action="MaintainVendor" method="post">
				<div class="wrapper wrapper-content animated fadeIn">
					<div class="row">
						<div class="col-lg-12">
							<div class="ibox float-e-margins">
								<div class="ibox-title">
									<h5>查询供应商</h5>
									<div class="ibox-tools">
										<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
										</a> <a class="dropdown-toggle" data-toggle="dropdown" href="#">
											<i class="fa fa-wrench"></i>
										</a>
										<ul class="dropdown-menu dropdown-user">
											<li><a href="#">配置 1</a></li>
											<li><a href="#">配置 2</a></li>
										</ul>
										<a class="close-link"> <i class="fa fa-times"></i>
										</a>
									</div>
								</div>
								<div class="ibox-content">
									<div class="row">
										<div class="col-md-2">
											<div class="form-group" id="toastTypeGroup">
												<label>供应商类型</label>
												<div class="radio">
													<label> <input type="radio" name="vtype"
														<%if ("person".equals(v.getVtype())) {%> checked
														<%} else {%> disabled="disabled" <%}%> value="person" />个人
													</label>
												</div>
												<div class="radio">
													<label class="radio"> <input type="radio"
														name="vtype"
														<%if ("organization".equals(v.getVtype())) {%> checked
														<%} else {%> disabled="disabled" <%}%>
														value="organization" />组织
													</label>
												</div>
												<div class="radio">
													<label class="radio"> <input type="radio"
														name="vtype" <%if ("group".equals(v.getVtype())) {%>
														checked <%} else {%> disabled="disabled" <%}%>
														value="group" />团体
													</label>
												</div>
											</div>
										</div>

										<div class="col-md-4">
											<div class="form-group">
												<label for="title">供应商名称</label> <input name="vname"
													type="text" class="form-control" value="<%=v.getVname()%>"
													readonly="readonly" />
											</div>
											<div class="form-group">
												<label for="message">供应商公司号</label> <input
													class="form-control" name="vcompanycode" type="text"
													class="form-control" value="<%=v.getVcompanycode()%>"
													readonly="readonly"></input>
											</div>
											<div class="form-group">
												<label for="message">供应商国家</label> <input
													class="form-control" name="vcountry" type="text"
													class="form-control" value="<%=v.getVcountry()%>"
													readonly="readonly" />
											</div>
											<div class="form-group">
												<label for="message">供应商城市</label> <input
													class="form-control" name="vcity" type="text"
													class="form-control" value="<%=v.getVcity()%>"
													readonly="readonly" />
											</div>
											<div class="form-group">
												<label for="message">供应商地区</label> <input
													class="form-control" name="vregion" type="text"
													class="form-control" value="<%=v.getVregion()%>"
													readonly="readonly" />
											</div>
											<div class="form-group">
												<label for="message">供应商街道</label> <input
													class="form-control" name="vstreet" type="text"
													class="form-control" value="<%=v.getVstreet()%>"
													readonly="readonly"></input>
											</div>
											<div class="form-group">
												<label for="message">供应商邮政编码</label> <input
													class="form-control" name="vpostalcode" type="text"
													class="form-control" value="<%=v.getVpostalcode()%>"
													readonly="readonly"></input>
											</div>
											<div class="form-group">
												<label for="message">供应商语言</label>
												<div>
													<input class="form-control" name="vpostalcode" type="text"
														class="form-control" value="<%=v.getVlanguage()%>"
														readonly="readonly"></input>
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label for="title">使用货币类型</label>
												<div>
													<input class="form-control" name="vpostalcode" type="text"
														class="form-control" value="<%=v.getVcurrency()%>"
														readonly="readonly"></input>
												</div>
											</div>
											<div class="form-group">
												<label for="title">税号</label> <input name="vtax" type="text"
													class="form-control" value="<%=v.getVtaxnum()%>"
													readonly="readonly" />
											</div>
											<div class="form-group">
												<label for="title">支付模式</label>
												<div>
													<input class="form-control" name="vpostalcode" type="text"
														class="form-control" value="<%=v.getVpaymentterms()%>"
														readonly="readonly"></input>
												</div>
											</div>
											<div class="form-group">
												<label for="title">统驭科目</label>
												<div>
													<input class="form-control" name="vpostalcode" type="text"
														class="form-control" value="<%=v.getVreconacct()%>"
														readonly="readonly"></input>
												</div>
											</div>
											<div class="form-group">
												<label for="title">联系员工</label> <input name="vclerk"
													type="text" class="form-control" value="<%=v.getVclerk()%>"
													readonly="readonly" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="footer">
					<div class="pull-right"></div>
					<div style="padding-top: 2px;">
						<%
							String notice = (String) request.getAttribute("notice");
							if (notice != null && !"".equals(notice)) {
						%>
						<p>
							<font size="3" color=<%=request.getAttribute("color")%>><%=notice%></font>
						</p>
						<%
							request.setAttribute("notice", "");
							}
						%>
					</div>
				</div>
			</form>
		</div>
	</div>


	<!-- Mainly scripts -->
	<script src="js/jquery-2.1.1.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

	<!-- Custom and plugin javascript -->
	<script src="js/inspinia.js"></script>
	<script src="js/plugins/pace/pace.min.js"></script>

	<!-- Toastr script -->
	<script src="js/plugins/toastr/toastr.min.js"></script>

	<!-- Chosen -->
	<script src="js/plugins/chosen/chosen.jquery.js"></script>



</body>

</html>
