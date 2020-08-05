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
		vdao.initCreateTable(reconacct, paymentterms, currency, language);
		request.setAttribute("reconacct", reconacct);
		request.setAttribute("paymentterms", paymentterms);
		request.setAttribute("currency", currency);
		request.setAttribute("language", language);

		String vnum = request.getParameter("v");
		if (vnum != null && !"".equals(vnum)) {
			System.out.println(vnum);
			VendorDao vd = new VendorDao();
			Vendor v = new Vendor();
			vd.findVendor(vnum, v);
			request.setAttribute("vendor", v);
			System.out.println(v.getVcurrency());
		}
		request.getRequestDispatcher("/maintainvendor.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		Vendor v = new Vendor();
		v.setVtype(request.getParameter("vtype"));
		v.setVname(request.getParameter("vname"));
		v.setVtaxnum(request.getParameter("vtax"));
		v.setVcompanycode(request.getParameter("vcompanycode"));
		v.setVreconacct(request.getParameter("vreconacct"));
		v.setVpaymentterms(request.getParameter("vpaymentterms"));
		v.setVcurrency(request.getParameter("vcurrency"));
		v.setVstreet(request.getParameter("vstreet"));
		v.setVpostalcode(request.getParameter("vpostalcode"));
		v.setVcity(request.getParameter("vcity"));
		v.setVcountry(request.getParameter("vcountry"));
		v.setVregion(request.getParameter("vregion"));
		v.setVlanguage(request.getParameter("vlanguage"));
		v.setVclerk(request.getParameter("vclerk"));
		String notice = "保存失败，请检查输入的信息";
		String color = "#ed5565";
		System.out.println("1");
		VendorDao vdao = new VendorDao();
		String vnum = request.getParameter("v");
		System.out.println("222:"+vnum);
		System.out.println("2");
		System.out.println("3");
		vdao.updateVendor(vnum, v);;
		if (vnum != null && !"".equals(vnum)) {
			notice = "成功保存供应商" + vnum;
			color = "#1ab394";
			System.out.println("4");
		}
		System.out.println("5");

		request.setAttribute("notice", notice);
		request.setAttribute("color", color);
		doGet(request, response);
		return;
	}

}
