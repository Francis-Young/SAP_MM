<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>创建收货单</title>

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

<script type="text/javascript">
	var itemNo = 0;
</script>

<script>
	function addRow() {
		itemNo += 1;
		document.getElementById('num').value = itemNo;
		
		var oTable = document.getElementById("oTable");
		var tBodies = oTable.tBodies;
		var tbody = tBodies[0];
		var tr = tbody.insertRow(tbody.rows.length);

		var td_1 = tr.insertCell(0); //td_1,td_2。。。这些是每一行的单元格内要显示的元素,可以自己改内容和根据列数改数量
		td_1.innerHTML = itemNo;
		
		var td_2 = tr.insertCell(1);
		td_2.innerHTML = '<input name="m_text'+itemNo+'" id="materialtext" type="text" class="form-control" placeholder="输入物料编号..." />';
		var td_3 = tr.insertCell(2);
		td_3.innerHTML = '<input name="check'+itemNo+'" id="closeButton" type="checkbox" value="checked" class="input-mini" checked=""></input>';
		var td_4 = tr.insertCell(3);
		td_4.innerHTML = '<input name="m_num'+itemNo+'" class="form-control" id="vaddress" type="text" class="form-control" placeholder="输入物料数量 ..."></input>';
		var td_5 = tr.insertCell(4);
		td_5.innerHTML = '<input name="sloc'+itemNo+'" id="showEasing" type="text" placeholder="输入存储位置..." class="form-control" />';
		
	}
</script>

