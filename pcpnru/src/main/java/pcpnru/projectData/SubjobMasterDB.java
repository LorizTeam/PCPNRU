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
 

public class SubjobMasterDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List GetSubjobMasterList(String subjobCode, String subjobName) 
	throws Exception { //30-05-2014
		List subjobMasterList = new ArrayList();
		String amount = "", unit = "";
		DecimalFormat df1 = new DecimalFormat("#,###,##0.##");
		DecimalFormat df2 = new DecimalFormat("#,###,##0.00");
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT subjob_code, subjob_name " +
			"FROM subjob_master " +
			"WHERE "; 
			if(!subjobCode.equals("")) sqlStmt = sqlStmt+ "subjob_code like '"+subjobCode+"%' AND ";
			if(!subjobName.equals("")) sqlStmt = sqlStmt+ "subjob_name like '"+subjobName+"%' AND ";
			
			sqlStmt = sqlStmt + "subjob_code <> '' order by subjob_code, subjob_name";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				subjobCode 	= rs.getString("subjob_code");
				if (rs.getString("subjob_name") != null) 		subjobName = rs.getString("subjob_name"); else subjobName = "";
				 
			//	amount 			= df2.format(Float.parseFloat(amount));
				
				subjobMasterList.add(new SubjobMasterForm(subjobCode, subjobName));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return subjobMasterList;
	 }
	
	public void AddSubjobMaster(String subjobCode, String subjobName)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "INSERT IGNORE INTO subjob_master(subjob_code, subjob_name) " +
		"VALUES ('"+subjobCode+"', '"+subjobName+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void UpdateSubjobMaster(String subjobCode, String subjobName, String subjobCodeHD)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE subjob_master set subjob_code = '"+subjobCode+"', subjob_name = '"+subjobName+"', " +
				"WHERE subjob_code = '"+subjobCodeHD+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void DeleteSubjobMaster(String subjobCode)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE From subjob_master "+
		"WHERE subjob_code = '"+subjobCode+"'";
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
