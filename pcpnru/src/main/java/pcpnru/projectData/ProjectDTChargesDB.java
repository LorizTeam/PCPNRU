package pcpnru.projectData;

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
 

public class ProjectDTChargesDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List GetProjDTChargesList(String projectcode) 
			throws Exception { //18-01-2016
				List ProjDTReceive = new ArrayList(); 
				String gcostcost = "", gcostname  = "", budget = ""; 
				try { 
					conn = agent.getConnectMYSql();
					
					String sqlStmt = "SELECT project_code, gcostcode, gcostcode_name, budget " +
					"FROM projectplan_detail WHERE ";
					if(!projectcode.equals("")) sqlStmt = sqlStmt+ "project_code = '"+projectcode+"' AND ";
					sqlStmt = sqlStmt + "project_code <> '' and subjob_code not in ('0003') order by datetime_response desc";
					
					//System.out.println(sqlStmt);				
					pStmt = conn.createStatement();
					rs = pStmt.executeQuery(sqlStmt);	
					while (rs.next()) {
						projectcode		= rs.getString("project_code"); 
						gcostcost		= rs.getString("gcostcode");
						gcostname 		= rs.getString("gcostcode_name"); 
						budget 			= rs.getString("budget"); 
						 
						ProjDTReceive.add(new ProjectModel(projectcode, gcostcost, gcostname, budget));
					}
					rs.close();
					pStmt.close();
					conn.close();
				} catch (SQLException e) {
				    throw new Exception(e.getMessage());
				}
				return ProjDTReceive;
			 }
	
	public void AddProjDTReceive(String projectcode, String subjob, String csubjob, String costcode, String costname, String budget)  throws Exception{
		
		conn = agent.getConnectMYSql();
		 
		String sqlStmt = "INSERT IGNORE INTO projectplan_detail(project_code, subjob_code, childsubjobcode, gcostcode, gcostcode_name, budget, datetime_response) " +
		"VALUES ('"+projectcode+"', '"+subjob+"', '"+csubjob+"', '"+costcode+"', '"+costname+"', '"+budget+"', now())";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	} 
	public void DeleteProjDTReceive(String projectcode, String costcode)  throws Exception{
		conn = agent.getConnectMYSql();
		 
		String sqlStmt = "DELETE From projectplan_detail "+
		"WHERE project_code = '"+projectcode+"' and gcostcode = '"+costcode+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public String getAmtValue(String percentage) throws Exception {
	
	String amountTotal = "";
	
	conn = agent.getConnectMYSql();
 	
 	String sqlStmt = "SELECT sum(budget) as att " +
	"FROM projectplan_detail WHERE subjob_code = '0003' Group by subjob_code ";
 	
 	pStmt = conn.createStatement();
	rs = pStmt.executeQuery(sqlStmt);	
	
	while (rs.next()) {
		amountTotal = rs.getString("att"); 
	}
	amountTotal = Float.toString((Float.parseFloat(amountTotal)*Float.parseFloat(percentage))/100);
	
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
	public List GetSubjobList() 
			throws Exception { //19-01-2016
				List childSubjobList = new ArrayList();
				String subjobcode = "", subjobname = "";
				try {
				
					conn = agent.getConnectMYSql();
					
					String sqlStmt = "SELECT subjob_code, subjob_name " +
					"FROM subjob_master " +
					"WHERE "; 
					//if(!subjobcode.equals("")) sqlStmt = sqlStmt+ "subjobcode like '"+subjobcode+"%' AND ";
					//if(!childsubjobcode.equals("")) sqlStmt = sqlStmt+ "childsubjobcode like '"+childsubjobcode+"%' AND ";
					//if(!childsubjobname.equals("")) sqlStmt = sqlStmt+ "childsubjobname like '"+childsubjobname+"%' AND ";
					
					sqlStmt = sqlStmt + "subjob_code not in ('0003') order by subjob_code";
					
					//System.out.println(sqlStmt);				
					pStmt = conn.createStatement();
					rs = pStmt.executeQuery(sqlStmt);	
					while (rs.next()) {
					 	subjobcode 	= rs.getString("subjob_code");
					 	subjobname  = rs.getString("subjob_name");
						 
						childSubjobList.add(new SubjobMasterForm(subjobcode, subjobname));
					}
					rs.close();
					pStmt.close();
					conn.close();
				} catch (SQLException e) {
				    throw new Exception(e.getMessage());
				}
				return childSubjobList;
			 }
	public List GetChildSubjobList() 
			throws Exception { //19-01-2016
				List childSubjobList = new ArrayList();
				String childsubjobcode = "", childsubjobname = "";
				try {
				
					conn = agent.getConnectMYSql();
					
					String sqlStmt = "SELECT subjobcode, subjob_name, childsubjobcode, childsubjobname " +
					"FROM childsubjob_master left join subjob_master on(subjobcode = subjob_code) " +
					"WHERE "; 
					//if(!subjobcode.equals("")) sqlStmt = sqlStmt+ "subjobcode like '"+subjobcode+"%' AND ";
					//if(!childsubjobcode.equals("")) sqlStmt = sqlStmt+ "childsubjobcode like '"+childsubjobcode+"%' AND ";
					//if(!childsubjobname.equals("")) sqlStmt = sqlStmt+ "childsubjobname like '"+childsubjobname+"%' AND ";
					
					sqlStmt = sqlStmt + "subjobcode = '0003'  group by subjobcode order by childsubjob_master.datetime desc";
					
					//System.out.println(sqlStmt);				
					pStmt = conn.createStatement();
					rs = pStmt.executeQuery(sqlStmt);	
					while (rs.next()) {
					//	subjobcode 	= rs.getString("subjobcode");
					//	subjobname  = rs.getString("subjob_name");
						childsubjobcode 	= rs.getString("childsubjobcode");
						if (rs.getString("childsubjobname") != null) childsubjobname = rs.getString("childsubjobname"); else childsubjobname = "";
						 
						childSubjobList.add(new ChildSubjobMasterForm(childsubjobcode, childsubjobname));
					}
					rs.close();
					pStmt.close();
					conn.close();
				} catch (SQLException e) {
				    throw new Exception(e.getMessage());
				}
				return childSubjobList;
			 }
	public List GetGroupCostCodeList() 
			throws Exception { //30-05-2014
				List groupcostCodeList = new ArrayList();
				String groupcostCode = "",groupcostName=""; 
				try {
				
					conn = agent.getConnectMYSql();
					
					String sqlStmt = "SELECT gcostcode, gcostcode_name,gcostcode_standardprice,gcostcode_fundprice, DATE_FORMAT(datetime,'%d-%m-%Y %H:%i') as datetime " +
					"FROM groupcostcode_master " +
					"WHERE "; 
					if(!groupcostCode.equals("")) sqlStmt = sqlStmt+ "gcostcode like '"+groupcostCode+"%' AND ";
					if(!groupcostName.equals("")) sqlStmt = sqlStmt+ "gcostcode_name like '"+groupcostName+"%' AND ";
					
					sqlStmt = sqlStmt + "gcostcode <> '' order by datetime desc";
					
					//System.out.println(sqlStmt);				
					pStmt = conn.createStatement();
					rs = pStmt.executeQuery(sqlStmt);	
					while (rs.next()) {
						groupcostCode 	= rs.getString("gcostcode"); 
						if (rs.getString("gcostcode_name") != null) 		groupcostName = rs.getString("gcostcode_name"); else groupcostName = "";
						  
						groupcostCodeList.add(new GroupCostCodeMasterModel(groupcostCode, groupcostName));
					}
					rs.close();
					pStmt.close();
					conn.close();
				} catch (SQLException e) {
				    throw new Exception(e.getMessage());
				}
				return groupcostCodeList;
			 }
}
