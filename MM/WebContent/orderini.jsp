<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>创建订单</title>

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



function search()
{    
	var key = $("#key1").val()+","+ $("#key2").val()+","+ $("#key3").val()+","+ $("#key4").val()+","+ $("#key5").val()
	var url="${pageContext.request.contextPath}/rfqsearchServlet?key="+key
	
	function gettext(text)
	{
		var subt = text.match(/mark.(\S*?)mark./);
		return subt[1];
	}
	function getdate(text)
	{
		var subt = text.match(/mark.(\S*?)mark./);
		return subt[1];
	}

    

     $.ajax({
              type:"post",
              url:"${pageContext.request.contextPath}/searchServlet",
              async:true, //默认-异步（true） 同步-false
              dataType:"text",
              
              data:{"key":key},
              beforeSend: function (){
                  //ajax刷新前加载load动画
                  //showLoad();
              },
              success:function (dataArray) {
            	  
            	  var subnum = dataArray.match(/mark0(\S*?)mark1/g);
            	  var subpla = dataArray.match(/mark1(\S*?)mark2/g);
            	  var subcol = dataArray.match(/mark2(\S*?)mark3/g);
            	  var subvdr = dataArray.match(/mark3(\S*?)mark4/g);
            	  var subddl = dataArray.match(/mark4(\S*?)mark5/g);
            	 // alert(subtext[1]);
            	 // alert(decodeURI(subtext[1]))
            	 // alert(decodeURI(subdate))
            	  //decodeURI方法返回一个字符数组，所以如果要知道字符串的数量就要分组decode，否则组的每位只有一个字符
            	  $("tbody#tableBody").remove();//删除已有表格	
                  var tableBody = "<tbody id='tableBody'>";
 				  //alert(subnum.length);
                  for (var i = 0; i < subnum.length; i++) {
 					
                      tableBody += '<tr onclick="selectline(this)">';
 
                      tableBody += "<td>"+gettext(decodeURI(subnum[i]))+"</td>";
                      tableBody += "<td>"+gettext(decodeURI(subpla[i]))+"</td>";
                      tableBody += "<td>"+gettext(decodeURI(subcol[i]))+"</td>";
                      tableBody += "<td>"+gettext(decodeURI(subvdr[i]))+"</td>";
                      tableBody += "<td>"+gettext(decodeURI(subddl[i]))+"</td>";

                      tableBody += "</tr>";
                  }
 
                  tableBody += "</tBody>";
 
                  
                  $("#tableHead").after(tableBody);
 
              },
              error:function (e,textStatus,request) {
                  //隐藏load动画
                  hiddenLoad();
                  alert("错误！"+e.status);
                  var json=JSON.parse(request.responseText);  
                  alert(json.city); 
                  alert(request.responseText)
                  alert(" parser error"+textStatus); // parser error;
              },
              complete:function () {

                 
                  //表格隔行显色，鼠标悬浮高亮显示
                  var oTab = document.getElementById('tbl');
                  var oldColor = '';//用于保存原来一行的颜色
 
                  for(var i = 0; oTab.tBodies[0].rows.length; i++){
 
                      //当鼠标移上去，改变字体色-背景色
                      oTab.tBodies[0].rows[i].onmouseover = function () {
                          oldColor = this.style.background;
                          this.style.background = "#009B63";
                          this.style.color = "#ffffff";
                      };
 
                      //当鼠标移开，恢复原来的颜色
                      oTab.tBodies[0].rows[i].onmouseout = function () {
                          this.style.background = oldColor;
                          this.style.color = "#000000";
                      };
 
                      //隔行显色
                      if(i%2){
                          oTab.tBodies[0].rows[i].style.background = "#EAF2D3";
                      }
                      else{
                          oTab.tBodies[0].rows[i].style.background = "";
                      }
                  }
              }
          });
    
}
</script>
<script>
function open_and_search()
{
	openwin3(1);
	search();
	}
