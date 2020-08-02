<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="mm.bean.Vendor"%>
<%
	ArrayList<Vendor> vendor = (ArrayList<Vendor>) request.getAttribute("vendor");
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>选择供应商</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet">

<link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet">

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
								<li><a href="login.html">退出登录</a></li>
							</ul>
						</div>
						<div class="logo-element">IN+</div>
					</li>
					<li><a href="index.html"><i class="fa fa-th-large"></i> <span
							class="nav-label">首页</span> <span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="index.html">首页 v.1</a></li>
							<li><a href="dashboard_2.html">首页 v.2</a></li>
							<li><a href="dashboard_3.html">首页 v.3</a></li>
							<li><a href="dashboard_4_1.html">首页 v.4</a></li>
							<li><a href="dashboard_5.html">首页 v.5 <span
									class="label label-primary pull-right">NEW</span></a></li>
						</ul></li>
					<li><a href="layouts.html"><i class="fa fa-diamond"></i> <span
							class="nav-label">布局</span></a></li>
					<li><a href="#"><i class="fa fa-bar-chart-o"></i> <span
							class="nav-label">图表</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="graph_flot.html">Flot Charts</a></li>
							<li><a href="graph_morris.html">Morris.js Charts</a></li>
							<li><a href="graph_rickshaw.html">Rickshaw Charts</a></li>
							<li><a href="graph_chartjs.html">Chart.js</a></li>
							<li><a href="graph_chartist.html">Chartist</a></li>
							<li><a href="c3.html">c3 charts</a></li>
							<li><a href="graph_peity.html">Peity Charts</a></li>
							<li><a href="graph_sparkline.html">Sparkline Charts</a></li>
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
						<li><span class="m-r-sm text-muted welcome-message">欢迎来到goopay</span>
						</li>
						<li class="dropdown"><a class="dropdown-toggle count-info"
							data-toggle="dropdown" href="#"> <i class="fa fa-envelope"></i>
								<span class="label label-warning">16</span>
						</a></li>
						<li class="dropdown"><a class="dropdown-toggle count-info"
							data-toggle="dropdown" href="#"> <i class="fa fa-bell"></i> <span
								class="label label-primary">8</span>
						</a></li>


						<li><a href="Login"> <i class="fa fa-sign-out"></i> 退出登录
						</a></li>
					</ul>
				</nav>
			</div>
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<h2>选择供应商</h2>
					<ol class="breadcrumb">
						<li><a href="Home">主页</a></li>
						<li><a>供应商管理</a></li>
						<li class="active"><strong>选择供应商</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>
			<form class="m-t" role="form" action="SelectVendor" method="post">
				<div class="wrapper wrapper-content animated fadeInRight">
					<div class="row">
						<div class="col-lg-12">
							<div class="ibox float-e-margins">
								<div class="ibox-title">
									<h5>选择供应商</h5>
									<div class="ibox-tools">
										<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
										</a> <a class="dropdown-toggle" data-toggle="dropdown" href="#">
											<i class="fa fa-wrench"></i>
										</a>
										<ul class="dropdown-menu dropdown-user">
											<li><a href="#">配置选项 1</a></li>
											<li><a href="#">配置选项 2</a></li>
										</ul>
										<a class="close-link"> <i class="fa fa-times"></i>
										</a>
									</div>
								</div>
								<div class="ibox-content">

									<div class="table-responsive">

										<table
											class="table table-striped table-bordered table-hover dataTables-example">
											<thead>
												<tr>
													<th></th>
													<th>编号</th>
													<th>名称</th>
													<th>类型</th>
													<th>城市</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${vendor}" var="vendor" begin="0"
													end="${vendor.size()}" step="1">
													<tr>
														<td><input type="radio" name="v"
															value="${vendor.vnum}" /></td>
														<td><c:out value="${vendor.vnum}"></c:out></td>
														<td><c:out value="${vendor.vname}"></c:out></td>
														<td class="center"><c:out value="${vendor.vtype}"></c:out></td>
														<td class="center"><c:out value="${vendor.vcity}"></c:out></td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
												<tr>
													<th></th>
													<th>编号</th>
													<th>名称</th>
													<th>类型</th>
													<th>城市</th>
												</tr>
											</tfoot>
										</table>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="footer">
					<div class="pull-right">
						<button type="submit" class="btn btn-primary"id="showtoast">继续</button>
						<button type="reset" class="btn btn-white"id="clearlasttoast">清除</button>
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
	<script src="js/plugins/jeditable/jquery.jeditable.js"></script>

	<script src="js/plugins/dataTables/datatables.min.js"></script>

	<!-- Custom and plugin javascript -->
	<script src="js/inspinia.js"></script>
	<script src="js/plugins/pace/pace.min.js"></script>
	
	<!-- Toastr script -->
	<script src="js/plugins/toastr/toastr.min.js"></script>


	<!-- Page-Level Scripts -->
	<script>
		$(document)
				.ready(
						function() {
							$('.dataTables-example')
									.DataTable(
											{
												dom : '<"html5buttons"B>lTfgitp',
												buttons : [
														{
															extend : 'copy'
														},
														{
															extend : 'csv'
														},
														{
															extend : 'excel',
															title : 'ExampleFile'
														},
														{
															extend : 'pdf',
															title : 'ExampleFile'
														},

														{
															extend : 'print',
															customize : function(
																	win) {
																$(
																		win.document.body)
																		.addClass(
																				'white-bg');
																$(
																		win.document.body)
																		.css(
																				'font-size',
																				'10px');

																$(
																		win.document.body)
																		.find(
																				'table')
																		.addClass(
																				'compact')
																		.css(
																				'font-size',
																				'inherit');
															}
														} ]

											});

							/* Init DataTables */
							var oTable = $('#editable').DataTable();

							/* Apply the jEditable handlers to the table */
							oTable
									.$('td')
									.editable(
											'../example_ajax.php',
											{
												"callback" : function(sValue, y) {
													var aPos = oTable
															.fnGetPosition(this);
													oTable.fnUpdate(sValue,
															aPos[0], aPos[1]);
												},
												"submitdata" : function(value,
														settings) {
													return {
														"row_id" : this.parentNode
																.getAttribute('id'),
														"column" : oTable
																.fnGetPosition(this)[2]
													};
												},

												"width" : "90%",
												"height" : "100%"
											});

						});
	</script>

</body>

</html>
