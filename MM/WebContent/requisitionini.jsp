<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>创建请购单</title>
<!--

    <link href="css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
-->
    <link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">


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
function initDatePicker(ele){
	ele.datepicker({
	autoSize:true,
	autoclose: true,
	language: "zh-CN",
	viewDate:new Date()
	})
}
    $(document).ready(function(){

		initDatePicker($(".input-group.date"));
   });
    

</script>

<script type="text/javascript">
var itemNo = 0;//---添加行
</script>
<script>
function addRow(){		
	itemNo+=10;
	document.getElementById('num').value=itemNo;
    var oTable = document.getElementById("oTable");
    var tBodies = oTable.tBodies;
    var tbody = tBodies[0];
    var tr = tbody.insertRow(tbody.rows.length);
    var td_1 = tr.insertCell(0);
    td_1.innerHTML = itemNo;
    
    var td_2 = tr.insertCell(1);
    td_2.innerHTML = '<input name="material'+itemNo+'" id="vname" type="text" class="form-control" placeholder="输入材料编号..." />';
    var td_3 = tr.insertCell(2);
    td_3.innerHTML = '<input class="form-control" name="quantity'+itemNo+'" id="vaddress" type="text" class="form-control" placeholder="输入请购数量 ..."></input>';
    var td_4 = tr.insertCell(3);
    td_4.innerHTML = 	'<div id="'+itemNo+'" class="input-group date"> <span class="input-group-addon">'+
'<i class="fa fa-calendar"></i></span><input name="deliverydate'+itemNo+'" type="text" class="form-control" readonly="readonly">'+
'</div>';
    var td_5 = tr.insertCell(4);
    td_5.innerHTML = '<input name="plant'+itemNo+'" id="showEasing" type="text" placeholder="输入运送工厂..." class="form-control" />';
    var td_6 = tr.insertCell(5);
    td_6.innerHTML = '<input name="storloc'+itemNo+'" id="showEasing" type="text" placeholder="输入仓库地点..." class="form-control" />';
    var td_7 = tr.insertCell(6);
    td_7.innerHTML = '<input name="organ'+itemNo+'" id="showMethod" type="text" placeholder="输入请购组织" class="form-control" />';
    initDatePicker($('#'+itemNo));
    
    }

</script>




<style type="text/css">
.table-b td{border:1px solid #808080; padding:0px}
.table > tbody > tr > td {
  border-top: 1px solid #e7eaec;
  line-height: 1.42857;
  padding: 0px;
  vertical-align: top;
}
</style>

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

					<li class="active"><a href="#"><i class="fa fa-shopping-cart"></i><span
							class="nav-label"> 采购管理 </span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li class="active"><a href="#">请购单管理 <span class="fa arrow"></span></a>
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
					<h2>创建请购单</h2>
					<ol class="breadcrumb">
						<li><a href="index.html">主页</a></li>
						<li>请购管理</li>
						<li class="active"><strong>创建请购单</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>

	<form class="m-t" role="form" action="${pageContext.request.contextPath}/requisition" method="post">
						       <input type='text' value='creat' name='action' hidden='true'>	<!-- 控制表单名 -->					
							<input type='text' id='num' value='0' name='num' hidden='true'>    <!-- 条目数量 -->	
							
			<div class="wrapper wrapper-content animated fadeIn">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">

							<div class="ibox-title">
								<h5>创建请购单</h5>
								<div class="ibox-tools">
									<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
									</a> <a class="dropdown-toggle" data-toggle="dropdown" href="#">
										<i class="fa fa-wrench"></i>
									</a>
									<ul class="dropdown-menu dropdown-user">
										<li><a href="#">配置 1</a></li>
										<li><a href="#">配置 2</a></li>
									</ul>
									<a class="close-link" hidden="hidden"> <i class="fa fa-times"></i>
									</a>
								</div>
							</div>

							<div class="ibox-content">
								<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="col-sm-2 control-label">头部注明</label>
												<div class="col-sm-10">
													<textarea name="head_requisition" placeholder="文本内容可能延伸超出一行"
														style="width: 700px; height: 100px;" class="form-control"></textarea>
												</div>
											</div>

										</div>
									</div>
		<br>
																	
<div class="row">

								
										
<div class="table-b">
<table id="oTable" class="table table-bordered" style="border:1 ; width:100;">
<thead style="border:2 ; width:100;">
<tr>
<th>条目</th>
<th>材料编号</th>
<th>请购数量</th>
<th>请购运送时间</th>
<th>请购运送工厂</th>
<th>请购运送地点</th>
<th>请购组织</th>

</tr>
</thead>
<tbody>
<tr>

</tr>
</tbody>
</table>
<div class="row">
<div class="pull-right">
<input type="button" class="btn btn-primary" onClick="addRow();" style="font-size: 16px;margin:3px;" value="+" />
<button type="reset" class="btn btn-white" id="clearlasttoast" style="margin:19px;">清除</button>
</div>
</div>
</div>
<br>
<script type="text/javascript">addRow();</script>



									</div>

							</div>
						</div>
					</div>
				</div>

				
							
				
				
			</div>

			<div class="footer" style="position: fixed; bottom: 0 ;z-index: 1;">

				<div class="pull-right">
					<div class="text-right">
						<input type="submit"  value="保存" class="btn btn-success btn-sm demo2" id="showtoast">
						<a href="${pageContext.request.contextPath}/Home"><button type="button" class="btn btn-white" id="cleartoasts">返回</button></a>
					</div>
				</div>
				
				<div style="padding-top: 2px;">
						
						<p>
							<font size="3" color="#1ab394">			
<%
if(request.getAttribute("requisition_code")!=null)
	out.print("成功创建请购单："+request.getAttribute("requisition_code").toString());
             %>	</font>
						</p>
						
					</div>
			</div>
				</form>
				
			</div>

		</div>




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
				toastr.success('可以添加新的请购材料', '提示!')
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
		});
		</script> 
   
  

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js">
    <script src="js/plugins/pace/pace.min.js"></script>

    <!-- Sweet alert -->
    <script src="js/plugins/sweetalert/sweetalert.min.js"></script>

<script>

    $(document).ready(function () {

        $('.demo1').click(function(){
            swal({
                title: "Welcome in Alerts",
                text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
            });
        });

        $('.demo2').click(function(){
            swal({
                title: "请购单添加成功!",
                text: "您的请购单号是10034245",
                type: "success"
            });
        });

        $('.demo3').click(function () {
            swal({
                title: "Are you sure?",
                text: "You will not be able to recover this imaginary file!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, delete it!",
                closeOnConfirm: false
            }, function () {
                swal("Deleted!", "Your imaginary file has been deleted.", "success");
            });
        });

        $('.demo4').click(function () {
            swal({
                        title: "Are you sure?",
                        text: "Your will not be able to recover this imaginary file!",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes, delete it!",
                        cancelButtonText: "No, cancel plx!",
                        closeOnConfirm: false,
                        closeOnCancel: false },
                    function (isConfirm) {
                        if (isConfirm) {
                            swal("Deleted!", "Your imaginary file has been deleted.", "success");
                        } else {
                            swal("Cancelled", "Your imaginary file is safe :)", "error");
                        }
                    });
        });


    });

</script>
	
</body>

</html>
