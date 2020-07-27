package mm.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        // TODO Auto-generated constructor stub
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			
			//基本数据部分
			int order = Integer.parseInt(request.getParameter("order_num").trim());
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
			
			//运输数据部分
			//int itemNo = Integer.parseInt(request.getParameter("itemNo"));
			//System.out.println(itemNo);
			String td_2=request.getParameter("td_2");
			System.out.println(td_2);
			String td_3=request.getParameter("td_3");
			System.out.println(td_3);
			String td_4=request.getParameter("td_4");
			System.out.println(td_4);
			String td_5=request.getParameter("td_5");
			System.out.println(td_5);
			
			
		}catch (Exception e) {
		    e.printStackTrace();
		}
	}

}
