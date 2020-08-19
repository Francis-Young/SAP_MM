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
import mm.bean.Quotation;
import mm.bean.Quotation_item;
import mm.bean.RFQ;
import mm.bean.RFQ_item;
import mm.bean.Requisition_item;
import mm.bean.Vendor;
import mm.dao.MaterialDao;
import mm.dao.OrderDao;
import mm.dao.QuotationDao;
import mm.dao.QuotationItemDao;
import mm.dao.RFQDao;
import mm.dao.RFQItemDao;
import mm.dao.ReqItemDao;
import mm.dao.VendorDao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.*;

@WebServlet(urlPatterns="/quotation")
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
			case "bounce_to_compare":
				compare(req,resp);
				break;
			case "reject":
				reject(req,resp);
				break;
			case "view":
				view(req,resp);
				break;
			default:
				break;
		}
		
	}







	private void view(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String quotationnum = req.getParameter("quotationnum");
		Quotation o = QuotationDao.findQuotationByCode(quotationnum);
		HttpSession session= req.getSession();
		session.setAttribute("quotation", o);
		req.getRequestDispatcher("quotationview.jsp");
	}







	private void reject(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session= req.getSession();
		Quotation qo=(Quotation)session.getAttribute("refuse");
		qo.setStatus(-1);
		QuotationDao.modifyQuotationByCode(qo);
		req.setAttribute("quonum", qo.getQuotation_code());
		req.getRequestDispatcher("quotationcompare2.jsp").forward(req, resp);;
		
	}







	private void compare(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		// TODO Auto-generated method stub
		
		String coll = req.getParameter("coll");
		RFQ rfq = new RFQ();
		rfq.setRfq_coll(coll);
		ArrayList<RFQ> rfqlist = RFQDao.findrfqByAnything(rfq);
		ArrayList<Quotation> quolist = new ArrayList<Quotation>();

		for(int i=0;i<rfqlist.size();i++)
		{
			String quocode = rfqlist.get(i).getRfq_code();
			if(QuotationDao.isqoCodeExist(quocode))
			{
				Quotation quo = QuotationDao.findQuotationByCode(quocode);
				quolist.add(quo);
			}
			
		}
		ArrayList<String> matlist = new ArrayList<String>();//所有材料
		
		for(int i=0;i<quolist.size();i++)
		{
			String code = quolist.get(i).getQuotation_code();
			ArrayList<Quotation_item> qilist=QuotationItemDao.findQuotationByQuoCode(code);
			for (int j=0;j<qilist.size();j++)
			{
				matlist.add(qilist.get(i).getMaterial_num());
			}
		}
		@SuppressWarnings("unchecked")
		ArrayList<String> matli = (ArrayList<String>) removeDuplicateWithOrder(matlist);
		ArrayList<Material> matoblist = new ArrayList<Material>();//所有材料
		for(int i=0;i<matlist.size();i++)
		{
			String num = matlist.get(i);
			Material ma = MaterialDao.findMaterialbyNum(num);
			matoblist.add(ma);
		}
		HttpSession session= req.getSession();
		session.setAttribute("coll",coll);
		session.setAttribute("matli",matoblist);
		req.getRequestDispatcher("quotationcompare2.jsp").forward(req, resp);
	
	}

	// 删除ArrayList中重复元素，保持顺序     
	 @SuppressWarnings("unchecked")
	public static ArrayList<?> removeDuplicateWithOrder(@SuppressWarnings("rawtypes") ArrayList list) {    
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





	private void save(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session= req.getSession();
		
		RFQ rfq= (RFQ)session.getAttribute("passrfq");
		Quotation quo=(Quotation)session.getAttribute("passquo");
		quo.setRfq_code(rfq.getRfq_code());		
		quo.setVendor_code(rfq.getVendor_code());
		quo.setStatus(0);
		String quo_code =QuotationDao.addQuotation(quo);
		quo.setQuotation_code(quo_code);
		String [] itemture=req.getParameterValues("checkname");//被选中的item
		//不确定这么写对不对
		String rfqcode=rfq.getRfq_code();
		ArrayList<RFQ_item> rilist=RFQItemDao.findRFQItemByRfqCode(rfqcode);
	    BigDecimal value= new BigDecimal("0");
	 
	  
	    
	    
	    
		for(int i=0;i<itemture.length;i++ )
		{
			int j=Integer.parseInt(itemture[i]);
				Quotation_item qi = new Quotation_item();
			
				RFQ_item ri= rilist.get(j);
				String price = req.getParameter("price"+j);
				int quantity=ri.getRequisition_quantity();
				
				BigDecimal deprice=new BigDecimal(price);
				qi.setMaterial_num(ri.getMaterial_num());
				qi.setDelivery_date(ri.getRequisition_deliverydate());
				qi.setStorageloc(ri.getRequisition_storageloc());
				qi.setQuantity(quantity);
				qi.setQuotation_code(quo_code);
				qi.setQuotation_status(0);//还没定。。
				qi.setCurrency_unit("RMB");
				QuotationItemDao.addQuotationItem(qi);
				
				
				BigDecimal ff= new BigDecimal(price);
				qi.setPrice(ff);
			    BigDecimal dd= new BigDecimal(quantity);
			    value=value.add(ff.multiply(dd));
				
				
				System.out.println(value);
		}
		quo.setValue(value);
		QuotationDao.modifyQuotationByCode(quo);
	
	
	req.setAttribute("quo_code", quo.getQuotation_code());
	req.getRequestDispatcher("quotationini.jsp").forward(req,resp);//请求转发
	}










	private void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String rfqcode=req.getParameter("rfqnum");
		RFQ rfq = RFQDao.findRFQbyCode(rfqcode);
		
		Quotation quo = new Quotation();
		quo.setQuotation_code(rfqcode);
		String vnums=rfq.getVendor_code();
		Vendor vd = VendorDao.findVendorbynum(vnums);
		HttpSession session= req.getSession();
		session.setAttribute("passrfq",rfq);
		session.setAttribute("passquo",quo);
		req.setAttribute("rfqnum",rfq.getRfq_code());
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