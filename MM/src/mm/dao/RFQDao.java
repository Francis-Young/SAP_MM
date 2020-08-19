package mm.dao;

import mm.bean.RFQ;
import mm.bean.Requisition;
import mm.bean.Vendor;
import mm.utils.DBUtil;
import java.sql.*;
import java.util.ArrayList;

public class RFQDao {
	//插入一张RFQ
	public static String addRFQ( RFQ rf) {
		//建立与数据库的连接
		int num=0;
		String code="error";
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+ "insert into RFQ" +" (rfq_num,rfq_type,rfq_language,rfq_date,rfq_deadline,rfq_purchasing_org,rfq_purchasing_group,rfq_plant,requisition_code,vendor_code,rfq_coll) "+"values(default,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
		
			psmt.setString(1, rf.getRfq_type());
			psmt.setString(2, rf.getRfq_language());
			psmt.setDate(3, rf.getRfq_date());
			psmt.setDate(4, rf.getRfq_deadline());
			psmt.setString(5, rf.getRfq_purchasing_org());
			psmt.setString(6, rf.getRfq_purchasing_group());
			psmt.setString(7, rf.getRfq_plant());
			psmt.setString(8, rf.getRequisition_code());
			psmt.setString(9, rf.getVendor_code());
			psmt.setString(10, rf.getRfq_coll());

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
	//更新RFQ
	public static void updateRFQ( RFQ rf) {
		//建立与数据库的连接
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+ "update RFQ set rfq_type = ? ,rfq_language = ? ,rfq_date = ? ,rfq_deadline = ? ,rfq_purchasing_org = ? ,rfq_purchasing_group = ? ,rfq_plant = ? ,requisition_code = ? ,vendor_code = ? ,rfq_coll = ? where rfq_code = ? " ;
			PreparedStatement psmt = conn.prepareStatement(sql);
		
			psmt.setString(1, rf.getRfq_type());
			psmt.setString(2, rf.getRfq_language());
			psmt.setDate(3, rf.getRfq_date());
			psmt.setDate(4, rf.getRfq_deadline());
			psmt.setString(5, rf.getRfq_purchasing_org());
			psmt.setString(6, rf.getRfq_purchasing_group());
			psmt.setString(7, rf.getRfq_plant());
			psmt.setString(8, rf.getRequisition_code());
			psmt.setString(9, rf.getVendor_code());
			psmt.setString(10, rf.getRfq_coll());
			psmt.setString(11, rf.getRfq_code());
			psmt.execute();
		}catch(SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
	}
	//根据RFQ编号查询
	public static RFQ findRFQbyCode(String code) {
		
		RFQ rf=new RFQ();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from RFQ where rfq_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, code);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rf.setRequisition_code(rs.getString("requisition_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_type(rs.getString("rfq_type"));
				rf.setRfq_language(rs.getString("rfq_language"));
				rf.setRfq_date(rs.getDate("rfq_date"));
				rf.setRfq_deadline(rs.getDate("rfq_deadline"));
				rf.setRfq_purchasing_org(rs.getString("rfq_purchasing_org"));
				rf.setRfq_purchasing_group(rs.getString("rfq_purchasing_group"));
				rf.setVendor_code(rs.getString("vendor_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_num(rs.getInt("rfq_num"));
				rf.setRfq_code(rs.getString("rfq_code"));
				rf.setRfq_plant(rs.getString("rfq_plant"));
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rf;
	}
	//根据请购单号查询
	public static RFQ findRFQbyrequiCode(String code) {
		
		RFQ rf=new RFQ();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from RFQ where requisition_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, code);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rf.setRequisition_code(rs.getString("requisition_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_type(rs.getString("rfq_type"));
				rf.setRfq_language(rs.getString("rfq_language"));
				rf.setRfq_date(rs.getDate("rfq_date"));
				rf.setRfq_deadline(rs.getDate("rfq_deadline"));
				rf.setRfq_purchasing_org(rs.getString("rfq_purchasing_org"));
				rf.setRfq_purchasing_group(rs.getString("rfq_purchasing_group"));
				rf.setVendor_code(rs.getString("vendor_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_num(rs.getInt("rfq_num"));
				rf.setRfq_code(rs.getString("rfq_code"));
				rf.setRfq_plant(rs.getString("rfq_plant"));
				rf.setRfq_plant(rs.getString("rfq_plant"));


			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rf;
	}
	//根据purchasing_org查询
	public static RFQ findRFQbyPurcha_org(String org) {
		
		RFQ rf=new RFQ();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from RFQ where rfq_purchasing_org = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, org);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rf.setRequisition_code(rs.getString("requisition_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_type(rs.getString("rfq_type"));
				rf.setRfq_language(rs.getString("rfq_language"));
				rf.setRfq_date(rs.getDate("rfq_date"));
				rf.setRfq_deadline(rs.getDate("rfq_deadline"));
				rf.setRfq_purchasing_org(rs.getString("rfq_purchasing_org"));
				rf.setRfq_purchasing_group(rs.getString("rfq_purchasing_group"));
				rf.setVendor_code(rs.getString("vendor_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_num(rs.getInt("rfq_num"));
				rf.setRfq_code(rs.getString("rfq_code"));
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rf;
	}
	//根据purchasing_group查询
	public static RFQ findRFQbyPurcha_group(String gro) {
		
		RFQ rf=new RFQ();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from RFQ where rfq_purchasing_group = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, gro);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rf.setRequisition_code(rs.getString("requisition_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_type(rs.getString("rfq_type"));
				rf.setRfq_language(rs.getString("rfq_language"));
				rf.setRfq_date(rs.getDate("rfq_date"));
				rf.setRfq_deadline(rs.getDate("rfq_deadline"));
				rf.setRfq_purchasing_org(rs.getString("rfq_purchasing_org"));
				rf.setRfq_purchasing_group(rs.getString("rfq_purchasing_group"));
				rf.setVendor_code(rs.getString("vendor_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_num(rs.getInt("rfq_num"));
				rf.setRfq_code(rs.getString("rfq_code"));
				rf.setRfq_plant(rs.getString("rfq_plant"));

			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rf;
	}
	//根据工厂查询
	public static RFQ findRFQbyPlant(String plant) {
		
		RFQ rf=new RFQ();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from RFQ where rfq_plant = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, plant);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rf.setRequisition_code(rs.getString("requisition_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_type(rs.getString("rfq_type"));
				rf.setRfq_language(rs.getString("rfq_language"));
				rf.setRfq_date(rs.getDate("rfq_date"));
				rf.setRfq_deadline(rs.getDate("rfq_deadline"));
				rf.setRfq_purchasing_org(rs.getString("rfq_purchasing_org"));
				rf.setRfq_purchasing_group(rs.getString("rfq_purchasing_group"));
				rf.setVendor_code(rs.getString("vendor_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_num(rs.getInt("rfq_num"));
				rf.setRfq_code(rs.getString("rfq_code"));
				rf.setRfq_plant(rs.getString("rfq_plant"));

			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rf;
	}
	//根据RFQ类型查询
	public static RFQ findRFQbyType(String ty) {
		
		RFQ rf=new RFQ();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from RFQ where rfq_type = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1,ty);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rf.setRequisition_code(rs.getString("requisition_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_type(rs.getString("rfq_type"));
				rf.setRfq_language(rs.getString("rfq_language"));
				rf.setRfq_date(rs.getDate("rfq_date"));
				rf.setRfq_deadline(rs.getDate("rfq_deadline"));
				rf.setRfq_purchasing_org(rs.getString("rfq_purchasing_org"));
				rf.setRfq_purchasing_group(rs.getString("rfq_purchasing_group"));
				rf.setVendor_code(rs.getString("vendor_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_num(rs.getInt("rfq_num"));
				rf.setRfq_code(rs.getString("rfq_code"));
				rf.setRfq_plant(rs.getString("rfq_plant"));

			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rf;
	}
	//根据供应商编码查询
	public static RFQ findRFQbyVenderCode(String code) {
		
		RFQ rf=new RFQ();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from RFQ where vendor_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, code);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rf.setRequisition_code(rs.getString("requisition_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_type(rs.getString("rfq_type"));
				rf.setRfq_language(rs.getString("rfq_language"));
				rf.setRfq_date(rs.getDate("rfq_date"));
				rf.setRfq_deadline(rs.getDate("rfq_deadline"));
				rf.setRfq_purchasing_org(rs.getString("rfq_purchasing_org"));
				rf.setRfq_purchasing_group(rs.getString("rfq_purchasing_group"));
				rf.setVendor_code(rs.getString("vendor_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_num(rs.getInt("rfq_num"));
				rf.setRfq_code(rs.getString("rfq_code"));
				rf.setRfq_plant(rs.getString("rfq_plant"));

			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rf;
	}
	
	
	
	
	
	

	//判断某RFQ号是否存在，若存在则返回true，若不存在返回false
	public static boolean isRfqNumExist(int num) {
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
			//查询语句，根据学号查询
			String sql=""+"select * from RFQ where rfq_num = ?";
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
	public static ArrayList<RFQ> findrfqByAnything(RFQ vd) {
		
		ArrayList<RFQ> rqlist=new ArrayList<RFQ>();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from RFQ ";
			
			
			int flag=0;
			if (!(vd.getRfq_coll()==null))
			{
				sql+="where  rfq_coll ="+'"'+vd.getRfq_coll()+'"';
				flag=1;
			}
			if (!(vd.getRfq_plant()==(null)))
			{
				if(flag==1)
					sql+=" AND  ";
				else
					sql+=" where  ";
				sql+=" rfq_plant ="+'"'+vd.getRfq_plant()+'"';
				flag=1;
			}
			if (!(vd.getRfq_purchasing_org()==(null)))
			{
				if(flag==1)
					sql+=" AND  ";
				else
					sql+=" where  ";
				sql+=" rfq_purchasing_org ="+'"'+vd.getRfq_purchasing_org()+'"';
				flag=1;
			}
			if (!(vd.getVendor_code()==null))
			{
				if(flag==1)
					sql+=" AND  ";
				else
					sql+=" where  ";
				sql+=" vendor_code ="+'"'+vd.getVendor_code()+'"';
				flag=1;
			}
			if (!(vd.getRfq_type()==(null)))
			{
				if(flag==1)
					sql+=" AND  ";
				else
					sql+=" where  ";
				sql+=" vendor_type ="+'"'+vd.getRfq_type()+'"';
				flag=1;
			}
			
			System.out.println(sql);
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				RFQ rf=new RFQ();
				rf.setRequisition_code(rs.getString("requisition_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_type(rs.getString("rfq_type"));
				rf.setRfq_language(rs.getString("rfq_language"));
				rf.setRfq_date(rs.getDate("rfq_date"));
				rf.setRfq_deadline(rs.getDate("rfq_deadline"));
				rf.setRfq_purchasing_org(rs.getString("rfq_purchasing_org"));
				rf.setRfq_purchasing_group(rs.getString("rfq_purchasing_group"));
				rf.setVendor_code(rs.getString("vendor_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_num(rs.getInt("rfq_num"));
				rf.setRfq_code(rs.getString("rfq_code"));
				rf.setRfq_plant(rs.getString("rfq_plant"));

				rqlist.add(rf);
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		System.out.println(rqlist.size());
		return rqlist;
		
		
		
		
}
	
	public static String insertcode(int num) {//生成code
		
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		int res=-1;
		
		int lenofav=9;
		String char0="";
		String snum=String.valueOf(num);
		for(int i=1;i<=lenofav-snum.length();i++)
		{
			char0+="0";
		}
		String code="6"+char0+snum;
		
		try {
			
			String sql=""+"update RFQ set rfq_code=? where rfq_num = ? ";
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

