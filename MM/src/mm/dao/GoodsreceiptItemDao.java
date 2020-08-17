package mm.dao;

import java.sql.*;

import org.json.*;

import mm.bean.GoodsReceipt;
import mm.utils.DBUtil;

public class GoodsreceiptItemDao {
	public void addgoodsreceiptitem(GoodsReceipt gr) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement stat = null;
		try {
			String sql = ""+"INSERT INTO Delivery_item"+"(material_num,delivery_num,OK,material_amount,storage_location)"+"VALUES (?,?,?,?,?)";
			stat = conn.prepareStatement(sql);
			stat.setString(1, gr.getM_text());//物料名
			stat.setInt(2, gr.getDelivery_num());
			stat.setString(3, gr.getCheck());
			stat.setInt(4, gr.getM_num());//物料数
			stat.setString(5, gr.getSloc());
			
			stat.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(conn);
	
	}
	public int getmaterialamout(GoodsReceipt gr){
		Connection conn = DBUtil.getConnection();
		PreparedStatement stat = null;
		
		try {
			String sql2 = ""+"SELECT * FROM Material WHERE material_num=?";
			stat = conn.prepareStatement(sql2);
			stat.setString(1, gr.getM_text());
			ResultSet rs = stat.executeQuery();
			while (rs.next()) {
				gr.setPre_m_num(rs.getInt("material_amount"));
			}
			
			int f_num = gr.getPre_m_num()-gr.getM_num();
			return f_num;
		}catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(conn);
		return 0;
	
	}
	public void changematerial(GoodsReceipt gr) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement stat = null;
		int x=-1;
		
		try {
			
			int f_num = getmaterialamout(gr);
			
			String sql1 = ""+"UPDATE Material SET material_amount=? WHERE material_num=?"+"VALUES (?,?)";
			stat = conn.prepareStatement(sql1);
			stat.setInt(1, f_num);
			stat.setString(2, gr.getM_text());
			
			stat.executeUpdate();
										

		} catch (SQLException e) {
			e.printStackTrace();
		}
		catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
	}
	public void showstock(GoodsReceipt gr) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement stat = null;
		int x=-1;
		
		try {
			
			String sql1 = ""+"SELECT * FROM Material WHERE material_num=?";
			stat = conn.prepareStatement(sql1);
			stat.setString(1, gr.getM_text());
			ResultSet rs = stat.executeQuery();
			if(rs.next()){
				gr.setEnd_m_num(rs.getInt("material_amount"));
			}
										

		} catch (SQLException e) {
			e.printStackTrace();
		}
		catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
	}
}
