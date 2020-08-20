<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="mm.utils.DBUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList"%>
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

    <title>查询应付账款</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">


    <link href="css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="css/plugins/summernote/summernote-bs3.css" rel="stylesheet">

    <link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <!-- FooTable -->
    <link href="css/plugins/footable/footable.core.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

<style>

.fa fa-calendar{
z-index:10000;

}
</style>

</head>

<body onload=makeit()>

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

					<li><a href="#"><i class="fa fa-shopping-cart"></i><span
							class="nav-label"> 采购管理 </span><span class="fa arrow"></span></a>
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
            <div class="row wrapper border-bottom white-bg page-heading" style="z-index:-100">
                <div class="col-lg-10">
                    <h2>查询应付账款</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="index.html">首页</a>
                        </li>
                        <li>
                            <a>收货管理</a>
                        </li>
                        <li class="active">
                            <strong>应付账款查询</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>

        <div class="wrapper wrapper-content animated fadeInRight ecommerce">


            <div class="ibox-content m-b-sm border-bottom" style="height:250px">
                <div class="row">
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="price">供应商编号</label>
                            <input type="text"  value="" placeholder="具体编号" class="form-control" id="v_nu" name="v_nu">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="price">供应商名称</label>
                            <input type="text"  value="" placeholder="可模糊查询" class="form-control" id="v_na" name="v_na">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="quantity">支付用户</label>
                            <input type="text" value="" placeholder="可模糊查询" class="form-control" id="usr" name="usr">
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                        <label class="control-label">到货日期: </label>
                                           <div class="input-group date" style="width:250px">
                                         		 <span class="input-group-addon" ><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="" id="dd" name="dd">
                                          </div>
                    </div>
                                    </div>
                                           <div class="form-group" style="display:inline-block">
                            <label class="control-label" for="status">账户</label>
                            <select name="status" id="status" class="form-control">
                              
                            </select>
                        </div>
                                    </div>
                                      <div class="row">
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="price">支付编号</label>
                            <input type="text"  value="" placeholder="具体支付编号" class="form-control" id="pid" name="pid">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="price">材料</label>
                            <input type="text" value="" placeholder="请用,隔开各材料" class="form-control" id="mtr" name="mtr">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="quantity">发票名称</label>
                            <input type="text" value="" placeholder="可模糊查询" class="form-control" id="text2" name="text2">
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                        <label class="control-label">支付日期: </label>
                                           <div class="input-group date" style="width:250px">
                                         		 <span class="input-group-addon" ><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="" id="pt" name="pt">
                                          </div>
                    </div>
                        </div>
                               
                        
                     <div class="col-sm-11" >
                              <div>     <button class="btn btn-primary pull-right" onclick="takeit()" type="button"> 查询</button>  </div>  
                   
                    </div>
                    
                                    </div>
                    

            </div>
					 <div style="position: fixed;left: 50%;top: 50%;z-index: 1000;"id="showResult" ></div>  

            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox-content m-b-sm border-bottom" id="whitebox" style="display:none">

                            <table class="footable table table-stripped toggle-arrow-tiny" data-page-size="15" id="myTable" name="myTable">

                            </table>
						<div id="export_excel"> </div>
                    </div>
                </div>
            </div>


        </div>
        <div class="footer" id="warning" style="font-size:20px">
        </div>

        </div>
        </div>



    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="js/xlsx.core.min.js"></script>
    <script src="js/forexcel.js"></script>
    <script src="js/bootstrap-table.js"></script>
    <script src="js/bootstrap-table-zh-CN.js"></script>
    

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>

    <!-- FooTable -->
    <script src="js/plugins/footable/footable.all.min.js"></script>
