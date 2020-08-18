package mm.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mm.bean.User;
import mm.dao.LoginDao;
import mm.utils.Permissions;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		request.getRequestDispatcher("/login.jsp").forward(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String unum = request.getParameter("unum");
		String upswd = request.getParameter("ucode");

		LoginDao loginDao = new LoginDao();
		boolean valid = loginDao.isValid(unum, upswd);
		if (valid) {
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(2 * 60 * 10);

			User user = new User();
			Permissions p=new Permissions();
			loginDao.initUser(user, unum);
			session.setAttribute("unum", unum);
			session.setAttribute("uportrait", user.getUser_portrait());
			session.setAttribute("uname", user.getUser_name());
			session.setAttribute("upermission", p.getPermissionName(unum));
			response.sendRedirect("Home");
			return;
		} else {
			request.setAttribute("error", "请输入正确的用户ID及密码！");
			doGet(request, response);
			return;
		}
	}

}
