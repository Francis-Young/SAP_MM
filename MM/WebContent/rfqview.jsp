<%@page import="mm.dao.*"%>
<%@page import="mm.bean.*,java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>查看RFQ</title>
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

<script>
function addRow(){
	
	var oTable = document.getElementById("oTable");
	var itemNo=oTable.rows.length+1;
	
	
	
	
	var s1="<input name='";
	

	var s4="'  type='text' class='form-control' /> ";
    
    var tBodies = oTable.tBodies;
    var tbody = tBodies[0];
    var tr = tbody.insertRow(tbody.rows.length);
    var td_1 = tr.insertCell(0);
    td_1.innerHTML = "<input type='checkbox' name='cbox'></td>";
    
    
    var td_2 = tr.insertCell(1);
    td_2.innerHTML = itemNo*10;
    
    var td_3 = tr.insertCell(2);
    td_3.innerHTML = "unCheck";
    var td_4 = tr.insertCell(3);
    td_4.innerHTML = s1+"material"+s4;
    var td_5 = tr.insertCell(4);
    td_5.innerHTML = "默认";
    var td_6 = tr.insertCell(5);
    td_6.innerHTML = s1+"quantity"+s4;
    var td_7 = tr.insertCell(6);
    td_7.innerHTML = "默认";
    var td_8 = tr.insertCell(7);
    td_8.innerHTML ="<div class='input-group date'> <span class='input-group-addon'>"+
	"<i class='fa fa-calendar'></i></span><input name='statdeliverydate"+
	"' type='text'  class='form-control'></div>";
	var td_9 = tr.insertCell(8);
    td_9.innerHTML ="<div class='input-group date'> <span class='input-group-addon'>"+
	"<i class='fa fa-calendar'></i></span><input name='deliverydate"+
	"' type='text'  class='form-control'></div>";
    var td_10 = tr.insertCell(9);
    td_10.innerHTML = s1+"price"+s4;

    var td_11 = tr.insertCell(10);
    td_11.innerHTML =oTable.getElementsByTagName("tr")[0].getElementsByTagName("td")[8].innerHTML;
    
    var td_12 = tr.insertCell(11);
    td_12.innerHTML = "默认";
    var td_13 = tr.insertCell(12);
    td_13.innerHTML =s1+"plant"+s4;
    var td_14 = tr.insertCell(13);
    td_14.innerHTML = s1+"storageloc"+s4;
    initDatePicker($(".input-group.date"));
    }

</script>

<script>
function splitRow(){	
	
	var oTable = document.getElementById("oTable");
	var itemNo=oTable.rows.length+1;
	var cheArr=document.getElementsByName("cbox");
	var si;
	for(var i=0;i<inputArr.length;i++)
	{
		if(inputArr[i].checked)
		{
			si=i;//要分开的那一行
			break;
		}
			
	}
	var tBodies = oTable.tBodies;
    var tbody = tBodies[0];
    var trnew = tbody.insertRow(tbody.rows.length);
    trnew.innerHTML = oTable.getElementsByTagName("tr")[itemNo-2];
	for(var i=itemNo-2;i>si+1;i--)
	{
		oTable.getElementsByTagName("tr")[i]=oTable.getElementsByTagName("tr")[i-1];	
	}
	oTable.getElementsByTagName("tr")[si+1]=oTable.getElementsByTagName("tr")[si];
	var quansplit1 =oTable.getElementsByTagName("tr")[si+1].getElementsByName("quantity")[0].value;
	oTable.getElementsByTagName("tr")[si+1].getElementsByName("quantity")[0].value=Math.ceil(quansplit1 /2);
	oTable.getElementsByTagName("tr")[si].getElementsByName("quantity")[0].value=quansplit1-Math.ceil(quansplit1 /2);

	initDatePicker($(".input-group.date"));
    }

</script>



