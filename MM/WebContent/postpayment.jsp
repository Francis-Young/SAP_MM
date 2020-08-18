<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="mm.utils.DBUtil"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page trimDirectiveWhitespaces="true" %>

<html>
 <%
 if((!session.getAttribute("unum").toString().startsWith("0101")) && !( session.getAttribute("unum").toString().startsWith("0000")))

       {
             String path = request.getContextPath();
             String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/"; 
     		response.setCharacterEncoding("utf-8");
    		response.setContentType("text/html;charset=UTF-8");
             request.getRequestDispatcher("/403.html").forward(request, response);
 			response.setContentType("text/html;charset=UTF-8");
 			 out.clear();
 			   out = pageContext.pushBody();
       }
 

  %> 
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>付款</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="css/plugins/summernote/summernote-bs3.css" rel="stylesheet">

    <link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

<style> //对正常页面和弹出框分层，后面的层唤出时将会覆盖在前面的层上
#wrapper //正常页面层
{
     z-index: 98;
   position: absolute;
}
.opbox1{  
    z-index: 105;
    width:70%; margin-top:5%; margin:auto; padding:28px;
    top:5%; left:15%;
    height:500px; border:1px #111 solid;
    display:none;          

position: absolute;
background:white;
}
.opbox1.show{display:block;} 
.opbox1 .x{ font-size:18px; text-align:right; display:block;}
.opbox2{ 
    z-index: 106;
    width:60%; margin-top:5%; margin:auto; padding:28px;
    top:5%; left:20%;
    height:650px; border:1px #111 solid;
    display:none;            /* 默认对话框隐藏 */

position: absolute;
background:white;
}
.opbox2.show{display:block;} 
.opbox2 .x{ font-size:18px; text-align:right; display:block;}
.opbox3{
    z-index: 110;
    width:40%; margin-top:5%; margin:auto; padding:28px;
    top:5%; left:30%;
    height:650px; border:1px #111 solid;
    display:none;            /* 默认对话框隐藏 */

position: absolute;
background:white;
}
.opbox3.show{display:block;} 
.opbox3 .x{ font-size:18px; text-align:right; display:block;}

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

		<div id="page-wrapper" class="gray-bg dashbard-1">
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
                <h2>付款</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="index.html">首页</a>
                    </li>
                    <li>
                        <a>收货管理</a>
                    </li>
                    <li class="active">
                        <strong>付款</strong>
                    </li>
                </ol>
            </div>
        </div>
  
        <div id='inputbox' class="opbox1"> 
        <a class='x' href=''onclick="openwin1_id(0); return false;">关闭</a> 
     <fieldset class="form-horizontal">
                                         <div class="form-group"><label class="col-sm-2 control-label">到货日期:</label>
                                           <div class="input-group date">
                                         		 <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="" id="w_time" name="w_time">
                                          </div>
                                          
                                          </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">付款日期:</label>
                                           <div class="input-group date">
                                         		 <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="" id="w_time1" name="w_time1">
                                          </div>
                                          
                                          </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">供应商编号： </label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="请输入供应商编号 ，如100000" id="w_num" name="w_num"></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">供应商名称：</label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="请输入供应商名称，支持模糊查询" id="w_name" name="w_name"></div>
                                            </div>
											<div class="form-group"><label class="col-sm-2 control-label">材料编号：</label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="请输入物料编号，如有多个请用英语逗号隔开" id="w_text" name="w_text"></div>
                                            </div>     
                                            <div class="form-group"><label class="col-sm-2 control-label">付款用户：</label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="请输入付款用户名称，支持模糊查询"" id="w_text1" name="w_text1"></div>
                                            </div>  
                                            <div class="form-group"><label class="col-sm-2 control-label">发票名称：</label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="请输入发票名称，支持模糊查询" id="w_text2" name="w_text2"></div>
                                            </div>                                      
                                                                         <button class="btn btn-primary" onclick="test_forwindow()" type="button">查询</button>                  

                                        </fieldset>
      			 
                                            
				
        </div>
                <div id='inputbox2' class="opbox2"> 
        <a class='x' href=''onclick="openwin2_id(0); return false;">关闭</a> 
                                <table class="table table-hover" id="tb1"></table>
    
				
        </div>
        			<div style="position: fixed;left: 50%;top: 50%;z-index: 1000;"id="showResult" ></div>  
 <form action="PostPayment" method="post" onsubmit="return validate();">
        
        <div class="wrapper wrapper-content animated fadeInRight ecommerce">

            <div class="row">
                <div class="col-lg-12">
  				<div class="form-group"><label class="col-sm-2 control-label">订单编号：<a href="javascript:openwin1_id(1)"> 前往查询 </a> </label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="请输入订单编号，如100000" id="o_num_new" name="o_num_new"></div>
                                            </div>
                    <br>     
                             <button class="btn btn-primary pull-right" onclick="getit()" type="button"> 查询</button>                  
					
                    <div class="tabs-container" id="p_detail" name="p_detail" style="display:none">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#tab-1">支付信息</a></li>
                                <li class=""><a data-toggle="tab" href="#tab-2" onclick=reset()> 付款</a></li>
                            </ul>
                            <div class="tab-content" >
                                <div id="tab-1" class="tab-pane active">
                                    <div class="panel-body">

                                        <fieldset class="form-horizontal">
                                          <div class="form-group"><label class="col-sm-2 control-label">支付账户：</label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="请输入发票名称，如100000" id="o_account" name="o_account"></div>
                                            </div>           
                                          <div class="form-group"><label class="col-sm-2 control-label">支付日期: </label>
                                           <div class="input-group date">
                                         		 <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="08/01/2020" id="p_time_new" name="p_time_new">
                                          </div>
                                          </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">价格： </label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="请输入两位小数，如160.00" id="o_price_new" name="o_price_new"></div>
                                            </div>
											<div class="form-group"><label class="col-sm-2 control-label">发票名称：</label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="请输入发票名称，如100000" id="o_text_new" name="o_text_new"></div>
                                            </div>             
                                                                 

                                        </fieldset>

                                    </div>
                                </div>
                         
                                <div id="tab-2" class="tab-pane">
                                    <div class="panel-body">

                                        <div class="table-responsive" >
                                        <div class="form-group"><label class="col-sm-2 control-label">未分配数额：</label>
                                                <div class="col-sm-10"><input type="text" class="form-control" readonly="readonly" placeholder="请输入发票名称，如100000" id="o_sum" name="o_sum"></div>
                                            </div> 
                                            <br><br><br>
                                            <table class="table table-stripped table-bordered" id="myTable" name="myTable" >

                                          
                                            </table>
                                        </div>

                                    </div>
                                </div>

                            </div>
                                                       <button class="btn btn-primary pull-right"> 确认</button>                  
                            
                    </div>
                                     
                </div>
            </div>

        </div>
                    </form>
  
        <div class="footer" id="warning" style="font-size:20px">
          
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

