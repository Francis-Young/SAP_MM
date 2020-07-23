package mm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mm.dao.PayDao;
import mm.dao.VendorDao;
import java.util.Date;
import java.text.SimpleDateFormat;
@WebServlet("/CreatePay")
/**
 * Servlet implementation class CreatePayController
 */
public class CreatePayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreatePayController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		request.getRequestDispatcher("/createaccount.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int order = Integer.parseInt(request.getParameter("o_num").trim());
			System.out.println(order);
			int vendor = Integer.parseInt(request.getParameter("o_vendor").trim());
			float amount = Float.parseFloat(request.getParameter("o_price".trim()));
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			String time=df.format(new Date());
			int status = Integer.parseInt(request.getParameter("p_status").trim());
			int user=100000;//等待传值
			PayDao vdao=new PayDao();//实例化后端类
			vdao.addPay(order,amount,vendor,status,time,user);//调用函数
		} catch (Exception e) {
		    e.printStackTrace();
		}
		response.sendRedirect("createpayment.jsp");//更新页面
		return;
	}

}
