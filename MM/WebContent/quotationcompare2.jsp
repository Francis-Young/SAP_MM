<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.List,mm.bean.*,mm.dao.*,java.util.ArrayList,java.math.BigDecimal,java.text.DecimalFormat"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>维护报价单</title>

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
    var inputElement =  document.getElementById("rfqid");
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
<style type="text/css">
.table-b table td {
	border: 2px solid #808080
}

.table-b p {
	margin: 5px
}
</style>
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
	height: 550px;
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
							<li><a href="#">RFQ管理 <span class="fa arrow"></span></a>
								<ul class="nav nav-third-level ">
									<li><a href="rfqini.jsp">创建RFQ </a></li>
									<li><a href="rfqleadview.jsp">查看RFQ </a></li>
								</ul></li>
							<li class="active"><a href="#">报价单管理 <span
									class="fa arrow"></span></a>
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
					<h2>报价单比较</h2>
					<ol class="breadcrumb">
						<li><a href="Home">主页</a></li>
						<li>报价单管理</li>
						<li class="active"><strong>报价单比较</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>

			<form class="m-t" role="form" action="/QoatationController"
				method="post">
				<input type='text' value='bounce_to_compare' name='action'
					hidden='true'>

				<div class="wrapper wrapper-content animated fadeIn">
					<div class="row">
						<div class="col-lg-12">
							<div class="ibox float-e-margins">

								<div class="ibox-title">
									<h5>报价单比较</h5>
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
										<div class="table-b">
											<table border="2">
												<tbody>


													<%
														String coll = (String) session.getAttribute("coll");
														RFQ rfq = new RFQ();
														rfq.setRfq_coll(coll);
														ArrayList<RFQ> rfqlist = RFQDao.findrfqByAnything(rfq);
														ArrayList<Quotation> quolist = new ArrayList<Quotation>();
														@SuppressWarnings("unchecked")
														ArrayList<Material> matlist = (ArrayList<Material>) session.getAttribute("matli");
														for (int i = 0; i < rfqlist.size(); i++) {
															String num = rfqlist.get(i).getRfq_code();
															System.out.print("num" + num);
															if (QuotationDao.isqoCodeExist(num)) {
																Quotation quo = QuotationDao.findQuotationByCode(num);
																quolist.add(quo);
															}

														}

														out.print("<tr>");
														out.print("<td>");
														out.print("<p style='background:#A2C3EA'>材料</p>");
														out.print("<p style='background:#A2C3EA'>标记</p>");
														out.print("<p style='background:#A2C3EA'>基本单位数量</p>");
														out.print("</td>");
														out.print("<td>");
														out.print("<p style='background:#A6E5F4'>报价单：</p>");
														out.print("<p style='background:#A6E5F4'>投标者：</p>");
														out.print("<p style='background:#A6E5F4'>RFQ集合号：</p>");
														out.print("</td>");
														for (int i = 0; i < quolist.size(); i++) {
															out.print("<td>");

															out.print("<a style='background:#C5EAEE;text-decoration:none' href='refuse.jsp?quonum="
																	+ quolist.get(i).getQuotation_code() + " '>" + quolist.get(i).getQuotation_code() + "</a>");
															out.print("<p style='background:#C5EAEE'>" + quolist.get(i).getVendor_code() + "</p>");
															out.print("<p style='background:#C5EAEE'>" + coll + "</p>");
															out.print("</td>");
														}
														out.print("</tr>");

														for (int i = 0; i < matlist.size(); i++) {

															out.print("<tr>");
															out.print("<td>");
															out.print("<p style='background:#CCE3E3'>" + matlist.get(i).getMaterial_num() + "</p>");
															out.print("<p style='background:#CCE3E3'>" + matlist.get(i).getMaterial_discr() + "</p>");
															out.print("<p style='background:#CCE3E3' align='right'>" + "200  EA" + "</p>");
															out.print("</td>");
															out.print("<td>");
															out.print("<p style='background:#CCE3E3'>总价值</p>");
															out.print("<p style='background:#CCE3E3'>价格</p>");
															out.print("<p style='background:#CCE3E3'>比率</p>");
															out.print("</td>");
															int availquos = 0;//记录有几个报价单是有此材料的；
															BigDecimal ans = new BigDecimal("0");//某报价单关于某材料的总价值
															ArrayList<BigDecimal> prices = new ArrayList<BigDecimal>();//某报价单关于某材料的总价值
															for (int j = 0; j < quolist.size(); j++) {
																Quotation qo = quolist.get(j);
																BigDecimal sumval = new BigDecimal("0");//某报价单关于某材料的总价值
																int quantity = 0;
																ArrayList<Quotation_item> quoitlist = QuotationItemDao
																		.findQuotationByQuoCode(qo.getQuotation_code());
																for (int k = 0; k < quoitlist.size(); k++) {
																	Quotation_item qit = quoitlist.get(k);
																	if (qit.getMaterial_num().equals(matlist.get(i).getMaterial_num()))//若是此项材料
																	{
																		quantity += qit.getQuantity();
																		BigDecimal bigdem_quantity = new BigDecimal(qit.getQuantity());
																		System.out.println("qitcode" + qit.getQuotation_code());
																		System.out.println("price" + qit.getPrice());
																		BigDecimal this_itemval = qit.getPrice().multiply(bigdem_quantity);//这一项的价值
																		sumval = sumval.add(this_itemval);
																	}
																}
																if (quantity != 0) {
																	availquos++;
																	BigDecimal average_price = sumval.divide(new BigDecimal(quantity), 7, BigDecimal.ROUND_HALF_UP);//在这一项quotation内的均价
																	ans = ans.add(average_price);
																	prices.add(average_price);
																}

															}
															BigDecimal gross_average_price = ans.divide(new BigDecimal(availquos), 7, BigDecimal.ROUND_HALF_UP);//所有报价单关于某材料的均价

															for (int j = 0; j < quolist.size(); j++) {
																Quotation qo = quolist.get(j);
																BigDecimal sumval = new BigDecimal("0");//某报价单关于某材料的总价值
																int quantity = 0;
																ArrayList<Quotation_item> quoitlist = QuotationItemDao
																		.findQuotationByQuoCode(qo.getQuotation_code());
																for (int k = 0; k < quoitlist.size(); k++) {
																	Quotation_item qit = quoitlist.get(k);
																	if (qit.getMaterial_num().equals(matlist.get(i).getMaterial_num()))//若是此项材料
																	{
																		quantity += qit.getQuantity();
																		BigDecimal bigdem_quantity = new BigDecimal(qit.getQuantity());
																		BigDecimal this_itemval = qit.getPrice().multiply(bigdem_quantity);//这一项的价值
																		sumval = sumval.add(this_itemval);
																	}
																}
																System.out.print("dfdff");
																String val = "不含有此材料";
																String price = "";
																String rate = "";
																String rank = "";
																if (quantity != 0) {
																	DecimalFormat df1 = new DecimalFormat("###,###.000");//格式化金额
																	val = df1.format(sumval);
																	BigDecimal average_price = sumval.divide(new BigDecimal(quantity), 7, BigDecimal.ROUND_HALF_UP);
																	price = df1.format(average_price);
																	BigDecimal derate = average_price.divide(gross_average_price, 7, BigDecimal.ROUND_HALF_UP);
																	DecimalFormat df = new DecimalFormat("0.00%");//格式化百分比
																	int rank1 = 1;
																	for (int z = 0; z < prices.size(); z++) {
																		if (average_price.compareTo(prices.get(z)) > 0)
																			rank1++;
																	}
																	rate = df.format(derate);
																	if (rank1 == 1)//根据排名，底色不同
																		rank = "#94D88F;'>" + rank1;
																	else
																		rank = "#A2C3EA;'>" + rank1;
																}
																out.print("<td>");
																out.print("<p style='background:white' align='right'>" + val + "</p>");
																out.print("<p style='background:white' align='right'>" + price + "</p>");
																out.print("<p style='background:white' align='right'><span style='background-color:" + rank
																		+ "&nbsp;&nbsp;</span> " + rate + "</p>");
																out.print("</td>");
															}
															out.print("</tr>");
														}
														out.print("<tr>");//最后一行
														out.print("<td>");
														out.print("<p style='background:#FFF843'>总览</p>");
														out.print("<p style='background:#FFF843'>&nbsp</p>");
														out.print("</td>");
														out.print("<td>");
														out.print("<p style='background:#FFF843'>总价</p>");
														out.print("<p style='background:#FFF843'>排行：</p>");
														out.print("</td>");
														BigDecimal ans1 = new BigDecimal(0);
														for (int i = 0; i < quolist.size(); i++) {
															ans1 = ans1.add(quolist.get(i).getValue());
														}
														System.out.println("ans" + ans1);
														System.out.println("quolist.size()" + quolist.size());
														BigDecimal average_val = ans1.divide(new BigDecimal(quolist.size()), 7, BigDecimal.ROUND_HALF_UP);
														for (int i = 0; i < quolist.size(); i++) {
															Quotation quo = quolist.get(i);
															int rank1 = 1;
															for (int j = 0; j < quolist.size(); j++) {
																if (quo.getValue().compareTo(quolist.get(j).getValue()) > 0)//计算排名
																	++rank1;
															}
															DecimalFormat df1 = new DecimalFormat("###,###.000");//格式化金额
															String val = df1.format(quo.getValue());
															DecimalFormat df2 = new DecimalFormat("0.00%");
															System.out.println("quv" + quo.getValue());
															BigDecimal derate = quo.getValue().divide(average_val, 7, BigDecimal.ROUND_HALF_UP);
															System.out.println(average_val);

															String rate = df2.format(derate);
															System.out.println("v" + rate);
															String rank;
															if (rank1 == 1)//根据排名，底色不同
																rank = "#94D88F;'>" + rank1;
															else
																rank = "#A2C3EA;'>" + rank1;
															out.print("<td>");
															out.print("<p style='background:#FFF843' align='right'>" + val + "</p>");
															out.print("<p style='background:#FFF843' align='right'><span style='background-color:" + rank
																	+ "&nbsp;&nbsp;</span> " + rate + "</p>");
															out.print("</td>");
														}
														out.print("</tr>");
													%>
												</tbody>
											</table>
											<!--RFQ具体信息 -->
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>


				<div class="footer">
					<div class="pull-right">
						<a href="${pageContext.request.contextPath}/Home"><button
								type="button" class="btn btn-white" id="cleartoasts">返回</button></a>
					</div>
					<div style="padding-top: 2px;">

						<p>
							<font size="3" color="#1ab394"> <%
 	if (request.getAttribute("quonum") != null) {
 		out.print("报价单已维护：" + request.getAttribute("quonum").toString());
 		session.setAttribute("quonum", request.getAttribute("quonum").toString());
 	}
 %>
							</font>
						</p>

					</div>
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


	<!-- 第二层弹窗 -->
	<div id="inputbox2" class="opbox2">

		<a class='x' href='' ; onclick="openwin2(0); return false;">关闭</a>
		<p>查找RFQ： 输入任意已知信息</p>
		<div class="ibox-content" style="padding: 5px 5px 5px 5px;">
			<div>
				<div>
					<!--RFQ具体信息 -->
					<div class="form-group">
						<label for="title">RFQ种类</label> <input id="key1" type="text"
							class="form-control">
					</div>

					<div class="form-group">
						<label for="message">请购组织</label> <input class="form-control"
							id="key2" type="text">
					</div>

					<div class="form-group">
						<label for="message">RFQ集合号</label> <input class="form-control"
							id="key3" type="text">
					</div>

					<div class="form-group">
						<label for="message">工厂</label> <input class="form-control"
							id="key4" type="text">
					</div>


					<div class="form-group">
						<label for="showMethod">供应商</label> <input id="xxkey1" type="key5"
							class="form-control">
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
