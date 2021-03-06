package mm.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class LoginFilter
 */

@WebFilter("/*") 
public class LoginFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public LoginFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {

		HttpServletResponse response = (HttpServletResponse) arg1;
		HttpServletRequest request = (HttpServletRequest) arg0;
		response.setDateHeader("Expires",-1); //IE游览器支持的
		
		//保证兼容性
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragme", "no-cache");
		HttpSession session = request.getSession(true);
		String unum = (String) session.getAttribute("unum");//
		String url = request.getRequestURI();
		if(url.endsWith(".css") || url.endsWith(".js") || url.endsWith(".png")|| url.endsWith(".jpg")){
            //如果发现是css或者js文件，直接放行
			arg2.doFilter(arg0, arg1);
		    return;
            }
		if (unum == null || unum.equals("")) {
			// �жϻ�ȡ��·����Ϊ���Ҳ��Ƿ��ʵ�¼ҳ���ִ�е�¼����ʱ��ת
			if (url != null && !url.equals("") && (url.indexOf("Login") < 0 && url.indexOf("login") < 0)) {
				
				response.setDateHeader("Expires",-1); //IE游览器支持的
				
				//保证兼容性
				response.setHeader("Cache-Control", "no-cache");
				response.setHeader("Pragme", "no-cache");
				request.getRequestDispatcher("/401.html").forward(request, response);
				return;
			}
		}
		// ��ͨ����֤���û����ʼ���
		arg2.doFilter(arg0, arg1);
	    return;
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
