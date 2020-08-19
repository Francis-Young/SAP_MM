package mm.dao;


import mm.bean.Order_item;
import mm.bean.Requisition_item;
import mm.utils.DBUtil;
import java.sql.*;
import java.util.ArrayList;

public class OrderItemDao {
	//插入一张请购单
	public static void addOrderItem(Order_item oi) {
		//建立与数据库的连接
		Connection conn=DBUtil.getConnection();
		try {
			int order_num_m=OrderDao.findOrderByCode(oi.getOrder_code()).getOrder_num();
			String sql=""+ "insert into Order_item" +" (order_item_num,`order_code`,purchase_requisition_num,price,quantity,delivery_date,currency_unit,material_num,sloc,plant,order_num_m) "+"values(default,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
		
			psmt.setString(1, oi.getOrder_code());
			psmt.setInt(2, oi.getPurchase_requisition_num());
			psmt.setBigDecimal(3, oi.getPrice());
			psmt.setInt(4, oi.getQuantity());
			psmt.setDate(5, oi.getDelivery_date());
			psmt.setString(6, oi.getCurrency_unit());
			psmt.setString(7, oi.getMaterial_num());
			psmt.setString(8, oi.getSloc());
			psmt.setString(9, oi.getPlant());
	
			psmt.setInt(10, order_num_m);
			psmt.execute();
		}catch(SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
	}
	//根据编号查询
	public static Order_item findOrderItemByOiNum(int num) {
		
		Order_item oi=new Order_item();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Order_item where order_item_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
				oi.setOrder_item_num(rs.getInt("order_item_num"));
				oi.setOrder_code(rs.getString("order_code"));
				oi.setPrice(rs.getBigDecimal("price"));
				oi.setPurchase_requisition_num(rs.getInt("purchase_requisition_num"));
				oi.setQuantity(rs.getInt("quantity"));
				oi.setCurrency_unit(rs.getString("currency_unit"));
				oi.setDelivery_date(rs.getDate("delivery_date"));
				oi.setMaterial_num(rs.getString("material_num"));
				oi.setPlant(rs.getString("plant"));
				oi.setSloc(rs.getString("sloc"));
				oi.setOrder_item_num(rs.getInt("order_num_m"));
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return oi;
	}
	//根据编号查询
	public static ArrayList<Order_item> findOrderItemByOCode(String code) {
		ArrayList <Order_item> oilist = new ArrayList<Order_item>();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Order_item where order_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, code);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Order_item oi=new Order_item();

				oi.setOrder_item_num(rs.getInt("order_item_num"));
				oi.setOrder_code(rs.getString("order_code"));
				oi.setPrice(rs.getBigDecimal("price"));
				oi.setPurchase_requisition_num(rs.getInt("purchase_requisition_num"));
				oi.setQuantity(rs.getInt("quantity"));
				oi.setCurrency_unit(rs.getString("currency_unit"));
				oi.setDelivery_date(rs.getDate("delivery_date"));
				oi.setMaterial_num(rs.getString("material_num"));
				oi.setPlant(rs.getString("plant"));
				oi.setSloc(rs.getString("sloc"));
				oi.setOrder_item_num(rs.getInt("order_num_m"));
				oi.setStat_delivery_date(rs.getDate("stat_delivery_date"));

				oilist.add(oi);
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return oilist;
	}
	
	//根据order编号查询 
	public static ArrayList<Order_item> findOrderByVendorCode(String code) {
		ArrayList<Order_item> oilist=new ArrayList<Order_item>();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Order_item where vender_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, code);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Order_item oi=new Order_item();
				oi.setOrder_item_num(rs.getInt("order_item_num"));
				oi.setOrder_code(rs.getString("order_code"));
				oi.setPrice(rs.getBigDecimal("price"));
				oi.setPurchase_requisition_num(rs.getInt("purchase_requisition_num"));
				oi.setQuantity(rs.getInt("quantity"));
				oi.setCurrency_unit(rs.getString("currency_unit"));
				oi.setDelivery_date(rs.getDate("delivery_date"));
				oi.setMaterial_num(rs.getString("material_num"));
				oi.setOrder_item_num(rs.getInt("order_num_m"));

				oilist.add(oi);
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return oilist;
	}
	
	//判断某订单条目号否存在，若存在则返回true，若不存在返回false
	public static boolean isOiNumExist(int num) {
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
			//查询语句，根据学号查询
			String sql=""+"select * from Order_item where Order_item_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
				return true;
				
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		return false;
	}
	
	
	
	//修改订单条目
	public static int modifyOrderItem(Order_item oi) {
		
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		int res=-1;
		try {
		
			String sql=""+"update Order_item set order_code = ? ,purchase_requisition_num = ? ,price = ? ,quantity = ? ,delivery_date = ? ,currency_unit = ? ,material_num = ? ,plant=?,sloc=?, where order_item_num= ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, oi.getOrder_code());
			psmt.setInt(2, oi.getPurchase_requisition_num());
			psmt.setBigDecimal(3, oi.getPrice());
			psmt.setInt(4, oi.getQuantity());
			psmt.setDate(5, oi.getDelivery_date());
			psmt.setString(6, oi.getCurrency_unit());
			psmt.setString(7, oi.getMaterial_num());
			psmt.setString(8, oi.getPlant());
			psmt.setString(9, oi.getSloc());
			psmt.setInt(10, oi.getOrder_item_num());
			
			
			//执行查询语句
			res= psmt.executeUpdate();
		
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		return res;
		
	}	
	//删除订单条目
	public static int deleteOrderByNum(int num) {
		
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		int res=-1;
		try {
		
			String sql=""+"delete from Order_item where order_item_num= ? ";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
		
			//执行查询语句
			res= psmt.executeUpdate();
		
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		return res;
		
	}	
	
	
}
