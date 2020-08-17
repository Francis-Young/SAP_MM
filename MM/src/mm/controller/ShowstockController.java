package mm.controller;

import java.io.IOException;

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
		HttpSession session = request.getSession();
		
		GoodsreceiptItemDao gridao = new GoodsreceiptItemDao();
		gridao.showstock(gr);
		request.setAttribute("m_text", gr.getM_text());
		request.setAttribute("sloc", gr.getSloc());
		request.setAttribute("m_amount", gr.getEnd_m_num());
		request.getRequestDispatcher("/showstock.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		GoodsReceipt gr = new GoodsReceipt();
		
		String m_text = request.getParameter("m_text");
		gr.setM_text(m_text);
		System.out.println(m_text);
		doGet(request, response, gr);
	}

}
