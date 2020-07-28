package mm.dao;
import java.sql.*;
import org.json.*;


import mm.utils.DBUtil;
public class PayDao {
	public int addPay(int order,float amount,int vendor,int status,String time,int user,String text) {
		Connection connection = DBUtil.getConnection();
        PreparedStatement pstmt =null;
		try {
	            String sql = "INSERT INTO Payment (Vendor_id,Order_num,Amount,Paid_Status,Pay_Time,Pay_user,Invoice_Text) VALUES (?,?,?,?,?,?,?)"; 
				pstmt=connection.prepareStatement(sql);
				pstmt.setInt(1, vendor);
				pstmt.setInt(2, order);
				pstmt.setFloat(3, amount);
				pstmt.setInt(4, status);
				pstmt.setString(5, time);
				pstmt.setInt(6, user);
				pstmt.setString(7, text);
	            int row = pstmt.executeUpdate();
	            if (row>0) {
	            }else {
	                System.out.println("数据添加失败！");
	            }
	           return 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(connection);
		return 0;

	}

    public String resultSetToJson(ResultSet rs) throws Exception 
    {  
       // json数组  
       JSONArray array = new JSONArray();  
        
       // 获取列数  
       ResultSetMetaData metaData = rs.getMetaData();  
       int columnCount = metaData.getColumnCount();  
        
       // 遍历ResultSet中的每条数据  
        while (rs.next()) {  
            JSONObject jsonObj = new JSONObject();  
             
            // 遍历每一列  
            for (int i = 1; i <= columnCount; i++) {  
                String columnName =metaData.getColumnLabel(i);  
                String value = rs.getString(columnName);  
                jsonObj.put(columnName, value);  
            }   
            array.put(jsonObj);   
        }  
        
       return array.toString();  
    }  

	public String Searchit(String id) throws Exception {
		Connection connection = DBUtil.getConnection();
        PreparedStatement pstmt =null;
        String s="";
		try {
			String ownid=id;
			Connection connectionnew = DBUtil.getConnection();
	        String sql="select * from Payment where Vendor_id="+ownid+""; 
	        Statement stmt = connectionnew.createStatement();
	        ResultSet rs = stmt.executeQuery(sql);     
	        s=resultSetToJson(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(connection);
		return s;

	}

}