<!-- SUMMERNOTE -->
<script src="js/plugins/summernote/summernote.min.js"></script>

<!-- Data picker -->
<script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>

<script>
function validate(){  
    var reg = new RegExp("^[0-9]*$"); 
    var reg2= new RegExp("^[0-9]+\.[0-9]{0,2}$");  
    var obj4 = document.getElementById("o_num_new");  
    var obj8 = document.getElementById("o_sum");  
    var obj1 = document.getElementById("o_account"); 
    var obj2 = document.getElementById("o_price_new");  
    var bottom = document.getElementById("warning");

 if(!reg.test(obj4.value)){  
     alert("订单编号未输入数字！"); 

     bottom.style.color = "#ed5565";
     bottom.innerText="订单编号未输入数字！";
     return false;
 }  
 else if(obj8.value!=0){
     alert("分配未完成"); 

     bottom.style.color = "#ed5565";
     bottom.innerText="分配未完成";
     return false;
 }
 else if(!reg2.test(obj2.value)){  
     alert("价格必须输入两位数字！");  

     bottom.style.color = "#ed5565";
     bottom.innerText="价格必须输入两位数字！";
     return false;
 }      

 else if(!reg.test(obj1.value)){  
     alert("付款账号未输入数字！");
     bottom.style.color = "#ed5565";
     bottom.innerText="付款账号未输入数字！";
     return false;
 }

 else if(obj1.value==""){  
     alert("付款账号未输入数字！");
     bottom.style.color = "#ed5565";
     bottom.innerText="付款账号未输入数字！";
     return false;
 }

 
 else{
 	return true;
 }
}  
function validate_input(){  
    var reg = new RegExp("^[0-9]*$"); 
	var reg2 = new RegExp("^[0-9,]*$"); 
    var obj1 = document.getElementById("w_num"); 
    var obj2 = document.getElementById("w_text");  

 if(!reg.test(obj1.value)){  
     alert("供应商编号请输入数字！"); 

     return false;
 }  
 else if(!reg2.test(obj2.value)){
     alert("材料编号只能输入数字，用英语逗号隔开，请重新输入"); 
     return false;
 }
 else{
 	return true;
 }
}     
$(document).ready(function(){

        $('.summernote').summernote();

        $('.input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true
        });

    });
    function test_true(){  

    	var utext = document.getElementById("o_num_new");
    	var text = utext.value;
        var reg = new RegExp("^[0-9]*$"); 
    	if (reg.test(text)&&text!=""){     	
    		var results = '';
    	 var html="<tbody>"
      		
      		$("#showResult").html("<img src=\"css/plugins/blueimp/img/loading.gif\" />");
      	var defer = $.Deferred(results);
      	 $.ajax({
      	            
      	                type : 'POST',
      	                url : 'UpdatePayment',
      	               data:{
      	                  id:text,
      	               },
      	               dataType : 'json',
      	                success : function(result,backData) {
      	                	results=result;
      	                   defer.resolve(result)

      	                },
      	                error : function(result) {
      	                    alert("无此发票");
      	                  var bottom = document.getElementById("warning");
      	                bottom.style.color = "#ed5565";
    	                  bottom.innerText="无此发票";
      	       			$("#showResult").html("");
      	   			$("#myTable").html("");


      	            }
      	            });}
    	else{
    		alert("发票号不规范，请重新输入");
              var bottom = document.getElementById("warning");
                bottom.style.color = "#ed5565";
                bottom.innerText="发票号不规范，请重新输入";
    	}


      	return defer.promise();

     	}
  function getit(){
        $.when(test_true()).done(function(result,backData){
        	var count = "";
			var info = JSON.stringify(result);
			var data = eval('(' + info + ')');
			if(data.length==0){
				alert("无此发票");
                  var bottom = document.getElementById("warning");
	                bottom.style.color = "#ed5565";
	                  bottom.innerText="无此发票";
    			$("#showResult").html("");
    			var html0=" <thead> <tr><th>材料</th><th>价格</th><th>数量</th><th>分配</th></tr></thead><tbody></tbody>;"
 	   			$("#myTable").html(html0);

				
			}
			else if(result[0].Paid_Status==1){
				alert("该订单已支付");
                  var bottom = document.getElementById("warning");
	                bottom.style.color = "#ed5565";
	                  bottom.innerText="该订单已支付";
    			$("#showResult").html("");
    			var html0=" <thead> <tr><th>材料</th>  <th>价格</th><th>数量</th><th>分配</th></tr></thead><tbody></tbody>;"
 	   			$("#myTable").html(html0);
			}
			else{
				var id=result[0].Pay_id;

				var bottom = document.getElementById("warning");
                bottom.style.color = "#1ab394";
                var to_write="查找成功，正在支付发票id："+id;
                  bottom.innerText=to_write;
			var html0=" <thead> <tr><th>材料</th>  <th>价格</th><th>数量</th><th>分配</th></tr></thead><tbody>;"
			var v1=result[0].Amount;
			var v2=result[0].Invoice_Text;
			var v3=result[0].Pay_Time;
			for(var i=0;i<data.length;i++){
			var id=result[i].material_num;
			var amount=result[i].quantity;
			var price=result[i].price;

 			var html1="<tr><td>啊1</td><td>啊2</td><td>啊3</td><td><a href=\"javascript:assign(index)\">分配</a></td></tr>"
        	
        	html1=html1.replace(/啊1/,id);
        	html1=html1.replace(/啊3/,amount);
        	html1=html1.replace(/啊2/,price);
        	html1=html1.replace(/index/,i+1);

			html0+=html1;

			}
        	html0+="</tbody>";
			$("#myTable").html(html0);
			$("#showResult").html("");
			document.getElementById('o_price_new').value = v1;
			document.getElementById('o_text_new').value = v2;
			document.getElementById('p_time_new').value = v3;
			document.getElementById('o_sum').value = v1;
	        document.getElementById('p_detail').style.display = "";

			}
         });  
}
function assign(a){

    var mytable = document.getElementById("myTable").rows[a].cells[1].innerHTML;
	var t=document.getElementById('o_sum').value;
	mytable=mytable*-1;
	var c=numAdd(mytable,t);
	var html="<a href=\"javascript:noassign(index)\">撤销分配</a>";
	html=html.replace(/index/,a);
  	document.getElementById("myTable").rows[a].cells[3].innerHTML=html;

	document.getElementById('o_sum').value=c;

}
   
