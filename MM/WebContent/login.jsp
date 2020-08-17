<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>MM | 登录</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">

<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet">
</head>

<body class="gray-bg">
	<div class="row">
		<div class="col-lg-12">
			<div class="middle-box text-center loginscreen animated fadeInDown">
				<div>
					<div>
						<h1 class="logo-name">MM</h1>
					</div>
					<h3>欢迎登陆 物料管理系统！</h3>
					<%
						String error = (String) request.getAttribute("error");
						if (error != null && !"".equals(error)) {
					%>
					<p style="color: red"><%=error%></p>
					<%
						}
					%>
					<p>和传统的昨天告别，向规范的未来迈进</p>
					<form class="m-t" role="form" action="Login" method="post">
						<div class="form-group">
							<input name="unum" type="text" class="form-control"
								placeholder="用户ID" required="">
						</div>
						<div class="form-group">
							<input name="ucode" type="password" class="form-control"
								placeholder="密码" required="">
						</div>
						<button type="submit" class="btn btn-primary block full-width m-b">登录</button>

						<p class="text-muted text-center">
							<small>没有账号?</small>
						</p>
						<a class="btn btn-sm btn-white btn-block" href="Register">创建账号</a>
					</form>

				</div>
			</div>
		</div>
	</div>

	<!-- Mainly scripts -->
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

	<!-- Custom and plugin javascript -->
	<script src="js/inspinia.js"></script>
	<script src="js/plugins/pace/pace.min.js"></script>


</body>

</html>