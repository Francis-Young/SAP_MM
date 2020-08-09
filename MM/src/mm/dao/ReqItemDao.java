package mm.dao;

import mm.bean.Requisition_item;
import mm.utils.DBUtil;
import java.sql.*;
import java.util.ArrayList;

public class ReqItemDao {
	//插入一条请购条目
	public static void addRequisitionItem( Requisition_item ri) {
		//建立与数据库的连接
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+ "insert into Requisition_item" +" (req_item_num,requisition_num,material_num,requisition_quantity,requisition_deliverydate,requisition_plant,requisition_storageloc) "+"values(default,?,?,?,?,?,?)";
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
	//根据请购条目编号查询
	public static Requisition_item findRequItemByRequItemNum(int req_item_num ) {
		Requisition_item ri=new Requisition_item();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Requisition_item where req_item_num = ? ";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, req_item_num);	
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
				ri.setReq_item_num(rs.getInt("req_item_num"));
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
	//根据请购单编号和材料编号查询
	public static ArrayList<Requisition_item> findRequItemByReqnumAndMatnum(int reqnum ,int matnum) {
		ArrayList<Requisition_item> rilist=new ArrayList<Requisition_item>();
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
			while (rs.next()) {
				ri.setReq_item_num(rs.getInt("req_item_num"));
				ri.setRequisition_num(rs.getInt("requisition_num"));
				ri.setMaterial_num(rs.getString("material_num"));
				ri.setRequisition_deliverydate(rs.getDate("requisition_deliverydate"));
				ri.setRequisition_plant(rs.getString("requisition_plant"));
				ri.setRequisition_storageloc(rs.getString("requisition_storageloc"));
				ri.setRequisition_quantity(rs.getInt("requisition_quantity"));
			
				rilist.add(ri);
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rilist;
	}
	
	//根据请购单编号查询
	public static ArrayList<Requisition_item> findRequItemByReqnum(int reqnum) {
		ArrayList<Requisition_item> rilist=new ArrayList<Requisition_item>();
		Requisition_item ri=new Requisition_item();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Requisition_item where requisition_num = ?  ";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reqnum);
			
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				ri.setReq_item_num(rs.getInt("req_item_num"));
				ri.setRequisition_num(rs.getInt("requisition_num"));
				ri.setMaterial_num(rs.getString("material_num"));
				ri.setRequisition_deliverydate(rs.getDate("requisition_deliverydate"));
				ri.setRequisition_plant(rs.getString("requisition_plant"));
				ri.setRequisition_storageloc(rs.getString("requisition_storageloc"));
				ri.setRequisition_quantity(rs.getInt("requisition_quantity"));
			
				rilist.add(ri);
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rilist;
	}
	

	//更新条目
	public static int modifyRequisitionItemByNum(Requisition_item ri) {
		
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		int res=-1;
		try {
		
			String sql=""+"update Requisition_item set requisition_num = ? ,material_num = ? ,requisition_quantity = ? ,requisition_deliverydate = ? ,requisition_plant = ? ,requisition_storageloc = ? ";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, ri.getRequisition_num());
			psmt.setString(2, ri.getMaterial_num());
			psmt.setInt(3, ri.getRequisition_quantity());
			psmt.setDate(4, ri.getRequisition_deliverydate());
			psmt.setString(5, ri.getRequisition_plant());
			psmt.setString(6, ri.getRequisition_storageloc());
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
