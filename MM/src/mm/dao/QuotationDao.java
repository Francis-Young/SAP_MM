package mm.dao;

import mm.bean.Quotation;
import mm.bean.Requisition_item;
import mm.utils.DBUtil;
import java.sql.*;
import java.util.ArrayList;

public class QuotationDao {
	//插入一张请购单
	public static void addQuotation(Quotation qo) {
		//建立与数据库的连接
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+ "insert into Quotation" +" (quotation_num,rfq_num,vendor_num) "+"values(default,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
		
			psmt.setInt(1, qo.getRfq_num());
			psmt.setInt(2, qo.getVendor_num());
	
			psmt.execute();
		}catch(SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
	}
	//根据编号查询
	public static Quotation findQuotationByNum(int num) {
		
		Quotation rq=new Quotation();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Quotation where quotation_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rq.setQuotation_num(rs.getInt("quotation_num"));
				rq.setRfq_num(rs.getInt("rfq_num"));
				rq.setVendor_num(rs.getInt("vendor_num"));
				
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
	public static Quotation findQuotationByRFQNum(int num) {
		
		Quotation rq=new Quotation();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Quotation where rfq_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rq.setQuotation_num(rs.getInt("quotation_num"));
				rq.setRfq_num(rs.getInt("rfq_num"));
				rq.setVendor_num(rs.getInt("vendor_num"));
				
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
	//对同一个rfq能有多个报价单吗？
	//根据供应商编号查询 
	public static ArrayList<Quotation> findQuotationByVendorNum(int num) {
		ArrayList<Quotation> qolist=new ArrayList<Quotation>();
		Quotation qo=new Quotation();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Quotation where vendor_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
			
				qo.setQuotation_num(rs.getInt("quotation_num"));
				qo.setRfq_num(rs.getInt("rfq_num"));
				qo.setVendor_num(rs.getInt("vendor_num"));
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
			String sql=""+"select * from Quotation where quotation_num = ?";
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
	public static int modifyQuotationByNum(Quotation qo) {
		
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		int res=-1;
		try {
		
			String sql=""+"update Quotation set rfq_num = ?, vendor_num = ? where quotation_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, qo.getRfq_num());
			psmt.setInt(2, qo.getVendor_num());
			
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
