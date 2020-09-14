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

	public int orderchecked(GoodsReceipt gr){
		Connection conn = DBUtil.getConnection();
		PreparedStatement stat = null;
		String sql="";
		int x = 2;
		try{
			sql = ""+"SELECT * FROM `Order` WHERE order_code=?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, gr.getOrder_num());
			ResultSet rs = stat.executeQuery();
			while (rs.next()) {
				
				if(rs.getInt("receipt_checked")==1){
						x = 1;//配送未完成
				}else{
					if(rs.getInt("receipt_checked")==0){
						x = 0;//配送完了
					}
				}
				}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return x;
	}
	public int itemchecked(GoodsReceipt gr){
		Connection conn = DBUtil.getConnection();
		PreparedStatement stat = null;
		String sql="";
		int x = 2;
		try{
			sql = ""+"SELECT * FROM `Order_item` WHERE material_num=? AND order_code=?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, gr.getM_text());
			stat.setString(2, gr.getOrder_num());
			ResultSet rs = stat.executeQuery();
			while (rs.next()) {
				
				if(rs.getInt("begin_checked")==0){
						x = 0;//配送未开始
				}else{
					if(rs.getInt("begin_checked")==1){
						x = 1;//配送已开始
					}
				}
				}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return x;
	}
	public int orderitemchecked(GoodsReceipt gr){
		Connection conn = DBUtil.getConnection(); 
		PreparedStatement stat = null;
		int x = -1;
		int y = -1;
		y = orderchecked(gr);
		int z = -1;
		z = itemchecked(gr);
		if(y==0){
			x = 3;//订单已完成配送
		}
		if(y==1){
			if(z==0){
				String sql="";
				try{
				sql = ""+"SELECT * FROM `Order_item` WHERE material_num=? AND order_code=?";
				stat = conn.prepareStatement(sql);
				stat.setString(1, gr.getM_text());
				stat.setString(2, gr.getOrder_num());
				ResultSet rs = stat.executeQuery();
				while (rs.next()) {
					gr.setReceipt_checked(rs.getInt("quantity"));
				}
				if(gr.getReceipt_checked()<gr.getM_num()){
					x = 0;//物料数量超过
				}else{
					sql=""+"UPDATE `Order_item` SET receipt_checked=? WHERE order_code=? AND material_num=?";
					stat = conn.prepareStatement(sql);
					stat.setInt(1, gr.getReceipt_checked()-gr.getM_num());
					stat.setString(2, gr.getOrder_num());
					stat.setString(3, gr.getM_text());
					stat.executeUpdate();
					sql=""+"UPDATE `Order_item` SET begin_checked=? WHERE order_code=? AND material_num=?";
					stat = conn.prepareStatement(sql);
					stat.setInt(1, 1);
					stat.setString(2, gr.getOrder_num());
					stat.setString(3, gr.getM_text());
					stat.executeUpdate();
					x = 1;//可以进行配送 
				}
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(z==1){
				String sql="";
				try{
				sql = ""+"SELECT * FROM `Order_item` WHERE material_num=? AND order_code=?";
				stat = conn.prepareStatement(sql);
				stat.setString(1, gr.getM_text());
				stat.setString(2, gr.getOrder_num());
				ResultSet rs = stat.executeQuery();
				while (rs.next()) {
					gr.setReceipt_checked(rs.getInt("receipt_checked"));
				}
				if(gr.getReceipt_checked()<gr.getM_num()){
					x = 0;//物料数量超过
				}else{
					sql=""+"UPDATE `Order_item` SET receipt_checked=? WHERE order_code=? AND material_num=?";
					stat = conn.prepareStatement(sql);
					stat.setInt(1, gr.getReceipt_checked()-gr.getM_num());
					stat.setString(2, gr.getOrder_num());
					stat.setString(3, gr.getM_text());
					stat.executeUpdate();
					x = 1;//可以进行配送 
				}
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
			String sql="";
			try{
			int oc=-1;
			sql = ""+"SELECT * FROM `Order_item` WHERE order_code=?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, gr.getOrder_num());
			ResultSet rs = stat.executeQuery();
			while (rs.next()) {
				if(rs.getInt("receipt_checked")>oc){
					oc=rs.getInt("receipt_checked");
				}
			}
			if(oc==0){
				sql=""+"UPDATE `Order` SET receipt_checked=? WHERE order_code=?";
				stat = conn.prepareStatement(sql);
				stat.setInt(1, 0);
				stat.setString(2, gr.getOrder_num());
				stat.executeUpdate();
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		finally {
			DBUtil.closeConnection(conn);
		}
		}
		return x;
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
	public int checkmat(GoodsReceipt gr) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement stat = null;
		int x=1;//存在物料

		try {

			String sql= ""
					+ "SELECT * FROM Inventory WHERE material_num=? AND material_storageloc=?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, gr.getM_text());
			stat.setString(2, gr.getSloc());
			ResultSet rs = stat.executeQuery();
			
			if(rs.next()==false)
			{
				x=0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(conn);
		}
		return x;
	}

}
