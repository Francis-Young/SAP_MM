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
import mm.bean.Vendor;
import mm.dao.RequisitionDao;
import mm.dao.VendorDao;


/**
 * Servlet implementation class searchServlet
 */
@WebServlet("/vendorSearchServlet")
public class vendorSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public vendorSearchServlet() {
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
	    String vcity="xx";
		String vcountry="xx";
		String vcompanycode="xx";
		String vname="xx";
		String vtype="xx";
		String vclerk="xx";
		
		vcity=req.getParameter("key5").equals("")?"xx":req.getParameter("key5");
		vcountry=req.getParameter("key4").equals("")?"xx":req.getParameter("key4");
		vcompanycode=req.getParameter("key3").equals("")?"xx":req.getParameter("key3");
	    vname=req.getParameter("key1").equals("")?"xx":req.getParameter("key1");
	    vtype=req.getParameter("key2").equals("")?"xx":req.getParameter("key2");
		vclerk=req.getParameter("key6").equals("")?"xx":req.getParameter("key6");
		
		System.out.print(vcity);
		Vendor vd = new Vendor();
		vd.setVcity(vcity);
		vd.setVcountry(vcountry);
		vd.setVcompanycode(vcompanycode);
		vd.setVname(vname);
		vd.setVtype(vtype);
		vd.setVclerk(vclerk);
		
		
		List<Vendor> vli=VendorDao.findVendorByAnything(vd);
		
		  
		
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
			s += "mark0"+vli.get(i).getVnum()+"mark1"+vli.get(i).getVname()+"mark2"+vli.get(i).getVtype()+"mark3"
					+vli.get(i).getVcompanycode()+"mark4"+vli.get(i).getVcity()+"mark5";
			
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
