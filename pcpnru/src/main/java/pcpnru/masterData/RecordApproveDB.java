package pcpnru.masterData;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pcpnru.masterModel.AuthenMasterModel;
import pcpnru.masterModel.RecordApproveModel;
import pcpnru.utilities.*;
 

public class RecordApproveDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List getListAuthen(String authen_type) throws IOException, Exception{
		String authen_type_name = "";
		String sqlWhere = "";
		if(!authen_type.equals("")){
			sqlWhere += "authen_master.authen_type = '"+authen_type+"' AND ";
		}
		
		String sqlQuery = "SELECT "
				+ "authen_master.authen_type, "
				+ "authen_master.authen_type_name "
				+ "FROM "
				+ "authen_master where ";
				sqlQuery += sqlWhere;
		sqlQuery +=  "authen_master.authen_type <> '' order by authen_master.authen_type ";
		
		conn = agent.getConnectMYSql();
		pStmt = conn.createStatement();
		rs = pStmt.executeQuery(sqlQuery);
		
		List getListAuthen = new ArrayList(); 
		while(rs.next()){
			authen_type		 = rs.getString("authen_type");
			authen_type_name = rs.getString("authen_type_name");
			 
			getListAuthen.add(new AuthenMasterModel(authen_type, authen_type_name));
		}
		
		rs.close();
		pStmt.close();
		conn.close();
		
		return getListAuthen;
	}
	public List ListRecordApproveDT(String docno, String year) throws IOException, Exception{
		String itemno = "", description = "", qty = "0", unit = "";
		
		String sqlWhere = "";
		if(!docno.equals("")){
			sqlWhere += "docno = '"+docno+"' AND ";
		}
		if(!year.equals("")){
			sqlWhere += "year = '"+year+"' AND ";
		}
		
		String sqlQuery = "SELECT docno, year, itemno, description, qty, unit " 
				+ "FROM record_approve_dt "
				+ " where ";
				sqlQuery += sqlWhere;
		sqlQuery +=  "docno <> '' order by itemno ";
		
		conn = agent.getConnectMYSql();
		pStmt = conn.createStatement();
		rs = pStmt.executeQuery(sqlQuery);
		
		List ListRecordApproveDT = new ArrayList(); 
		while(rs.next()){
			docno		 	= rs.getString("docno");
			year 			= rs.getString("year");
			itemno			 = rs.getString("itemno");
			description 	= rs.getString("description");
			qty 			= rs.getString("qty");
			unit 			= rs.getString("unit");
			 
			ListRecordApproveDT.add(new RecordApproveModel(docno, year, itemno, description, qty, unit));
		}
		
		rs.close();
		pStmt.close();
		conn.close();
		
		return ListRecordApproveDT;
	}
	
	public void AddRecordApprovehd(String docno, String year, String record_approve_hd, String record_approve_t, String record_approve_date, String record_approve_title, String record_approve_rian,
			String record_approve_des1, String record_approve_des2, String record_approve_cen, String record_approve_dep)  throws Exception{
		
		conn = agent.getConnectMYSql();
		
		String dateTime = "";
		String sqlStmt = "INSERT IGNORE INTO record_approve_hd(docno, year, record_approve_hd, record_approve_t, record_approve_date, record_approve_title, record_approve_rian, "
				+ "record_approve_des1, record_approve_des2, record_approve_cen, record_approve_dep) " +
				"VALUES ('"+docno+"', '"+year+"','"+record_approve_hd+"', '"+record_approve_t+"','"+record_approve_date+"', '"+record_approve_title+"', '"+record_approve_rian+"', "
						+ "'"+record_approve_des1+"','"+record_approve_des2+"', '"+record_approve_cen+"', '"+record_approve_dep+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void AddRecordApprovedt(String docno, String year, String description, String qty, String unit)  throws Exception{
		
		conn = agent.getConnectMYSql();

		String itemno = "";
		String sqlStmt = "SELECT max(itemno) as lno FROM record_approve_dt "+
				"WHERE itemno <> '' and docno = '"+docno+"' and year = '"+year+"' ";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		rs = pStmt.executeQuery(sqlStmt);		
		while (rs.next()) {
			itemno	= rs.getString("lno"); 
		}
		if(null==itemno||"".equals(itemno))  itemno = "0";
		 
		itemno 	= String.valueOf(Integer.parseInt(itemno) + 1); 
		if (itemno.length() == 1) {
			itemno = "00" + itemno; 
		} else if (itemno.length() == 2) {
			itemno = "0" + itemno;   
		}
		
		rs.close();
		pStmt.close(); 
		
		sqlStmt = "INSERT IGNORE INTO record_approve_dt(docno, year, itemno, description, qty, unit) " +
				"VALUES ('"+docno+"', '"+year+"', '"+itemno+"', '"+description+"', '"+qty+"','"+unit+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	
	public void UpdateAuthenMaster(String authen_type, String authen_type_name)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE authen_master set authen_type_name = '"+authen_type_name+"', datetime = now()" +
				"WHERE authen_type = '"+authen_type+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	
	public void DeleteRecordApprovedt(String docno, String year, String itemno)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE From record_approve_dt "+
		"WHERE docno = '"+docno+"' and year = '"+year+"' and itemno = '"+itemno+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	} 
	public String SelectUpdateDocNo() throws Exception {
		String requestno = "";
		try {
			conn = agent.getConnectMYSql();
			 
			String year = dateUtil.curYear();
			
			String sqlStmt = "SELECT max(docno) as lno FROM runningdocno_recordapprove "+
					"WHERE docno <> '' and year = '"+year+"' ";
			//System.out.println(sqlStmt);
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);		
			while (rs.next()) {
				requestno	= rs.getString("lno"); 
			}
			rs.close();
			pStmt.close(); 
			
			if(null==requestno||"".equals(requestno)){ 
				requestno = "0";
				requestno 	= String.valueOf(Integer.parseInt(requestno) + 1); 
				
				sqlStmt = "INSERT IGNORE INTO runningdocno_recordapprove(docno, year) "+ 
							"VALUES ('"+requestno+"', '"+year+"')";
				//System.out.println(sqlStmt);
				pStmt = conn.createStatement();
				pStmt.executeUpdate(sqlStmt);
				pStmt.close(); 
				conn.close();
				
			}else{
				requestno 	= String.valueOf(Integer.parseInt(requestno) + 1); 
				
				sqlStmt = "UPDATE runningdocno_recordapprove set docno = '"+requestno+"'" +
						"WHERE year = '"+year+"'";
				//System.out.println(sqlStmt);
				pStmt = conn.createStatement();
				pStmt.executeUpdate(sqlStmt);
				pStmt.close(); 
				conn.close();
			} 
			
			if (requestno.length() == 1) {
				requestno = "0000" + requestno; 
			} else if (requestno.length() == 2) {
				requestno = "000" + requestno;   
			} else if (requestno.length() == 3) {
				requestno = "00" + requestno;   
			} else if (requestno.length() == 4) {
				requestno = "0" + requestno;   
			}   
			
			} catch (Exception e) {
			throw new Exception(e.getMessage());
		}  
		return requestno;
		}
}
