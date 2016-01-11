package pcpnru.projectData;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import pcpnru.projectModel.*;
import pcpnru.utilities.*;
 

public class CostCodeMasterDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List GetCostCodeMasterList(String costCode, String costName) 
	throws Exception { //30-05-2014
		List costCodeMasterList = new ArrayList();
		String dateTime = "";
		DecimalFormat df1 = new DecimalFormat("#,###,##0.##");
		DecimalFormat df2 = new DecimalFormat("#,###,##0.00");
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT costcode, costname, DATE_FORMAT(datetime,'%d-%m-%Y %H:%i') as datetime " +
			"FROM costcode_master " +
			"WHERE "; 
			if(!costCode.equals("")) sqlStmt = sqlStmt+ "costcode like '"+costCode+"%' AND ";
			if(!costName.equals("")) sqlStmt = sqlStmt+ "costname like '"+costName+"%' AND ";
			
			sqlStmt = sqlStmt + "costcode <> '' order by datetime desc";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				costCode 	= rs.getString("costcode");
				if (rs.getString("costname") != null) 		costName = rs.getString("costname"); else costName = "";
				 
				dateTime		= rs.getString("datetime");  
				String day 		= dateTime.substring(0, 2);
				String month 	= dateTime.substring(3, 5);
				String year 	= Integer.toString((Integer.parseInt(dateTime.substring(6, 10))+543));
					
				String time 	= dateTime.substring(11);
				dateTime		= day+"-"+month+"-"+year+" "+time; 
			//	amount 			= df2.format(Float.parseFloat(amount));
				
				costCodeMasterList.add(new CostCodeMasterForm(costCode, costName, dateTime));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return costCodeMasterList;
	 }
	
	public void AddCostCodeMaster(String costCode, String costName)  throws Exception{
		
		conn = agent.getConnectMYSql();
		
		String dateTime = "";
		String sqlStmt = "INSERT INTO `costcode_master` (`costcode`, `costname`, datetime) VALUES ('"+costCode+"', '"+costName+"', now())";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void UpdateCostCodeMaster(String costCode, String costName, String costCodeHD)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE costcode_master set costcode = '"+costCode+"', costname = '"+costName+"', datetime = now()" +
				"WHERE costcode = '"+costCodeHD+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void DeleteCostCodeMaster(String costCode)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE From costcode_master "+
		"WHERE costCode = '"+costCode+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public boolean getCheckMaster(String materialCode) throws Exception {
	
	boolean chkCustomer = false;
	conn = agent.getConnectMYSql();
 	
 	String sqlStmt = "SELECT material_code " +
	"FROM material_master WHERE material_code = '"+materialCode+"' ";
 	
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
