package mm.controller;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mm.bean.Material;
import mm.bean.Order;
import mm.bean.Order_item;
import mm.bean.Quotation;
import mm.bean.Quotation_item;
import mm.bean.RFQ;
import mm.bean.RFQ_item;
import mm.bean.Requisition_item;
import mm.bean.Vendor;
import mm.dao.MaterialDao;
import mm.dao.OrderDao;
import mm.dao.OrderItemDao;
import mm.dao.QuotationDao;
import mm.dao.QuotationItemDao;
import mm.dao.RFQDao;
import mm.dao.RFQItemDao;
import mm.dao.ReqItemDao;
import mm.dao.VendorDao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.*;

@WebServlet(urlPatterns="/order")
public class OrderController extends HttpServlet{
	
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
			case "get_quotation":
				get_quotation(req,resp);
				break;
			case "view":
				view(req,resp);
				break;
			case "change":
				change(req,resp);
				break;
			default:
				break;
		}
		
	}







	private void change(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		HttpSession session= req.getSession();
	
		Date docdate = new Date((new java.util.Date()).getTime());

		Order o = new Order();
		o.setRfq_num(00000000);//"no reference
		o.setDocdate(docdate);
		String org=req.getParameter("org");
		String gro=req.getParameter("gro");
		o.setPur_group(gro);
		o.setPur_org(org);
		String vnum=req.getParameter("vendornum");
		int vennum=Integer.parseInt(vnum);
		o.setVendor_num(vennum);
		int onum = OrderDao.addOrder(o);
		session.setAttribute("onum",onum );
		String[] answerArr = req.getParameterValues("cbox");//查被选中的item
		String[] materialrArr = req.getParameterValues("material");//查物料
		String[] quantityArr = req.getParameterValues("quantity");//查被选中的item
		String[] deliverydateArr = req.getParameterValues("deliverydate");//查被选中的item
		String[] statdeliverydateArr = req.getParameterValues("statdeliverydate");//查被选中的item

		String[] priceArr = req.getParameterValues("price");//查被选中的item
		String[] plantArr = req.getParameterValues("plant");//查被选中的item
		String[] storagelocArr = req.getParameterValues("storageloc");//查被选中的item
		String[] currencyArr = req.getParameterValues("currency");
		//不确定这么写对不对
		OrderDao.deleteOitemByOnum(o.getOrder_num());
		for(int i=0;i<answerArr.length;i++ )
		{
			Order_item oi = new Order_item();
			if(answerArr[i].equals("true"))
			{
				oi.setOrder_num(onum);
				String material_num=materialrArr[i];
				oi.setMaterial_num(material_num);
				oi.setDelivery_date(strToDate(deliverydateArr[i]));
				oi.setPrice(new BigDecimal(priceArr[i]));
				oi.setQuantity(Integer.parseInt(quantityArr[i]));
				oi.setCurrency_unit(currencyArr[0]);
				oi.setStat_delivery_date(strToDate(statdeliverydateArr[i]));
				oi.setPlant(plantArr[i]);
				oi.setSloc(storagelocArr[i]);
				OrderItemDao.addOrderItem(oi);
			}
			
		}
		
	
	}







	private void view(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String ordernum = req.getParameter("ordernum");
		Order o = OrderDao.findOrderByNum(Integer.parseInt(ordernum));
		HttpSession session= req.getSession();
		session.setAttribute("order", o);
		req.getRequestDispatcher("orderview.jsp");
	}







	private void get_quotation(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String material_num = req.getParameter("material_num");
		ArrayList<Quotation_item>qilist= QuotationItemDao.findQuotationByMatNum(material_num);
		ArrayList<Quotation> qolist=new ArrayList<Quotation>();
		for(int i=0;i<qilist.size();i++)
		{
			Quotation_item qi=qilist.get(i);
			Quotation qo =QuotationDao.findQuotationByNum(qi.getQuotation_num());
			qolist.add(qo);
		}
		ArrayList<Vendor> venlist=new ArrayList<Vendor>();
		for(int i=0;i<qolist.size();i++)
		{
			Quotation qo=qolist.get(i);
			Vendor v=VendorDao.findVendorbynum(String.valueOf(qo.getVendor_num()));
			venlist.add(v);
		}
		qolist=removeDuplicateWithOrder(qolist);
			
		HttpSession session= req.getSession();
		session.setAttribute("qolist", qolist);
		session.setAttribute("venlist", venlist);
		req.getRequestDispatcher("ordershowquo.jsp");
	}








	// 删除ArrayList中重复元素，保持顺序     
	 @SuppressWarnings("unchecked")
	public static ArrayList<Quotation> removeDuplicateWithOrder(@SuppressWarnings("rawtypes") ArrayList list) {    
	    @SuppressWarnings("rawtypes")
		Set set = new HashSet();    
	     @SuppressWarnings("rawtypes")
	     ArrayList newList = new ArrayList();    
	   for (@SuppressWarnings("rawtypes")
	Iterator iter = list.iterator(); iter.hasNext();) {    
	         Object element = iter.next();    
	         if (set.add(element))    
	            newList.add(element);    
	      }     
	     list.clear();    
	     list.addAll(newList);    
	    return list;    
	 }





	private void save(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		HttpSession session= req.getSession();
		int rfqnum = (int)session.getAttribute("rfqnum");
	
		Date docdate = new Date((new java.util.Date()).getTime());

		Order o = new Order();
		o.setRfq_num(rfqnum);
		o.setDocdate(docdate);
		String org=req.getParameter("org");
		String gro=req.getParameter("gro");
		o.setPur_group(gro);
		o.setPur_org(org);
		Quotation qo=QuotationDao.findQuotationByNum(rfqnum);

		RFQ rfq= (RFQ)session.getAttribute("rfq");
		o.setVendor_num(Integer.parseInt(rfq.getVendor_code()));
		int onum = OrderDao.addOrder(o);
		session.setAttribute("onum",onum );
		String[] answerArr = req.getParameterValues("cbox");//查被选中的item
		String[] materialrArr = req.getParameterValues("material");//查物料
		String[] quantityArr = req.getParameterValues("quantity");//查被选中的item
		String[] deliverydateArr = req.getParameterValues("deliverydate");//查被选中的item
		String[] statdeliverydateArr = req.getParameterValues("statdeliverydate");//查被选中的item

		String[] priceArr = req.getParameterValues("price");//查被选中的item
		String[] plantArr = req.getParameterValues("plant");//查被选中的item
		String[] storagelocArr = req.getParameterValues("storageloc");//查被选中的item
		String[] currencyArr = req.getParameterValues("currency");
		//不确定这么写对不对
		
		for(int i=0;i<answerArr.length;i++ )
		{
			Order_item oi = new Order_item();
			if(answerArr[i].equals("true"))
			{
				oi.setOrder_num(onum);
				String material_num=materialrArr[i];
				oi.setMaterial_num(material_num);
				oi.setDelivery_date(strToDate(deliverydateArr[i]));
				oi.setPrice(new BigDecimal(priceArr[i]));
				oi.setQuantity(Integer.parseInt(quantityArr[i]));
				oi.setCurrency_unit(currencyArr[0]);
				oi.setStat_delivery_date(strToDate(statdeliverydateArr[i]));
				oi.setPlant(plantArr[i]);
				oi.setSloc(storagelocArr[i]);
				OrderItemDao.addOrderItem(oi);
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