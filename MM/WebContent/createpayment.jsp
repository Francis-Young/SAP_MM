<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="mm.utils.DBUtil"%>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>创建支付</title>

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
    height:400px; border:1px #111 solid;
    display:none;          

position: absolute;
background:white;
}
.opbox1.show{display:block;} 
.opbox1 .x{ font-size:18px; text-align:right; display:block;}
.opbox2{ 
    z-index: 106;
    width:40%; margin-top:5%; margin:auto; padding:28px;
    top:5%; left:30%;
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
                      <div class="dropdown profile-element"> <span>
                          <img alt="image" class="img-circle" src="img/profile_small.jpg" />
                           </span>
                          <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                          <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">王昆</strong>
                           </span> <span class="text-muted text-xs block">管理员 <b class="caret"></b></span> </span> </a>
                          <ul class="dropdown-menu animated fadeInRight m-t-xs">
                              <li><a href="profile.html">个人信息</a></li>
                              <li><a href="contacts.html">联系方式</a></li>
                              <li><a href="mailbox.html">邮箱</a></li>
                              <li class="divider"></li>
                              <li><a href="login.html">退出登录</a></li>
                          </ul>
                      </div>
                      <div class="logo-element">
                          IN+
                      </div>
                  </li>
                  <li>
                      <a href="index.html"><i class="fa fa-th-large"></i> <span class="nav-label">首页</span> <span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level">
                          <li><a href="index.html">首页 v.1</a></li>
                          <li><a href="dashboard_2.html">首页 v.2</a></li>
                          <li><a href="dashboard_3.html">首页 v.3</a></li>
                          <li><a href="dashboard_4_1.html">首页 v.4</a></li>
                          <li><a href="dashboard_5.html">首页 v.5 <span class="label label-primary pull-right">NEW</span></a></li>
                      </ul>
                  </li>
                  <li>
                      <a href="layouts.html"><i class="fa fa-diamond"></i> <span class="nav-label">布局</span></a>
                  </li>
                  <li>
                      <a href="#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">图表</span><span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level collapse">
                          <li><a href="graph_flot.html">Flot Charts</a></li>
                          <li><a href="graph_morris.html">Morris.js Charts</a></li>
                          <li><a href="graph_rickshaw.html">Rickshaw Charts</a></li>
                          <li><a href="graph_chartjs.html">Chart.js</a></li>
                          <li><a href="graph_chartist.html">Chartist</a></li>
                          <li><a href="c3.html">c3 charts</a></li>
                          <li><a href="graph_peity.html">Peity Charts</a></li>
                          <li><a href="graph_sparkline.html">Sparkline Charts</a></li>
                      </ul>
                  </li>
                  <li>
                      <a href="mailbox.html"><i class="fa fa-envelope"></i> <span class="nav-label">邮箱 </span><span class="label label-warning pull-right">16/24</span></a>
                      <ul class="nav nav-second-level collapse">
                          <li><a href="mailbox.html">收件箱</a></li>
                          <li><a href="mail_detail.html">邮件详情</a></li>
                          <li><a href="mail_compose.html">发送邮件</a></li>
                          <li><a href="email_template.html">邮件模板</a></li>
                      </ul>
                  </li>
                  <li>
                      <a href="metrics.html"><i class="fa fa-pie-chart"></i> <span class="nav-label">指标</span>  </a>
                  </li>
                  <li>
                      <a href="widgets.html"><i class="fa fa-flask"></i> <span class="nav-label">组件</span></a>
                  </li>
                  <li>
                      <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">表单</span><span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level collapse">
                          <li><a href="form_basic.html">基本表单</a></li>
                          <li><a href="form_advanced.html">高级插件</a></li>
                          <li><a href="form_wizard.html">分步引导</a></li>
                          <li><a href="form_file_upload.html">文件上传</a></li>
                          <li><a href="form_editors.html">富文本编辑</a></li>
                          <li><a href="form_markdown.html">Markdown</a></li>
                      </ul>
                  </li>
                  <li>
                      <a href="#"><i class="fa fa-desktop"></i> <span class="nav-label">APP视图</span>  <span class="pull-right label label-primary">SPECIAL</span></a>
                      <ul class="nav nav-second-level collapse">
                          <li><a href="contacts.html">联系方式</a></li>
                          <li><a href="profile.html">个人信息</a></li>
                          <li><a href="profile_2.html">个人信息 v.2</a></li>
                          <li><a href="contacts_2.html">联系方式 v.2</a></li>
                          <li><a href="projects.html">项目列表</a></li>
                          <li><a href="project_detail.html">项目详情</a></li>
                          <li><a href="teams_board.html">团队面板</a></li>
                          <li><a href="social_feed.html">订阅</a></li>
                          <li><a href="clients.html">客户信息</a></li>
                          <li><a href="full_height.html">Outlook</a></li>
                          <li><a href="vote_list.html">投票</a></li>
                          <li><a href="file_manager.html">文件管理</a></li>
                          <li><a href="calendar.html">日历</a></li>
                          <li><a href="issue_tracker.html">Issue</a></li>
                          <li><a href="blog.html">博客</a></li>
                          <li><a href="article.html">文章</a></li>
                          <li><a href="faq.html">FAQ</a></li>
                          <li><a href="timeline.html">时间轴</a></li>
                          <li><a href="pin_board.html">Pin board</a></li>
                      </ul>
                  </li>
                  <li>
                      <a href="#"><i class="fa fa-files-o"></i> <span class="nav-label">其他</span><span class="fa arrow"></span></a>
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
                      </ul>
                  </li>
                  <li>
                      <a href="#"><i class="fa fa-globe"></i> <span class="nav-label">杂七杂八</span><span class="label label-info pull-right">NEW</span></a>
                      <ul class="nav nav-second-level collapse">
                          <li><a href="toastr_notifications.html">通知</a></li>
                          <li><a href="nestable_list.html">嵌套列表</a></li>
                          <li><a href="agile_board.html">TO-DO LIST</a></li>
                          <li><a href="timeline_2.html">时间轴 v.2</a></li>
                          <li><a href="diff.html">文件对比</a></li>
                          <li><a href="i18support.html">国际化</a></li>
                          <li><a href="sweetalert.html">弹出框</a></li>
                          <li><a href="idle_timer.html">计时器</a></li>
                          <li><a href="truncate.html">截断...</a></li>
                          <li><a href="spinners.html">菊花</a></li>
                          <li><a href="tinycon.html">favicon</a></li>
                          <li><a href="google_maps.html">谷歌地图</a></li>
                          <li><a href="code_editor.html">代码</a></li>
                          <li><a href="modal_window.html">模态对话框</a></li>
                          <li><a href="clipboard.html">剪贴板</a></li>
                          <li><a href="forum_main.html">论坛</a></li>
                          <li><a href="validation.html">JS验证</a></li>
                          <li><a href="tree_view.html">树</a></li>
                          <li><a href="loading_buttons.html">加载按钮</a></li>
                          <li><a href="chat_view.html">聊天</a></li>
                          <li><a href="masonry.html">瀑布流</a></li>
                          <li><a href="tour.html">教程</a></li>
                      </ul>
                  </li>
                  <li>
                      <a href="#"><i class="fa fa-flask"></i> <span class="nav-label">UI</span><span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level collapse">
                          <li><a href="typography.html">段落</a></li>
                          <li><a href="icons.html">Icons</a></li>
                          <li><a href="draggable_panels.html">拖拽面板</a></li> <li><a href="resizeable_panels.html">调整大小面板</a></li>
                          <li><a href="buttons.html">按钮</a></li>
                          <li><a href="video.html">视频</a></li>
                          <li><a href="tabs_panels.html">面板</a></li>
                          <li><a href="tabs.html">Tabs</a></li>
                          <li><a href="notifications.html">通知 & Tooltips</a></li>
                          <li><a href="badges_labels.html">徽章, Labels, 进度条</a></li>
                      </ul>
                  </li>

                  <li>
                      <a href="grid_options.html"><i class="fa fa-laptop"></i> <span class="nav-label">网格</span></a>
                  </li>
                  <li>
                      <a href="#"><i class="fa fa-table"></i> <span class="nav-label">表格</span><span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level collapse">
                          <li><a href="table_basic.html">静态表格</a></li>
                          <li><a href="table_data_tables.html">动态表格</a></li>
                          <li><a href="table_foo_table.html">高级表格</a></li>
                          <li><a href="jq_grid.html">jqGrid</a></li>
                      </ul>
                  </li>
                  <li  class="active">
                      <a href="#"><i class="fa fa-shopping-cart"></i> <span class="nav-label">电子商务</span><span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level collapse">
                          <li><a href="ecommerce_products_grid.html">产品-网格</a></li>
                          <li><a href="ecommerce_product_list.html">产品-列表</a></li>
                          <li  class="active"><a href="ecommerce_product.html">产品-编辑</a></li>
                          <li><a href="ecommerce_product_detail.html">产品-详情</a></li>
                          <li><a href="ecommerce-cart.html">购物车</a></li>
                          <li><a href="ecommerce-orders.html">订单</a></li>
                          <li><a href="ecommerce_payments.html">信用卡</a></li>
                      </ul>
                  </li>
                  <li>
                      <a href="#"><i class="fa fa-picture-o"></i> <span class="nav-label">画廊</span><span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level collapse">
                          <li><a href="basic_gallery.html">灯箱</a></li>
                          <li><a href="slick_carousel.html">旋转木马</a></li>
                          <li><a href="carousel.html">Bootstrap 轮播</a></li>

                      </ul>
                  </li>
                  <li>
                      <a href="#"><i class="fa fa-sitemap"></i> <span class="nav-label">菜单 </span><span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level collapse">
                          <li>
                              <a href="#">三级菜单 <span class="fa arrow"></span></a>
                              <ul class="nav nav-third-level">
                                  <li>
                                      <a href="#">三级菜单标题</a>
                                  </li>
                                  <li>
                                      <a href="#">三级菜单标题</a>
                                  </li>
                                  <li>
                                      <a href="#">三级菜单标题</a>
                                  </li>

                              </ul>
                          </li>
                          <li><a href="#">二级菜单标题</a></li>
                          <li>
                              <a href="#">二级菜单标题</a></li>
                          <li>
                              <a href="#">二级菜单标题</a></li>
                      </ul>
                  </li>
                  <li>
                      <a href="css_animation.html"><i class="fa fa-magic"></i> <span class="nav-label">CSS动画 </span><span class="label label-info pull-right">62</span></a>
                  </li>
                  <li class="landing_link">
                      <a target="_blank" href="landing.html"><i class="fa fa-star"></i> <span class="nav-label">着陆页</span> <span class="label label-warning pull-right">NEW</span></a>
                  </li>
                  <li class="special_link">
                      <a href="package.html"><i class="fa fa-database"></i> <span class="nav-label">框架</span></a>
                  </li>
              </ul>

          </div>
      </nav>

  <div id="page-wrapper" class="gray-bg">
  <div class="row border-bottom">
    <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
            <form role="search" class="navbar-form-custom" action="search_results.html">
                <div class="form-group">
                    <input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search">
                </div>
            </form>
        </div>
        <ul class="nav navbar-top-links navbar-right">
            <li>
                <span class="m-r-sm text-muted welcome-message">欢迎来到goopay</span>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                    <i class="fa fa-envelope"></i>  <span class="label label-warning">16</span>
                </a>
                <ul class="dropdown-menu dropdown-messages">
                    <li>
                        <div class="dropdown-messages-box">
                            <a href="profile.html" class="pull-left">
                                <img alt="image" class="img-circle" src="img/a7.jpg">
                            </a>
                            <div class="media-body">
                                <small class="pull-right">46小时前</small>
                                <strong>李文俊</strong> 关注了 <strong>刘海洋</strong>. <br>
                                <small class="text-muted">3 天 前- 10.06.2014</small>
                            </div>
                        </div>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <div class="dropdown-messages-box">
                            <a href="profile.html" class="pull-left">
                                <img alt="image" class="img-circle" src="img/a4.jpg">
                            </a>
                            <div class="media-body ">
                                <small class="pull-right text-navy">5小时前</small>
                                <strong>王昆</strong> 关注了 <strong>李文俊</strong>. <br>
                                <small class="text-muted">昨天下午1:21 - 11.06.2014</small>
                            </div>
                        </div>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <div class="dropdown-messages-box">
                            <a href="profile.html" class="pull-left">
                                <img alt="image" class="img-circle" src="img/profile.jpg">
                            </a>
                            <div class="media-body ">
                                <small class="pull-right">23小时前</small>
                                <strong>张三</strong> 赞了 <strong>李四</strong>. <br>
                                <small class="text-muted">2天前 - 11.06.2014</small>
                            </div>
                        </div>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <div class="text-center link-block">
                            <a href="mailbox.html">
                                  <i class="fa fa-envelope"></i> <strong>查看更多消息</strong>
                            </a>
                        </div>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                    <i class="fa fa-bell"></i>  <span class="label label-primary">8</span>
                </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <li>
                        <a href="mailbox.html">
                            <div>
                                <i class="fa fa-envelope fa-fw"></i> 您有 16 条未读通知
                                <span class="pull-right text-muted small">4 分钟 前</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="profile.html">
                            <div>
                                <i class="fa fa-twitter fa-fw"></i> 3 个新粉丝
                                <span class="pull-right text-muted small">12 分钟 前</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="grid_options.html">
                            <div>
                                <i class="fa fa-upload fa-fw"></i> 服务器重启
                                <span class="pull-right text-muted small">4 分钟 前</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <div class="text-center link-block">
                            <a href="notifications.html">
                                <strong>查看更多通知</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>
                    </li>
                </ul>
            </li>


            <li>
                <a href="login.html">
                    <i class="fa fa-sign-out"></i> 退出登录
                </a>
            </li>
    </ul>
  </nav>
        </div>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>创建支付</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="index.html">首页</a>
                    </li>
                    <li>
                        <a>电子商务</a>
                    </li>
                    <li class="active">
                        <strong>产品-编辑</strong>
                    </li>
                </ol>
            </div>
        </div>
    <div style="position: fixed;left: 50%;top:10%;z-index:1000;"id="showResult" ></div>  
        
        <div id='inputbox' class="opbox1"> 
        <a class='x' href=''onclick="openwin1_id(0); return false;">关闭</a> 
     <fieldset class="form-horizontal">
                                         <div class="form-group"><label class="col-sm-2 control-label">到货日期:</label>
                                           <div class="input-group date">
                                         		 <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="" id="w_time" name="w_time">
                                          </div>
                                          </div>
                                         
                                            <div class="form-group"><label class="col-sm-2 control-label">供应商编号： </label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="请输入供应商编号 ，如100000" id="w_num" name="w_num"></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">供应商名称：</label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="请输入供应商名称，支持模糊查询" id="w_name" name="w_name"></div>
                                            </div>
											<div class="form-group"><label class="col-sm-2 control-label">材料编号：</label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="请输入物料编号" id="w_text" name="w_text"></div>
                                            </div>                                         
                                                                         <button class="btn btn-primary" onclick="test_forwindow()" type="button">查询</button>                  

                                        </fieldset>
      			 
                                            
				
        </div>
                <div id='inputbox2' class="opbox2"> 
        <a class='x' href=''onclick="openwin2_id(0); return false;">关闭</a> 
                                <table class="table table-hover" id="tb1"></table>
    
				
        </div>

        <div class="wrapper wrapper-content animated fadeInRight ecommerce">

            <div class="row">
                <div class="col-lg-12">
                    <div class="tabs-container">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#tab-1">基本信息</a></li>
                                <li class=""><a data-toggle="tab" href="#tab-2" onclick="test()">订单详情</a></li>

                            </ul>
					<form action="CreatePay" method="post" onsubmit="return validate();">
                            
                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane active">
                                    <div class="panel-body">

                                        <fieldset class="form-horizontal">
                                         <div class="form-group"><label class="col-sm-2 control-label">支付日期:</label>
                                           <div class="input-group date">
                                         		 <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="08/01/2020" id="p_time" name="p_time">
                                          </div>
                                          </div>
                                         
                                            <div class="form-group"><label class="col-sm-2 control-label">订单编号：<a href="javascript:openwin1_id(1)"> 前往查询 </a>  </label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="请输入订单编号，如100000" id="o_num" name="o_num"></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">价格：</label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="请输入两位小数，如160.00" id="o_price" name="o_price"></div>
                                            </div>
											<div class="form-group"><label class="col-sm-2 control-label">发票名称：</label>
                                                <div class="col-sm-10"><input type="text" class="form-control" placeholder="请输入发票名称，如100000" id="o_text" name="o_text"></div>
                                            </div>                                         

                                        </fieldset>
                                    </div>
                                </div>
                                <div id="tab-2" class="tab-pane">
                                    <div class="panel-body">

                                        <fieldset class="form-horizontal">

                         <label class="col-sm-2"  id="v_table" style="width:80%">供应商</label>            
                            <table class="table table-hover" id="myTable">
                               
                               <thead> 
                               <tr>
                               <th>物料编号</th>  
                               <th>数量</th>
                               <th>价格</th>
                               <th>到达时间</th>
                               </tr>
                               </thead>
                               

</table>
						 <label> <input type="checkbox" class="i-checks" id="p_check" name="p_check">已确认账单信息</label>
<br>
                             <button class="btn btn-primary" onclick="invoice()" type="button"> 查看模拟发票</button>                  
					
                           <button class="btn btn-primary pull-right"> 确认</button>                  
                                   
                                </fieldset>


                                    </div>
                                </div>
         

                            </div>
                            </form>
                    </div>
                </div>
            </div>

        </div>
        <div class="footer">
            <div class="pull-right">
                10GB of <strong>250GB</strong> Free.
            </div>
            <div>
                <strong>Copyright</strong> Example Company &copy; 2014-2015
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

<!-- SUMMERNOTE -->
<script src="js/plugins/summernote/summernote.min.js"></script>

<!-- Data picker -->
<script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>

<script>
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
</script>
<script type="text/javascript">  
     function validate(){  
       var reg = new RegExp("^[0-9]*$"); 
       var reg2= new RegExp("^[0-9]+\.[0-9]{0,2}$");  
       var obj1 = document.getElementById("o_num");  
       var obj2 = document.getElementById("o_price");  
       var obj4 = document.getElementById("p_check");
       var obj5 = document.getElementById("myTable") ;
    if(!reg.test(obj1.value)){  
        alert("订单编号未输入数字！"); 
        return false;
    }  
    else if(!reg2.test(obj2.value)){  
        alert("价格必须输入两位数字！");  
        return false;
    }      

    else if(obj4.checked==false){
    	alert("请在确认订单后提交!");
    	return false;
    }
    else if(obj5.rows.length-1==0){
    	alert("无相关订单，请重新输入订单号!");
    	return false;
    }
    else{
    	return true;
    }
  }  
     function test_true(){  

    	var utext = document.getElementById("o_num");
    	var text = utext.value;
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
      	       			$("#showResult").html("");
      	   			$("#myTable").html("");


      	            }
      	            });}
    	else{
    		alert("订单号不规范，请重新输入");
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
    			$("#showResult").html("");
    			var html0=" <thead> <tr><th>物料编号</th>  <th>数量</th><th>价格</th><th>到达时间</th></tr></thead><tbody>;"
 	   			$("#myTable").html(html0);

				
			}
			else{
				var html0="  <thead> <tr><th>物料编号</th>  <th>数量</th><th>价格</th><th>到达时间</th></tr></thead><tbody>;"
					var v=result[0].vendor_name;

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
			var v1="供应商："+v;
			document.getElementById('v_table').innerHTML = v1;
			}
         });                   
}

