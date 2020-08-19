<%@ page import="java.util.List,mm.bean.*,mm.dao.*,java.util.ArrayList"
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>维护报价单</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet">

<!-- Toastr style -->
<link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">

<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">


<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet">

<!-- Sweet Alert -->
<link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<!-- Mainly scripts 日期-->
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
	function initDatePicker(ele) {
		ele.datepicker({
			autoSize : true,
			autoclose : true,
			language : "zh-CN",
			viewDate : new Date()
		})
	}
	$(document).ready(function() {

		initDatePicker($(".input-group.date"));
	});
</script>

<style type="text/css">
.table-b td {
	border: 1px solid #808080;
	padding: 0px
}

.table>tbody>tr>td {
	border-top: 1px solid #e7eaec;
	line-height: 1.42857;
	padding: 0px;
	vertical-align: top;
}
</style>
<style>
#wrapper {
	z-index: 99;
	position: absolute;
}

.opbox1 {
	z-index: 100;
	width: 50%;
	margin-top: 10%;
	margin: auto;
	padding: 28px;
	top: 25%;
	left: 25%;
	height: 350px;
	border: 1px #111 solid;
	display: none; /* 默认对话框隐藏 */
	position: absolute;
	background: white;
}

.opbox1.show {
	display: block;
}

.opbox1 .x {
	font-size: 18px;
	text-align: right;
	display: block;
}

.opbox2 {
	z-index: 101;
	width: 40%;
	margin-top: 10%;
	margin: auto;
	padding: 28px;
	top: 5%;
	left: 30%;
	height: 550px;
	border: 1px #111 solid;
	display: none; /* 默认对话框隐藏 */
	position: absolute;
	background: white;
}

.opbox2.show {
	display: block;
}

.opbox2 .x {
	font-size: 18px;
	text-align: right;
	display: block;
}

.opbox3 {
	z-index: 101;
	width: 40%;
	margin-top: 10%;
	margin: auto;
	padding: 28px;
	top: 5%;
	left: 30%;
	height: 650px;
	border: 1px #111 solid;
	display: none; /* 默认对话框隐藏 */
	position: absolute;
	background: white;
}

.opbox3.show {
	display: block;
}

.opbox3 .x {
	font-size: 18px;
	text-align: right;
	display: block;
}
</style>
<script>
	function vaildday() {
		var selectContent = document.getElementsByName("checkname");
		//获取要赋值的input的元素
		openwin(0);
		//  var inputElement =  document.getElementById("reqnum");
		//给input框赋值
		//  inputElement.value = clickContent.cells[1].innerHTML;//.innerText;
		//选中input框的内容
		// inputElement.select();
		// 执行浏览器复制命令
		// document.execCommand("Copy");

	}
</script>

</head>

