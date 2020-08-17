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

<title>展示收货单</title>

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
						<span> <img alt="image" class="img-circle"
							src="img/profile_small.jpg" />
						</span> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
							class="clear"> <span class="block m-t-xs"> <strong
									class="font-bold">王昆</strong>
							</span> <span class="text-muted text-xs block">管理员 <b
									class="caret"></b></span>
						</span>
						</a>
						<ul class="dropdown-menu animated fadeInRight m-t-xs">
							<li><a href="profile.html">个人信息</a></li>
							<li><a href="contacts.html">联系方式</a></li>
							<li><a href="mailbox.html">邮箱</a></li>
							<li class="divider"></li>
							<li><a href="login.html">退出登录</a></li>
						</ul>
					</div>
					<div class="logo-element">IN+</div>
				</li>
				<li><a href="layouts.html"><i class="fa fa-home"></i> <span
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
						class="nav-label">收货管理</span><span class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse">
						<li><a href="Goodsreceipt">创建收货单</a></li>
						<li><a href="Showstock">查看库存</a></li>
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
					</a>
						<ul class="dropdown-menu dropdown-messages">
							<li>
								<div class="dropdown-messages-box">
									<a href="profile.html" class="pull-left"> <img alt="image"
										class="img-circle" src="img/a7.jpg">
									</a>
									<div class="media-body">
										<small class="pull-right">46小时前</small> <strong>李文俊</strong>
										关注了 <strong>刘海洋</strong>. <br> <small class="text-muted">3
											天 前- 10.06.2014</small>
									</div>
								</div>
							</li>
							<li class="divider"></li>
							<li>
								<div class="dropdown-messages-box">
									<a href="profile.html" class="pull-left"> <img alt="image"
										class="img-circle" src="img/a4.jpg">
									</a>
									<div class="media-body ">
										<small class="pull-right text-navy">5小时前</small> <strong>王昆</strong>
										关注了 <strong>李文俊</strong>. <br> <small class="text-muted">昨天下午1:21
											- 11.06.2014</small>
									</div>
								</div>
							</li>
							<li class="divider"></li>
							<li>
								<div class="dropdown-messages-box">
									<a href="profile.html" class="pull-left"> <img alt="image"
										class="img-circle" src="img/profile.jpg">
									</a>
									<div class="media-body ">
										<small class="pull-right">23小时前</small> <strong>张三</strong> 赞了
										<strong>李四</strong>. <br> <small class="text-muted">2天前
											- 11.06.2014</small>
									</div>
								</div>
							</li>
							<li class="divider"></li>
							<li>
								<div class="text-center link-block">
									<a href="mailbox.html"> <i class="fa fa-envelope"></i> <strong>查看更多消息</strong>
									</a>
								</div>
							</li>
						</ul></li>

					<li><a href="login.html"> <i class="fa fa-sign-out"></i>
							退出登录
					</a></li>
				</ul>

				</nav>
			</div>
			<form class="m-t" role="form" action="Showstock" method="post">
				<div class="row wrapper border-bottom white-bg page-heading">
					<div class="col-lg-10">
						<h2>创建收货单</h2>
						<ol class="breadcrumb">
							<li><a href="index.html">主页</a></li>
							<li>收货管理</li>
							<li class="active"><strong>查看库存</strong></li>
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
								<div class="wrapper wrapper-content animated fadeIn">
									<div class="row">
										<div class="col-lg-6">
											<div class="ibox ">
												<div class="ibox-title">
													<h5>存货情况</h5>
													<div class="ibox-tools">
														<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
														</a> <a class="dropdown-toggle" data-toggle="dropdown"
															href="#"> <i class="fa fa-wrench"></i>
														</a>
														<ul class="dropdown-menu dropdown-user">
															<li><a href="#" class="dropdown-item">Config
																	option 1</a></li>
															<li><a href="#" class="dropdown-item">Config
																	option 2</a></li>
														</ul>
														<a class="close-link"> <i class="fa fa-times"></i>
														</a>
													</div>
												</div>
												<div class="ibox-content">

													<table class="table">
														<thead>
															<tr>
																<th>物料编号</th>
																<th>存储位置</th>
																<th>剩余数量</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td><input class="form-control" name="vpostalcode"
																	type="text" class="form-control"
																	value="<%=request.getAttribute("m_text")%>"
																	readonly="readonly"></input></td>
																<td><input class="form-control" name="vpostalcode"
																	type="text" class="form-control"
																	value="<%=request.getAttribute("sloc")%>"
																	readonly="readonly"></input></td>
																<td><input class="form-control" name="vpostalcode"
																	type="text" class="form-control"
																	value="<%=request.getAttribute("m_amount")%>"
																	readonly="readonly"></input></td>


															</tr>
														</tbody>
													</table>

												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="footer">
						<div class="row m-t-lg">
							<div class="pull-right">
								<button type="submit" class="btn btn-primary" id="showtoast">查看</button>
								<button type="button" class="btn btn-white" id="cleartoasts">取消</button>
							</div>

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