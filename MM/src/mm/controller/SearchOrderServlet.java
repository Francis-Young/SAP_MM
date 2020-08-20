package mm.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mm.bean.Order;
import mm.bean.Requisition;
import mm.dao.GoodsreceiptDao;
import mm.dao.RequisitionDao;

/**
 * Servlet implementation class SearchOrderServlet
 */
@WebServlet("/SearchOrderServlet")
public class SearchOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchOrderServlet() {
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
		System.out.println("key:"+key);
		
		//String subkey = key.substring(0, key.length() - 1);
		//String[] result = key.split(",");
		
		String o_vendor="xx";
		String o_group="xx";
		String o_org="xx";
		
		String pattern1 ="(.*),";//description
	    // 创建 Pattern 对象
	    Pattern r = Pattern.compile(pattern1);
	    // 现在创建 matcher 对象
	    Matcher m = r.matcher(key);
	    if (m.find() && !(m.group(1).equals("")))
	    {
	    	o_vendor=m.group(1);
	    	o_vendor=o_vendor.substring(0, o_vendor.length()-1);
	    }
	    String pattern2 =",(.*)";//description
	    // 创建 Pattern 对象
	    r = Pattern.compile(pattern2);
	    // 现在创建 matcher 对象
	    m = r.matcher(key);
	    if (m.find() && !(m.group(1).equals("")))
	    {
	    	o_group=m.group(1);
	    	o_group=o_group.substring(0, o_group.length()-1);
	    }
	    String pattern3 =",(.*)";//description
	    // 创建 Pattern 对象
	    r = Pattern.compile(pattern3);
	    // 现在创建 matcher 对象
	    m = r.matcher(key);
	    if (m.find() && !(m.group(1).equals("")))
	    {
	    	o_org=m.group(1);
	    	o_org=o_org.substring(0, o_org.length()-1);
	    }
				
	    System.out.println("vendorcode"+o_vendor);
	    System.out.println("group"+o_group);
	    System.out.println("org"+o_org);
	  
	    Order od = new Order();
	    
	    od.setVendor_code(o_vendor);
	    od.setPur_group(o_group);
	    od.setPur_org(o_org);
	    
		List<Order> odlist=GoodsreceiptDao.findOrderByAnything(od);
				
		if (odlist.isEmpty())
		{
			System.out.print("无记录？");
			resp.getWriter().print(URLEncoder.encode("mark0*mark1没有相关记录！mark2","utf-8"));
			
		}
		else
		{
			String s="";
		for(int i=0; i<odlist.size();i++)
		{
			s += "mark0"+odlist.get(i).getOrder_code()+"mark1"+odlist.get(i).getDocdate()+"mark2"+odlist.get(i).getPur_org()+"mark3"+odlist.get(i).getRfq_code()+"mark4";
			
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
