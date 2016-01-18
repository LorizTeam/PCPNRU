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
 

public class ProjectDTReceiveDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List GetProjDTReceiveList(String projectcode) 
			throws Exception { //18-01-2016
				List ProjDTReceive = new ArrayList(); 
				String costname  = "", budget = ""; 
				try { 
					conn = agent.getConnectMYSql();
					
					String sqlStmt = "SELECT project_code, costname, budget " +
					"FROM projectplan_detail WHERE ";
					if(!projectcode.equals("")) sqlStmt = sqlStmt+ "project_code = '"+projectcode+"' AND ";
					sqlStmt = sqlStmt + "project_code <> '' order by datetime_response desc";
					
					//System.out.println(sqlStmt);				
					pStmt = conn.createStatement();
					rs = pStmt.executeQuery(sqlStmt);	
					while (rs.next()) {
						projectcode		= rs.getString("project_code"); 
						costname 		= rs.getString("costname"); 
						budget 			= rs.getString("budget"); 
						 
						ProjDTReceive.add(new ProjectModel(projectcode, costname, budget));
					}
					rs.close();
					pStmt.close();
					conn.close();
				} catch (SQLException e) {
				    throw new Exception(e.getMessage());
				}
				return ProjDTReceive;
			 }
	
	public void AddProjDTReceive(String projectcode, String costname, String budget)  throws Exception{
		
		conn = agent.getConnectMYSql();
		 
		String sqlStmt = "INSERT IGNORE INTO projectplan_detail(project_code, costname, budget, datetime_response) " +
		"VALUES ('"+projectcode+"', '"+costname+"', '"+budget+"', now())";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void UpdateProjDTReceive(String docNo, String itemNo, String description, String qty, String amount, String amountTotal)  throws Exception{
		conn = agent.getConnectMYSql();
		  
		if (itemNo.length() == 1) itemNo = "00" + itemNo;
		if (itemNo.length() == 2) itemNo = "0" + itemNo;
		
		String sqlStmt = "UPDATE receivedt set description = '"+description+"', qty = '"+qty+"', amount = '"+amount+"', amounttotal = '"+amountTotal+"' " +
				"WHERE docno = '"+docNo+"' and itemno = '"+itemNo+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void DeleteReceiveDT(String docNo, String itemNo)  throws Exception{
		conn = agent.getConnectMYSql();
		
		if (itemNo.length() == 1) itemNo = "00" + itemNo;
		if (itemNo.length() == 2) itemNo = "0" + itemNo;
		
		String sqlStmt = "DELETE From receivedt "+
		"WHERE docno = '"+docNo+"' and itemno = '"+itemNo+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public String getSumAmount(String docNo) throws Exception {
	
	String amountTotal = "";
	
	conn = agent.getConnectMYSql();
 	
 	String sqlStmt = "SELECT sum(amounttotal) as att " +
	"FROM receivedt WHERE docno = '"+docNo+"' Group by docno ";
 	
 	pStmt = conn.createStatement();
	rs = pStmt.executeQuery(sqlStmt);	
	
	while (rs.next()) {
		amountTotal = rs.getString("att"); 
	}
	
	
	rs.close();
	pStmt.close();
	
	return amountTotal;
	}
	public String SumReceive(String docNo) 
			throws Exception { //30-05-2014
				 
				String itemNo  = "", description = "", qty = "", amount = "", amountTotal = "";
				
				try {
				
					conn = agent.getConnectMYSql();
					
					String sqlStmt = "SELECT sum(amounttotal) as sumamt " +
					"FROM receivedt WHERE docno = '"+docNo+"' ";
					
					sqlStmt = sqlStmt + "group by docno order by itemno";
					
					//System.out.println(sqlStmt);				
					pStmt = conn.createStatement();
					rs = pStmt.executeQuery(sqlStmt);	
					while (rs.next()) {
						 
						amountTotal 	= rs.getString("sumamt");
						
					
					}
					rs.close();
					pStmt.close();
					conn.close();
				} catch (SQLException e) {
				    throw new Exception(e.getMessage());
				}
				return amountTotal;
			 }
}
