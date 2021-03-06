package mm.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mm.dao.PayDao;

/**
 * Servlet implementation class UpdatePaymentController
 */
public class UpdatePaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePaymentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String data="";
		try {
			
			String o1=request.getParameter("time");
			String o2=request.getParameter("name");
			String o3=request.getParameter("num");

			String o4=request.getParameter("text");
			String o5=request.getParameter("time1");
			String o6=request.getParameter("text1");
			String o7=request.getParameter("text2");

			o2=new String(o2.getBytes("iso8859-1"),"UTF-8");
			o6=new String(o6.getBytes("iso8859-1"),"UTF-8");
			o7=new String(o7.getBytes("iso8859-1"),"UTF-8");

			PayDao vdao=new PayDao();//
			data=vdao.ForSearch(o1,o2,o3,o4,o5,o6,o7);
		} catch (Exception e) {
		    e.printStackTrace();
		}
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
        out.print(data);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String data="";
		try {
			
			String o=request.getParameter("id");
			PayDao vdao=new PayDao();
			data=vdao.Searchitbyid(o);
		} catch (Exception e) {
		    e.printStackTrace();
		}
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
        out.print(data);
		return;	
		}

}
