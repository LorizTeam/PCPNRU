package pcpnru.masterData;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import pcpnru.masterModel.GroupCostCodeMasterModel;
import pcpnru.projectModel.*;
import pcpnru.utilities.*;
 

public class GroupcostcodeMasterDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List GetGroupCostCodeMasterList(String groupcostCode, String groupcostName,String type_gcostcode) 
	throws Exception { //30-05-2014
		List groupcostCodeMasterList = new ArrayList();
		String dateTime = "",standardprice="",fundprice="";
		
		DecimalFormat df1 = new DecimalFormat("#,###,##0.##");
		DecimalFormat df2 = new DecimalFormat("#,###,##0.00");
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT gcostcode, gcostcode_name,gcostcode_standardprice,gcostcode_fundprice, DATE_FORMAT(datetime,'%d-%m-%Y %H:%i') as datetime " +
			"FROM groupcostcode_master " +
			"WHERE "; 
			if(!groupcostCode.equals("")) sqlStmt = sqlStmt+ "gcostcode like '"+groupcostCode+"%' AND ";
			if(!groupcostName.equals("")) sqlStmt = sqlStmt+ "gcostcode_name like '"+groupcostName+"%' AND ";
			
			sqlStmt = sqlStmt + "gcostcode <> '' and type_gcostcode = '"+type_gcostcode+"' order by datetime desc";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				groupcostCode 	= rs.getString("gcostcode");
				standardprice = rs.getString("gcostcode_standardprice");
				fundprice = rs.getString("gcostcode_fundprice");
				if (rs.getString("gcostcode_name") != null) 		groupcostName = rs.getString("gcostcode_name"); else groupcostName = "";
				 
				dateTime		= rs.getString("datetime");  
				String day 		= dateTime.substring(0, 2);
				String month 	= dateTime.substring(3, 5);
				String year 	= Integer.toString((Integer.parseInt(dateTime.substring(6, 10))+543));
					
				String time 	= dateTime.substring(11);
				dateTime		= day+"-"+month+"-"+year+" "+time; 
			//	amount 			= df2.format(Float.parseFloat(amount));
				
				groupcostCodeMasterList.add(new GroupCostCodeMasterModel(groupcostCode, groupcostName,standardprice,fundprice, dateTime));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return groupcostCodeMasterList;
	 }
	
	public void AddCostCodeMaster(String groupcostCode, String groupcostName, String standardprice, String fundprice,String type_gcostcode)  throws Exception{
		
		conn = agent.getConnectMYSql();
		
		String dateTime = "";
		String sqlStmt = "INSERT INTO `groupcostcode_master` (`gcostcode`, `gcostcode_name`,gcostcode_standardprice,gcostcode_fundprice, datetime,type_gcostcode) "
				+ "VALUES ('"+groupcostCode+"', '"+groupcostName+"','"+standardprice+"','"+fundprice+"', now(),'"+type_gcostcode+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	
	public void UpdateCostCodeMaster(String groupcostCode, String groupcostName, String groupcostCodeHD, String standardprice, String fundprice)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE groupcostcode_master set gcostcode = '"+groupcostCode+"', gcostcode_name = '"+groupcostName+"',gcostcode_standardprice = '"+standardprice+"'"
				+ ",gcostcode_fundprice = '"+fundprice+"', datetime = now()" +
				"WHERE gcostcode = '"+groupcostCodeHD+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	
	public void DeleteCostCodeMaster(String groupcostCode)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE From groupcostcode_master "+
		"WHERE gcostcode = '"+groupcostCode+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	
	public boolean getCheckMaster(String groupcostCode) throws Exception {
	
	boolean chkCustomer = false;
	conn = agent.getConnectMYSql();
 	
 	String sqlStmt = "SELECT * " +
	"FROM groupcostcode_master WHERE gcostcode = '"+groupcostCode+"' ";
 	
 	pStmt = conn.createStatement();
	rs = pStmt.executeQuery(sqlStmt);	
	
	while (rs.next()) {
		chkCustomer = true;
	}
	
	rs.close();
	pStmt.close();
	
	return chkCustomer;
	}
}
