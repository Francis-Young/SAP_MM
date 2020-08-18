package mm.dao;

import mm.bean.Quotation;
import mm.bean.Requisition;
import mm.utils.DBUtil;
import java.sql.*;
import java.util.ArrayList;

public class RequisitionDao {
	//插入一张请购单,返回最新插入单子的num
	public static String addRequisition( Requisition rq) {
		//建立与数据库的连接
		int num=0;
		String code="error";
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+ "insert into Requisition" +" (requisition_num,requisition_discription,requisition_purchasegroup) "+"values(default,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
		
			psmt.setString(1, rq.getRequisition_discription());
			psmt.setString(2, rq.getRequisition_purchasegroup());
			
			psmt.execute();
			
			sql="SELECT LAST_INSERT_ID()";
			psmt = conn.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();
			//----遍历打印
			/*ResultSetMetaData rsmd = rs.getMetaData();
			int columnsNumber = rsmd.getColumnCount();
			while (rs.next()) {
			    for (int i = 1; i <= columnsNumber; i++) {
			        if (i > 1) System.out.print(",  ");
			        String columnValue = rs.getString(i);
			        System.out.print(columnValue + " " + rsmd.getColumnName(i));
			    }
			    System.out.println("");
			}*/
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
	public static Requisition findRequisitionByCode(String code) {
		
		Requisition rq=new Requisition();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Requisition where requisition_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, code);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rq.setRequisition_num(rs.getInt("requisition_num"));
				rq.setRequisition_discription(rs.getString("requisition_discription"));
				rq.setRequisition_purchasegroup(rs.getString("requisition_purchasegroup"));
				rq.setRequisition_code(rs.getString("requisition_code"));
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
	//根据任意条件查询
	public static ArrayList<Requisition> findRequisitionByAnything(Requisition rq) {
		ArrayList<Requisition> rqlist=new ArrayList<Requisition>();
		Requisition rq1=new Requisition();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Requisition ";
			int flag=0;
			if (!rq.getRequisition_discription().equals("xx"))
			{
				sql+="where requisition_discription ="+'"'+rq.getRequisition_discription()+'"';
				flag=1;
			}
			if (!rq.getRequisition_purchasegroup().equals("xx"))
			{
				if(flag==1)
					sql+=" AND  ";
				else
					sql+=" where  ";
				sql+=" requisition_purchasegroup ="+'"'+rq.getRequisition_purchasegroup()+'"';
				flag=1;
			}
			System.out.println(sql);
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
			
				rq1.setRequisition_num(rs.getInt("requisition_num"));
				rq1.setRequisition_discription(rs.getString("requisition_discription"));
				rq1.setRequisition_purchasegroup(rs.getString("requisition_purchasegroup"));
				rq1.setRequisition_code(rs.getString("requisition_code"));
				rqlist.add(rq1);
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rqlist;
	}
	//根据group查询
	public static Requisition findRequisitionBygroup(String purgro) {
		
		Requisition rq=new Requisition();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+"select * from Requisition where requisition_purchasegroup = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, purgro);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
				
				rq.setRequisition_num(rs.getInt("requisition_num"));
				rq.setRequisition_discription(rs.getString("requisition_discription"));
				rq.setRequisition_purchasegroup(rs.getString("requisition_purchasegroup"));
				rq.setRequisition_code(rs.getString("requisition_code"));
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
	
	//判断某请购单号否存在，若存在则返回true，若不存在返回false
	public static boolean isRqNumExist(int num) {
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
			//查询语句，根据学号查询
			String sql=""+"select * from Requisition where requisition_num = ?";
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
	//修改请购单
	public static int updateRequisitionByCode(String code,String description, String group) {
		
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		int res=-1;
		try {
		
			String sql=""+"update Requisition set requisition_discription=? , requisition_purchasegroup = ? where requisition_code = ? ";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, description);
			psmt.setString(2, group);
			psmt.setString(3, code);
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
	public static String insertcode(int num) {//生成code
		
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		int res=-1;
		
		int lenofav=7;
		String char0="";
		String snum=String.valueOf(num);
		for(int i=1;i<=lenofav-snum.length();i++)
		{
			char0+="0";
		}
		String code="001"+char0+snum;
		
		try {
			
			String sql=""+"update Requisition set requisition_code=? where requisition_num = ? ";
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
