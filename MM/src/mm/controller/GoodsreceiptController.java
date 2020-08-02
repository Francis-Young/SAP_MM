package mm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mm.dao.GoodsreceiptDao;
import java.util.Date;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class GoodsreceiptController
 */
@WebServlet("/Goodsreceipt")
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
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		try {

			// 基本数据部分
			int order = Integer.parseInt(request.getParameter("order_num")
					.trim());
			System.out.println(order);

			String posting_date;
			posting_date = (request.getParameter("posting_date")).toString();
			System.out.println(posting_date);

			String document_date;
			document_date = (request.getParameter("document_date")).toString();
			System.out.println(document_date);

			String delivery_note;
			delivery_note = request.getParameter("delivery_note");
			System.out.println(delivery_note);

			// 运输数据部分
			// int itemNo = Integer.parseInt(request.getParameter("itemNo"));
			// System.out.println(itemNo);
			String p_m_text = request.getParameter("p_m_text");
			System.out.println(p_m_text);

			String m_textArray = request.getParameter("m_textArray");
			System.out.println(m_textArray);
			String[] f_m_textArray = m_textArray.split(",");
			for (int i = 0; i < f_m_textArray.length; i++) {
				System.out.println("f_m_textArray[" + i + "]="
						+ f_m_textArray[i]);
			}

			String td_3 = request.getParameter("td_3");
			System.out.println(td_3);
			String td_4 = request.getParameter("td_4");
			System.out.println(td_4);
			String td_5 = request.getParameter("td_5");
			System.out.println(td_5);

			GoodsreceiptDao grdao = new GoodsreceiptDao();
			int x = grdao.addgoodsreceipt(order, posting_date, document_date,
					delivery_note, p_m_text, td_3, td_4, td_5);
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			if (x == 1) {
				out.print("<script language=\"javascript\">alert('创建成功！');window.location.href='/MM/goodsreceipt.jsp'</script>");
			} else {
				out.print("<script language=\"javascript\">alert('创建失败！请重试');window.location.href='/MM/goodsreceipt.jsp'</script>");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.setContentType("text/html;charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.print("<script language=\"javascript\">alert('创建失败！请重试');window.location.href='/MM/goodsreceipt.jsp'</script>");

		}
	}



}
