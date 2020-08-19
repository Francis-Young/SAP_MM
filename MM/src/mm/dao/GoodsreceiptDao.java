package mm.dao;

import java.sql.*;

import org.json.*;

import mm.bean.GoodsReceipt;
import mm.bean.Order;
import mm.bean.Requisition;
import mm.utils.DBUtil;

public class GoodsreceiptDao {
	public int addgoodsreceipt(GoodsReceipt gr) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement stat = null;
		int num = 0;
		try {
			String sql = ""
					+ "INSERT INTO Delivery"
					+ " (delivery_num,purchase_order_num,posting_date,document_date,delivery_note) "
					+ "VALUES (default,?,?,?,?)";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, gr.getOrder_num());
			stat.setString(2, gr.getPosting_date());
			stat.setString(3, gr.getDocument_date());
			stat.setString(4, gr.getDelivery_note());

			stat.execute();

			sql = "SELECT LAST_INSERT_ID()";
			stat = conn.prepareStatement(sql);
			ResultSet rs = stat.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(conn);
		return num;

	}

	public static Order findOrderByVendor(String o_vendor) {

		Order od = new Order();

		// 建立数据库连接
		Connection conn = DBUtil.getConnection();
		try {

			String sql = "" + "select * from Order where vendor_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, o_vendor);
			// 执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {

				od.setDocdate(rs.getDate("docdate"));
				od.setOrder_num(rs.getInt("order_num"));
				od.setPur_org(rs.getString("pur_org"));
				od.setRfq_code(rs.getString("rfq_code"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NullPointerException f) {
			f.printStackTrace();
		} finally {
			DBUtil.closeConnection(conn);
		}

		return od;
	}
}
