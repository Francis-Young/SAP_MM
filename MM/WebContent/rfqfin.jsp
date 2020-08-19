<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.List,mm.bean.*,mm.dao.*,java.util.ArrayList"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>创建RFQ</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet">

<!-- Toastr style -->
<link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">

<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

<!-- Sweet Alert -->
<link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

<script>
function selectline(ele)
{
	var clickContent = ele;         
    //获取要赋值的input的元素
    var inputElement =  document.getElementById("vendor");
    //给input框赋值
    inputElement.value = clickContent.cells[1].innerHTML;//.innerText;
    //选中input框的内容
   // inputElement.select();
     // 执行浏览器复制命令
   // document.execCommand("Copy");
    openwin3(0);
    openwin2(0);
	}


</script>

<script type="text/javascript">



function search()
{    
	var key1 =$("#key1").val();
	var key2 =$("#key2").val();
	var key3 =$("#key3").val();
	var key4 =$("#key4").val();
	var key5 =$("#key5").val();
	var key6 =$("#key6").val();
	var url="${pageContext.request.contextPath}/vendorSearchServlet?key1="+key1+"&key2="+key2+"&key3="+key3+"&key4="+key4+"&key5="+key5+"&key6="+key6
	
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
              url:"${pageContext.request.contextPath}/vendorSearchServlet",
              async:true, //默认-异步（true） 同步-false
              dataType:"text",
              
              data:{"key1":key1,"key2":key2,"key3":key3,"key4":key4,"key5":key5,"key6":key6},
              beforeSend: function (){
                  //ajax刷新前加载load动画
                  //showLoad();
              },
              success:function (dataArray) {
            	  
            	  var subnum = dataArray.match(/mark0(\S*?)mark1/g);
            	  var subnam = dataArray.match(/mark1(\S*?)mark2/g);
            	  var subtyp = dataArray.match(/mark2(\S*?)mark3/g);
            	  var subcod = dataArray.match(/mark3(\S*?)mark4/g);
            	  var subciy = dataArray.match(/mark4(\S*?)mark5/g);
            	 // alert(subtext[1]);
            	 // alert(decodeURI(subtext[1]))
            	 // alert(decodeURI(subdate))
            	  //decodeURI方法返回一个字符数组，所以如果要知道字符串的数量就要分组decode，否则组的每位只有一个字符
            	  $("tbody#tableBody").remove();//删除已有表格	
                  var tableBody = "<tbody id='tableBody'>";
 				  //alert(subnum.length);
                  for (var i = 0; i < subnum.length; i++) {
 					
                      tableBody += '<tr onclick="selectline(this)">';
 
                      tableBody += '<td><input type="checkbox" checked="" class="i-checks" name="input[]"></td>';
                      tableBody += "<td>"+gettext(decodeURI(subnum[i]))+"</td>";
                      tableBody += "<td>"+gettext(decodeURI(subnam[i]))+"</td>";
                      tableBody += "<td>"+gettext(decodeURI(subtyp[i]))+"</td>";
                      tableBody += "<td>"+gettext(decodeURI(subcod[i]))+"</td>";
                      tableBody += "<td>"+gettext(decodeURI(subciy[i]))+"</td>";
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
	height: 650px;
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

					<li class="active"><a href="#"><i
							class="fa fa-shopping-cart"></i><span class="nav-label">
								采购管理 </span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="#">请购单管理 <span class="fa arrow"></span></a>
								<ul class="nav nav-third-level">
									<li><a href="requisitionini.jsp">创建请购单 </a></li>
									<li><a href="requisitionleadview.jsp">查看请购单 </a></li>
								</ul></li>
							<li class="active"><a href="#">RFQ管理 <span
									class="fa arrow"></span></a>
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
					<h2>创建RFQ</h2>
					<ol class="breadcrumb">
						<li><a href="Home">主页</a></li>
						<li>RFQ管理</li>
						<li class="active"><strong>创建RFQ</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>

			<form class="m-t" role="form"
				action="${pageContext.request.contextPath}/rfq" method="post">
				<input type='text' value='save' name='action' hidden='true'>

				<div class="wrapper wrapper-content animated fadeIn">
					<div class="row">
						<div class="col-lg-12">
							<div class="ibox float-e-margins">

								<div class="ibox-title">
									<h5>创建RFQ</h5>
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
								<%
									RFQ rfq = (RFQ) session.getAttribute("passdata");
									String type = rfq.getRfq_type();
									String group = rfq.getRfq_purchasing_group();
									String organ = rfq.getRfq_purchasing_org();
									String rfqdate = rfq.getRfq_date().toString();
									String lan = rfq.getRfq_language();
									String plant = rfq.getRfq_plant();
								%>
								<div class="ibox-content">

									<div class="row">

										<div class="col-md-4">
											<!--RFQ具体信息 -->
											<div class="form-group">
												<label for="title">RFQ种类</label> <input id="vname"
													name="rfq_type" readonly="readonly" type="text"
													class="form-control" value=<%=type%>>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="message">使用语言</label> <input readonly="readonly"
													class="form-control" id="vaddress" type="text"
													name="language" value=<%=lan%>></input>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label for="message">RFQ日期</label> <input
													readonly="readonly" class="form-control" id="vaddress"
													type="text" name="date" value=<%=rfqdate%>></input>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="message">报价截止日期</label> <input
													class="form-control" id="vaddress" type="text"
													readonly='readonly' name="quoddin" value=<%=rfqdate%>></input>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-2">
											<div class="form-group">
												<label for="showEasing">运送工厂</label> <input name="plant"
													id="showEasing" type="text" value=<%=plant%>
													readonly='readonly' class="form-control" />
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<label for="showEasing">供应商</label> <input name="vendor"
													id="vendor" type="text" class="form-control" /> <a
													onclick="openwin2(1)"><i class="fa fa-search-plus"></i></a>
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">

												<label for="showEasing">RFQ集合号</label> <input name="coll"
													type="text" class="form-control" />
											</div>
										</div>
									</div>
									<div class="hr-line-dashed"></div>
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label for="showMethod">采购组织</label> <input id="showMethod"
													name="org" type="text" value=<%=organ%> readonly="readonly"
													class="form-control" />
											</div>
										</div>
										<div class="col-md-4">


											<div class="form-group">
												<label for="showMethod">采购小组</label> <input id="showMethod"
													name="group" type="text" value=<%=group%>
													readonly="readonly" class="form-control" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="footer" style="position: fixed; bottom: 0; z-index: 1;">
					<div class="pull-right">
						<div class="text-right">
							<input type="submit" class="btn btn-primary btn-sm demo2"
								id="showtoast" value="保存"> <a
								href="${pageContext.request.contextPath}/Home"><button
									type="button" class="btn btn-white" id="cleartoasts">取消</button></a>
						</div>
					</div>
					<div style="padding-top: 2px;">

						<p>
							<font size="3" color="#1ab394"> <%
 	if (request.getAttribute("rfq_code") != null) {
 		out.print("成功创建RFQ：" + request.getAttribute("rfq_code").toString());
 		session.setAttribute("rfqnum", request.getAttribute("rfq_code").toString());
 	}
 %>
							</font>
						</p>

					</div>
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
	</div>









	<!-- 第二层弹窗 -->
	<div id="inputbox2" class="opbox2">

		<a class='x' href='' ; onclick="openwin2(0); return false;">关闭</a>
		<p>查找供应商： 输入任意已知信息</p>
		<div class="ibox-content" style="padding: 5px 5px 5px 5px;">
			<div>
				<div>
					<!--请购单具体信息 -->
					<div class="form-group">
						<label for="title">供应商名称</label> <input id="key1" type="text"
							class="form-control" placeholder="输入请购单种类...">
					</div>

					<div class="form-group">
						<label for="message">类型</label> <input id="key2"
							class="form-control" id="vaddress" type="text"
							placeholder="输入使用语言...">
					</div>

					<div class="form-group">
						<label for="message">公司代码</label> <input id="key3"
							class="form-control" id="vaddress" type="text"
							placeholder="输入请购单日期 ...">
					</div>

					<div class="form-group">
						<label for="message">国家</label> <input id="key4"
							class="form-control" id="key2" type="text"
							placeholder="输入请购描述...">
					</div>


					<div class="form-group">
						<label for="showMethod">城市</label> <input id="key5" type="text"
							placeholder="输入请购组织" class="form-control">
					</div>

					<div class="form-group">
						<label for="showMethod">联络员</label> <input id="key6" type="text"
							placeholder="输入请购小组" class="form-control">
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
					<th></th>
					<th>供应商代码</th>
					<th>名称</th>
					<th>类型</th>
					<th>公司代码</th>
					<th>城市</th>
				</tr>
			</thead>


			<tbody id="tableBody">


			</tbody>
		</table>
	</div>

	<script src="js/jquery-2.1.1.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

	<!-- Custom and plugin javascript -->
	<script src="js/inspinia.js"></script>
	<script src="js/plugins/pace/pace.min.js"></script>

	<!-- Toastr script -->
	<script src="js/plugins/toastr/toastr.min.js"></script>
	<!-- Sweet alert -->
	<script src="js/plugins/sweetalert/sweetalert.min.js"></script>

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
