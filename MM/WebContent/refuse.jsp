<%@page import="mm.dao.*"%>
<%@page import="mm.bean.*,java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>报价单管理</title>
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
					<li><a href="Home"><i class="fa fa-home"></i> <span class="nav-label">主页</span></a></li>
					<li><a href="layouts.html"><i class="fa fa-diamond"></i> <span class="nav-label">供应商管理</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="CreateVendor">创建供应商</a></li>
							<li><a href="SelectVendor?type=display">查询供应商</a></li>
							<li><a href="SelectVendor?type=update">维护供应商</a></li>
						</ul></li>
						
						
						
						<li class="active">
                      <a href="#"><i class="fa fa-shopping-cart"></i><span class="nav-label">采购管理 </span><span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level collapse in" style="">
                          <li class="">
                              <a href="#">请购单管理 <span class="fa arrow"></span></a>
                              <ul class="nav nav-third-level collapse" style="height: 0px;">
                                  <li>
                                      <a href="requisitionini.jsp">创建请购单 </a>
                                  </li>
                                  <li>
                                      <li><a href="requisitionleadview.jsp">查看请购单 </a></li>
                                
                              

                              </ul>
                          </li>
                           <li class="">
                              <a href="#">RFQ管理 <span class="fa arrow"></span></a>
                              <ul class="nav nav-third-level collapse" style="height: 0px;">
                                  <li>
                                     <a href="rfqini.jsp">创建RFQ </a>
                                  </li>
                                  <li>
                                     <a href="rfqleadview.jsp">查看RFQ </a>
                                  </li>
                            

                              </ul>
                          </li> <li class="">
                              <a href="#">报价单管理 <span class="fa arrow"></span></a>
                              <ul class="nav nav-third-level collapse" style="height: 0px;">
                                  <li>
                                      <a href="quotationini.jsp">维护报价单 </a>
                                  </li>
                                  <li>
                                      <a href="quotationcompare.jsp">比对报价单 </a>
                                  </li>

                              </ul>
                          </li> <li class="">
                              <a href="#">订单管理 <span class="fa arrow"></span></a>
                              <ul class="nav nav-third-level collapse" style="height: 0px;">
							<li><a href="orderini.jsp">创建订单 </a></li>
							<li><a href="orderleadview.jsp">查看订单 </a></li>
							<li><a href="orderleadchange.jsp">维护订单 </a></li>

                              </ul>
                          </li>
                      </ul>
                  </li>
                  
		

					<li><a href="#"><i class="fa fa-files-o"></i> <span class="nav-label">收货管理</span><span class="fa arrow"></span></a>
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
					<h2>维护报价单</h2>
					<ol class="breadcrumb">
						<li><a href="index.html">主页</a></li>
						<li>报价单管理</li>
						<li class="active"><strong>维护报价单</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>

	<form class="m-t" role="form" action="${pageContext.request.contextPath}/quotation" method="post">
						       <input type='text' value='reject' name='action' hidden='true'>	<!-- 控制表单名 -->					
							<input type='text' id='num' value='0' name='num' hidden='true'>    <!-- 条目数量 -->	
							
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
									<a class="close-link" hidden="hidden"> <i class="fa fa-times"></i>
									</a>
								</div>
							</div>

							<div class="ibox-content">

<%

String quonum=request.getAttribute("quonum").toString();

Quotation qo=QuotationDao.findQuotationByCode(quonum);
session.setAttribute("refuse", qo);
RFQ rfq=RFQDao.findRFQbyCode(quonum);

String vnum=rfq.getVendor_code();
Vendor vd=VendorDao.findVendorbyCode(vnum);



%>	

	<!-- 换行有问题 -->					
<div >									

<label class="col-sm-2 control-label" style="width:auto;margin-bottom:0;padding-top:7px">RFQ:</label>
<div class="col-md-2">		
<input name="org" type="text"  class="form-control" readonly="readonly" value=<%= rfq.getRfq_code()%>>

</div>
</div>

<div >	
<label class="col-sm-2 control-label" style="width:auto;margin-bottom:0;padding-top:7px">RFQ类型:</label>
<div class="col-md-2">		<input name="gro" type="text"  readonly="readonly" class="form-control" value=<%= rfq.getRfq_type()%>>
</div>
</div>