function noassign(a){

    var mytable = document.getElementById("myTable").rows[a].cells[1].innerHTML;
	var t=document.getElementById('o_sum').value;
	var c=numAdd(mytable,t);
	var html="<a href=\"javascript:assign(index)\">分配</a>";
	html=html.replace(/index/,a);
  	document.getElementById("myTable").rows[a].cells[3].innerHTML=html;

	document.getElementById('o_sum').value=c;

}
   
function reset()
{
	document.getElementById('o_sum').value=document.getElementById('o_price_new').value;
	var n=document.getElementById("myTable").rows.length;
	for(i=1;i<n;i++){
		var html="<a href=\"javascript:assign(index)\">分配</a>";
		html=html.replace(/index/,i);

	document.getElementById("myTable").rows[i].cells[3].innerHTML=html;
	}
}
function numAdd(num1, num2) {

    var baseNum, baseNum1, baseNum2;

    try {

        baseNum1 = num1.toString().split(".")[1].length;

    } catch (e) {

        baseNum1 = 0;

    }

    try {

        baseNum2 = num2.toString().split(".")[1].length;

    } catch (e) {

        baseNum2 = 0;

    }

    baseNum = Math.pow(10, Math.max(baseNum1, baseNum2));

    return (num1 * baseNum + num2 * baseNum) / baseNum;
}
function openwin1_id(n){
    document.getElementById('inputbox').style.display=n?'block':'none';  
}
function openwin2_id(n){
    document.getElementById('inputbox2').style.display=n?'block':'none';  
}
function test_true_window(){  

	var time = document.getElementById("w_time").value;
	var num = document.getElementById("w_num").value;
	var name = document.getElementById("w_name").value;
	var text = document.getElementById("w_text").value;
	var time1 = document.getElementById("w_time1").value;
	var text1 = document.getElementById("w_text1").value;
	var text2 = document.getElementById("w_text2").value;


    var right=validate_input();
	if (right){     	
		var results = '';
	 var html="<tbody>"

			$("#tb1").html("");

	 $("#showResult").html("<img src=\"css/plugins/blueimp/img/loading.gif\" />");
  	var defer = $.Deferred(results);
  	 $.ajax({
  	            
  	                type : 'GET',
  	                url : 'UpdatePayment',
  	               data:{
  	            	  time:time,
  	            	  num:num,
  	            	  name:name,
  	                  text:text,
  	                  time1:time1,
  	                  text1:text1,
  	                  text2:text2,
  	               },
  	               dataType : 'json',
  	                success : function(result,backData) {
  	                	results=result;
  	                   defer.resolve(result)

  	                },
  	                error : function(result) {
  	                    alert("无此发票");
    	                  var bottom = document.getElementById("warning");
        	                bottom.style.color = "#ed5565";
      	                  bottom.innerText="无此发票";
  	       			$("#showResult").html("");
  	   			$("#tb1").html("");


  	            }
  	            });}
	else{
		$("#showResult").html("");
 		$("#myTable").html("");       
	}


  	return defer.promise();

 	}
