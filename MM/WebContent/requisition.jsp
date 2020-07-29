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

       // $('.summernote').summernote();

   //     $('.input-group.date').datepicker({
    //        todayBtn: "linked",
   //         keyboardNavigation: false,
   //         forceParse: false,
   //         calendarWeeks: true,
   //         autoclose: true
   //     });
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
.table-b table td{border:2px solid #808080}
</style>

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
							<li><a href="graph_flot.html">创建供应商</a></li>
							<li><a href="graph_morris.html">维护供应商</a></li>
						</ul></li>
					<li><a href="#"><i class="fa fa-shopping-cart"></i> <span
							class="nav-label">请购</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="form_basic.html"></a></li>
							<li><a href="form_advanced.html">创建请购单</a></li>
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
											<small class="pull-right">23小时前</small> <strong>张三</strong>
											赞了 <strong>李四</strong>. <br> <small class="text-muted">2天前
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

										<div class="form-group">
											<label class="col-sm-2 control-label">头部注明</label>
											<div class="col-sm-10">
												<textarea name="head_requisition" style="width:700px;height:100px;" class="form-control"> 
												</textarea >
												<span class="help-block m-b-none">文本内容可能延伸超出一行</span>
											</div>
										</div>
										
<div class="table-b">
<table id="oTable" style="background-color:#F5F5F5;" bordercolor="#aaaaaa" border="2" cellpadding="0" cellpadding="2" width="100%">
<thead>
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
<input type="button" onClick="addRow();" style="font-size:16px;" value="+"/>
</div>
<br>
<script type="text/javascript">addRow();</script>



									</div>

									<div class="row">
										<div class="col-lg-12">
											<button type="button" class="btn btn-primary"
												id="showsimple">增加</button>
											<button type="button" class="btn btn-white"
												id="clearlasttoast">清除</button>
										</div>
									</div>
								

							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="footer">
				<div class="pull-right">
					<div class="text-right">
						<input type="submit"  value="保存" class="btn btn-success btn-sm demo2" id="showtoast">
						<button type="button" class="btn btn-white" id="cleartoasts"><a href="Home.jsp">返回</a></button>
					</div>
				</div>
				</form>
				<div>
					<strong>Copyright</strong> 版权所有 &copy; 2020-2021
				</div>
			</div>

		</div>
	</div>
</form>


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
