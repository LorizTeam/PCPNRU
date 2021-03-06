package pcpnru.projectData;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import pcpnru.projectModel.*;
import pcpnru.utilities.*;
 

public class Receive1DB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public String SelectUpdateDocNo(String year) throws Exception {
		String requestno = "";
		try {
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT max(SUBSTRING(docno, 5,10)) as lno FROM runningdocno "+
					"WHERE SUBSTRING(docno, 1,4) = '"+year+"' limit 1 ";
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);		
			while (rs.next()) {
				requestno	= rs.getString("lno");
				if(null==requestno){
					requestno = "0";
				}
				requestno 	= String.valueOf(Integer.parseInt(requestno) + 1); 
			}
			
			if (requestno.length() == 1) {
				requestno = "00000" + requestno; 
			} else if (requestno.length() == 2) {
				requestno = "0000" + requestno; 
			} else if (requestno.length() == 3) {
				requestno = "000" + requestno; 
			} else if (requestno.length() == 4) {
				requestno = "00" + requestno; 
			} else if (requestno.length() == 5) {
				requestno = "0" + requestno; 
			} 
			 
			rs.close();
			pStmt.close();
			
			if(!requestno.equals("000001")){ 
				requestno = year+requestno;
				sqlStmt = "UPDATE runningdocno set docno = '"+requestno+"' " +
						"WHERE SUBSTRING(docno, 1,4) = '"+year+"'"; 
				pStmt = conn.createStatement();
				pStmt.executeUpdate(sqlStmt);
				pStmt.close();
			}else{
				requestno = year+requestno;
				sqlStmt = "INSERT IGNORE INTO runningdocno(docno) " +
						"VALUES ('"+requestno+"')"; 
				pStmt = conn.createStatement();
				pStmt.executeUpdate(sqlStmt);
				pStmt.close();
			}
			
