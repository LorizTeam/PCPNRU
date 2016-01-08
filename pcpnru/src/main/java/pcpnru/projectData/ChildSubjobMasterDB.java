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
 

public class ChildSubjobMasterDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List GetChildSubjobMasterList(String subjobcode, String childsubjobcode, String childsubjobname) 
	throws Exception { //30-05-2014
		List childSubjobMasterList = new ArrayList();
		String amount = "", unit = "", subjobname = "";
		DecimalFormat df1 = new DecimalFormat("#,###,##0.##");
		DecimalFormat df2 = new DecimalFormat("#,###,##0.00");
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT subjobcode, subjob_name, childsubjobcode, childsubjobname " +
			"FROM childsubjob_master left join subjob_master on(subjobcode = subjob_code) " +
			"WHERE "; 
			if(!subjobcode.equals("")) sqlStmt = sqlStmt+ "subjobcode like '"+subjobcode+"%' AND ";
			if(!childsubjobcode.equals("")) sqlStmt = sqlStmt+ "childsubjobcode like '"+childsubjobcode+"%' AND ";
			if(!childsubjobname.equals("")) sqlStmt = sqlStmt+ "childsubjobname like '"+childsubjobname+"%' AND ";
			
			sqlStmt = sqlStmt + "childsubjobcode <> '' order by subjobcode, childsubjobcode, childsubjobname";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				subjobcode 	= rs.getString("subjobcode");
				subjobname  = rs.getString("subjob_name");
				childsubjobcode 	= rs.getString("childsubjobcode");
				if (rs.getString("childsubjobname") != null) childsubjobname = rs.getString("childsubjobname"); else childsubjobname = "";
				 
			//	amount 			= df2.format(Float.parseFloat(amount));
				
				childSubjobMasterList.add(new ChildSubjobMasterForm(subjobcode, subjobname, childsubjobcode, childsubjobname));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return childSubjobMasterList;
	 }
	
	public void AddChildSubjobMaster(String subjobcode, String childsubjobcode, String childsubjobname)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "INSERT IGNORE INTO childsubjob_master(subjobcode, childsubjobcode, childsubjobname) " +
		"VALUES ('"+subjobcode+"', '"+childsubjobcode+"', '"+childsubjobname+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void UpdateChildSubjobMaster(String subjobcode, String childsubjobcode, String childsubjobname, String childsubjobcodehd)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE childsubjob_master set childsubjobcode = '"+childsubjobcode+"', childsubjobname = '"+childsubjobname+"' " +
				"WHERE subjobcode = '"+subjobcode+"' and childsubjobcode = '"+childsubjobcodehd+"'";
		//System.out.println(sqlStmt); 
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void DeleteChildSubjobMaster(String subjobcode, String childsubjobcode)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE From childsubjob_master "+
		"WHERE subjobcode = '"+subjobcode+"' and childsubjobcode = '"+childsubjobcode+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
}
