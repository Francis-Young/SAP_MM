<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="mm.bean.Vendor"%>
<%
	ArrayList<String> reconacct = (ArrayList<String>) request.getAttribute("reconacct");
	ArrayList<String> paymentterms = (ArrayList<String>) request.getAttribute("paymentterms");
	ArrayList<String> currency = (ArrayList<String>) request.getAttribute("currency");
	ArrayList<String> language = (ArrayList<String>) request.getAttribute("language");
	Vendor v = (Vendor) request.getAttribute("vendor");
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>维护供应商</title>
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
					<h2>维护供应商</h2>
					<ol class="breadcrumb">
						<li><a href="Home">主页</a></li>
						<li>供应商管理</li>
						<li class="active"><strong>维护供应商</strong></li>
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
									<h5>维护供应商</h5>
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
														<%if ("person".equals(v.getVtype())) {%> checked <%}%>
														value="person" />个人
													</label>
												</div>
												<div class="radio">
													<label class="radio"> <input type="radio"
														name="vtype"
														<%if ("organization".equals(v.getVtype())) {%> checked
														<%}%> value="organization" />组织
													</label>
												</div>
												<div class="radio">
													<label class="radio"> <input type="radio"
														name="vtype" <%if ("group".equals(v.getVtype())) {%>
														checked <%}%> value="group" />团体
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
													class="form-control" value="<%=v.getVcompanycode()%>"></input>
											</div>
											<div class="form-group">
												<label for="message">供应商国家</label> <input
													class="form-control" name="vcountry" type="text"
													class="form-control" value="<%=v.getVcountry()%>"></input>
											</div>
											<div class="form-group">
												<label for="message">供应商城市</label> <input
													class="form-control" name="vcity" type="text"
													class="form-control" value="<%=v.getVcity()%>"></input>
											</div>
											<div class="form-group">
												<label for="message">供应商地区</label> <input
													class="form-control" name="vregion" type="text"
													class="form-control" value="<%=v.getVregion()%>"></input>
											</div>
											<div class="form-group">
												<label for="message">供应商街道</label> <input
													class="form-control" name="vstreet" type="text"
													class="form-control" value="<%=v.getVstreet()%>"></input>
											</div>
											<div class="form-group">
												<label for="message">供应商邮政编码</label> <input
													class="form-control" name="vpostalcode" type="text"
													class="form-control" value="<%=v.getVpostalcode()%>"></input>
											</div>
											<div class="form-group">
												<label for="message">供应商语言</label>
												<div>
													<select class="select2_demo_1 form-control"
														name="vlanguage">
														<c:forEach items="${language}" var="language" begin="0"
															end="${language.size()}" step="1">
															<option value="${language }"
																<c:if test="${language==v.getVlanguage()}"> selected="selected" </c:if>><c:out
																	value="${language}"></c:out></option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label for="title">使用货币类型</label>
												<div class="input-group">
													<select class="select2_demo_1 form-control"
														style="width: 350px;" name="vcurrency">
														<c:forEach items="${currency}" var="currency" begin="0"
															end="${currency.size()}" step="1">
															<option value="${currency }"
																<c:if test="${currency==v.getVcurrency()}"> selected="selected" </c:if>><c:out
																	value="${currency}"></c:out></option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label for="title">税号</label> <input name="vtax" type="text"
													class="form-control" value="<%=v.getVtaxnum()%>" />
											</div>
											<div class="form-group">
												<label for="title">支付模式</label> <select
													class="select2_demo_1 form-control" name="vpaymentterms">
													<c:forEach items="${paymentterms}" var="paymentterms"
														begin="0" end="${paymentterms.size()}" step="1">
														<option value="${paymentterms }"
															<c:if test="${paymentterms==v.getVpaymentterms()}"> selected="selected" </c:if>><c:out
																value="${paymentterms}"></c:out></option>
													</c:forEach>
												</select>
											</div>
											<div class="form-group">
												<label for="title">统驭科目</label>
												<div>
													<select class="select2_demo_1 form-control"
														name="vreconacct">
														<c:forEach items="${reconacct}" var="reconacct" begin="0"
															end="${reconacct.size()}" step="1">
															<option value="${reconacct }"
																<c:if test="${reconacct==v.getVreconacct()}"> selected="selected" </c:if>><c:out
																	value="${reconacct}"></c:out></option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label for="title">联系员工</label> <input name="vclerk"
													type="text" class="form-control" value="<%=v.getVclerk()%>" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="footer">
					<div class="pull-right">
						<button type="submit" class="btn btn-primary" id="showtoast">保存</button>
						<button type="reset" class="btn btn-white" id="clearlasttoast">清除</button>
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

	<!-- Toastr script -->
	<script src="js/plugins/toastr/toastr.min.js"></script>

	<!-- Chosen -->
	<script src="js/plugins/chosen/chosen.jquery.js"></script>

	<script>
		$(document)
				.ready(
						function() {

							var $image = $(".image-crop > img")
							$($image).cropper({
								aspectRatio : 1.618,
								preview : ".img-preview",
								done : function(data) {
									// Output the result data for cropping image.
								}
							});

							var $inputImage = $("#inputImage");
							if (window.FileReader) {
								$inputImage
										.change(function() {
											var fileReader = new FileReader(), files = this.files, file;

											if (!files.length) {
												return;
											}

											file = files[0];

											if (/^image\/\w+$/.test(file.type)) {
												fileReader.readAsDataURL(file);
												fileReader.onload = function() {
													$inputImage.val("");
													$image.cropper("reset",
															true).cropper(
															"replace",
															this.result);
												};
											} else {
												showMessage("Please choose an image file.");
											}
										});
							} else {
								$inputImage.addClass("hide");
							}

							$("#download").click(function() {
								window.open($image.cropper("getDataURL"));
							});

							$("#zoomIn").click(function() {
								$image.cropper("zoom", 0.1);
							});

							$("#zoomOut").click(function() {
								$image.cropper("zoom", -0.1);
							});

							$("#rotateLeft").click(function() {
								$image.cropper("rotate", 45);
							});

							$("#rotateRight").click(function() {
								$image.cropper("rotate", -45);
							});

							$("#setDrag").click(function() {
								$image.cropper("setDragMode", "crop");
							});

							$('#data_1 .input-group.date').datepicker({
								todayBtn : "linked",
								keyboardNavigation : false,
								forceParse : false,
								calendarWeeks : true,
								autoclose : true
							});

							$('#data_2 .input-group.date').datepicker({
								startView : 1,
								todayBtn : "linked",
								keyboardNavigation : false,
								forceParse : false,
								autoclose : true,
								format : "dd/mm/yyyy"
							});

							$('#data_3 .input-group.date').datepicker({
								startView : 2,
								todayBtn : "linked",
								keyboardNavigation : false,
								forceParse : false,
								autoclose : true
							});

							$('#data_4 .input-group.date').datepicker({
								minViewMode : 1,
								keyboardNavigation : false,
								forceParse : false,
								autoclose : true,
								todayHighlight : true
							});

							$('#data_5 .input-daterange').datepicker({
								keyboardNavigation : false,
								forceParse : false,
								autoclose : true
							});

							var elem = document.querySelector('.js-switch');
							var switchery = new Switchery(elem, {
								color : '#1AB394'
							});

							var elem_2 = document.querySelector('.js-switch_2');
							var switchery_2 = new Switchery(elem_2, {
								color : '#ED5565'
							});

							var elem_3 = document.querySelector('.js-switch_3');
							var switchery_3 = new Switchery(elem_3, {
								color : '#1AB394'
							});

							$('.i-checks').iCheck({
								checkboxClass : 'icheckbox_square-green',
								radioClass : 'iradio_square-green'
							});

							$('.demo1').colorpicker();

							var divStyle = $('.back-change')[0].style;
							$('#demo_apidemo').colorpicker({
								color : divStyle.backgroundColor
							}).on('changeColor', function(ev) {
								divStyle.backgroundColor = ev.color.toHex();
							});

							$('.clockpicker').clockpicker();

							$('input[name="daterange"]').daterangepicker();

							$('#reportrange span').html(
									moment().subtract(29, 'days').format(
											'MMMM D, YYYY')
											+ ' - '
											+ moment().format('MMMM D, YYYY'));

							$('#reportrange')
									.daterangepicker(
											{
												format : 'MM/DD/YYYY',
												startDate : moment().subtract(
														29, 'days'),
												endDate : moment(),
												minDate : '01/01/2012',
												maxDate : '12/31/2015',
												dateLimit : {
													days : 60
												},
												showDropdowns : true,
												showWeekNumbers : true,
												timePicker : false,
												timePickerIncrement : 1,
												timePicker12Hour : true,
												ranges : {
													'Today' : [ moment(),
															moment() ],
													'Yesterday' : [
															moment().subtract(
																	1, 'days'),
															moment().subtract(
																	1, 'days') ],
													'Last 7 Days' : [
															moment().subtract(
																	6, 'days'),
															moment() ],
													'Last 30 Days' : [
															moment().subtract(
																	29, 'days'),
															moment() ],
													'This Month' : [
															moment().startOf(
																	'month'),
															moment().endOf(
																	'month') ],
													'Last Month' : [
															moment()
																	.subtract(
																			1,
																			'month')
																	.startOf(
																			'month'),
															moment()
																	.subtract(
																			1,
																			'month')
																	.endOf(
																			'month') ]
												},
												opens : 'right',
												drops : 'down',
												buttonClasses : [ 'btn',
														'btn-sm' ],
												applyClass : 'btn-primary',
												cancelClass : 'btn-default',
												separator : ' to ',
												locale : {
													applyLabel : 'Submit',
													cancelLabel : 'Cancel',
													fromLabel : 'From',
													toLabel : 'To',
													customRangeLabel : 'Custom',
													daysOfWeek : [ 'Su', 'Mo',
															'Tu', 'We', 'Th',
															'Fr', 'Sa' ],
													monthNames : [ 'January',
															'February',
															'March', 'April',
															'May', 'June',
															'July', 'August',
															'September',
															'October',
															'November',
															'December' ],
													firstDay : 1
												}
											},
											function(start, end, label) {
												console.log(
														start.toISOString(),
														end.toISOString(),
														label);
												$('#reportrange span')
														.html(
																start
																		.format('MMMM D, YYYY')
																		+ ' - '
																		+ end
																				.format('MMMM D, YYYY'));
											});

							$(".select2_demo_1").select2();
							$(".select2_demo_2").select2();
							$(".select2_demo_3").select2({
								placeholder : "Select a state",
								allowClear : true
							});

							$(".touchspin1").TouchSpin({
								buttondown_class : 'btn btn-white',
								buttonup_class : 'btn btn-white'
							});

							$(".touchspin2").TouchSpin({
								min : 0,
								max : 100,
								step : 0.1,
								decimals : 2,
								boostat : 5,
								maxboostedstep : 10,
								postfix : '%',
								buttondown_class : 'btn btn-white',
								buttonup_class : 'btn btn-white'
							});

							$(".touchspin3").TouchSpin({
								verticalbuttons : true,
								buttondown_class : 'btn btn-white',
								buttonup_class : 'btn btn-white'
							});

						});
		var config = {
			'.chosen-select' : {},
			'.chosen-select-deselect' : {
				allow_single_deselect : true
			},
			'.chosen-select-no-single' : {
				disable_search_threshold : 10
			},
			'.chosen-select-no-results' : {
				no_results_text : 'Oops, nothing found!'
			},
			'.chosen-select-width' : {
				width : "95%"
			}
		}
		for ( var selector in config) {
			$(selector).chosen(config[selector]);
		}

		$("#ionrange_1").ionRangeSlider({
			min : 0,
			max : 5000,
			type : 'double',
			prefix : "$",
			maxPostfix : "+",
			prettify : false,
			hasGrid : true
		});

		$("#ionrange_2").ionRangeSlider({
			min : 0,
			max : 10,
			type : 'single',
			step : 0.1,
			postfix : " carats",
			prettify : false,
			hasGrid : true
		});

		$("#ionrange_3").ionRangeSlider({
			min : -50,
			max : 50,
			from : 0,
			postfix : "°",
			prettify : false,
			hasGrid : true
		});

		$("#ionrange_4").ionRangeSlider(
				{
					values : [ "January", "February", "March", "April", "May",
							"June", "July", "August", "September", "October",
							"November", "December" ],
					type : 'single',
					hasGrid : true
				});

		$("#ionrange_5").ionRangeSlider({
			min : 10000,
			max : 100000,
			step : 100,
			postfix : " km",
			from : 55000,
			hideMinMax : true,
			hideFromTo : false
		});

		$(".dial").knob();

		$("#basic_slider").noUiSlider({
			start : 40,
			behaviour : 'tap',
			connect : 'upper',
			range : {
				'min' : 20,
				'max' : 80
			}
		});

		$("#range_slider").noUiSlider({
			start : [ 40, 60 ],
			behaviour : 'drag',
			connect : true,
			range : {
				'min' : 20,
				'max' : 80
			}
		});

		$("#drag-fixed").noUiSlider({
			start : [ 40, 60 ],
			behaviour : 'drag-fixed',
			connect : true,
			range : {
				'min' : 20,
				'max' : 80
			}
		});
	</script>
</body>

</html>
