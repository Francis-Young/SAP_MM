package mm.dao;

import mm.bean.Requisition;
import mm.bean.Requisition_item;
import mm.utils.DBUtil;
import java.sql.*;

public class ReqItemDao {
	//插入一条请购条目
	public static void addRequisition( Requisition_item ri) {
		//建立与数据库的连接
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+ "insert into Requisition_item" +" (requisition_num,material_num,requisition_quantity,requisition_deliverydate,requisition_plant,requisition_storageloc) "+"values(?,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, ri.getRequisition_num());
			psmt.setString(2, ri.getMaterial_num());
			psmt.setInt(3, ri.getRequisition_quantity());
			psmt.setDate(4, ri.getRequisition_deliverydate());
			psmt.setString(5, ri.getRequisition_plant());
			psmt.setString(6, ri.getRequisition_storageloc());
	
			psmt.execute();
		}catch(SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
	}
	//根据编号查询
	public static Requisition_item findRequItemByReqnumAndMatnum(int reqnum ,int matnum) {
		
		Requisition_item ri=new Requisition_item();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Requisition_item where requisition_num = ?  and material_num = ? ";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reqnum);
			psmt.setInt(2, matnum);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				ri.setRequisition_num(rs.getInt("requisition_num"));
				ri.setMaterial_num(rs.getString("material_num"));
				ri.setRequisition_deliverydate(rs.getDate("requisition_deliverydate"));
				ri.setRequisition_plant(rs.getString("requisition_plant"));
				ri.setRequisition_storageloc(rs.getString("requisition_storageloc"));
				ri.setRequisition_quantity(rs.getInt("requisition_quantity"));
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return ri;
	}
	

	
	//判断某请购单号是否存在，若存在则返回true，若不存在返回false
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

	public static int updateRequisitionByNum(int num,String description, String group) {
		
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		int res=-1;
		try {
		
			String sql=""+"update Requisition set requisition_discription=? , requisition_purchasegroup = ? where requisition_num = ? ";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, description);
			psmt.setString(1, group);
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
