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

import mm.bean.Requisition;
import mm.dao.RequisitionDao;


/**
 * Servlet implementation class searchServlet
 */
@WebServlet("/searchServlet")
public class searchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchServlet() {
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
		
		String description="xx";
		String group="xx";
		
		String pattern1 ="(.*),";//description
	    // 创建 Pattern 对象
	    Pattern r = Pattern.compile(pattern1);
	    // 现在创建 matcher 对象
	    Matcher m = r.matcher(key);
	    if (m.find())
	    {
	    	description=m.group(1);
	    }
	    
	    String pattern2 =",(.*)";//description
	    // 创建 Pattern 对象
	    r = Pattern.compile(pattern2);
	    // 现在创建 matcher 对象
	    m = r.matcher(key);
	    if (m.find())
	    {
	    	description=m.group(1);
	    }
	    System.out.println("des"+description);
	    Requisition rq = new Requisition();
	    rq.setRequisition_discription(description);
	    rq.setRequisition_purchasegroup(group);
		List<Requisition> rqlist=RequisitionDao.findRequisitionByAnything(rq);
		
		  
		
		
		if (rqlist.isEmpty())
		{
			System.out.print("无记录？");
			resp.getWriter().print(URLEncoder.encode("mark0*mark1没有相关记录！mark2","utf-8"));
			
		}
		else
		{
			String s="";
		for(int i=0; i<rqlist.size();i++)
		{
			s += "mark0"+rqlist.get(i).getRequisition_num()+"mark1"+rqlist.get(i).getRequisition_discription()+"mark2"+rqlist.get(i).getRequisition_purchasegroup()+"mark3";
			
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
