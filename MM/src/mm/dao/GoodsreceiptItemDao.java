package mm.dao;

import java.sql.*;
import java.sql.ResultSet;
import org.json.*;

import mm.bean.GoodsReceipt;
import mm.utils.DBUtil;

public class GoodsreceiptItemDao {
	public void addgoodsreceiptitem(GoodsReceipt gr) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement stat = null;
		try {

			String sql = ""
					+ "INSERT INTO Delivery_item"
					+ "(material_num,delivery_num,OK,material_amount,storage_location)"
					+ "VALUES (?,?,?,?,?)";
			stat = conn.prepareStatement(sql);
			stat.setString(1, gr.getM_text());// 物料名
			stat.setInt(2, gr.getDelivery_num());
			stat.setString(3, gr.getCheck());
			stat.setInt(4, gr.getM_num());// 物料数
			stat.setString(5, gr.getSloc());
			stat.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(conn);

	}

	public int changeinventory(GoodsReceipt gr) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement stat = null;
		int x = -1;
		String sql="";
		try {

			sql = "" + "SELECT * FROM Inventory WHERE material_num=?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, gr.getM_text());
			ResultSet rs = stat.executeQuery();
			while (rs.next()) {
				gr.setPre_m_num(rs.getInt("material_storagenum"));
			}
			gr.setEnd_m_num(gr.getPre_m_num() + gr.getM_num());
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			
			sql = ""
					+ "UPDATE Inventory SET material_storagenum=? WHERE material_num=? AND material_storageloc=?";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, gr.getEnd_m_num());
			stat.setString(2, gr.getM_text());
			stat.setString(3, gr.getSloc());
			x = stat.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		finally {
			DBUtil.closeConnection(conn);
		}
		return x;
	}

	public void showstock(GoodsReceipt gr) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement stat = null;

		try {

			String sql= ""
					+ "SELECT * FROM Inventory WHERE material_num=? AND material_storageloc=?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, gr.getM_text());
			stat.setString(2, gr.getSloc());
			ResultSet rs = stat.executeQuery();
			while (rs.next()) {
				gr.setEnd_m_num(rs.getInt("material_storagenum"));
				gr.setM_text(rs.getString("material_num"));
				gr.setSloc(rs.getString("material_storageloc"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(conn);
		}
	}
}
