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
			
			String sqlStmt = "SELECT max(SUBSTRING(docno, 1,4)) as lno FROM runningdocno "+
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
				requestno = "000000" + requestno; 
			} else if (requestno.length() == 2) {
				requestno = "00000" + requestno; 
			} else if (requestno.length() == 3) {
				requestno = "0000" + requestno; 
			} else if (requestno.length() == 4) {
				requestno = "000" + requestno; 
			} else if (requestno.length() == 5) {
				requestno = "00" + requestno; 
			} else if (requestno.length() == 6) {
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
	
	public void AddReceiveHD(String docNo, String projectCode, String costCode, String docDate, String day, String month, String year, String amountFrom, String local)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "INSERT IGNORE INTO receivehd(docno, projectcode, costcode, docdate, day, month, year, amountfrom, local) " +
		"VALUES ('"+docNo+"', '"+projectCode+"''"+costCode+"', '"+docDate+"''"+day+"', '"+month+"', '"+year+"', '"+amountFrom+"', '"+local+"')";
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
