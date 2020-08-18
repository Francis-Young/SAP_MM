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
import javax.servlet.http.HttpSession;

import mm.bean.Order;
import mm.bean.Requisition;
import mm.bean.Requisition_item;
import mm.dao.OrderDao;
import mm.dao.ReqItemDao;
import mm.dao.RequisitionDao;
import java.sql.Date;
import java.util.*;

@WebServlet(urlPatterns="/requisition")
public class RequisitionController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String action = req.getParameter("action");
	
		switch (action)
		{
			case "creat":
				creat(req,resp);
				break;
			case "view":
				view(req,resp);
				break;
			default:view(req,resp);
				break;
		}
		
	}





	private void view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String requisitioncode = req.getParameter("requisitionnum");
		Requisition r = RequisitionDao.findRequisitionByCode(requisitioncode);
		HttpSession session= req.getSession();
		session.setAttribute("requisition", r);
		System.out.print("view!");
		req.getRequestDispatcher("requisitionview.jsp").forward(req,resp);
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
		//---????????-----
		Requisition rqi = new Requisition();
		rqi.setRequisition_purchasegroup(group);
		head = new String(head.getBytes("ISO-8859-1"),"UTF-8"); //??????????;
		head="???????";
		rqi.setRequisition_discription(head);
		String requisition_code=RequisitionDao.addRequisition(rqi);
		
		Enumeration<String> enu=req.getParameterNames();
		while(enu.hasMoreElements()){
		String paraName=(String)enu.nextElement();
		System.out.println(paraName+": "+req.getParameter(paraName));	
		} 
		//------??????item--
		for (int i=10;i<=num;i+=10)
		{
			Requisition_item ri = new Requisition_item();
			ri.setMaterial_num(req.getParameter("material"+i));
			
			String datestr=req.getParameter("deliverydate"+i);
			
			java.sql.Date date=strToDate(datestr);
				
			ri.setRequisition_deliverydate(date);
			ri.setRequisition_code(requisition_code);
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
	
	
	
	
	







}

