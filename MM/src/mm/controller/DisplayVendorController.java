package mm.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mm.bean.DownList;
import mm.bean.Vendor;
import mm.dao.VendorDao;

/**
 * Servlet implementation class MaintainVendorController
 */
public class DisplayVendorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DisplayVendorController() {
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
		HttpSession session = request.getSession();
		String vnum = (String) session.getAttribute("vnum");

		VendorDao vdao = new VendorDao();
		Vendor v = new Vendor();
		if (vnum != null && !"".equals(vnum)) {
			vdao.findVendor(vnum, v);
			request.setAttribute("vendor", v);
		}

		ArrayList<DownList> reconacct = new ArrayList<DownList>();
		ArrayList<DownList> paymentterms = new ArrayList<DownList>();
		ArrayList<DownList> language = new ArrayList<DownList>();
		ArrayList<DownList> currency = new ArrayList<DownList>();
		vdao.initCreateTable(reconacct, v.getVreconacct(), paymentterms, v.getVpaymentterms(), currency,
				v.getVcurrency(), language, v.getVlanguage());
		request.setAttribute("reconaccts", reconacct);
		request.setAttribute("paymenttermss", paymentterms);
		request.setAttribute("currencys", currency);
		request.setAttribute("languages", language);
		request.getRequestDispatcher("/displayvendor.jsp").forward(request, response);
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
		VendorDao vdao = new VendorDao();
		HttpSession session = request.getSession();
		String vnum = (String) session.getAttribute("vnum");
		vdao.updateVendor(vnum, v);
		;
		if (vnum != null && !"".equals(vnum)) {
			notice = "成功保存供应商" + vnum;
			color = "#1ab394";
		}
		request.setAttribute("notice", notice);
		request.setAttribute("color", color);
		doGet(request, response);
		return;
	}

}
