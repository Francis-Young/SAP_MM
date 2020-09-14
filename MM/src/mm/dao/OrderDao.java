package mm.dao;

import mm.bean.Order;
import mm.utils.DBUtil;
import java.sql.*;
import java.util.ArrayList;

public class OrderDao {
	//插入一张请购单
	public static String addOrder(Order qo) {
		//建立与数据库的连接
		int num=0;
		String code="error";
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+ "insert into `Order`" +" (order_num,rfq_code,vendor_code,docdate,pur_org,pur_group) "+"values(default,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
		
			psmt.setString(1, qo.getRfq_code());
			psmt.setString(2, qo.getVendor_code());
			psmt.setDate(3, qo.getDocdate());
			psmt.setString(4, qo.getPur_org());
			psmt.setString(5, qo.getPur_group());
			System.out.println(sql);
			psmt.execute();
			
			sql="SELECT LAST_INSERT_ID()";
			psmt = conn.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {  
				num= rs.getInt(1);
				code = insertcode(num);
		    }
			
			
		}catch(SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		return code;
	}
	//根据编号查询
	public static Order findOrderByCode(String code) {
		
		Order rq=new Order();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from `Order` where order_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, code);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rq.setOrder_num(rs.getInt("order_num"));
				rq.setRfq_code(rs.getString("rfq_code"));
				rq.setVendor_code(rs.getString("vendor_code"));
				rq.setDocdate(rs.getDate("docdate"));
				rq.setPur_org(rs.getString("pur_org"));
				rq.setPur_group(rs.getString("pur_group"));
				rq.setOrder_code(rs.getString("order_code"));
				System.out.println("orderdao_Pur_group"+rq.getPur_group());
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rq;
	}
	//根据rfq编号查询
	public static Order findOrderByRFQCode(String code) {
		
		Order rq=new Order();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from `Order` where rfq_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, code);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rq.setOrder_num(rs.getInt("order_num"));
				rq.setRfq_code(rs.getString("rfq_code"));
				rq.setVendor_code(rs.getString("vendor_code"));
				rq.setDocdate(rs.getDate("docdate"));
				rq.setPur_org(rs.getString("pur_org"));
				rq.setPur_group(rs.getString("pur_group"));
				rq.setOrder_code(rs.getString("order_code"));
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rq;
	}
	
	//根据供应商编号查询 
	public static ArrayList<Order> findOrderByVendorCode(String code) {
		ArrayList<Order> qolist=new ArrayList<Order>();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from `Order` where vendor_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString (1, code);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Order qo=new Order();

				qo.setOrder_num(rs.getInt("order_num"));
				qo.setRfq_code(rs.getString("rfq_code"));
				qo.setVendor_code(rs.getString("vendor_code"));
				qo.setDocdate(rs.getDate("docdate"));
				qo.setPur_org(rs.getString("pur_org"));
				qo.setPur_group(rs.getString("pur_group"));
				qo.setOrder_code(rs.getString("order_code"));
				qolist.add(qo);
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return qolist;
	}
	
	//判断某报价单号否存在，若存在则返回true，若不存在返回false
	public static boolean isqoNumExist(int num) {
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
			//查询语句，根据学号查询
			String sql=""+"select * from `Order_item` where Order_code = ?";
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
	
	
	

	
	//修改报价单
	public static int modifyOrderByCode(Order qo) {
		
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		int res=-1;
		try {
		
			String sql=""+"update `Order` set rfq_code = ?, vendor_code = ? docdate =? ,pur_org =? ,pur_group =? where order_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, qo.getRfq_code());
			psmt.setString(2, qo.getVendor_code());
			
			psmt.setDate(3, qo.getDocdate());
			psmt.setString(4, qo.getPur_org());
			psmt.setString(5, qo.getPur_org());
			psmt.setString(6, qo.getOrder_code());
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
	
	//修改报价单
	public static int deleteOitemByOnum(String order_num) {
		
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		int res=-1;
		try {
		
			String sql=""+"delete from `Order_item` where order_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, order_num);
			
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
	public static String insertcode(int num) {//生成code
		
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		int res=-1;
		
		int lenofav=8;
		String char0="";
		String snum=String.valueOf(num);
		for(int i=1;i<=lenofav-snum.length();i++)
		{
			char0+="0";
		}
		String code="45"+char0+snum;
		
		try {
			
			String sql=""+"update `Order` set order_code=? where order_num = ? ";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, code);
			
			psmt.setInt(2, num);
			//执行查询语句
			res= psmt.executeUpdate();
		
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		return code;
		
	}
}
