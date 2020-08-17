<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>

<%@ page import="mm.utils.DBUtil"%>
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

    <title>发票</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
<style media="print" type="text/css">
    @page {
      size: auto;  /* auto is the initial value */
      margin: 0mm; /* this affects the margin in the printer settings */
    }
     .noprint{visibility:hidden}  
     .print:last-child{
     page-break-after:auto;
     }
     body{
     height:99%;
     }
</style>
</head>

<body onload="test()">

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
        <div class="noprint">
            <div class="row wrapper border-bottom white-bg page-heading" >
                <div class="col-lg-8">
                    <h2>发票</h2>
            
                </div>
                <div class="col-lg-4">
                    <div class="title-action">
                      
                        <a href=javascript:printpage()  class="btn btn-primary"><i class="fa fa-print"></i> 打印发票 </a>
                    </div>
                </div>
            </div>
            </div>
            <div class="print">
        <div class="row" id="real_invoice" >
            <div class="col-lg-12">
                <div class="wrapper wrapper-content animated fadeInRight">
                    <div class="ibox-content p-xl">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h5>来自:</h5>
                                    <address>
                                        <strong>Inspinia, Inc.</strong><br>
                                        106 Jorg Avenu, 600/10<br>
                                        Chicago, VT 32456<br>
                                        <abbr title="Phone">P:</abbr> (123) 601-4590
                                    </address>
                                </div>

                                <div class="col-sm-6 text-right">
                                    <h4 class="text-navy">
                                   <%
                                    String s="";
                                    s=request.getParameter("text");
                                    String keyWord1 =java.net.URLDecoder.decode(s,"UTF-8");//使用java.net.URLDecoder.decode()进行编码                                  
                                    out.print(keyWord1);
                                    %>
                                    </h4>
                                    <span>到:</span>
                                    <address id="v_address">
                                       
                                    </address>
                                    <p>
                                        <span><strong>发票日期:</strong><%out.print(request.getParameter("date")); %></span><br/>
                                    </p>
                                </div>
                            </div>
					 <div style="position: fixed;left: 50%;top: 50%;z-index: 1000;"id="showResult" ></div>  

                            <div class="table-responsive m-t">
                                <table class="table invoice-table" id="myTable" name="myTable">
                               
                                    <tbody>
                                  
                                    </tbody>
                                </table>
                            </div><!-- /table-responsive -->

                            <table class="table invoice-total" >
                                <tbody>

                                <tr>
                                    <td><strong>总费用 :</strong></td>
                                    <td><%out.print(request.getParameter("amount")); %>
                                    <p id="currency"></p></td>
                                </tr>
                                </tbody>
                            </table>
                           

           
                        </div>
                </div>
            </div>
        </div>
        </div>
        <div class="noprint">
        <div class="footer" id="warning" style="font-size:20px">
        
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
  <script type="text/javascript">
  function test_true(){  

  	var text =getQueryVariable("id"); ;
      var reg = new RegExp("^[0-9]*$"); 
  	if (reg.test(text)&&text!=""){     	
  		var results = '';
  	 var html="<tbody>"
    		
    		$("#showResult").html("<img src=\"css/plugins/blueimp/img/loading.gif\" />");
    	var defer = $.Deferred(results);
    	 $.ajax({
    	            
    	                type : 'POST',
    	                url : 'PaymentTable',
    	               data:{
    	                  id:text,
    	               },
    	               dataType : 'json',
    	                success : function(result,backData) {
    	                	results=result;
    	                   defer.resolve(result)

    	                },
    	                error : function(result) {
    	                    alert("无此订单");
      	                	var bottom = document.getElementById("warning");

        	                  bottom.style.color = "#ed5565";
        	                  bottom.innerText="无此订单";
    	       			$("#showResult").html("");
    	   			$("#myTable").html("");


    	            }
    	            });}
  	else{
  		alert("订单号不规范，请重新输入");
  		var bottom = document.getElementById("warning");

        bottom.style.color = "#ed5565";
        bottom.innerText="订单号不规范，请重新输入";
			$("#showResult").html("");

  	}


    	return defer.promise();

   	}
function test(){
      $.when(test_true()).done(function(result,backData){
      	var count = "";
			var info = JSON.stringify(result);
			var data = eval('(' + info + ')');
			if(data.length==0){
				alert("无此订单");
				var bottom = document.getElementById("warning");

                bottom.style.color = "#ed5565";
                bottom.innerText="无此订单";
  			$("#showResult").html("");
			var html0="  <thead> <tr><th>物料编号</th>  <th>数量</th><th>价格</th><th>到达时间</th></tr></thead><tbody>;"
	   			$("#myTable").html(html0);

				
			}
			else{
				var html0="  <thead> <tr><th>物料编号</th>  <th>数量</th><th>价格</th><th>到达时间</th></tr></thead><tbody>;"
					var v_n=result[0].vendor_name;
					var v_p=result[0].vendor_postalcode;
					var v_c=result[0].vendor_city;
					var v_s=result[0].vendor_street;
					var v_cu=result[0].vendor_currency;

					for(var i=0;i<data.length;i++){
					var id=result[i].material_num;
					var amount=result[i].quantity;
					var price=result[i].price;
					var date=result[i].delivery_date;

		 			var html1="<tr><td>啊1</td><td>啊2</td><td>啊3</td><td>啊4</td></tr>"
		        	
		        	html1=html1.replace(/啊1/,id);
		        	html1=html1.replace(/啊2/,amount);
		        	html1=html1.replace(/啊3/,price);
		        	html1=html1.replace(/啊4/,date);

					html0+=html1;
					
					

			}
      	html0+="</tbody>";
			$("#myTable").html(html0);
			$("#showResult").html("");
			var v1="    <strong>啊1</strong><br>啊2<br>啊3,啊4<br>";
		  	v1=v1.replace(/啊1/,v_n);
        	v1=v1.replace(/啊2/,v_s);
        	v1=v1.replace(/啊3/,v_c);
        	v1=v1.replace(/啊4/,v_p);
			
			document.getElementById('v_address').innerHTML = v1;
			document.getElementById('currency').innerHTML = v_cu;

			
			}
       });       
      
}
function getQueryVariable(variable)
{
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
        var pair = vars[i].split("=");
        if(pair[0] == variable){return pair[1];}
    }
    return(false);
}

function printpage()
{	var saveit=window.document.body.innerHTML;
	var printData = document.getElementById("real_invoice").innerHTML;
	window.document.body.innerHTML = printData; 
    window.print();
    window.document.body.innerHTML=saveit;
    }

</script>

</body>

</html>
