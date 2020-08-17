package mm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mm.bean.GoodsReceipt;
import mm.dao.GoodsreceiptDao;
import mm.dao.GoodsreceiptItemDao;

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
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		System.out.println(action);

		switch (action) {
		case "creat":
			creat(request, response);
			break;

		}

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	/**
	 * @throws IOException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	private void creat(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		try {
			String notice = "保存失败，请检查输入的信息";
			String color = "#ed5565";

			GoodsReceipt gr = new GoodsReceipt();

			String m_order = request.getParameter("order_num");
			int order = Integer.parseInt(m_order.trim());
			gr.setOrder_num(order);
			System.out.println(order);

			String posting_date = (request.getParameter("posting_date"))
					.toString();
			gr.setPosting_date(posting_date);
			System.out.println(posting_date);

			String document_date = (request.getParameter("document_date"))
					.toString();
			gr.setDocument_date(document_date);
			System.out.println(document_date);

			String delivery_note = request.getParameter("delivery_note");
			gr.setDelivery_note(delivery_note);
			System.out.println(delivery_note);

			GoodsreceiptDao grdao = new GoodsreceiptDao();
			int x = grdao.addgoodsreceipt(gr);
			System.out.println(x);
			gr.setDelivery_num(x);

			int itemNo = Integer.parseInt(request.getParameter("num"));
			System.out.println(itemNo);

			for (int i = 1; i <= itemNo; i++) {

				
				String m_text_i = request.getParameter("m_text" + i);
				gr.setM_text(m_text_i);
				System.out.println(m_text_i);

				String check_i = request.getParameter("check" + i);
				gr.setCheck(check_i);
				System.out.println(check_i);

				int m_num_i = Integer.parseInt(request
						.getParameter("m_num" + i));
				gr.setM_num(m_num_i);
				System.out.println(m_num_i);

				String sloc_i = request.getParameter("sloc" + i);
				gr.setSloc(sloc_i);
				System.out.println(sloc_i);

				GoodsreceiptItemDao gridao = new GoodsreceiptItemDao();
				gridao.addgoodsreceiptitem(gr);
				//gridao.changematerial(gr); 无法改变material表中的数据

			}

			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			if (m_order != null) {
				
				notice = "成功保存收货单50000000" + x;
				color = "#1ab394";
			}
			request.setAttribute("notice", notice);
			request.setAttribute("color", color);
			

		} catch (Exception e) {
			e.printStackTrace();
			response.setContentType("text/html;charset=UTF-8");

			
		}
	}

}
