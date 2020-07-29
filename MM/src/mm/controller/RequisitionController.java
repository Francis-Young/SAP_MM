package mm.controller;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mm.bean.Requisition;
import mm.bean.Requisition_item;
import mm.dao.ReqItemDao;
import mm.dao.RequisitionDao;
import java.sql.Date;
import java.util.*;

@WebServlet(urlPatterns="/requisition")
public class RequisitionController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		//获取请求的行为
		String action = req.getParameter("action");
		System.out.println(action);
		//根据不同的action请求，进入不同的方法
		
		switch (action)
		{
			case "creat":
				creat(req,resp);
				break;
			default:select_question(req,resp);
				break;
		}
		
	}





	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		doGet(req, resp);
	}
	private void creat(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		int num=Integer.parseInt(req.getParameter("num"));
		
		String group = req.getParameter("organ10");
		String head = req.getParameter("head_requisition");
		//---创建请购单-----
		Requisition rqi = new Requisition();
		rqi.setRequisition_purchasegroup(group);
		head = new String(head.getBytes("ISO-8859-1"),"UTF-8"); //中文解码转换;
		head="测试汉字";
		rqi.setRequisition_discription(head);
		int requisition_num=RequisitionDao.addRequisition(rqi);
		
		Enumeration<String> enu=req.getParameterNames();
		while(enu.hasMoreElements()){
		String paraName=(String)enu.nextElement();
		System.out.println(paraName+": "+req.getParameter(paraName));	
		} 
		//------逐一添加item--
		for (int i=10;i<=num;i+=10)
		{
			Requisition_item ri = new Requisition_item();
			ri.setMaterial_num(req.getParameter("material"+i));
			
			String datestr=req.getParameter("deliverydate"+i);
			
			java.sql.Date date=strToDate(datestr);
				
			ri.setRequisition_deliverydate(date);
			ri.setRequisition_num(requisition_num);
			ri.setRequisition_plant(req.getParameter("plant"+i));
			int quantity= Integer.parseInt(req.getParameter("quantity"+i));
			ri.setRequisition_quantity(quantity);
			ri.setRequisition_storageloc(req.getParameter("storloc"+i));
			ReqItemDao.addRequisitionItem(ri);
		}
		
   	
		
		
		
		
		
		
		
		
		
	}
	 private java.sql.Date strToDate(String strDate) {  
	        String str = strDate;  
	        
	        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");  
	        java.util.Date d = null;  
	        try {  
	            d = format.parse(str);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	        java.sql.Date date = new java.sql.Date(d.getTime());  
	        return date;  
	    }  		
	
	
	
	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private void select_question(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException 
	{
		// TODO Auto-generated method stub

		System.out.println("进入选题业务！");
		String username = req.getParameter("user_name");//controller层这样获取用户名
		System.out.println(username+"进入主动选题业务！");
		int selection=Integer.parseInt(req.getParameter("action"));
		//解析前端传回字符串的含义
		int a = selection/100;
		int b = (selection-100*a)/10;
		int c = selection%10;
		String chapter;
		String titype;
		String tilevel;
		
	}


	private String packQuestion(Object ticontent,String type,int tiindex) //题的内容，题型，显示编号
	{
		String stiindex=String.valueOf(tiindex+1);
		String pack="";
		switch (type)
		{
			case "选择题":
				
				pack=ticontent+
				"      <div>\r\n" + 
				"        <input id=\"item"+stiindex+"1\" type=\"radio\" name=\"myan"+stiindex+"\" value=\"A\" >\r\n" + 
				"        <label for=\"item"+stiindex+"1\"></label>\r\n" + 
				"        <span style=\"margin-left: 10px\">A</span>\r\n" + 
				"      </div>\r\n" + 
				"      <div>\r\n" + 
				"        <input id=\"item"+stiindex+"2\" type=\"radio\" name=\"myan"+stiindex+"\" value=\"B\">\r\n" + 
				"        <label for=\"item"+stiindex+"2\"></label>\r\n" + 
				"        <span style=\"margin-left: 10px\">B</span>\r\n" + 
				"      </div>\r\n" + 
				"      <div>\r\n" + 
				"        <input id=\"item"+stiindex+"3\" type=\"radio\" name=\"myan"+stiindex+"\" value=\"C\" >\r\n" + 
				"        <label for=\"item"+stiindex+"3\"></label>\r\n" + 
				"        <span style=\"margin-left: 10px\">C</span>\r\n" + 
				"      </div>\r\n" + 
				"      <div>\r\n" + 
				"        <input id=\"item"+stiindex+"4\" type=\"radio\" name=\"myan"+stiindex+"\" value=\"D\">\r\n" + 
				"        <label for=\"item"+stiindex+"4\"></label>\r\n" + 
				"        <span style=\"margin-left: 10px\">D</span>\r\n" + 
				"      </div>   ";
				break;
			case "填空题":
				pack=ticontent+"<input type=\"text\" name=\"myan"+stiindex+"\" >";
				break;
			case "计算题":
				pack=ticontent+"<input class=\"form-control form-control-lg mb-3\" type=\"text\" name=\"myan"+stiindex+"\"  placeholder=\"在这里输入最终计算结果\">";
				break;
			default:
				break;
		}
		return pack;
	}



	@SuppressWarnings("unchecked")
	private void Hand_in(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{


		String username = req.getParameter("user_name");//controller层这样获取用户名
	    
		@SuppressWarnings("rawtypes")
		int selection=Integer.parseInt(req.getParameter("select").toString());
		int a = selection/100;
		int b = (selection-100*a)/10;
		int c = selection%10;
		String chapter;
		String titype;
		String tilevel;
	
        //---------------------下面将历史记录写入数据库
      
        System.out.println(req.getParameter("user_name")+"成功写入了历史记录");
        
	
		req.getRequestDispatcher("consequence_se.jsp").forward(req,resp);//请求转发
		
		
	}
}

