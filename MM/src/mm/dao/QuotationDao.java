package mm.dao;

import mm.bean.Quotation;
import mm.bean.Requisition_item;
import mm.utils.DBUtil;
import java.sql.*;
import java.util.ArrayList;

public class QuotationDao {
	//插入一张请购单
	public static String addQuotation(Quotation qo) {
		//建立与数据库的连接
		int num=0;
		
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+ "insert into Quotation" +" (quotation_code,rfq_code,vendor_code) "+"values(?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, qo.getRfq_code());
			psmt.setString(2, qo.getRfq_code());
			psmt.setString(3, qo.getVendor_code());
	
			psmt.execute();
			
			
		    
			
		}catch(SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		return qo.getRfq_code();
	}
	//根据编号查询
	public static Quotation findQuotationByCode(String code) {
		
		Quotation rq=new Quotation();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Quotation where quotation_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, code);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rq.setQuotation_num(rs.getInt("quotation_num"));
				rq.setRfq_code(rs.getString("rfq_code"));
				rq.setVendor_code(rs.getString("vendor_code"));
				rq.setQuotation_code(rs.getString("quotation_code"));
				
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
	public static Quotation findQuotationByRFQCode(String code) {
		
		Quotation rq=new Quotation();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Quotation where rfq_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, code);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rq.setQuotation_num(rs.getInt("quotation_num"));
				rq.setRfq_code(rs.getString("rfq_code"));
				rq.setVendor_code(rs.getString("vendor_code"));
				rq.setQuotation_code(rs.getString("quotation_code"));

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
	public static ArrayList<Quotation> findQuotationByVendorCode(String code) {
		ArrayList<Quotation> qolist=new ArrayList<Quotation>();
		Quotation qo=new Quotation();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Quotation where vendor_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, code);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
			
				qo.setQuotation_num(rs.getInt("quotation_num"));
				qo.setRfq_code(rs.getString("rfq_code"));
				qo.setVendor_code(rs.getString("vendor_code"));
				qo.setQuotation_code(rs.getString("quotation_code"));

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
	public static boolean isqoCodeExist(String code) {
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
			//查询语句，根据学号查询
			String sql=""+"select * from Quotation where quotation_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, code);
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
	public static int modifyQuotationByCode(Quotation qo) {
		
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		int res=-1;
		try {
		
			String sql=""+"update Quotation set rfq_code = ?, vendor_code = ? value=? where quotation_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, qo.getRfq_code());
			psmt.setString(2, qo.getVendor_code());
			psmt.setBigDecimal(3, qo.getValue());
			psmt.setString(4, qo.getQuotation_code());
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

