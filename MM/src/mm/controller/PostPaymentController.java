package mm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mm.dao.PayDao;

/**
 * Servlet implementation class PostPaymentController
 */
public class PostPaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostPaymentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");

		try {
			
			
			int id = Integer.parseInt(request.getParameter("o_num_new").trim());
			int account = Integer.parseInt(request.getParameter("o_account").trim());

			float amount = Float.parseFloat(request.getParameter("o_price_new".trim()));
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//�������ڸ�ʽ
			java.util.Date addtime=df.parse(changedate(request.getParameter("p_time_new".trim())));
			
			String time=df.format(addtime);
			int status = 1;
			String text=request.getParameter("o_text_new").trim();
			text=new String(text.getBytes("iso8859-1"),"UTF-8");

			PayDao vdao=new PayDao();
			int x=vdao.updatePay(amount,id,status,time,text,account);
			PrintWriter out = response.getWriter();

			response.setContentType("text/html;charset=UTF-8");
			if(x==1) {
			out.print("<script language=\"javascript\">alert('付款成功');window.location.href='/MM/postpayment.jsp'</script>");
			}
			else
			{
				out.print("<script language=\"javascript\">alert('付款失败，请重试');window.location.href='/MM/postpayment.jsp'</script>");

			}
		} catch (Exception e) {
		    e.printStackTrace();
			response.setContentType("text/html;charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.print("<script language=\"javascript\">alert('付款失败，请重试');window.location.href='/MM/postpayment.jsp'</script>");

		}
		response.setContentType("text/html;charset=UTF-8");
		return;
	}
	public String changedate(String date){
		if(date.indexOf("/")>0) {
		String s1=date.substring(0,2);//M
		String s2=date.substring(3,5);//D
		String s3=date.substring(6,10);//Y
		
		return s3+"-"+s1+"-"+s2;
		}
		else
		{
			return date;
		}
	}

}