function test_forwindow(){

    $.when(test_true_window()).done(function(result,backData){
    	openwin2_id(1);

    	var count = "";
		var info = JSON.stringify(result);
		var data = eval('(' + info + ')');
		if(data.length==0){
			alert("无此发票");
              var bottom = document.getElementById("warning");
                bottom.style.color = "#ed5565";
                bottom.innerText="无此发票";
			$("#showResult").html("");
			
	    	openwin2_id(0);

			
		}
		else{
		var html0=" <thead> <tr><th>支付号</th><th>支付日期</th><th>供应商</th><th>支付者</th><th>发票名</th><th>材料</th></tr></thead><tbody>;"
		var v=result[0].Vendor_id;

		for(var i=0;i<data.length;i++){
		var id=result[i].Pay_id;
		var amount=result[i].Pay_Time;
		var user=result[i].vendor_name;
		var usr=result[i].Pay_User;
		var inv=result[i].Invoice_Text;
		var mar=result[i].material_num;

			var html1="<tr onclick=\"selectline(this)\"><td>啊1</td><td>啊2</td><td>啊3</td><td>啊4</td><td>啊5</td><td>啊6</td></tr>"
    	
    	html1=html1.replace(/啊1/,id);
    	html1=html1.replace(/啊2/,amount);
    	html1=html1.replace(/啊3/,user);
    	html1=html1.replace(/啊4/,usr);
    	html1=html1.replace(/啊5/,inv);
    	html1=html1.replace(/啊6/,mar);

		html0+=html1;

		}
    	html0+="</tbody>";
    	
		$("#tb1").html(html0);
 		$("#showResult").html("");

	     var oTab = document.getElementById('tb1');
         var oldColor = '';//用于保存原来一行的颜色
         for(var i = 0; i<oTab.tBodies[0].rows.length; i++){
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
function selectline(ele)  //单击后赋值的函数
{
   var clickContent = ele;         
  //获取要赋值的input的元素
  var inputElement =  document.getElementById("o_num_new");
  //给input框赋值
  inputElement.value = clickContent.cells[0].innerHTML;//.innerText;

  openwin2_id(0);           //关掉两个弹窗
  openwin1_id(0);
}



</script>

</body>

</html>
