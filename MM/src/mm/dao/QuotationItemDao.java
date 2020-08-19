package mm.dao;


import mm.bean.Quotation_item;

import mm.utils.DBUtil;
import java.sql.*;
import java.util.ArrayList;

public class QuotationItemDao {
	//插入一张请购单
	public static void addQuotationItem(Quotation_item qi) {
		//建立与数据库的连接
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+ "insert into Quotation_item" +" (quotation_item_num,quotation_code,price,quantity,delivery_date,currency_unit,material_num,quotation_status,storageloc) "+"values(default,?,?,?,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
		
			psmt.setString(1, qi.getQuotation_code());
			psmt.setBigDecimal(2, qi.getPrice());
			psmt.setInt(3, qi.getQuantity());
			psmt.setDate(4, qi.getDelivery_date());
			psmt.setString(5, qi.getCurrency_unit());
			psmt.setString(6, qi.getMaterial_num());
			psmt.setInt(7, qi.getQuotation_status());
			psmt.setString(8, qi.getStorageloc());
			psmt.execute();
		}catch(SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
	}
	//根据编号查询
	public static ArrayList<Quotation_item> findQuotationItemByQiNum(int num) {
		ArrayList<Quotation_item> qilist = new ArrayList<Quotation_item>();
		
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Quotation_item where quotation_item_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
				Quotation_item qi=new Quotation_item();
				qi.setQuotation_item_num(rs.getInt("quotation_item_num"));
				qi.setQuotation_code(rs.getString("quotation_code"));
				qi.setPrice(rs.getBigDecimal("price"));
				qi.setQuotation_status(rs.getInt("quotation_status"));
				qi.setQuantity(rs.getInt("quantity"));
				qi.setCurrency_unit(rs.getString("currency_unit"));
				qi.setDelivery_date(rs.getDate("delivery_date"));
				qi.setMaterial_num(rs.getString("material_num"));
				qi.setStorageloc(rs.getString("storageloc"));

				qilist.add(qi);
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return qilist;
	}

	
	//根据quotation编号查询 
	public static ArrayList<Quotation_item> findQuotationByQuoCode(String code) {
		ArrayList<Quotation_item> qilist=new ArrayList<Quotation_item>();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Quotation_item where quotation_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, code);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Quotation_item qi=new Quotation_item();

				qi.setQuotation_item_num(rs.getInt("quotation_item_num"));
				qi.setQuotation_code(rs.getString("quotation_code"));
				qi.setPrice(rs.getBigDecimal("price"));
				qi.setQuotation_status(rs.getInt("quotation_status"));
				qi.setQuantity(rs.getInt("quantity"));
				qi.setCurrency_unit(rs.getString("currency_unit"));
				qi.setDelivery_date(rs.getDate("delivery_date"));
				qi.setMaterial_num(rs.getString("material_num"));
				qi.setStorageloc(rs.getString("storageloc"));
				qilist.add(qi);
				System.out.println(qi.getPrice());
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return qilist;
	}
	//根据物料查询 
	public static ArrayList<Quotation_item> findQuotationByMatNum(String num) {
		ArrayList<Quotation_item> qilist=new ArrayList<Quotation_item>();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Quotation_item where material_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Quotation_item qi=new Quotation_item();

				qi.setQuotation_item_num(rs.getInt("quotation_item_num"));
				qi.setQuotation_code(rs.getString("quotation_code"));
				qi.setPrice(rs.getBigDecimal("price"));
				qi.setQuotation_status(rs.getInt("quotation_status"));
				qi.setQuantity(rs.getInt("quantity"));
				qi.setCurrency_unit(rs.getString("currency_unit"));
				qi.setDelivery_date(rs.getDate("delivery_date"));
				qi.setMaterial_num(rs.getString("material_num"));
				qi.setStorageloc(rs.getString("storageloc"));

				qilist.add(qi);
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return qilist;
	}
	
	//判断某订单条目号否存在，若存在则返回true，若不存在返回false
	public static boolean isOiNumExist(int num) {
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
			//查询语句，根据学号查询
			String sql=""+"select * from Quotation_item where Quotation_item_num = ?";
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
	
	
	
	//修改
	public static int modifyQuotationItem(Quotation_item qi) {
		
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		int res=-1;
		try {
		
			String sql=""+"update Quotation set quotation_code = ? ,price = ? ,quantity = ? ,delivery_date = ? ,currency_unit = ? ,material_num = ?,Quotation_status= ? where quotation_item_num= ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, qi.getQuotation_code());
			psmt.setBigDecimal(2, qi.getPrice());
			psmt.setInt(3, qi.getQuantity());
			psmt.setDate(4, qi.getDelivery_date());
			psmt.setString(5, qi.getCurrency_unit());
			psmt.setString(6, qi.getMaterial_num());
			psmt.setInt(7, qi.getQuotation_status());
			
			psmt.setString(8, qi.getStorageloc());
			psmt.setInt(9, qi.getQuotation_item_num());
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
	
	//删除某一条
	public static int deleteQuotationByNum(int num) {
		
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		int res=-1;
		try {
		
			String sql=""+"delete from Quotation_item where quotation_item_num= ? ";
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
