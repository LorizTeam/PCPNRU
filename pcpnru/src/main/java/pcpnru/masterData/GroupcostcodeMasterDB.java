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
	
	public List GetGroupCostCodeMasterList(String project_code, String groupcostCode, String groupcostName,String type_gcostcode) 
	throws Exception { //30-05-2014
		List groupcostCodeMasterList = new ArrayList();
		String project_name = "",dateTime = "",standardprice="",fundprice="";
		
		DecimalFormat df1 = new DecimalFormat("#,###,##0.##");
		DecimalFormat df2 = new DecimalFormat("#,###,##0.00");
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT a.project_code,project_name, gcostcode, gcostcode_name,gcostcode_standardprice,gcostcode_fundprice, DATE_FORMAT(a.datetime,'%d-%m-%Y %T') as datetime " +
			"FROM groupcostcode_master a " +
			"INNER JOIN project_master b on(b.project_code = a.project_code) " +
			"WHERE "; 
			if(!project_code.equals("")) sqlStmt = sqlStmt+ "a.project_code = '"+project_code+"' AND ";
			if(!groupcostCode.equals("")) sqlStmt = sqlStmt+ "gcostcode like '"+groupcostCode+"%' AND ";
			if(!groupcostName.equals("")) sqlStmt = sqlStmt+ "gcostcode_name like '"+groupcostName+"%' AND ";
			
			sqlStmt = sqlStmt + "gcostcode <> '' and type_gcostcode = '"+type_gcostcode+"' order by a.datetime desc";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				project_name	= rs.getString("project_name");
				project_code	= rs.getString("project_code");
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
				
				groupcostCodeMasterList.add(new GroupCostCodeMasterModel(project_code,project_name, groupcostCode, groupcostName,standardprice,fundprice, dateTime));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return groupcostCodeMasterList;
	 }
	
	public void AddCostCodeMaster(String project_code,String groupcostCode, String groupcostName, String standardprice, String fundprice,String type_gcostcode)  throws Exception{
		
		conn = agent.getConnectMYSql();
		
		String dateTime = "";
		String sqlStmt = "INSERT INTO `groupcostcode_master` (project_code, `gcostcode`, `gcostcode_name`,gcostcode_standardprice,gcostcode_fundprice, datetime,type_gcostcode) "
				+ "VALUES ('"+project_code+"', '"+groupcostCode+"', '"+groupcostName+"','"+standardprice+"','"+fundprice+"', now(),'"+type_gcostcode+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	
	public void UpdateCostCodeMaster(String project_code, String groupcostCode, String groupcostName, String groupcostCodeHD, String standardprice, String fundprice)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE groupcostcode_master set gcostcode = '"+groupcostCode+"', gcostcode_name = '"+groupcostName+"',gcostcode_standardprice = '"+standardprice+"'"
				+ ",gcostcode_fundprice = '"+fundprice+"', datetime = now()" +
				"WHERE project_code = '"+project_code+"' and gcostcode = '"+groupcostCodeHD+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	
	public void DeleteCostCodeMaster(String project_code, String groupcostCode)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE From groupcostcode_master "+
		"WHERE project_code = '"+project_code+"' and gcostcode = '"+groupcostCode+"'";
		System.out.println(sqlStmt);
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
	
	conn.close();
	rs.close();
	pStmt.close();
	
	return chkCustomer;
	}
	public List WindowGroupCostCodeMasterReceive(String project_code, String year, String groupcostCode, String groupcostName,String type_gcostcode) 
			throws Exception { //30-05-2014
				List groupcostCodeMasterList = new ArrayList();
				String project_name = "",dateTime = "",standardprice="",fundprice="";
				
				DecimalFormat df1 = new DecimalFormat("#,###,##0.##");
				DecimalFormat df2 = new DecimalFormat("#,###,##0.00");
				try {
				
					conn = agent.getConnectMYSql();
					
					String sqlStmt = "SELECT a.project_code,project_name, gcostcode, gcostcode_name,gcostcode_standardprice,gcostcode_fundprice, DATE_FORMAT(a.datetime,'%d-%m-%Y %T') as datetime " +
					"FROM groupcostcode_master a " +
					"INNER JOIN project_master b on(b.project_code = a.project_code) " +
					"WHERE a.type_gcostcode = '1' and "; 
					
					if(!project_code.equals("")) sqlStmt = sqlStmt+ "a.project_code = '"+project_code+"' AND ";
					if(!groupcostCode.equals("")) sqlStmt = sqlStmt+ "a.gcostcode like '"+groupcostCode+"%' AND ";
					if(!groupcostName.equals("")) sqlStmt = sqlStmt+ "a.gcostcode_name like '"+groupcostName+"%' AND ";
					
					sqlStmt = sqlStmt + "a.gcostcode not in (select DISTINCT(c.gcostcode) from projectplan_detail c where c.gcostcode = a.gcostcode and " +
							 "c.project_code = '"+project_code+"' and c.year = '"+year+"') order by a.datetime desc";
					
					//System.out.println(sqlStmt);				
					pStmt = conn.createStatement();
					rs = pStmt.executeQuery(sqlStmt);	
					while (rs.next()) {
						project_name	= rs.getString("project_name");
						project_code	= rs.getString("project_code");
						groupcostCode 	= rs.getString("gcostcode");
						standardprice = rs.getString("gcostcode_standardprice");
						fundprice = rs.getString("gcostcode_fundprice");
						if (rs.getString("gcostcode_name") != null) 		groupcostName = rs.getString("gcostcode_name"); else groupcostName = "";
						 
						dateTime		= rs.getString("datetime");  
						String day 		= dateTime.substring(0, 2);
						String month 	= dateTime.substring(3, 5);
						year 	= Integer.toString((Integer.parseInt(dateTime.substring(6, 10))+543));
							
						String time 	= dateTime.substring(11);
						dateTime		= day+"-"+month+"-"+year+" "+time; 
					//	amount 			= df2.format(Float.parseFloat(amount));
						
						groupcostCodeMasterList.add(new GroupCostCodeMasterModel(project_code,project_name, groupcostCode, groupcostName,standardprice,fundprice, dateTime));
					}
					rs.close();
					pStmt.close();
					conn.close();
				} catch (SQLException e) {
				    throw new Exception(e.getMessage());
				}
				return groupcostCodeMasterList;
			 }
	public List WindowGroupCostCodeMasterRequisition(String project_code, String year, String groupcostCode, String groupcostName,String type_gcostcode) 
			throws Exception { //30-05-2014
				List groupcostCodeMasterList = new ArrayList();
				String project_name = "",dateTime = "",standardprice="",fundprice="";
				
				DecimalFormat df1 = new DecimalFormat("#,###,##0.##");
				DecimalFormat df2 = new DecimalFormat("#,###,##0.00");
				try {
				
					conn = agent.getConnectMYSql();
					
					String sqlStmt = "SELECT a.project_code,project_name, gcostcode, gcostcode_name,gcostcode_standardprice,gcostcode_fundprice, DATE_FORMAT(a.datetime,'%d-%m-%Y %T') as datetime " +
					"FROM groupcostcode_master a " +
					"INNER JOIN project_master b on(b.project_code = a.project_code) " +
					"WHERE a.type_gcostcode = '2' and "; 
					
					if(!project_code.equals("")) sqlStmt = sqlStmt+ "a.project_code = '"+project_code+"' AND ";
					if(!groupcostCode.equals("")) sqlStmt = sqlStmt+ "a.gcostcode like '"+groupcostCode+"%' AND ";
					if(!groupcostName.equals("")) sqlStmt = sqlStmt+ "a.gcostcode_name like '"+groupcostName+"%' AND ";
					
					sqlStmt = sqlStmt + "a.gcostcode not in (select DISTINCT(c.gcostcode) from projectplan_detail c where c.gcostcode = a.gcostcode and " +
							 "c.project_code = '"+project_code+"' and c.year = '"+year+"') order by a.datetime desc";
					
					//System.out.println(sqlStmt);				
					pStmt = conn.createStatement();
					rs = pStmt.executeQuery(sqlStmt);	
					while (rs.next()) {
						project_name	= rs.getString("project_name");
						project_code	= rs.getString("project_code");
						groupcostCode 	= rs.getString("gcostcode");
						standardprice = rs.getString("gcostcode_standardprice");
						fundprice = rs.getString("gcostcode_fundprice");
						if (rs.getString("gcostcode_name") != null) 		groupcostName = rs.getString("gcostcode_name"); else groupcostName = "";
						 
						dateTime		= rs.getString("datetime");  
						String day 		= dateTime.substring(0, 2);
						String month 	= dateTime.substring(3, 5);
						year 	= Integer.toString((Integer.parseInt(dateTime.substring(6, 10))+543));
							
						String time 	= dateTime.substring(11);
						dateTime		= day+"-"+month+"-"+year+" "+time; 
					//	amount 			= df2.format(Float.parseFloat(amount));
						
						groupcostCodeMasterList.add(new GroupCostCodeMasterModel(project_code,project_name, groupcostCode, groupcostName,standardprice,fundprice, dateTime));
					}
					rs.close();
					pStmt.close();
					conn.close();
				} catch (SQLException e) {
				    throw new Exception(e.getMessage());
				}
				return groupcostCodeMasterList;
			 }
}