<script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>

    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function() {

            $('.footable').footable();
            $('.input-group.date').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: true,
                autoclose: true,
                orientation:'top',
                });

        });
        function excel(){
            var table1 = document.querySelector("#myTable");
            var sheet = XLSX.utils.table_to_sheet(table1);//将一个table对象转换成一个sheet对象
            openDownloadDialog(sheet2blob(sheet),'下载.xlsx');

        }
        function test_true(){  

        	var time = document.getElementById("dd").value;
        	var num = document.getElementById("v_nu").value;
        	var name = document.getElementById("v_na").value;
        	var text = document.getElementById("mtr").value;
        	var time1 = document.getElementById("pt").value;
        	var text1 = document.getElementById("usr").value;
        	var text2 = document.getElementById("text2").value;
        	var pid = document.getElementById("pid").value;
        	var acc = document.getElementById("status").value;
        	var reg = new RegExp("^[0-9]*$"); 
        	var reg2 = new RegExp("^[0-9,]*$"); 

        	if (reg.test(num)&&reg.test(pid)){     	
        		var results = '';
        	 var html="<tbody>"
          		
          		$("#showResult").html("<img src=\"css/plugins/blueimp/img/loading.gif\" />");
          	var defer = $.Deferred(results);
          	 $.ajax({
          	            
          	                type : 'POST',
          	                url : 'SearchPayment',
          	               data:{
          	            	 time:time,
         	            	  num:num,
         	            	  name:name,
         	                  text:text,
         	                  time1:time1,
         	                  text1:text1,
         	                  text2:text2,
         	                  pid:pid,
         	                  acc:acc,
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
        		alert("供应商/支付编号只能输入数字，请重新输入");
        		var bottom = document.getElementById("warning");

                  bottom.style.color = "#ed5565";
                  bottom.innerText="供应商/支付编号只能输入数字，请重新输入";
        	}


          	return defer.promise();

         	}
      function takeit(){
            $.when(test_true()).done(function(result,backData){
            	$("#myTable").bootstrapTable('destroy');
            	var count = "";
    			var info = JSON.stringify(result);
    			var data = eval('(' + info + ')');
    			if(data.length==0){
    				alert("无此发票");
    				var bottom = document.getElementById("warning");

                    bottom.style.color = "#ed5565";
                    bottom.innerText="无此发票";

        			$("#showResult").html("");
        			var html0=" <thead> <tr><th>支付号</th><th>支付日期</th><th>供应商</th><th>支付者</th><th>发票名</th><th>材料</th><th>价格</th><th>数量</th></tr></thead><tbody>;"
     	   			$("#myTable").html(html0);

        		
    			}
    			else{
    			var html0=" <thead> <tr><th>支付号</th><th>支付日期</th><th>供应商</th><th>支付者</th><th>发票名</th><th>材料</th><th>价格</th><th>数量</th></tr></thead><tbody>;"
    			var v1=result[0].Amount;
    			var v2=result[0].Invoice_Text;
    			var v3=result[0].Pay_Time;
    			for(var i=0;i<data.length;i++){
    				var id=result[i].Pay_id;
    				var amount=result[i].Pay_Time;
    				var user=result[i].vendor_name;
    				var usr=result[i].Pay_User;
    				var inv=result[i].Invoice_Text;
    				var mar=result[i].material_num;
    				var pr=result[i].price;
    				var qr=result[i].quantity;


     			var forexcel="<a href=javascript:excel()>导出excel</a>";
            	
     			var html1="<tr><td>啊1</td><td>啊2</td><td>啊3</td><td>啊4</td><td>啊5</td><td>啊6</td><td>啊7</td><td>啊8</td></tr>"
     		    	
     		    	html1=html1.replace(/啊1/,id);
     		    	html1=html1.replace(/啊2/,amount);
     		    	html1=html1.replace(/啊3/,user);
     		    	html1=html1.replace(/啊4/,usr);
     		    	html1=html1.replace(/啊5/,inv);
     		    	html1=html1.replace(/啊6/,mar);
     		    	html1=html1.replace(/啊7/,pr);
     		    	html1=html1.replace(/啊8/,qr);


    			html0+=html1;

    			}
    		    document.getElementById('whitebox').style.display='';  

            	html0+="</tbody>";
    			$("#myTable").html(html0);
    			$("#showResult").html("");
    			$("#export_excel").html(forexcel);

    			$("#myTable").bootstrapTable({
    		        pagination: true,   //是否显示分页条
    		        pageSize: 10,   //一页显示的行数
    		        paginationLoop: false,   //是否开启分页条无限循环，最后一页时点击下一页是否转到第一页
    		    });
    			$("#myTable").bootstrapTable('hideLoading');
    			

    			}
             });  
            
    }
      function test_true1(){  

      
      	if (1){     	
      		var results = '';
      	 var html="<tbody>"
        		
        		$("#showResult").html("<img src=\"css/plugins/blueimp/img/loading.gif\" />");
        	var defer = $.Deferred(results);
        	 $.ajax({
        	            
        	                type : 'GET',
        	                url : 'SearchPayment',
        	               dataType : 'json',
        	                success : function(result,backData) {
        	                	results=result;
        	                   defer.resolve(result)

        	                },
        	                error : function(result) {
        	       			$("#showResult").html("");
        	   			$("#myTable").html("");


        	            }
        	            });}
      	else{
      	}


        	return defer.promise();

       	}
    function makeit(){
          $.when(test_true1()).done(function(result,backData){
          	var count = "";
  			var info = JSON.stringify(result);
  			var data = eval('(' + info + ')');
  			if(data.length==0){
      			$("#showResult").html("");
       			var html0="";
   	   			$("#status").html(html0);

      		alert("目前无支付记录");
        	var bottom = document.getElementById("warning");

            bottom.style.color = "#ed5565";
            bottom.innerText="目前无支付记录";

  			}
  			else{
  	   		var html0="<option value=\'all\'>不限账户</option>";

  			for(var i=0;i<data.length;i++){
  			var id=result[i].Pay_Account;

   			var html1="<option value=\"啊1\">啊2</option>";

          	
          	html1=html1.replace(/啊1/,id);
          	html1=html1.replace(/啊2/,id);
          	

  			html0+=html1;

  			}
  			$("#status").html(html0);
  			$("#showResult").html("");
            $('div input').val('');

  			}
           });  
          
  }
    </script>

</body>

</html>