<style type="text/css">
.table-b table td{border:2px solid #808080}
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
									<span class="clear"> <span class="block m-t-xs">
											<strong class="font-bold"><%=session.getAttribute("uname")%></strong>
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

						<li><a href="layouts.html"><i class="fa fa-diamond"></i>
								<span class="nav-label">供应商管理</span><span class="fa arrow"></span></a>
							<ul class="nav nav-second-level collapse">
								<li><a href="CreateVendor">创建供应商</a></li>
								<li><a href="SelectVendor?type=display">查询供应商</a></li>
								<li><a href="SelectVendor?type=update">维护供应商</a></li>
							</ul></li>

						<li class="active"><a href="#"><i
								class="fa fa-shopping-cart"></i><span class="nav-label">
									采购管理 </span><span class="fa arrow"></span></a>
							<ul class="nav nav-second-level collapse">
								<li class="active"><a href="#">请购单管理 <span
										class="fa arrow"></span></a>
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
					<h2>查看RFQ</h2>
					<ol class="breadcrumb">
						<li><a href="index.html">主页</a></li>
						<li>RFQ管理</li>
						<li class="active"><strong>查看RFQ</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>

	<form class="m-t" role="form" action="${pageContext.request.contextPath}/order" method="post">
						       <input type='text' value='save' name='action' hidden='true'>	<!-- 控制表单名 -->					
							<input type='text' id='num' value='0' name='num' hidden='true'>    <!-- 条目数量 -->	
							
			<div class="wrapper wrapper-content animated fadeIn">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">

							<div class="ibox-title">
								<h5>查看RFQ</h5>
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

<%

RFQ q = (RFQ) session.getAttribute("RFQ");


%>	

	<!-- 换行有问题 -->					
<div >									

<label class="col-sm-2 control-label" style="width:auto;margin-bottom:0;padding-top:7px">RFQ编号：:</label>
<div class="col-md-2">		
<input name="org" type="text" readonly="readonly"  class="form-control" value=<%= q.getRfq_num()%>>

</div>
</div>

<div >	
<label class="col-sm-2 control-label" style="width:auto;margin-bottom:0;padding-top:7px">采购组织:</label>
<div class="col-md-2">		<input name="gro" type="text"  class="form-control" value=<%= q.getRfq_purchasing_org()%>>
</div>
</div>
<div >	
<label class="col-sm-2 control-label" style="width:auto;margin-bottom:0;padding-top:7px">RFQ集合号:</label>
<div class="col-md-2">		<input name="ccd" type="text"  class="form-control" value=<%= q.getRfq_coll()%>>
</div>
</div>

<br>						
						




								

									<div class="row">
										<div class="col-lg-12">
										
											<button type="reset" class="btn btn-white"
												id="clearlasttoast">清除</button>
										</div>
									</div>
							<!-- tab -->	
								
		<div class="tabs-container">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true"> 送货时间表</a></li>
                            <li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">材料信息</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="tab-1" class="tab-pane active">
                                <div class="panel-body">
             <div style="width:950px;  overflow-x:scroll;">										
<div class="table-b">
<table id="oTable" style="background-color:#F5F5F5;" bordercolor="#aaaaaa" border="2" cellpadding="0" cellpadding="2" width="1200px">
<thead>
<tr>
<th><input type="checkbox" id="checkbox0"></th>
<th>条目</th>
<th>状态</th>
<th>材料编号</th>
<th>短文本</th>
<th>订购数量</th>
<th>基本单位</th>

<th>送货时间</th>

<th>物料组</th>
<th>工厂</th>
<th>运送地点</th>


</tr>
</thead>
<tbody>

<%

ArrayList<RFQ_item> qilist= RFQItemDao.findRFQItemByRfqCode(q.getRfq_code());
for(int i=0;i<qilist.size();i++)
{
	RFQ_item qi=qilist.get(i);
	Material m = MaterialDao.findMaterialbyNum(qi.getMaterial_num());
	String s1="<td><input name='";
	
	String s3="' value='";
	String s4="'  type='text' readonly='readonly' class='form-control' /> </td>";
	out.print("<tr>");
		out.print("<td>"+"<input type='checkbox' name='cbox'></td>");
		out.print("<td>"+(i*10+10)+"</td>");
		out.print("<td>"+1+"</td>");
		out.print(s1+"material"+s3+m.getMaterial_num()+s4);  //name:material id:m几
		out.print(s1+"shorttext"+s3+m.getMaterial_discr()+s4);
		out.print(s1+"quantity"+s3+qi.getRequisition_quantity()+s4);
		out.print(s1+"baseunit"+s3+m.getMaterial_baseunit()+s4);
		
		out.print("<td><div class='input-group date'> <span class='input-group-addon'>"+
		"<i class='fa fa-calendar'></i></span><input name='deliverydate"+i+
		"' type='text' readonly='readonly'  value='"+qi.getRequisition_deliverydate().toString()+"' class='form-control'></div></td>");
		
		out.print(s1+"materialgroup"+s3+m.getMaterial_group()+s4);
		out.print(s1+"plant"+s3+qi.getRequisition_plant()+s4);
		out.print(s1+"storageloc"+s3+qi.getRequisition_storageloc()+s4);
	out.print("</tr>");

}


%>

</tbody>
</table>
</div>
</div>
<br>



<!--  
<div style="width:950px;  overflow-x:scroll;">										
<div class="table-b">
<table id="oTable" style="background-color:#F5F5F5;" bordercolor="#aaaaaa" border="2" cellpadding="0" cellpadding="2" width="100%">
<thead>
<tr>

<th><input type="checkbox" id="checkbox0"></th>
<th>材料编号</th>

<th>订购数量</th>
<th>基本单位</th>
<th>送货时间</th>
<th>净价</th>
<th>货币单位</th>

<th>工厂</th>
<th>运送地点</th>


</tr>
</thead>
<tbody>

 
for(int i=0;i<qilist.size();i++)
{
	Quotation_item qi=qilist.get(i);
	Material m = MaterialDao.findMaterialbyNum(qi.getMaterial_num());
	String s1="<td><input name='";
	String s2="' id='";
	String s3="' value='";
	String s4="'  type='text' class='form-control' /> </td>";
	out.print("<tr>");
		out.print("<td>"+"<input type='checkbox' name='cbox'></td>");
		out.print("<td>"+(i*10+10)+"</td>");
		out.print(s1+"material"+s2+"m"+i+s3+m.getMaterial_num()+"readonly='readonly'"+s4);  //name:material id:m几
		out.print(s1+"quantity"+s2+"q"+i+s3+qi.getQuantity()+s4);
		out.print(s1+"baseunit"+s2+"bu"+i+s3+m.getMaterial_baseunit()+"readonly='readonly'"+s4);
		out.print("<div id='d"+i+"'class='input-group date'> <span class='input-group-addon'>"+
		"<i class='fa fa-calendar'></i></span><input name='deliverydate"+i+
		"' type='text' value='"+qi.getDelivery_date().toString()+"' class='form-control'></div>");
		out.print(s1+"price"+s2+"pr"+i+s3+qi.getPrice().toString()+"readonly='readonly'"+s4);
		out.print(s1+"currency"+s2+"c"+i+s3+qi.getCurrency_unit()+"readonly='readonly'"+s4);
		out.print(s1+"plant"+s2+"pl"+i+s3+rfq.getRfq_plant()+"readonly='readonly'"+s4);
		out.print(s1+"storageloc"+s2+"sl"+i+s3+qi.getStorageloc()+s4);
	out.print("</tr>");
}

</tbody>
</table>
<input type="button" onClick="splitRow();" style="font-size:16px;" value="+"/>
</div>
</div>
-->



                                </div>
                            </div>
                            <div id="tab-2" class="tab-pane">
                                <div class="panel-body">
                                         <% for(int i=0;i<qilist.size();i++)
               {
            		RFQ_item qi=qilist.get(i);
            		Material m = MaterialDao.findMaterialbyNum(qi.getMaterial_num());
                    out.print("<strong>"+m.getMaterial_num()+"<strong>");
                    out.print("<p>MRP类型:"+m.getMaterial_MRPtype()+"</p>");
                    out.print("<p>描述:"+m.getMaterial_discr()+"</p>");
                                    
               }              
              %>       
                            </div>
                        </div>


                    </div>						
								
								
				<!-- tab结束 -->					
								
								
								
								
								
								
								
								
								
								
								
								

							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="footer" style="position: fixed; bottom: 0;">
				<div class="pull-right">
					<div class="text-right">
					<a href="Home">	<button type="button" class="btn btn-white" id="cleartoasts">返回</button></a>
					</div>
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
