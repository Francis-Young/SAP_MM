package mm.controller;

import java.io.IOException;
import java.security.Permissions;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mm.bean.GoodsReceipt;
import mm.dao.GoodsreceiptItemDao;

/**
 * Servlet implementation class ShowstockController
 */
@WebServlet(urlPatterns = "/showstock")
public class ShowstockController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowstockController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response, GoodsReceipt gr) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		mm.utils.Permissions p=new mm.utils.Permissions();
		boolean flag=p.checkPermission("Showstock",(String)session.getAttribute("unum"));
		if (!flag) {
			request.getRequestDispatcher("/403.html").forward(request, response);
			return;
		}
		
		GoodsreceiptItemDao gridao = new GoodsreceiptItemDao();
		gridao.showstock(gr);
		request.setAttribute("m_text", gr.getM_text());
		request.setAttribute("sloc", gr.getSloc());
		request.setAttribute("m_amount", gr.getEnd_m_num());
		System.out.println(gr.getSloc());
		System.out.println(gr.getEnd_m_num());
		request.getRequestDispatcher("/showstock.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		GoodsReceipt gr = new GoodsReceipt();
		String notice = "查看失败，请检查输入的信息";
		String color = "#ed5565";
		
		String m_text = null;
		m_text=request.getParameter("m_num");
		gr.setM_text(m_text);
		System.out.println(m_text);
		
		String sloc = null;
		sloc=request.getParameter("sloc");
		gr.setSloc(sloc);
		System.out.println(gr.getSloc());
		
		if (m_text != null && sloc !=null&&!"".equals(m_text)&&!"".equals(sloc)) {
			notice = gr.getM_text()+"库存信息如上所示";
			color = "#1ab394";
		}
		else{
			notice = "请输入物料编号/存储位置";
			color = "#ed5565";
		}
		
		request.setAttribute("notice", notice);
		request.setAttribute("color", color);
		doGet(request, response, gr);
	}

}
