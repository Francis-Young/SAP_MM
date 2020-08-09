package mm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mm.bean.DownList;

import java.util.ArrayList;

/**
 * Servlet implementation class TestController
 */
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestController() {
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
		ArrayList<DownList> list1 = new ArrayList<DownList>();
		DownList item1 = new DownList();
		item1.setListitemname("RMB");
		list1.add(item1);
		DownList item2 = new DownList();
		item2.setListitemname("USD");
		list1.add(item2);
		for (DownList l : list1) {
			if (l.getListitemname().equals("RMB")) {
				l.setSelected("selected");
			} else {
				l.setSelected("");
			}
			System.out.println(l.getListitemname() + ":" + l.getSelected());
		}

		request.setAttribute("list1", list1);

		request.getRequestDispatcher("/test.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
