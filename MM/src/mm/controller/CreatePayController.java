package mm.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
			int vendor = 100000;//后续查sql订正
			float amount = Float.parseFloat(request.getParameter("o_price".trim()));
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
			java.util.Date addtime=df.parse(changedate(request.getParameter("p_time".trim())));
			String time=df.format(addtime);
			int status = 0;//在update中才能更新
			int user=100000;//等待传值
			String text=request.getParameter("o_text").trim();
			PayDao vdao=new PayDao();//实例化后端类
			int x=vdao.addPay(order,amount,vendor,status,time,user,text);//调用函数
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			if(x==1) {
			out.print("<script language=\"javascript\">alert('创建成功！');window.location.href='/MM/createpayment.jsp'</script>");
			}
			else
			{
				out.print("<script language=\"javascript\">alert('创建失败！请重试');window.location.href='/MM/createpayment.jsp'</script>");

			}
		} catch (Exception e) {
		    e.printStackTrace();
			response.setContentType("text/html;charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.print("<script language=\"javascript\">alert('创建失败！请重试');window.location.href='/MM/createpayment.jsp'</script>");

		}
		response.setContentType("text/html;charset=UTF-8");
		return;
	}
	public String changedate(String date){
		String s1=date.substring(0,2);//M
		String s2=date.substring(3,5);//D
		String s3=date.substring(6,10);//Y

		return s3+"-"+s1+"-"+s2;
	}
}