			conn.close();
			} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {
			try {
				if (pStmt != null) pStmt.close();
				if (conn != null)  conn.close();
			} catch (SQLException e) {
				throw new Exception(e.getMessage());
			}
		}
		return requestno;
		}
	
	public void AddReceiveHD(String docNo, String projectCode,String project_year, String gcostCode, String docDate, String day, String month, String year, String amountFrom, String local)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String[] parts = projectCode.split(" - ");
		String pjCode = parts[0]; 
		 
		String[] parts1 = gcostCode.split(" - ");
		String cCode = parts1[0];   
		
		String sqlStmt = "INSERT IGNORE INTO receivehd(docno, projectcode,project_year, gcostcode, docdate, day, month, year, amountfrom, local) " +
		"VALUES ('"+docNo+"', '"+pjCode+"','"+project_year+"',  '"+cCode+"', '"+docDate+"', '"+day+"', '"+month+"', '"+year+"', '"+amountFrom+"', '"+local+"')";
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
	conn.close();
	
	return chkCustomer;
	}
	public List GetAmountFrom() 
			throws Exception { //30-05-2014
				List amtFromList = new ArrayList();
				 
				String amtFrom  = "";
				
				try {
				
					conn = agent.getConnectMYSql();
					
					String sqlStmt = "SELECT amountfrom " +
					"FROM receivehd WHERE ";
					
					sqlStmt = sqlStmt + "amountfrom <> '' group by amountfrom order by amountfrom";
					
					//System.out.println(sqlStmt);				
					pStmt = conn.createStatement();
					rs = pStmt.executeQuery(sqlStmt);	
					while (rs.next()) {
						amtFrom		= rs.getString("amountfrom"); 
						
						amtFromList.add(new ReceiveForm("1", amtFrom, ""));
					}
					rs.close();
					pStmt.close();
					conn.close();
				} catch (SQLException e) {
				    throw new Exception(e.getMessage());
				}
				return amtFromList;
			 }
	public List GetLocal() 
			throws Exception { //30-05-2014
				List localList = new ArrayList();
				 
				String local  = "";
				
				try {
				
					conn = agent.getConnectMYSql();
					
					String sqlStmt = "SELECT local " +
					"FROM receivehd WHERE ";
					
					sqlStmt = sqlStmt + "local <> '' group by local order by local";
					
					//System.out.println(sqlStmt);				
					pStmt = conn.createStatement();
					rs = pStmt.executeQuery(sqlStmt);	
					while (rs.next()) {
						local		= rs.getString("local"); 
						
						localList.add(new ReceiveForm("2", "", local));
					}
					rs.close();
					pStmt.close();
					conn.close();
				} catch (SQLException e) {
				    throw new Exception(e.getMessage());
				}
				return localList;
			 }
	public List GetSelectReceiveList(String docNo, String projectcode, String costcode, 
			String docdate, String amountfrom, String local) 
		throws Exception { //30-05-2014
			List SelectReceiveList = new ArrayList();
				 
			String project = "", cost = "";
				
			try {
				
				conn = agent.getConnectMYSql();
					
				String sqlStmt = "SELECT docno, CONCAT(project_code,' - ',project_name) as project, "+
						"CONCAT(a.costcode,' - ',costname) cost, docdate, amountfrom, local " +
				"FROM receivehd a "+
				"left join project_master b on(b.project_code = a.projectcode) "+
				"left join costcode_master c on(c.costcode = a.costcode) "+
				"WHERE ";
				if(!docNo.equals("")) sqlStmt = sqlStmt+ "a.docno = '"+docNo+"' AND ";
				if(!projectcode.equals("")) sqlStmt = sqlStmt+ "a.projectcode = '"+projectcode+"' AND ";
				if(!costcode.equals("")) sqlStmt = sqlStmt+ "a.costcode = '"+costcode+"' AND ";
				if(!docdate.equals("")) sqlStmt = sqlStmt+ "a.docdate = '"+docdate+"' AND ";
				if(!amountfrom.equals("")) sqlStmt = sqlStmt+ "a.amountfrom = '"+amountfrom+"' AND ";
				if(!local.equals("")) sqlStmt = sqlStmt+ "a.local = '"+local+"' AND ";
				
				sqlStmt = sqlStmt + "a.docno <> '' order by docdate, docno desc";
					
				//System.out.println(sqlStmt);				
				pStmt = conn.createStatement();
				rs = pStmt.executeQuery(sqlStmt);	
				while (rs.next()) {
					docNo 			= rs.getString("docno"); 
					if (rs.getString("project") != null)  project = rs.getString("project"); else project = "";
					if (rs.getString("cost") != null)  cost = rs.getString("cost"); else cost = "";
					docdate 	= rs.getString("docdate");
					amountfrom 	= rs.getString("amountfrom");
					local 		= rs.getString("local"); 
					 
					SelectReceiveList.add(new ReceiveForm(docNo, projectcode, project, cost, docdate, amountfrom, local));
				}
				rs.close();
				pStmt.close();
				conn.close();
			} catch (SQLException e) {
				   throw new Exception(e.getMessage());
			}
			return SelectReceiveList;
		}
	
	public List ShowCostCodeforReceive2(String gcostcode,String costcode) throws IOException, Exception{
		List Listcostcodereceive2 = new ArrayList();
		
		String sqlQuery = "select * FROM costcode_master AS a where ";
		
		if(!gcostcode.equals("")) sqlQuery = sqlQuery+ "a.gcostcode = '"+gcostcode+"' AND ";
		if(!costcode.equals("")) sqlQuery = sqlQuery+ "a.costcode = '"+costcode+"' AND ";
		
		sqlQuery += "a.costcode <> ''";
		
		conn = agent.getConnectMYSql();
		pStmt = conn.createStatement();
		rs = pStmt.executeQuery(sqlQuery);
		
		String costname = "",percentprice="",datetime="";
		while(rs.next()){
			costcode = rs.getString("costcode");
			costname = rs.getString("costname");
			gcostcode = rs.getString("gcostcode");
			percentprice = rs.getString("percentprice");
			datetime = rs.getString("datetime");
			
			Listcostcodereceive2.add(new ReceiveForm(costcode,costname,percentprice,datetime,gcostcode));
		}
		return Listcostcodereceive2;
	}
	
	public String SelectPriceStandard_fromgcostcode(String gcostcode) throws IOException, Exception{
		String sqlQuery = "SELECT "
				+ "a.gcostcode, "
				+ "a.gcostcode_name,"
				+ "a.gcostcode_standardprice,"
				+ "a.gcostcode_fundprice,"
				+ "a.datetime,"
				+ "a.type_gcostcode "
				+ "FROM "
				+ "groupcostcode_master AS a "
				+ "where "
				+ "gcostcode = '"+gcostcode+"'";

		conn = agent.getConnectMYSql();
		pStmt = conn.createStatement();
		rs = pStmt.executeQuery(sqlQuery);
		String standardprice = "";
		
		while(rs.next()){
			standardprice = rs.getString("gcostcode_standardprice");
		}
		
		rs.close();
		pStmt.close();
		conn.close();
		
		return standardprice;
	}
}
