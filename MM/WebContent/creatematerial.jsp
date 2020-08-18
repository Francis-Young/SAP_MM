<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>创建物料主数据</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet">

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
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<h2>创建物料主数据</h2>
					<ol class="breadcrumb">
						<li><a href="Home">主页</a></li>
						<li>物料管理</li>
						<li class="active"><strong>创建物料主数据</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>
			<form class="m-t" role="form" action="CreateMaterial" method="post">
				<div class="wrapper wrapper-content animated fadeIn">
					<div class="row">
						<div class="col-lg-12">
							<div class="ibox float-e-margins">
								<div class="ibox-title">
									<h5>创建物料主数据</h5>
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
										<div class="col-md-4">
											<div class="form-group">
												<label for="title">材料编号</label> <input name="mnum"
													type="text" class="form-control" placeholder="输入材料编号..." />
											</div>
											<div class="form-group">
												<label for="title">材料描述</label> <input name="mdiscr"
													type="text" class="form-control" placeholder="输入材料描述..." />
											</div>
											<div class="form-group">
												<label for="title">基本单位</label> <input name="mbaseunit"
													type="text" class="form-control" placeholder="输入基本单位..." />
											</div>
											<div class="form-group">
												<label for="title">工业部门</label> <input name="mindustrysec"
													type="text" class="form-control" placeholder="输入工业部门..." />
											</div>
											<div class="form-group">
												<label for="title">销售组织</label> <input name="msalesorg"
													type="text" class="form-control" placeholder="输入销售组织..." />
											</div>
											<div class="form-group">
												<label for="title">分销渠道</label> <input name="mdistrchannel"
													type="text" class="form-control" placeholder="输入分销渠道..." />
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="title">材料组别</label> <input name="mgroup"
													type="text" class="form-control" placeholder="输入材料组别..." />
											</div>
											<div class="form-group">
												<label for="title">材料种类</label> <input name="mdivision"
													type="text" class="form-control" placeholder="输入材料种类..." />
											</div>
											<div class="form-group">
												<label for="title">材料单位</label> <input name="munitprice"
													type="text" class="form-control" placeholder="输入材料单位..." />
											</div>
											<div class="form-group">
												<label for="title">材料可得性检查</label> <input
													name="mavailabilitycheck" type="text" class="form-control"
													placeholder="输入材料可得性检查..." />
											</div>
											<div class="form-group">
												<label for="title">材料采购组织</label> <input
													name="mpurchasinggroup" type="text" class="form-control"
													placeholder="输入材料采购组织..." />
											</div>
											<div class="form-group">
												<label for="title">材料MRP种类</label> <input name="mMRPtype"
													type="text" class="form-control" placeholder="输入材料MRP种类..." />
											</div>
											<div class="form-group">
												<label for="title">材料MRP控制器</label> <input
													name="mMRPcontroller" type="text" class="form-control"
													placeholder="输入材料MRP控制器..." />
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="title">材料装运过程</label> <input
													name="mlotsizingprocedure" type="text" class="form-control"
													placeholder="输入材料装运过程..." />
											</div>
											<div class="form-group">
												<label for="title">材料最小装运单位</label> <input
													name="mminimumlotsize" type="text" class="form-control"
													placeholder="输入材料最小装运单位..." />
											</div>
											<div class="form-group">
												<label for="title">材料预计到达周期</label> <input
													name="mplanneddelivtime" type="text" class="form-control"
													placeholder="输入材料预计到达周期..." />
											</div>
											<div class="form-group">
												<label for="title">用于在Delivery表中展示</label> <input
													name="mshorttext" type="text" class="form-control"
													placeholder="输入用于在Delivery表中展示..." />
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
						<button type="submit" class="btn btn-primary">创建</button>
						<button type="reset" class="btn btn-white">清除</button>
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


</body>

</html>