</script>
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
							<li><a href="#">报价单管理 <span class="fa arrow"></span></a>
								<ul class="nav nav-third-level">
									<li><a href="quotationini.jsp">维护报价单 </a></li>
									<li><a href="quotationcompare.jsp">比对报价单 </a></li>

								</ul></li>
							<li class="active"><a href="#">订单管理 <span
									class="fa arrow"></span></a>
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
					<h2>创建订单</h2>
					<ol class="breadcrumb">
						<li><a href="Home">主页</a></li>
						<li>订单管理</li>
						<li class="active"><strong>创建订单</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>

			<form class="m-t" role="form"
				action="${pageContext.request.contextPath}/order" method="post">
				<input type='text' value='get_quotation' name='action' hidden='true'>

				<div class="wrapper wrapper-content animated fadeIn">
					<div class="row">
						<div class="col-lg-12">
							<div class="ibox float-e-margins">

								<div class="ibox-title">
									<h5>创建订单</h5>
									<div class="ibox-tools">
										<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
										</a> <a class="dropdown-toggle" data-toggle="dropdown" href="#">
											<i class="fa fa-wrench"></i>
										</a>
										<ul class="dropdown-menu dropdown-user">
											<li><a href="#">配置 1</a></li>
											<li><a href="#">配置 2</a></li>
										</ul>

									</div>
								</div>

								<div class="ibox-content">


									<div class="row">

										<div class="form-group">
											<label class="col-sm-2 control-label">材料编号：</label>
											<div class="col-sm-2">
												<input name="material_num" id="rfqid" class="form-control">
											</div>
											<div class="infont col-md-3 col-sm-4" style="Float: left">
												<a onclick="openwin2(1)"><i class="fa fa-search-plus"></i></a>
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
						<div class="text-right">
							<input type="submit" class="btn btn-primary " value="执行">
							<a href="${pageContext.request.contextPath}/Home"><button
									type="button" class="btn btn-white" id="cleartoasts">返回</button></a>
						</div>
					</div>
					<div style="padding-top: 2px;">

						<p>
							<font size="3" color="#1ab394"> <%
 	if (request.getAttribute("order_code") != null) {
 		out.print("成功创建订单：" + request.getAttribute("order_code").toString());
 		session.setAttribute("onum", request.getAttribute("order_code"));
 	}
 %>
							</font>
						</p>

					</div>
				</div>

				<!-- 第一层弹窗 -->
				<div id='inputbox' class="opbox1">

					<a class='x' href='' ; onclick="openwin(0); return false;">关闭</a>

					<div class="ibox-content">

						<div class="form-group">

							<label class="col-sm-2 control-label"
								style="width: 13%; padding: 1px;">请购单</label>
							<div class="col-sm-10" style="width: 87%; padding: 1px;">
								<input name="requisition_num" id="reqnum" type="text"
									class="form-control" style="width: 80%">
								<div class="infont col-md-3 col-sm-4" style="Float: right">
									<a onclick="openwin2(1)"><i class="fa fa-search-plus"></i></a>
								</div>
							</div>

							<label class="col-sm-2 control-label"
								style="width: 13%; padding: 1px;">工厂</label>
							<div class="col-sm-10" style="width: 87%; padding: 1px;">
								<input name="plant2" type="text" class="form-control"
									style="width: 80%">
								<div class="infont col-md-3 col-sm-4" style="Float: right">
									<a onclick="#"><i class="fa fa-search-plus"></i></a>
								</div>
							</div>

							<button type="button" class="btn btn-primary "
								style="margin: 60px 20px 0 0; Float: right"
								onclick="openwin(0); return false;">取消</button>
							<input type="submit" class="btn btn-primary "
								style="margin: 60px 20px 0 0; Float: right" value="继续">

						</div>

						<input type="button" value="确定">

					</div>
				</div>
			</form>
		</div>


		<script>
			initDatePicker($(".input-group.date"));
			
			</script>

	</div>







	<!-- Mainly scripts for pop windows-->
	<script>  
        function openwin(n){
            document.getElementById('inputbox').style.display=n?'block':'none';     /* 点击按钮打开/关闭 对话框 */
        }
     </script>
	<script>  
        function openwin2(n){
            document.getElementById('inputbox2').style.display=n?'block':'none';     /* 点击按钮打开/关闭 对话框 */
        }
     </script>
	<script>  
        function openwin3(n){
            document.getElementById('inputbox3').style.display=n?'block':'none';     /* 点击按钮打开/关闭 对话框 */
        }
     </script>



	<!-- 第二层弹窗 -->
	<div id="inputbox2" class="opbox2">

		<a class='x' href='' ; onclick="openwin2(0); return false;">关闭</a>
		<p>查找物料： 输入任意已知信息</p>
		<div class="ibox-content" style="padding: 5px 5px 5px 5px;">
			<div>
				<div>
					<!--RFQ具体信息 -->
					<div class="form-group">
						<label for="title">描述</label> <input id="key1" type="text"
							class="form-control">
					</div>

					<div class="form-group">
						<label for="message">基本单位</label> <input class="form-control"
							id="key2" type="text">
					</div>

					<div class="form-group">
						<label for="message">MRP类型</label> <input class="form-control"
							id="key3" type="text">
					</div>

					<div class="form-group">
						<label for="message">产品组</label> <input class="form-control"
							id="key4" type="text">
					</div>



				</div>
				<div class="row">
					<div class="col-lg-12">
						<button type="button" class="btn btn-primary" id="showsimple"
							onclick=open_and_search()>搜索</button>
					</div>

				</div>

			</div>

		</div>
	</div>
	<!-- 第三层弹窗 -->
	<div id="inputbox3" class="opbox3">

		<a class='x' href='' ; onclick="openwin3(0); return false;">关闭</a>
		<table id="tbl" class="table table-striped">

			<thead id="tableHead">
				<tr>
					<th>RFQ编号</th>
					<th>工厂</th>
					<th>RFQ集合号</th>


					<th>供应商</th>
					<th>截止日期</th>
				</tr>
			</thead>


			<tbody id="tableBody">


			</tbody>
		</table>
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
	<!-- float window -->


</body>

</html>
