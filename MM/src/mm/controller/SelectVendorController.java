package mm.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mm.bean.Vendor;
import mm.dao.VendorDao;

/**
 * Servlet implementation class MaintainVendorController
 */
public class SelectVendorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectVendorController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Vendor> v = new ArrayList<Vendor>();
		VendorDao vd = new VendorDao();
		vd.findAllVendor(v);
		request.setAttribute("vendor", v);

		String type = (String) request.getParameter("type");
		HttpSession session = request.getSession();
		session.setAttribute("selectvendortype", type);
		request.getRequestDispatcher("/selectvendor.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String v = request.getParameter("v");

		HttpSession session = request.getSession();
		session.setAttribute("vnum", v);
		String type=(String) session.getAttribute("selectvendortype");

		if (type.equals("display"))
			response.sendRedirect("DisplayVendor");
		else if (type.equals("update"))
			response.sendRedirect("MaintainVendor");
		else
			response.sendRedirect("Home");
		return;
	}

}
