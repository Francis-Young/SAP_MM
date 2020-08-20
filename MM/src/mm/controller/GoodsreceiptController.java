package mm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.Permissions;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mm.bean.GoodsReceipt;
import mm.bean.Order;
import mm.bean.Requisition;
import mm.dao.GoodsreceiptDao;
import mm.dao.GoodsreceiptItemDao;
import mm.dao.RequisitionDao;

import java.util.Date;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class GoodsreceiptController
 */

@WebServlet(urlPatterns = "/goodsreceipt")
public class GoodsreceiptController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public GoodsreceiptController() {
		super();
		// TODO Auto-generated constructor stub

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		mm.utils.Permissions p = new mm.utils.Permissions();

		boolean flag = p.checkPermission("GoodsReceipt",
				(String) session.getAttribute("unum"));
		if (!flag) {
			request.getRequestDispatcher("/403.html")
					.forward(request, response);
			return;
		}

		request.getRequestDispatcher("/goodsreceipt.jsp").forward(request, response);

		// String action = request.getParameter("action");
		// System.out.println(action);

	}


	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("utf-8");

		String notice = "保存失败，请检查输入的信息";
		String color = "#ed5565";

		GoodsReceipt gr = new GoodsReceipt();

		String m_order = request.getParameter("order_num");
		//int order = Integer.parseInt(m_order.trim());
		gr.setOrder_num(m_order);
		System.out.println(m_order);

		String posting_date = (request.getParameter("posting_date")).toString();
		gr.setPosting_date(posting_date);
		System.out.println(posting_date);

		String document_date = (request.getParameter("document_date"))
				.toString();
		gr.setDocument_date(document_date);
		System.out.println(document_date);

		String delivery_note = request.getParameter("delivery_note");
		gr.setDelivery_note(delivery_note);
		System.out.println(delivery_note);

		int x = 0;
		try {
			GoodsreceiptDao grdao = new GoodsreceiptDao();
			x = grdao.addgoodsreceipt(gr);
			System.out.println(x);
			gr.setDelivery_num(x);
		} catch (Exception e) {
			e.printStackTrace();
		}

		int itemNo = Integer.parseInt(request.getParameter("num"));
		System.out.println(itemNo);

		int y = 0;

		for (int i = 1; i <= itemNo; i++) {

			String m_text_i = request.getParameter("m_text" + i);
			gr.setM_text(m_text_i);
			System.out.println(m_text_i);

			String check_i = request.getParameter("check" + i);
			gr.setCheck(check_i);
			System.out.println(check_i);

			int m_num_i = Integer.parseInt(request.getParameter("m_num" + i));
			gr.setM_num(m_num_i);
			System.out.println(m_num_i);

			String sloc_i = request.getParameter("sloc" + i);
			gr.setSloc(sloc_i);
			System.out.println(gr.getSloc());
			try {
				GoodsreceiptItemDao gridao = new GoodsreceiptItemDao();
				gridao.addgoodsreceiptitem(gr);
				y = gridao.changeinventory(gr);
				System.out.println(gr.getEnd_m_num());
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		if (m_order != null && y !=0&&!"".equals(m_order)) {

			notice = "收货单50000000" + x+"保存成功";
			color = "#1ab394";
		}
		request.setAttribute("notice", notice);
		request.setAttribute("color", color);

		doGet(request, response);
		return;
	}

	/**
	 * @throws IOException
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

}
