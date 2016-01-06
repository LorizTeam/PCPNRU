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
		String amount = "", unit = "";
		DecimalFormat df1 = new DecimalFormat("#,###,##0.##");
		DecimalFormat df2 = new DecimalFormat("#,###,##0.00");
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT costcode, costname " +
			"FROM costcode_master " +
			"WHERE "; 
			if(!costCode.equals("")) sqlStmt = sqlStmt+ "costcode like '"+costCode+"%' AND ";
			if(!costName.equals("")) sqlStmt = sqlStmt+ "costname like '"+costName+"%' AND ";
			
			sqlStmt = sqlStmt + "costcode <> '' order by costcode, costname";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				costCode 	= rs.getString("costcode");
				if (rs.getString("costname") != null) 		costName = rs.getString("costname"); else costName = "";
				 
			//	amount 			= df2.format(Float.parseFloat(amount));
				
				costCodeMasterList.add(new CostCodeMasterForm(costCode, costName));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return costCodeMasterList;
	 }
	
	public void AddProjectMaster(String projectCode, String projectName)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "INSERT IGNORE INTO project_master(project_code, project_name) " +
		"VALUES ('"+projectCode+"', '"+projectName+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void UpdateProjectMaster(String projectCode, String projectName, String projectCodeHD)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE project_master set project_code = '"+projectCode+"', project_name = '"+projectName+"' " +
				"WHERE project_code = '"+projectCodeHD+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void DeleteProjectMaster(String projectCode)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE From project_master "+
		"WHERE project_code = '"+projectCode+"'";
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
