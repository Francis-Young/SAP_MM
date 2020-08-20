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

import mm.bean.Material;
import mm.bean.Order;
import mm.dao.GoodsreceiptDao;

/**
 * Servlet implementation class SearchMaterialServlet
 */
@WebServlet("/SearchMaterialServlet")
public class SearchMaterialServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMaterialServlet() {
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
		
		String m_des="xx";
		String m_salesorg="xx";
		
		String pattern1 ="(.*),";//description
	    // 创建 Pattern 对象
	    Pattern r = Pattern.compile(pattern1);
	    // 现在创建 matcher 对象
	    Matcher m = r.matcher(key);
	    if (m.find() && !(m.group(1).equals("")))
	    {
	    	m_des=m.group(1);
	    	//m_des=m_des.substring(0, m_des.length()-1);
	    }
	    String pattern2 =",(.*)";//description
	    // 创建 Pattern 对象
	    r = Pattern.compile(pattern2);
	    // 现在创建 matcher 对象
	    m = r.matcher(key);
	    if (m.find() && !(m.group(1).equals("")))
	    {
	    	m_salesorg=m.group(1);
	    	//m_salesorg=m_salesorg.substring(0, m_salesorg.length()-1);
	    }

				
	    System.out.println("m_des:"+m_des);
	    System.out.println("m_salesorg:"+m_salesorg);
	  
	    Material mat = new Material();
	    
	    mat.setMaterial_discr(m_des);
	    mat.setMaterial_salesorg(m_salesorg);
	    
	    List<Material> matlist=GoodsreceiptDao.findMaterialByAnything(mat);
				
		if (matlist.isEmpty())
		{
			System.out.print("无记录？");
			resp.getWriter().print(URLEncoder.encode("mark0*mark1没有相关记录！mark2","utf-8"));
			
		}
		else
		{
			String s="";
		for(int i=0; i<matlist.size();i++)
		{
			s += "mark0"+matlist.get(i).getMaterial_num()+"mark1"+matlist.get(i).getMaterial_unitprice()+"mark2"+matlist.get(i).getMaterial_discr()+"mark3"+matlist.get(i).getMaterial_salesorg()+"mark4";
			
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
