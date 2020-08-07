package mm.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mm.bean.Vendor;
import mm.dao.VendorDao;

/**
 * Servlet implementation class MaintainVendorController
 */
public class MaintainVendorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MaintainVendorController() {
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
		VendorDao vdao = new VendorDao();
		ArrayList<String> reconacct = new ArrayList<String>();
		ArrayList<String> paymentterms = new ArrayList<String>();
		ArrayList<String> language = new ArrayList<String>();
		ArrayList<String> currency = new ArrayList<String>();
		vdao.initCreateTable(reconacct,paymentterms,currency,language);
		request.setAttribute("reconacct", reconacct);
		request.setAttribute("paymentterms", paymentterms);
		request.setAttribute("currency", currency);
		request.setAttribute("language", language);
		
		String vnum=request.getParameter("v");
		VendorDao vd=new VendorDao();
		Vendor v=new Vendor();
		vd.findVendor(vnum, v);
		request.setAttribute("vendor", v);
		request.getRequestDispatcher("/maintainvendor.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		return;
	}

}
