<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="mm.utils.DBUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>


<style type="text/css">
.table-b table td {
	border: 2px solid #e7eaec
}
</style>
<style type="text/css">
.table-b table td {
	border: 2px solid #e7eaec
}
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>查询库存</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet">

<link href="css/plugins/summernote/summernote.css" rel="stylesheet">
<link href="css/plugins/summernote/summernote-bs3.css" rel="stylesheet">

<link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">

<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<!-- Toastr style -->
<link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">

<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
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
						</span> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
							class="clear"> <span class="block m-t-xs"> <strong
									class="font-bold"><%=session.getAttribute("uname")%></strong>
							</span> <span class="text-muted text-xs block"><%=session.getAttribute("upermission")%><b
									class="caret"></b></span>
						</span>
						</a>
						<ul class="dropdown-menu animated fadeInRight m-t-xs">
							<li><a>个人信息</a></li>
							<li><a>联系方式</a></li>
							<li><a>邮箱</a></li>
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
						<li><a href="SelectVendor?type=display">查询供应商</a></li>
						<li><a href="SelectVendor?type=update">维护供应商</a></li>
					</ul></li>

				<li><a href="#"><i class="fa fa-shopping-cart"></i><span
						class="nav-label"> 采购管理 </span><span class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse">
						<li><a href="#">请购单管理 <span class="fa arrow"></span></a>
							<ul class="nav nav-third-level">
								<li><a href="requisitionini.jsp">创建请购单 </a></li>
								<li><a href="requisitionleadview.jsp">查看请购单 </a></li>
							</ul></li>
						<li><a href="#">RFQ管理 <span class="fa arrow"></span></a>
							<ul class="nav nav-third-level ">
								<li><a href="rfqini.jsp">创建RFQ </a></li>
								<li><a href="rfqleadview.jsp">查看RFQ </a></li>
							</ul></li>
						<li><a href="#">报价单管理 <span class="fa arrow"></span></a>
							<ul class="nav nav-third-level">
								<li><a href="quotationini.jsp">维护报价单 </a></li>
								<li><a href="quotationcompare.jsp">比对报价单 </a></li>

							</ul></li>
						<li><a href="#">订单管理 <span class="fa arrow"></span></a>
							<ul class="nav nav-third-level ">
								<li><a href="orderini.jsp">创建订单 </a></li>
								<li><a href="orderleadview.jsp">查看订单 </a></li>
								<li><a href="orderleadchange.jsp">维护订单 </a></li>
							</ul></li>
					</ul></li>
				<li class="active"><a href="#"><i class="fa fa-files-o"></i>
						<span class="nav-label">收货管理</span><span class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse">
						<li><a href="goodsreceipt.jsp">创建收货单 </a></li>
						<li class="active"><a href="showstock.jsp">查询库存 </a></li>
						<li><a href="createpayment.jsp">创建发票 </a></li>
						<li><a href="postpayment.jsp">付款 </a></li>
						<li><a href="account.jsp">查看应付账款 </a></li>
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
				</div>
				<ul class="nav navbar-top-links navbar-left">
					<li><a> <i class="fa fa-paper-plane"></i>Be What's Next.
					</a></li>
				</ul>
				<ul class="nav navbar-top-links navbar-right">
					<li><span class="m-r-sm text-muted welcome-message">欢迎你，<%=session.getAttribute("uname")%></span>
					</li>
					<li><a href="Login"> <i class="fa fa-sign-out"></i> 退出登录
					</a></li>
				</ul>

				</nav>
			</div>
			<form class="m-t" role="form" action="Showstock" method="post">
				<div class="row wrapper border-bottom white-bg page-heading">
					<div class="col-lg-10">
						<h2>查询库存</h2>
						<ol class="breadcrumb">
							<li><a href="Home">主页</a></li>
							<li>收货管理</li>
							<li class="active"><strong>查询库存</strong></li>
						</ol>
					</div>

				</div>
				<div class="wrapper wrapper-content animated fadeIn">
					<div class="row">
						<div class="col-lg-12">
							<div class="ibox float-e-margins">


								<div class="ibox ">
									<div class="ibox-title">
										<h5>物料信息</h5>
										<div class="ibox-tools">
											<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
											</a> <a class="close-link"> <i class="fa fa-times"></i>
											</a>
										</div>
									</div>
									<div class="ibox-content m-b-sm border-bottom">
										<div class="row">
											<div class="input-group m-b">
												<!-- 还要做出搜索效果 -->
												<div class="col-sm-4">
													<div class="form-group">
														<input type="text" id="order_num" name="m_text" value=""
															placeholder="物料名称" class="form-control">
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<input type="text" id="order_num" name="sloc" value=""
															placeholder="库存中心" class="form-control">
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<select name="DataTables_Table_0_length"
															aria-controls="DataTables_Table_0"
															class="form-control form-control-sm">
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
															<option value="6">6</option>
														</select>
													</div>
												</div>
											</div>

										</div>
									</div>

								</div>

								<div class="ibox ">
									<div class="ibox-title">
										<h5>存货情况</h5>
										<div class="ibox-tools">
											<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
											</a> <a class="close-link"> <i class="fa fa-times"></i>
											</a>
										</div>
									</div>
									<div class="ibox-content">

										<table class="table table-bordered">
											<thead>
												<tr>
													<th>物料编号</th>
													<th>存储位置</th>
													<th>剩余数量</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>
														<%
															String str1 = (String) request.getAttribute("m_text");
															if (str1 != null && !"".equals(str1)) {
														%> <%=str1%> <%
 	} else {
 %>请输入物料信息<%
 	}
 %>
													</td>
													<td>
														<%
															String str2 = (String) request.getAttribute("sloc");
															if (str2 != null && !"".equals(str2)) {
														%> <%=str2%> <%
 	}
 %>
													</td>
													<td>
														<%
															Integer str3 = (Integer) request.getAttribute("m_amount");
															if (str3 != null && !"".equals(str3)) {
														%> <%=str3%> <%
 	}
 %>

													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="footer">

						<div class="pull-right">
							<button type="submit" class="btn btn-primary" id="showtoast">查看</button>

							<a href="Home">
								<button type="button" class="btn btn-white" id="cleartoasts">
									返回</button>
							</a>
						</div>


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
	<!-- SUMMERNOTE -->
	<script src="js/plugins/summernote/summernote.min.js"></script>

	<!-- Data picker -->
	<script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>

	<script>
		$(document).ready(function() {

			$('.summernote').summernote();

			$('.input-group.date').datepicker({
				todayBtn : "linked",
				keyboardNavigation : false,
				forceParse : false,
				calendarWeeks : true,
				autoclose : true
			});

		});
	</script>
	<!-- Toastr script -->
	<script src="js/plugins/toastr/toastr.min.js"></script>

	<script type="text/javascript">
		$(function() {
			var i = -1;
			var toastCount = 0;
			var $toastlast;
			var getMessage = function() {
				var msg = 'Hi, welcome to Inspinia. This is example of Toastr notification box.';
				return msg;
			};

			$('#showsimple').click(function() {
				// Display a success toast, with a title
				toastr.success('Without any options', 'Simple notification!')
			});
			$('#showtoast')
					.click(
							function() {
								var shortCutFunction = $(
										"#toastTypeGroup input:radio:checked")
										.val();
								var msg = $('#message').val();
								var title = $('#title').val() || '';
								var $showDuration = $('#showDuration');
								var $hideDuration = $('#hideDuration');
								var $timeOut = $('#timeOut');
								var $extendedTimeOut = $('#extendedTimeOut');
								var $showEasing = $('#showEasing');
								var $hideEasing = $('#hideEasing');
								var $showMethod = $('#showMethod');
								var $hideMethod = $('#hideMethod');
								var toastIndex = toastCount++;
								toastr.options = {
									closeButton : $('#closeButton').prop(
											'checked'),
									debug : $('#debugInfo').prop('checked'),
									progressBar : $('#progressBar').prop(
											'checked'),
									preventDuplicates : $('#preventDuplicates')
											.prop('checked'),
									positionClass : $(
											'#positionGroup input:radio:checked')
											.val()
											|| 'toast-top-right',
									onclick : null
								};
								if ($('#addBehaviorOnToastClick').prop(
										'checked')) {
									toastr.options.onclick = function() {
										alert('You can perform some custom action after a toast goes away');
									};
								}
								if ($showDuration.val().length) {
									toastr.options.showDuration = $showDuration
											.val();
								}
								if ($hideDuration.val().length) {
									toastr.options.hideDuration = $hideDuration
											.val();
								}
								if ($timeOut.val().length) {
									toastr.options.timeOut = $timeOut.val();
								}
								if ($extendedTimeOut.val().length) {
									toastr.options.extendedTimeOut = $extendedTimeOut
											.val();
								}
								if ($showEasing.val().length) {
									toastr.options.showEasing = $showEasing
											.val();
								}
								if ($hideEasing.val().length) {
									toastr.options.hideEasing = $hideEasing
											.val();
								}
								if ($showMethod.val().length) {
									toastr.options.showMethod = $showMethod
											.val();
								}
								if ($hideMethod.val().length) {
									toastr.options.hideMethod = $hideMethod
											.val();
								}
								if (!msg) {
									msg = getMessage();
								}
								$("#toastrOptions").text(
										"Command: toastr["
												+ shortCutFunction
												+ "](\""
												+ msg
												+ (title ? "\", \"" + title
														: '')
												+ "\")\n\ntoastr.options = "
												+ JSON
														.stringify(
																toastr.options,
																null, 2));
								var $toast = toastr[shortCutFunction](msg,
										title); // Wire up an event handler to a button in the toast, if it exists
								$toastlast = $toast;
								if ($toast.find('#okBtn').length) {
									$toast
											.delegate(
													'#okBtn',
													'click',
													function() {
														alert('you clicked me. i was toast #'
																+ toastIndex
																+ '. goodbye!');
														$toast.remove();
													});
								}
								if ($toast.find('#surpriseBtn').length) {
									$toast
											.delegate(
													'#surpriseBtn',
													'click',
													function() {
														alert('Surprise! you clicked me. i was toast #'
																+ toastIndex
																+ '. You could perform an action here.');
													});
								}
							});
			function getLastToast() {
				return $toastlast;
			}
			$('#clearlasttoast').click(function() {
				toastr.clear(getLastToast());
			});
			$('#cleartoasts').click(function() {
				toastr.clear();
			});
		})
	</script>

</body>
</html>