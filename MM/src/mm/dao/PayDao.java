package mm.dao;
import java.sql.*;
import org.json.*;


import mm.utils.DBUtil;
public class PayDao {
	public int addPay(int order,float amount,int status,String time,String user,String text) {
		Connection connection = DBUtil.getConnection();
        PreparedStatement pstmt =null;
		try {
	            String sql = "INSERT INTO Payment (Order_num,Amount,Paid_Status,Pay_Time,Pay_user,Invoice_Text) VALUES (?,?,?,?,?,?)"; 
				pstmt=connection.prepareStatement(sql);
				pstmt.setInt(1, order);
				pstmt.setFloat(2, amount);
				pstmt.setInt(3, status);
				pstmt.setString(4, time);
				pstmt.setString(5, user);
				pstmt.setString(6, text);
	            String sql_check = "SELECT Pay_Id FROM Payment WHERE Order_num="+order; 

				 Statement stmt = connection.createStatement();
			     ResultSet rs = stmt.executeQuery(sql_check);  
			     rs.last(); 
		        int row_check =  rs.getRow();
	            if (row_check==0) {
		            int row = pstmt.executeUpdate();

	            	if(row>0)
	            	{
	     	           return 1;

	            	}
	            	else {
	     	          return 0;

	            	}
	            	
	            }else {
	            	 return 2;
	            }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(connection);
		return 0;

	}
	public int updatePay(float amount,int id,int status,String time,String text,int account) {
		Connection connection = DBUtil.getConnection();
        PreparedStatement pstmt =null;
		try {
	            String sql = "Update Payment Set Amount=?,Paid_Status=?,Pay_Time=?,Invoice_Text=?,Pay_Account=? where Pay_id=?"; 
				pstmt=connection.prepareStatement(sql);
				pstmt.setFloat(1, amount);
				pstmt.setFloat(2, status);
				pstmt.setString(3, time);
				pstmt.setString(4, text);
				pstmt.setInt(5, account);
				pstmt.setInt(6, id);
	            int row = pstmt.executeUpdate();
		        		 
		   

	            if (row>0) {
	            	
	            
	            		return 1;
	            	
	            	
	            }else {
	                System.out.println("录入失败");
	            }
	           
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(connection);
		return 0;

	}


    public String resultSetToJson(ResultSet rs) throws Exception 
    {  
       // json转换
       JSONArray array = new JSONArray();  
        
       ResultSetMetaData metaData = rs.getMetaData();  
       int columnCount = metaData.getColumnCount();  
        
        while (rs.next()) {  
            JSONObject jsonObj = new JSONObject();  
             
            for (int i = 1; i <= columnCount; i++) {  
                String columnName =metaData.getColumnLabel(i);  
                String value = rs.getString(columnName);  
                jsonObj.put(columnName, value);  
            }   
            array.put(jsonObj);   
        }  
        
       return array.toString();  
    }  

	public String Fororder(String date,String name,String num,String text) throws Exception {
		Connection connection = DBUtil.getConnection();
        PreparedStatement pstmt =null;
        String s="";
		try {
			String o1=changedate(date);
			String o2=name;
			String o3=num;
			String o4=text;
			
			o1="'"+o1+"'";
			
			if(o1.equals("\'\'"))
			{
				o1=" is not null";

			}
			else
			{
				o1="="+o1;
			}
			if(!o2.equals(""))
			{
				o2=" LIKE '%"+o2+"%'";

			}
			else
			{
				o2=" is not null";
			}
			if(o3.equals(""))
			{
				o3=" is not null ";
			}
			else
			{
				o3="="+o3;
			}
			if(o4.equals(""))
			{
				o4=" is not null ";
			}
			else if(o4.indexOf(",")>0) 
			{
				String s11=" in (";
				String[] splitM=o4.split(",");
				for(int i=0;i<splitM.length;i++) {
					String x11="\'"+splitM[i]+"',";
				s11+=x11;
				}
			s11=s11.substring(0,s11.length()-1);	
			s11+=")";
			o4=s11;
			}
			else
			{
				o4="=\'"+o4+"'";
			}
			Connection connectionnew = DBUtil.getConnection();
	        String sql="select * FROM Order_item JOIN `Order` ON Order_item.order_num_m=`Order`.order_num JOIN Vendor ON `Order`.vendor_code=Vendor.vendor_code "
	        		+ "where `Order`.receipt_checked=0 and vendor_name"+o2+
	        		" and Vendor.vendor_code"+o3+" and material_num"+o4+" and delivery_date"+o1+"";
	        Statement stmt = connectionnew.createStatement();
	        ResultSet rs = stmt.executeQuery(sql);     
	        s=resultSetToJson(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(connection);
		return s;

	}
	public String ForSearch(String date,String name,String num,String text,String date2,String user,String voice) throws Exception {
		Connection connection = DBUtil.getConnection();
        PreparedStatement pstmt =null;
        String s="";
		try {
			String o1=changedate(date);
			String o2=name;
			String o3=num;
			String o4=text;
			String o5=changedate(date2);
			String o6=user;
			String o7=voice;

			o1="'"+o1+"'";
			
			if(o1.equals("\'\'"))
			{
				o1=" is not null";

			}
			else
			{
				o1="="+o1;
			}
			if(!o2.equals(""))
			{
				o2=" LIKE '%"+o2+"%'";

			}
			else
			{
				o2=" is not null";
			}
			if(o3.equals(""))
			{
				o3=" is not null ";
			}
			else
			{
				o3="="+o3;
			}
			if(o4.equals(""))
			{
				o4=" is not null ";
			}
			else if(o4.indexOf(",")>0) 
			{		String s11=" in (";
			String[] splitM=o4.split(",");
			for(int i=0;i<splitM.length;i++) {
				String x11="\'"+splitM[i]+"',";
			s11+=x11;
			}
		s11=s11.substring(0,s11.length()-1);	
		s11+=")";
		o4=s11;
			}
			else
			{
				o4="=\'"+o4+"'";
			}

			o5="'"+o5+"'";
			
			if(o5.equals("\'\'"))
			{
				o5=" is not null";

			}
			else
			{
				o5="="+o5;
			}	

			if(!o6.equals(""))
			{
				o6=" LIKE '%"+o6+"%'";

			}
			else
			{
				o6=" is not null";
			}
			if(!o7.equals(""))
			{
				o7=" LIKE '%"+o7+"%'";

			}
			else
			{
				o7=" is not null";
			}
			Connection connectionnew = DBUtil.getConnection();
	        String sql="select * FROM Order_item "
	        		+ "Join Payment On Order_item.order_num_m=Payment.Order_num "
	        		+ " JOIN `Order` ON Order_item.order_num_m=`Order`.order_num "
	        		+ "JOIN Vendor ON `Order`.vendor_code"
	        		+ "=Vendor.vendor_code where vendor_name"+o2+
	        		" and Vendor.vendor_code"+o3+" and material_num"+o4+" and delivery_date"+o1+""+
    		" and Pay_time"+o5+" and Pay_User"+o6+" and Invoice_Text"+o7+"";
		
	        ; 
	        Statement stmt = connectionnew.createStatement();
	        ResultSet rs = stmt.executeQuery(sql);     
	        s=resultSetToJson(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(connection);
		return s;

	}
	public String Searchit(String id) throws Exception {
		Connection connection = DBUtil.getConnection();
        PreparedStatement pstmt =null;
        String s="";
		try {
			String ownid=id;
			Connection connectionnew = DBUtil.getConnection();
	        String sql="select * FROM Order_item JOIN `Order` ON Order_item.order_num_m=`Order`.order_num JOIN Vendor ON `Order`.vendor_code=Vendor.vendor_code where Order_item.order_num_m="+ownid+""; 
	        Statement stmt = connectionnew.createStatement();
	        ResultSet rs = stmt.executeQuery(sql);     
	        s=resultSetToJson(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(connection);
		return s;

	}
	public String Searchitbyid(String id) throws Exception {
		Connection connection = DBUtil.getConnection();
        PreparedStatement pstmt =null;
        String s="";
		try {
			String ownid=id;
			Connection connectionnew = DBUtil.getConnection();
	        String sql="select * FROM Order_item JOIN Payment ON Order_item.order_num_m=Payment.Order_num where Pay_id="+ownid+""; 
	        Statement stmt = connectionnew.createStatement();
	        ResultSet rs = stmt.executeQuery(sql);     
	        s=resultSetToJson(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(connection);
		return s;

	}
	public String changedate(String date){
		if(date.indexOf("/")>0) {
		String s1=date.substring(0,2);//M
		String s2=date.substring(3,5);//D
		String s3=date.substring(6,10);//Y
		
		return s3+"-"+s1+"-"+s2;
		}
		else
		{
			return date;
		}
	}
	public String Getready() throws Exception {
		Connection connection = DBUtil.getConnection();
        PreparedStatement pstmt =null;
        String s="";
		try {
			Connection connectionnew = DBUtil.getConnection();
	        String sql="select distinct Pay_Account FROM Payment"; 
	        Statement stmt = connectionnew.createStatement();
	        ResultSet rs = stmt.executeQuery(sql);     
	        s=resultSetToJson(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(connection);
		return s;

	}
	
	public String ForSearch_u(String date,String name,String num,String text,String date2,String user,String voice,String pid,String acc) throws Exception {
		Connection connection = DBUtil.getConnection();
        PreparedStatement pstmt =null;
        String s="";
		try {
			String o1=changedate(date);
			String o2=name;
			String o3=num;
			String o4=text;
			String o5=changedate(date2);
			String o6=user;
			String o7=voice;
			String o8=pid;
			String o9=acc;

			o1="'"+o1+"'";
			
			if(o1.equals("\'\'"))
			{
				o1=" is not null";

			}
			else
			{
				o1="="+o1;
			}
			if(!o2.equals(""))
			{
				o2=" LIKE '%"+o2+"%'";

			}
			else
			{
				o2=" is not null";
			}
			if(o3.equals(""))
			{
				o3=" is not null ";
			}
			else
			{
				o3="="+o3;
			}
			if(o4.equals(""))
			{
				o4=" is not null ";
			}
			else if(o4.indexOf(",")>0) 
			{		String s11=" in (";
			String[] splitM=o4.split(",");
			for(int i=0;i<splitM.length;i++) {
				String x11="\'"+splitM[i]+"',";
			s11+=x11;
			}
		s11=s11.substring(0,s11.length()-1);	
		s11+=")";
		o4=s11;
			}
			else
			{
				o4="=\'"+o4+"'";
			}

			o5="'"+o5+"'";
			
			if(o5.equals("\'\'"))
			{
				o5=" is not null";

			}
			else
			{
				o5="="+o5;
			}	

			if(!o6.equals(""))
			{
				o6=" LIKE '%"+o6+"%'";

			}
			else
			{
				o6=" is not null";
			}
			if(!o7.equals(""))
			{
				o7=" LIKE '%"+o7+"%'";

			}
			else
			{
				o7=" is not null";
			}
			if(o8.equals(""))
			{
				o8=" is not null ";
			}
			else
			{
				o8="="+o8;
			}
			if(o9.equals("all")||o9.equals(""))
			{
				o9=" is not null ";
			}
			else
			{
				o9="="+o9;
			}
			Connection connectionnew = DBUtil.getConnection();
	        String sql="select * FROM Order_item "
	        		+ "Join Payment On Order_item.order_num_m=Payment.Order_num "
	        		+ " JOIN `Order` ON Order_item.order_num_m=`Order`.order_num "
	        		+ "JOIN Vendor ON `Order`.vendor_code"
	        		+ "=Vendor.vendor_code where vendor_name"+o2+
	        		" and Vendor.vendor_num"+o3+" and material_num"+o4+" and delivery_date"+o1+""+
    		" and Pay_time"+o5+" and Pay_User"+o6+" and Invoice_Text"+o7+" "
    				+ "and Pay_id"+o8+" and Pay_Account"+o9;
		

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