</script>
<script type="text/javascript">
	function invoice()
	{ 
    var obj1 = document.getElementById("o_num").value;  
    var obj2 = document.getElementById("o_price").value;  
    var obj4 = document.getElementById("o_text").value;  
    var date = document.getElementById("p_time").value;
	url="invoice.jsp?id=订单&text=文本&amount=金额&date=日期";
	var s1=date.substring(0,2);//M
	var s2=date.substring(3,5);//D
	var s3=date.substring(6,10);//Y

	date=s3+"-"+s1+"-"+s2;

	url=url.replace(/日期/,date);
	url=url.replace(/订单/,obj1);
	url=url.replace(/金额/,obj2);
	url=url.replace(/文本/,obj4);
	url=encodeURI(encodeURI(url));
	window.open (url);
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

        var reg = new RegExp("^[0-9]*$"); 
    	if (1){     	
    		var results = '';
    	 var html="<tbody>"

  			$("#tb1").html("");
	
    	 $("#showResult").html("<img src=\"css/plugins/blueimp/img/loading.gif\" />");
      	var defer = $.Deferred(results);
      	 $.ajax({
      	            
      	                type : 'GET',
      	                url : 'PaymentTable',
      	               data:{
      	            	  time:time,
      	            	  num:num,
      	            	  name:name,
      	                  text:text,
      	               },
      	               dataType : 'json',
      	                success : function(result,backData) {
      	                	results=result;
      	                   defer.resolve(result)

      	                },
      	                error : function(result) {
      	                    alert("无此订单");
      	       			$("#showResult").html("");
      	   			$("#tb1").html("");


      	            }
      	            });}
    	else{
    		alert("订单号不规范，请重新输入");
    	}


      	return defer.promise();

     	}
  function test_forwindow(){
	  openwin2_id(1);
        $.when(test_true_window()).done(function(result,backData){
        	var count = "";
			var info = JSON.stringify(result);
			var data = eval('(' + info + ')');
			if(data.length==0){
				alert("无此订单");
    			$("#showResult").html("");
    			var html0=" <thead> <tr><th>订单号</th><th>到达日期</th><th>供应商</th><th>材料</th></tr></thead><tbody>;"
 	   			$("#tb1").html(html0);

				
			}
			else{
			var html0=" <thead> <tr><th>订单号</th>  <th>到达日期</th><th>供应商</th><th>材料</th></tr></thead><tbody>;"
			var v=result[0].Vendor_id;

			for(var i=0;i<data.length;i++){
			var id=result[i].order_num;
			var amount=result[i].delivery_date;
			var user=result[i].vendor_name;
			var mar=result[i].material_num;

 			var html1="<tr onclick=\"selectline(this)\"><td>啊1</td><td>啊2</td><td>啊3</td><td>啊4</td></tr>"
        	
        	html1=html1.replace(/啊1/,id);
        	html1=html1.replace(/啊2/,amount);
        	html1=html1.replace(/啊3/,user);
        	html1=html1.replace(/啊4/,mar);

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
      var inputElement =  document.getElementById("o_num");
      //给input框赋值
      inputElement.value = clickContent.cells[0].innerHTML;//.innerText;
   
      openwin2_id(0);           //关掉两个弹窗
      openwin1_id(0);
  	}

  </script>

    
</body>

</html>