<style type="text/css" defer=true>
.table-b table td {
	border: 2px solid #e7eaec
}
</style>

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
					<li><a href="#"><i class="fa fa-shopping-cart"></i> <span
							class="nav-label">采购管理</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="requisitionini.jsp">创建请购单 </a></li>
							<li><a href="requisitionleadview.jsp">查看请购单 </a></li>
							<li><a href="rfqini.jsp">创建RFQ </a></li>
							<li><a href="rfqleadview.jsp">查看RFQ </a></li>
							<li><a href="quotationini.jsp">维护报价单 </a></li>
							<li><a href="quotationcompare.jsp">比对报价单 </a></li>
							<li><a href="orderini.jsp">创建订单 </a></li>
							<li><a href="orderleadview.jsp">查看订单 </a></li>
							<li><a href="orderleadchange.jsp">维护订单 </a></li>
						</ul></li>

					<li><a href="#"><i class="fa fa-files-o"></i> <span
							class="nav-label">收货管理</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="goodsreceipt.jsp">创建收货单 </a></li>
							<li><a href="showstock.jsp">查询库存 </a></li>
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
			<form class="m-t" role="form" action="${pageContext.request.contextPath}/goodsreceipt" method="post">
			
			<input type='text' value='creat' name='action' hidden='true'>
			<input type='text' id='num' value='0' name='num' hidden='true'>
			
				<div class="row wrapper border-bottom white-bg page-heading">
					<div class="col-lg-10">
						<h2>创建收货单</h2>
						<ol class="breadcrumb">
							<li><a href="index.html">主页</a></li>
							<li>收货管理</li>
							<li class="active"><strong>创建收货单</strong></li>
						</ol>
					</div>

				</div>
				<div class="wrapper wrapper-content animated fadeIn">
					<div class="row">
						<div class="col-lg-12">
							<div class="ibox float-e-margins">


								<div class="ibox ">
									<div class="ibox-title">
										<h5>基本数据</h5>
										<div class="ibox-tools">
											<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
											</a> <a class="close-link"> <i class="fa fa-times"></i>
											</a>
										</div>
									</div>
									<div class="ibox-content m-b-sm border-bottom">
										<div class="row">
											<div class="input-group m-b">

												<!-- 两个暂无选择意义的下拉框 -->
												<div class="col-sm-4">
													<div class="form-group">
														<select name="DataTables_Table_0_length"
															aria-controls="DataTables_Table_0"
															class="form-control form-control-sm">
															<option value="1">收货单</option>
															<option value="2">取消</option>
															<option value="3">展示</option>
															<option value="4">存储位置</option>
															<option value="5">重新运输</option>
															<option value="6">接连运输</option>
														</select>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<select name="DataTables_Table_0_length"
															aria-controls="DataTables_Table_0"
															class="form-control form-control-sm">
															<option value="1">采购订单</option>
															<option value="2">进货</option>
															<option value="3">物料文件</option>
															<option value="4">出货</option>
															<option value="5">运输</option>
															<option value="6">运输码</option>
														</select>
													</div>
												</div>


												<!-- 还要做出搜索效果 -->
												<div class="col-sm-4">
													<div class="form-group">
														<input type="text" id="order_num" name="order_num"
															value="" placeholder="采购单号" class="form-control">
													</div>
												</div>
											</div>
										</div>
										<!-- 两个日期 需返回  -->
										<div class="row">
											<div class="col-sm-4">
												<div class="form-group">
													<label class="font-normal">文件日期</label>
													<div class="input-group date">
														<span class="input-group-addon"><i
															class="fa fa-calendar"></i></span> <input type="text"
															id="posting_date" name="posting_date"
															class="form-control" value="08/01/2020">
													</div>
												</div>
											</div>
											<div class="col-sm-4">
												<div class="form-group">
													<label class="font-normal">文件打印日期</label>
													<div class="input-group date">
														<span class="input-group-addon"><i
															class="fa fa-calendar"></i></span> <input type="text"
															id="document_date" name="document_date"
															class="form-control" value="08/01/2020">
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-sm-4">
												<div class="form-group">
													<select name="DataTables_Table_0_length"
														aria-controls="DataTables_Table_0"
														class="form-control form-control-sm">
														<option value="1">单独放置</option>
														<option value="2">共同放置</option>
														<option value="3">单独放置（带备注）</option>
													</select>
												</div>
											</div>
											<div class="col-sm-4">
												<div class="form-group">
													<input type="text" id="delivery_note" name="delivery_note"
														value="" placeholder="运输备注" class="form-control">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="wrapper wrapper-content animated fadeIn">
						<div class="row">
							<div class="col-lg-12">
								<div class="ibox float-e-margins">
									<div class="ibox-title">
										<h5>运输数据</h5>
										<div class="ibox-tools">
											<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
											</a> <a class="close-link"> <i class="fa fa-times"></i>
											</a>
										</div>
									</div>
									<div class="ibox-content m-b-sm border-bottom">
										<!-- 前后的灰色线 -->
										<input type="hidden" name="m_textArray" value=""
											id="m_textArray">

										<div class="table-b">
											<div class="wrapper wrapper-content animated fadeIn">
												<div align="center">
													<table id="oTable" style="background-color: #f3f3f4;"
														bordercolor="#e7eaec" border="2" cellpadding="50"
														cellpadding="50" width="100%" height="200%" align="center">
														<thead>
															<tr>
																<th>
																	<div align="center">条目</div>
																</th>
																<!--  这些是表头，可以自己改列数和内容-->
																<th>
																	<div align="center">物料编号</div>
																</th>
																<th>
																	<div align="center">OK</div>
																</th>
																<th>
																	<div align="center">物料数量</div>
																</th>
																<th>
																	<div align="center">存储位置</div>
																</th>
															</tr>
														</thead>
														<tbody>
															<tr>

															</tr>
														</tbody>
													</table>
												</div>
												<input type="button" onClick="addRow();"
													class="btn btn-white" value="+" />

												<!-- 原先的设计<input type="button" onClick="addRow();"
													style="font-size: 16px;" value="+" /> -->
											</div>
										</div>
										<br>
										<script type="text/javascript">
											addRow();
										</script>
										
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="footer">
						<div class="row">
							<div class="col-lg-12">
								<div class="pull-right">
									<button type="submit" class="btn btn-primary" id="showtoast">保存</button>
									<button type="button" class="btn btn-white" id="cleartoasts">
								<a href="Home.jsp">返回</a>
								</div>
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