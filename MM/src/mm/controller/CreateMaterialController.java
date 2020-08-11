package mm.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mm.bean.Material;
import mm.bean.Vendor;
import mm.dao.VendorDao;

/**
 * Servlet implementation class CreateMaterialController
 */
public class CreateMaterialController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateMaterialController() {
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

		request.getRequestDispatcher("/creatematerial.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");

		Material m = new Material();
		String mnum = request.getParameter("mnum");
		m.setMaterial_num(request.getParameter("mnum"));
		m.setMaterial_discr(request.getParameter("mdiscr"));
		m.setMaterial_baseunit(request.getParameter("mbaseunit"));
		m.setMaterial_industrysec(request.getParameter("mindustrysec"));
		m.setMaterial_salesorg(request.getParameter("msalesorg"));
		m.setMaterial_distrchannel(request.getParameter("mdistrchannel"));
		m.setMaterial_group(request.getParameter("mgroup"));
		m.setMaterial_division(request.getParameter("mdivision"));
		m.setMaterial_unitprice(request.getParameter("munitprice"));
		m.setMaterial_availabilitycheck(request.getParameter("mavailabilitycheck"));
		m.setMaterial_purchasinggroup(request.getParameter("mpurchasinggroup"));
		m.setMaterial_MRPtype(request.getParameter("mMRPtype"));
		m.setMaterial_MRPcontroller(request.getParameter("mMRPcontroller"));
		m.setMaterial_lotsizingprocedure(request.getParameter("mlotsizingprocedure"));
		m.setMaterial_minimumlotsize(request.getParameter("mminimumlotsize"));
		m.setMaterial_planneddelivtime(request.getParameter("mplanneddelivtime"));
		m.setMaterial_shorttext(request.getParameter("mshorttext"));
		String notice = "创建失败，请检查输入的信息";
		String color = "#ed5565";
		if (m.getMaterial_num() != null && !"".equals(m.getMaterial_num())) {
			VendorDao mdao = new VendorDao();
			boolean flag = false;
			try {
				flag = mdao.addMaterial(m);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (flag == true && mnum != null && !"".equals(mnum)) {
				notice = "成功创建物料" + mnum + "主数据";
				color = "#1ab394";
			}
		}
		request.setAttribute("notice", notice);
		request.setAttribute("color", color);
		doGet(request, response);

		return;
	}

}