<body>
	<div id="wrapper">


		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="sidebar-collapse" style="z-index: 10";>
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

					<li class="active"><a href="#"><i
							class="fa fa-shopping-cart"></i><span class="nav-label">
								采购管理 </span><span class="fa arrow"></span></a>
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
							<li class="active"><a href="#">报价单管理 <span
									class="fa arrow"></span></a>
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


			<!--正文 -->
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<h2>维护报价单</h2>
					<ol class="breadcrumb">
						<li><a href="Home">主页</a></li>
						<li>报价单管理</li>
						<li class="active"><strong>维护报价单</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>

			<form class="m-t" role="form"
				action="${pageContext.request.contextPath}/quotation" method="post">

				<div class="wrapper wrapper-content animated fadeIn">
					<div class="row">
						<div class="col-lg-12">
							<div class="ibox float-e-margins">

								<div class="ibox-title">
									<h5>维护报价单</h5>
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
									<input type="text" value="save" name="action" hidden="true">

									<div class="row">

										<div class="col-md-4">
											<!--RFQ具体信息 -->
											<div class="form-group">
												<label for="title">RFQ:</label> <input id="vname"
													name="rfq_type" type="text" class="form-control"
													readonly="readonly" value=${ rfqnum} />
											</div>
											<div class="form-group">
												<label for="message">RFQ类型：</label> <input
													readonly="readonly" value=${ rfqtype} type="text"
													class="form-control"></input>

											</div>
											<div class="form-group">
												<label for="message">供应商：</label> <input readonly="readonly"
													value=${ vendor} type="text" class="form-control"></input>
												${ vendorname}
											</div>



										</div>

										<div class="col-md-2"></div>

										<div class="col-md-2" style="width: 25%;">

											<div class="form-group">
												<label for="showMethod">RFQ日期：</label> <input
													id="showMethod" readonly="readonly" value=${ rfqdate}
													class="form-control" />
											</div>
											<div class="form-group">
												<label for="showMethod">截止日期：</label> <input id="showMethod"
													readonly="readonly" value=${ ddldate} class="form-control" />
											</div>

										</div>
									</div>
									<div class="table-b">
										<table id="oTable" class="table table-bordered">
											<thead>
												<tr>
													<th></th>
													<th>条目</th>
													<th>材料编号</th>
													<th>数量</th>
													<th>运送日期</th>
													<th>价格</th>
													<th>工厂</th>


												</tr>
											</thead>
											<tbody>

												<%
													//取出请购单的条目
													RFQ rfq = (RFQ) session.getAttribute("passrfq");

													ArrayList<RFQ_item> rilist = RFQItemDao.findRFQItemByRfqCode(rfq.getRfq_code());
													for (int i = 0; i < rilist.size(); i++) {
														RFQ_item ri = rilist.get(i);

														out.print("<tr>");
														out.print("<td><input  type='checkbox' checked='' class='i-checks' name='checkname' value='" + i
																+ "'></td>");
														out.print("<td>" + (i + 10) * 10 + "</td>");
														out.print("<td>" + ri.getMaterial_num() + "</td>");
														out.print("<td>" + ri.getRequisition_quantity() + "</td>");
														out.print("<td>" + ri.getRequisition_deliverydate() + "</td>");
														out.print("<td><input name='price" + i + "'  type='text' class='form-control'></td>");
														out.print("<td>" + ri.getRequisition_plant() + "</td>");
													}
												%>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="footer">
					<div class="pull-right">
						<div class="text-right">
							<input type="submit" class="btn btn-primary " value="接受条目">
							<button type="button" class="btn btn-white" onclick="openwin(1)">有效期设置</button>
							<button type="button" class="btn btn-white" id="cleartoasts">取消</button>
						</div>
					</div>
				</div>
				<!-- Mainly scripts for pop windows-->
				<script>
					function openwin(n) {
						document.getElementById('inputbox').style.display = n ? 'block'
								: 'none'; /* 点击按钮打开/关闭 对话框 */
					}
				</script>
				<script>
					function openwin2(n) {
						document.getElementById('inputbox2').style.display = n ? 'block'
								: 'none'; /* 点击按钮打开/关闭 对话框 */
					}
				</script>
				<script>
					function openwin3(n) {
						document.getElementById('inputbox3').style.display = n ? 'block'
								: 'none'; /* 点击按钮打开/关闭 对话框 */
					}
				</script>

				<!-- 第一层弹窗 -->
				<div id='inputbox' class="opbox1">

					<a class='x' href='' ; onclick="openwin(0); return false;">关闭</a>

					<div class="ibox-content">

						<div class="form-group">

							<label class="col-sm-2 control-label"
								style="width: 13%; padding: 1px;">生效时间</label>


							<div class="input-group date">
								<span class="input-group-addon"> <i
									class="fa fa-calendar"></i></span> <input name="deliverydate"
									type="text" class="form-control" >
							</div>

						</div>

						<label class="col-sm-2 control-label"
							style="width: 13%; padding: 1px;">失效时间</label>
						<div class="input-group date">
							<span class="input-group-addon"> <i class="fa fa-calendar"></i></span>
							<input name="deliverydate" type="text" class="form-control"
								>
						</div>
					</div>
					<div class="text-right">
						<button type="button" class="btn btn-primary "
							onclick="openwin(0); return false;">取消</button>
						<input type="submit" class="btn btn-primary " value="继续">
					</div>
				</div>
			</form>
		</div>


		<!-- 日期框 -->
	</div>
	<script>
		initDatePicker($(".input-group.date"));
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
				toastr.success('可以添加新的RFQ材料', '提示!')
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

	<!-- Mainly scripts -->
	<script src="js/jquery-2.1.1.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

	<!-- Custom and plugin javascript -->
	<script src="js/inspinia.js"></script>
	<script src="js/plugins/pace/pace.min.js"></script>

	<!-- Sweet alert -->
	<script src="js/plugins/sweetalert/sweetalert.min.js"></script>

	<script>
		$(document)
				.ready(
						function() {

							$('.demo1')
									.click(
											function() {
												swal({
													title : "Welcome in Alerts",
													text : "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
												});
											});

							$('.demo2').click(function() {
								swal({
									title : "Good job!",
									text : "You clicked the button!",
									type : "success"
								});
							});

							$('.demo3')
									.click(
											function() {
												swal(
														{
															title : "Are you sure?",
															text : "You will not be able to recover this imaginary file!",
															type : "warning",
															showCancelButton : true,
															confirmButtonColor : "#DD6B55",
															confirmButtonText : "Yes, delete it!",
															closeOnConfirm : false
														},
														function() {
															swal(
																	"Deleted!",
																	"Your imaginary file has been deleted.",
																	"success");
														});
											});

							$('.demo4')
									.click(
											function() {
												swal(
														{
															title : "Are you sure?",
															text : "Your will not be able to recover this imaginary file!",
															type : "warning",
															showCancelButton : true,
															confirmButtonColor : "#DD6B55",
															confirmButtonText : "Yes, delete it!",
															cancelButtonText : "No, cancel plx!",
															closeOnConfirm : false,
															closeOnCancel : false
														},
														function(isConfirm) {
															if (isConfirm) {
																swal(
																		"Deleted!",
																		"Your imaginary file has been deleted.",
																		"success");
															} else {
																swal(
																		"Cancelled",
																		"Your imaginary file is safe :)",
																		"error");
															}
														});
											});

						});
	</script>
</body>

</html>
