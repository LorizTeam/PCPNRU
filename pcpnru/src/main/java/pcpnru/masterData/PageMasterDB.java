package pcpnru.masterData;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pcpnru.masterModel.AuthenMasterModel;
import pcpnru.masterModel.PageMasterModel;
import pcpnru.utilities.*;
 

public class PageMasterDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List getListPage(String page_code) throws IOException, Exception{
		String page_name = "";
		String sqlWhere = "";
		if(!page_code.equals("")){
			sqlWhere += "page_master.page_code = '"+page_code+"' AND ";
		}
		
		String sqlQuery = "SELECT "
				+ "page_master.page_code, "
				+ "page_master.page_name "
				+ "FROM "
				+ "page_master where ";
				sqlQuery += sqlWhere;
		sqlQuery +=  "page_master.page_code <> '' order by page_master.page_code ";
		
		conn = agent.getConnectMYSql();
		pStmt = conn.createStatement();
		rs = pStmt.executeQuery(sqlQuery);
		
		List getListPage = new ArrayList(); 
		while(rs.next()){
			page_code		 = rs.getString("page_code");
			page_name 		 = rs.getString("page_name");
			 
			getListPage.add(new PageMasterModel(page_code, page_name));
		}
		
		rs.close();
		pStmt.close();
		conn.close();
		
		return getListPage;
	}
	
	public void AddPageMaster(String page_code, String page_name)  throws Exception{
		
		conn = agent.getConnectMYSql();
		
		String dateTime = "";
		String sqlStmt = "INSERT INTO page_master (page_code, page_name, datetime) " +
				"VALUES ('"+page_code+"', '"+page_name+"', now())";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	
	public void UpdatePageMaster(String page_code, String page_name)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE page_master set page_name = '"+page_name+"', datetime = now()" +
				"WHERE page_code = '"+page_code+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	
	public void DeletePageMaster(String page_code)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE From page_master "+
		"WHERE page_code = '"+page_code+"'";
		//System.out.println(sqlStmt);
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
	

}
