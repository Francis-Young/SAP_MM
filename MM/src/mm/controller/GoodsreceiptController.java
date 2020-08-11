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

import mm.bean.GoodsReceipt;
import mm.dao.GoodsreceiptDao;
import mm.dao.GoodsreceiptItemDao;

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

			GoodsreceiptDao grdao = new GoodsreceiptDao();
			int x = grdao.addgoodsreceipt(order, posting_date, document_date,
					delivery_note);
			
			int itemNo = Integer.parseInt(request.getParameter("itemNo"));
			System.out.println(itemNo);
			
			for(int i=1;i<=itemNo;i++)
			{
				GoodsReceipt gr = new GoodsReceipt();
				
				int m_text_i=Integer.parseInt(request.getParameter("m_text"+i));
				gr.setM_text(m_text_i);
				
				String check_i=request.getParameter("check"+i);
				gr.setCheck(check_i);
				
				int m_num_i=Integer.parseInt(request.getParameter("m_num"+i));
				gr.setM_num(m_num_i);
				
				String sloc_i=request.getParameter("sloc"+i);
				gr.setSloc(sloc_i);
				
				GoodsreceiptItemDao gridao = new GoodsreceiptItemDao();
				int y = gridao.addgoodsreceiptitem(m_text_i, check_i, m_num_i, sloc_i);
			}
			
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			if (x == 1) {
				out.print("<script language=\"javascript\">alert('录入成功');window.location.href='/MM/goodsreceipt.jsp'</script>");
			} else {
				out.print("<script language=\"javascript\">alert('录入失败，请重试');window.location.href='/MM/goodsreceipt.jsp'</script>");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.setContentType("text/html;charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.print("<script language=\"javascript\">alert('录入失败，请重试');window.location.href='/MM/goodsreceipt.jsp'</script>");

		}
	}



}
