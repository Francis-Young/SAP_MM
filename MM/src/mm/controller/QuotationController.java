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

import mm.bean.Quotation;
import mm.bean.RFQ;
import mm.bean.RFQ_item;
import mm.bean.Requisition;
import mm.bean.Requisition_item;
import mm.bean.Vendor;
import mm.dao.RFQDao;
import mm.dao.RFQItemDao;
import mm.dao.ReqItemDao;
import mm.dao.RequisitionDao;
import mm.dao.VendorDao;

import java.sql.Date;
import java.util.*;

@WebServlet(urlPatterns="/rfq")
public class QuotationController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		//获取请求的行为
		String action = req.getParameter("action");
		System.out.println(action);
		//根据不同的action请求，进入不同的方法
		
		switch (action)
		{
			case "save":
				save(req,resp);
				break;
			case "bounce_to_select":
				select(req,resp);
				break;
			case "bounce_to_edit":
				edit(req,resp);
				break;	
			default:
				break;
		}
		
	}







	private void save(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		HttpSession session= req.getSession();
		
		RFQ rfq= (RFQ)session.getAttribute("passdata");
		String rfq_coll=req.getParameter("coll");
		String vendor_code=req.getParameter("vendor");
		rfq.setRfq_coll(rfq_coll);
		rfq.setVendor_code(vendor_code);
		int rfq_num =RFQDao.addRFQ(rfq);
		
		String [] itemture=(String[]) session.getAttribute("itemture");
		int requisition_num=rfq.getRequisition_num();
		ArrayList<Requisition_item> rilist=ReqItemDao.findRequItemByReqnum(requisition_num);
	
		for(int i=0;i<itemture.length;i++ )
		{
			if(itemture[i].equals("true"))
			{
				Requisition_item ri = rilist.get(i);
				RFQ_item rf = new RFQ_item();
				String material_num=ri.getMaterial_num();
				rf.setMaterial_num(material_num);
				rf.setRfq_num(rfq_num);
				rf.setRequisition_deliverydate(ri.getRequisition_deliverydate());
				rf.setRequisition_plant(ri.getRequisition_plant());
				rf.setRequisition_quantity(ri.getRequisition_quantity());
				rf.setRequisition_storageloc(ri.getRequisition_storageloc());
				RFQItemDao.addRFQItem(rf);
			}
		}
		
		
		
	}







	private void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session= req.getSession();
		String [] itemture=req.getParameterValues("checkname");
		session.setAttribute("itemture", itemture);
		req.getRequestDispatcher("rfq6.jsp").forward(req,resp);//请求转发


	

		
	}







	private void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int rfqnum=Integer.parseInt(req.getParameter("rfqnum"));
		RFQ rfq = RFQDao.findRFQbyNum(rfqnum);
		
		Quotation quo = new Quotation();
		quo.setQuotation_num(rfqnum);
		String vnums=rfq.getVendor_code();
		Vendor vd = VendorDao.findVendorbynum(vnums);
		HttpSession session= req.getSession();
		session.setAttribute("passrfq",rfq);
		session.setAttribute("passquo",quo);
		req.setAttribute("rfqnum",rfq.getRfq_num());
		req.setAttribute("rfqtype",rfq.getRfq_type());
		req.setAttribute("rfqdate",rfq.getRfq_date().toString());
		req.setAttribute("ddldate",rfq.getRfq_deadline().toString());
		req.setAttribute("vendor", rfq.getVendor_code());
		req.setAttribute("vendorname", vd.getVname());
		//Requisition resquisition = RequisitionDao.findRequisitionByNum(requisition_num);
		req.getRequestDispatcher("quotationselect.jsp").forward(req,resp);//请求转发
		
	}







	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		doGet(req, resp);
	}
	private void create(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding("utf-8");
		//---创建rfq-----
		
		String rfq_type=req.getParameter("type");
		String rfq_language=req.getParameter("language");
		String date = req.getParameter("date");
		java.sql.Date rfq_date=strToDate(date);
		String deadline = req.getParameter("deadline");
		java.sql.Date rfq_deadline=strToDate(deadline);
		String rfq_purchasing_org = req.getParameter("org");
		String rfq_purchasing_group = req.getParameter("group");
		String rfq_plant = req.getParameter("plant");
		int requisition_num=Integer.parseInt(req.getParameter("reqnum"));
		String vendor_code=req.getParameter("vendorcode");
		String rfq_coll=req.getParameter("coll");
		RFQ rfq = new RFQ();
		rfq.setRequisition_num(requisition_num);
		rfq.setRfq_coll(rfq_coll);
		rfq.setRfq_date(rfq_date);
		rfq.setRfq_deadline(rfq_deadline);
		rfq.setRfq_language(rfq_language);

		rfq.setRfq_plant(rfq_plant);
		rfq.setRfq_purchasing_group(rfq_purchasing_group);
		rfq.setRfq_purchasing_org(rfq_purchasing_org);
		rfq.setRfq_type(rfq_type);
		rfq.setVendor_code(vendor_code);
		
		int rfq_num=RFQDao.addRFQ(rfq);
		
		Enumeration<String> enu=req.getParameterNames();
		while(enu.hasMoreElements()){
		String paraName=(String)enu.nextElement();
		System.out.println(paraName+": "+req.getParameter(paraName));	
		} 
		//------逐一添加item--
		int num=Integer.parseInt(req.getParameter("num"));
		/*for (int i=10;i<=num;i+=10)
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
		*/
   	
		
		
		
		
		
		
		
		
		
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