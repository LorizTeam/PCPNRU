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
 

public class Receive2DB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List GetReceiveList(String docNo) 
			throws Exception { //30-05-2014
				List ReceiveList = new ArrayList();
				 
				String itemNo  = "", description = "", qty = "", amount = "", amountTotal = "";
				
				DecimalFormat df1 = new DecimalFormat("#,###,##0.##");
				DecimalFormat df2 = new DecimalFormat("#,###,##0.00");
				try {
				
					conn = agent.getConnectMYSql();
					
					String sqlStmt = "SELECT docno, itemno, description, qty, amount, amounttotal " +
					"FROM receivedt WHERE docno = '"+docNo+"' and ";
					
					sqlStmt = sqlStmt + "docno <> '' order by itemno";
					
					//System.out.println(sqlStmt);				
					pStmt = conn.createStatement();
					rs = pStmt.executeQuery(sqlStmt);	
					while (rs.next()) {
						docNo 			= rs.getString("docno");
						itemNo 			= rs.getString("itemno"); 
						if (rs.getString("description") != null)  description = rs.getString("description"); else description = "";
						qty 			= rs.getString("qty");
						amount 			= rs.getString("amount");
						amountTotal 	= rs.getString("amounttotal");
						
						itemNo			= Integer.toString(Integer.parseInt(itemNo));
						qty 			= df1.format(Float.parseFloat(qty));
						amount 			= df2.format(Float.parseFloat(amount));
						amountTotal 	= df2.format(Float.parseFloat(amountTotal));
						
						ReceiveList.add(new ReceiveForm(docNo, itemNo, description, qty, amount, amountTotal));
					}
					rs.close();
					pStmt.close();
					conn.close();
				} catch (SQLException e) {
				    throw new Exception(e.getMessage());
				}
				return ReceiveList;
			 }
	
	public void AddReceiveDT(String docNo, String description, String qty, String amount, String amountTotal)  throws Exception{
		
		conn = agent.getConnectMYSql();
		
			String itemNo = "0";   
			String sqlStmt= "SELECT itemno FROM receivedt WHERE "+
				"docno = '"+docNo+"' " +
				"ORDER BY itemno DESC LIMIT 1";
				
			//	System.out.println(sqlStmt);
				pStmt = conn.createStatement();
				rs = pStmt.executeQuery(sqlStmt);			
				while (rs.next()) {
					itemNo	= rs.getString("itemno");
				}
				rs.close();
				pStmt.close();
				
				itemNo	= String.valueOf(Integer.parseInt(itemNo)+1);
				if (itemNo.length() == 1) itemNo = "00" + itemNo;
				if (itemNo.length() == 2) itemNo = "0" + itemNo;
		
		sqlStmt = "INSERT IGNORE INTO receivedt(docno, itemno, description, qty, amount, amountTotal) " +
		"VALUES ('"+docNo+"', '"+itemNo+"', '"+description+"', '"+qty+"', '"+amount+"', '"+amountTotal+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void UpdateReceive(String docNo, String itemNo, String description, String qty, String amount, String amountTotal)  throws Exception{
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
	DecimalFormat df1 = new DecimalFormat("#,###,##0.##");
	DecimalFormat df2 = new DecimalFormat("#,###,##0.00");
	
	conn = agent.getConnectMYSql();
 	
 	String sqlStmt = "SELECT sum(amounttotal) as att " +
	"FROM receivedt WHERE docno = '"+docNo+"' Group by docno ";
 	
 	pStmt = conn.createStatement();
	rs = pStmt.executeQuery(sqlStmt);	
	
	while (rs.next()) {
		amountTotal = rs.getString("att"); 
	}
	amountTotal 	= df2.format(Float.parseFloat(amountTotal));
	
	rs.close();
	pStmt.close();
	
	return amountTotal;
	}
}
