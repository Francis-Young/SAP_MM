package mm.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mm.bean.DownList;
import mm.bean.Vendor;
import mm.dao.VendorDao;
import mm.utils.Permissions;

/**
 * Servlet implementation class CreateVendorController
 */
@WebServlet("/CreateVendor")
public class CreateVendorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateVendorController() {
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
		HttpSession session=request.getSession();
		Permissions permission=new Permissions();
		boolean flag=permission.checkPermission("CreateVendor",(String)session.getAttribute("unum"));
		if (!flag) {
			request.getRequestDispatcher("/403.html").forward(request, response);
			return;
		}
		
		VendorDao vdao = new VendorDao();
		ArrayList<DownList> reconacct = new ArrayList<DownList>();
		ArrayList<DownList> paymentterms = new ArrayList<DownList>();
		ArrayList<DownList> language = new ArrayList<DownList>();
		ArrayList<DownList> currency = new ArrayList<DownList>();
		vdao.initCreateTable(reconacct, "300000", paymentterms, "0001", currency, "RMB", language, "ZH-CN");
		request.setAttribute("reconacct", reconacct);
		request.setAttribute("paymentterms", paymentterms);
		request.setAttribute("currency", currency);
		request.setAttribute("language", language);
		request.getRequestDispatcher("/createvendor.jsp").forward(request, response);
		
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
		String notice = "创建失败，请检查输入的信息";
		String color = "#ed5565";
		if (v.getVname() != null && !"".equals(v.getVname())) {
			VendorDao vdao = new VendorDao();
			String vnum = "";
			try {
				vnum = vdao.addVendor(v);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (vnum != null && !"".equals(vnum)) {
				notice = "成功创建供应商" + vnum;
				color = "#1ab394";
			}
		}
		request.setAttribute("notice", notice);
		request.setAttribute("color", color);
		doGet(request, response);
		return;
	}
}