<div >	
<label class="col-sm-2 control-label" style="width:auto;margin-bottom:0;padding-top:7px">RFQ日期:</label>
<div class="col-md-2">		<input name="ccd" type="text"  readonly="readonly" class="form-control" value=<%= rfq.getRfq_date().toString()%>>
</div>
</div>

<div >	
<label class="col-sm-2 control-label" style="width:auto;margin-bottom:0;padding-top:7px">供应商:</label>
<div class="col-md-2">		<input name="ccd" type="text"   readonly="readonly" class="form-control" value=<%= vd.getVcode() %>><span><%= vd.getVname()%></span>
</div>
</div>

<div >	
<label class="col-sm-2 control-label" style="width:auto;margin-bottom:0;padding-top:7px">报价单截止日期:</label>
<div class="col-md-2">		<input name="ccd" type="text"  readonly="readonly" class="form-control" value=<%= rfq.getRfq_deadline()%>>
</div>
</div>


<br>						
						




								

									<div class="row">
										<div class="col-lg-12">
										
											<button type="button" class="btn btn-white"
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
<table id="oTable" style="background-color:#F5F5F5;" bordercolor="#aaaaaa" border="2" cellpadding="0" cellpadding="2" width="100%">
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
<th>净价</th>
<th>货币单位</th>
<th>物料组</th>
<th>工厂</th>
<th>运送地点</th>


</tr>
</thead>
<tbody>

<%

ArrayList<Quotation_item> qilist= QuotationItemDao.findQuotationByQuoCode(quonum);

for(int i=0;i<qilist.size();i++)
{
	Quotation_item qi=qilist.get(i);
	Material m = MaterialDao.findMaterialbyNum(qi.getMaterial_num());
	String s1="<td><input name='";
	
	String s3="' readonly='readonly' value='";
	String s4="'  type='text' class='form-control' /> </td>";
	out.print("<tr>");
		out.print("<td>"+"<input type='checkbox' name='cbox'></td>");
		out.print("<td>"+(i*10+10)+"</td>");
		out.print("<td>"+qo.getStatus()+"</td>");
		out.print(s1+"material"+s3+m.getMaterial_num()+s4);  //name:material id:m几
		out.print(s1+"shorttext"+s3+m.getMaterial_shorttext()+s4);
		out.print(s1+"quantity"+s3+qi.getQuantity()+s4);
		out.print(s1+"baseunit"+s3+m.getMaterial_baseunit()+s4);
		out.print("<div class='input-group date'> <span class='input-group-addon'>"+
		"<i class='fa fa-calendar'></i></span><input name='statdeliverydate"+i+
		"' type='text' value='"+qi.getDelivery_date().toString()+"' class='form-control'></div>");
		out.print("<div class='input-group date'> <span class='input-group-addon'>"+
		"<i class='fa fa-calendar'></i></span><input name='deliverydate"+i+
		"' type='text' value='"+qi.getDelivery_date().toString()+"' class='form-control'></div>");
		
		out.print(s1+"price"+s3+qi.getPrice().toString()+s4);
		out.print(s1+"currency"+s3+qi.getCurrency_unit()+s4);
		out.print(s1+"materialgroup"+s3+m.getMaterial_group()+s4);
		out.print(s1+"plant"+s3+rfq.getRfq_plant()+s4);
		out.print(s1+"storageloc"+s3+qi.getStorageloc()+s4);
	out.print("</tr>");
	out.print("<script>");
	out.print("initDatePicker($('.input-group.date'));");
	out.print("</script>");
}


%>

</tbody>
</table>
<input type="submit" class="btn btn-info  dim"  style="font-size:16px;" value="否决"/>
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
                                    <strong>Donec quam felis</strong>

                                    <p>千未知的植物注意到我：当我听到在茎的小世界的嗡嗡声，和熟悉的昆虫无数难以形容的形式
                                        然后，我感觉到全能者的存在，他在自己的形象中形成了我们，并且呼吸</p>

                                    <p>I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite
                                        sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet.</p>
                                </div>
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
						<input type="submit"  value="保存" class="btn btn-success btn-sm demo2" id="showtoast">
						<button type="button" class="btn btn-white" id="cleartoasts"><a href="Home.jsp">返回</a></button>
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
