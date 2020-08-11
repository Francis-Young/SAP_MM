package mm.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mm.bean.RFQ;
import mm.bean.Requisition;
import mm.bean.Vendor;
import mm.dao.RFQDao;
import mm.dao.RequisitionDao;
import mm.dao.VendorDao;


/**
 * Servlet implementation class searchServlet
 */
@WebServlet("/rfqSearchServlet")
public class rfqSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public rfqSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Search(request,response);
	}

	private void Search(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// TODO Auto-generated method stub
		System.out.println("进入搜索！");
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text;charset=utf-8");
		resp.setCharacterEncoding("UTF-8");
	    resp.setHeader("Cache-Control", "no-cache"); 
		String key= req.getParameter("key");
		System.out.println(key);
		String coll="xx";
		String rfq_plant="xx";
		String rfq_type="xx";
		String vendor_code="xx";
		String rfq_purchasing_org="xx";
		
		
		String pattern1 ="(.*),";//description
	    // 创建 Pattern 对象
	    Pattern r = Pattern.compile(pattern1);
	    // 现在创建 matcher 对象
	    Matcher m = r.matcher(key);
	    if (m.find())
	    {
	    	rfq_type=m.group(1);
	    }
	    
	    String pattern2 =",(.*)";//description
	    // 创建 Pattern 对象
	    r = Pattern.compile(pattern2);
	    // 现在创建 matcher 对象
	    m = r.matcher(key);
	    for (int i=1;i<=5;i++)
	    	{
	    	if(m.find())
	    	{
	    		if(i==1)
	    			rfq_purchasing_org=m.group(1);
	    		if(i==2)
		    		coll=m.group(1);
	    		if(i==3)
	    			rfq_plant=m.group(1);
	    		if(i==4)
	    			vendor_code=m.group(1);
	    		
	    	
	    	}
	    	}
	    
		
		
		RFQ rf = new RFQ();
		rf.setRfq_coll(coll);
		rf.setRfq_plant(rfq_plant);
		rf.setRfq_type(rfq_type);
		rf.setVendor_code(vendor_code);
		rf.setRfq_purchasing_org(rfq_purchasing_org);
		
		
		ArrayList<RFQ> vli=RFQDao.findrfqByAnything(rf);
		
		  
		
		if (vli.isEmpty())
		{
			System.out.print("无记录？");
			resp.getWriter().print(URLEncoder.encode("mark0*mark1没有相关记录！mark2","utf-8"));
			
		}
		else
		{
			String s="";
		for(int i=0; i<vli.size();i++)
		{
			s += "mark0"+vli.get(i).getRfq_num()+"mark1"+vli.get(i).getRfq_plant()+"mark2"+vli.get(i).getRfq_coll()+"mark3"
					+vli.get(i).getVendor_code()+"mark4"+vli.get(i).getRfq_deadline().toString()+"mark5";
			
		}
		System.out.println(s);
		
		resp.getWriter().print(URLEncoder.encode(s,"utf-8"));//解决中文乱码
		}	
	
			// TODO Auto-generated catch block
			
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
