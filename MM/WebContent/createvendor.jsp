<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>创建供应商</title>

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
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<h2>创建供应商</h2>
					<ol class="breadcrumb">
						<li><a href="index.html">主页</a></li>
						<li>供应商管理</li>
						<li class="active"><strong>创建供应商</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>
			<div class="wrapper wrapper-content animated fadeIn">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>创建供应商</h5>
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
								<form class="m-t" role="form" action="CreateVendor"
									method="post">
									<div class="row">

										<div class="col-md-4">
											<div class="form-group">
												<label for="title">供应商名称</label> <input name="vname"
													type="text" class="form-control" placeholder="输入标题..." />
											</div>
											<div class="form-group">
												<label for="message">供应商地址</label> <input
													class="form-control" id="vaddress" type="text"
													class="form-control" placeholder="输入消息 ..."></input>
											</div>
											<div class="checkbox">
												<label class="checkbox" for="closeButton"> <input
													id="closeButton" type="checkbox" value="checked"
													class="input-mini" checked />关闭按钮
												</label>
											</div>
											<div class="checkbox">
												<label class="checkbox" for="addBehaviorOnToastClick">
													<input id="addBehaviorOnToastClick" type="checkbox"
													value="checked" class="input-mini" />在小方块上点击
												</label>
											</div>
											<div class="checkbox">
												<label class="checkbox" for="debugInfo"> <input
													id="debugInfo" type="checkbox" value="checked"
													class="input-mini" />Debug
												</label>
											</div>
											<div class="checkbox">
												<label class="checkbox" for="progressBar"> <input
													id="progressBar" type="checkbox" value="checked"
													class="input-mini" checked />进度条
												</label>
											</div>
											<div class="checkbox">
												<label class="checkbox" for="preventDuplicates"> <input
													id="preventDuplicates" type="checkbox" value="checked"
													class="input-mini" />防止重复
												</label>
											</div>
										</div>

										<div class="col-md-2">
											<div class="form-group" id="toastTypeGroup">
												<label>类型</label>
												<div class="radio">
													<label> <input type="radio" name="toasts"
														value="success" checked />成功
													</label>
												</div>
												<div class="radio">
													<label class="radio"> <input type="radio"
														name="toasts" value="info" />信息
													</label>
												</div>
												<div class="radio">
													<label class="radio"> <input type="radio"
														name="toasts" value="warning" />警告
													</label>
												</div>
												<div class="radio">
													<label class="radio"> <input type="radio"
														name="toasts" value="error" />错误
													</label>
												</div>
											</div>
											<div class="form-group" id="positionGroup">
												<label>位置</label>
												<div class="radio">
													<label> <input type="radio" name="positions"
														value="toast-top-right" checked />右上角
													</label>
												</div>
												<div class="radio">
													<label> <input type="radio" name="positions"
														value="toast-bottom-right" />右下角
													</label>
												</div>
												<div class="radio">
													<label> <input type="radio" name="positions"
														value="toast-bottom-left" />左下角
													</label>
												</div>
												<div class="radio">
													<label> <input type="radio" name="positions"
														value="toast-top-left" />左上角
													</label>
												</div>
												<div class="radio">
													<label> <input type="radio" name="positions"
														value="toast-top-full-width" />顶全宽
													</label>
												</div>
												<div class="radio">
													<label> <input type="radio" name="positions"
														value="toast-bottom-full-width" />底全宽
													</label>
												</div>
												<div class="radio">
													<label> <input type="radio" name="positions"
														value="toast-top-center" />顶中心
													</label>
												</div>
												<div class="radio">
													<label> <input type="radio" name="positions"
														value="toast-bottom-center" />低中心
													</label>
												</div>
											</div>
										</div>

										<div class="col-md-2">
											<div class="form-group">
												<label for="showEasing">缓慢显示</label> <input id="showEasing"
													type="text" placeholder="swing, linear"
													class="form-control" value="swing" />
											</div>
											<div class="form-group">

												<label for="hideEasing">缓慢隐藏</label> <input id="hideEasing"
													type="text" placeholder="swing, linear"
													class="form-control" value="linear" />
											</div>
											<div class="form-group">

												<label for="showMethod">显示方式</label> <input id="showMethod"
													type="text" placeholder="show, fadeIn, slideDown"
													class="form-control" value="fadeIn" />
											</div>
											<div class="form-group">

												<label for="hideMethod">隐藏方式</label> <input id="hideMethod"
													type="text" placeholder="hide, fadeOut, slideUp"
													class="form-control" value="fadeOut" />
											</div>
										</div>

										<div class="col-md-3">
											<div class="form-group">
												<label for="showDuration">显示持续时间</label> <input
													id="showDuration" type="text" placeholder="ms"
													class="form-control" value="400" />
											</div>
											<div class="form-group">
												<label for="hideDuration">隐藏持续时间</label> <input
													id="hideDuration" type="text" placeholder="ms"
													class="form-control" value="1000" />
											</div>
											<div class="form-group">
												<label for="timeOut">超时</label> <input id="timeOut"
													type="text" placeholder="ms" class="form-control"
													value="7000" />
											</div>
											<div class="form-group">
												<label for="extendedTimeOut">延长时间</label> <input
													id="extendedTimeOut" type="text" placeholder="ms"
													class="form-control" value="1000" />
											</div>
										</div>

									</div>

									<div class="row">
										<div class="col-lg-12">
											<button type="submit" class="btn btn-primary" id="showtoast">显示</button>
											<button type="button" class="btn btn-white" id="cleartoasts">隐藏</button>
											<button type="button" class="btn btn-white"
												id="clearlasttoast">清除</button>
											<button type="button" class="btn btn-white" id="showsimple">显示简单的选项</button>
										</div>
									</div>
								</form>
								<div class="row m-t-lg">
									<div class="col-lg-12">
										<small>JSON选项</small>
										<pre id="toastrOptions" class="p-m"></pre>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer">
				<div class="pull-right">
					10GB of <strong>250GB</strong> Free.
				</div>
				<div>
					<strong>Copyright</strong> 版权所有 &copy; 2014-2015
				</div>
			</div>

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
