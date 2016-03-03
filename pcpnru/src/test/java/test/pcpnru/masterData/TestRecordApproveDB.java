package test.pcpnru.masterData;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pcpnru.masterModel.RecordApproveModel;
import pcpnru.utilities.DBConnect;
import pcpnru.utilities.DateUtil;
import test.pcpnru.masterModel.TestRecordApproveModel;

public class TestRecordApproveDB {
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	PreparedStatement ppStmt = null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List GetListPR_Header(String pr_number,String pr_title,String pr_date,String pr_month,String pr_year) throws IOException, Exception{
		
		List ListPR = new ArrayList();
		
		String sqlQuery = "SELECT * FROM `record_approve_hd` "
				+ "where ";
		
				if(!pr_number.equals(""))
					sqlQuery += "docno = '"+pr_number+"' and ";
				
				if(!pr_title.equals(""))
					sqlQuery += "record_approve_title like '%"+pr_title+"%' and ";
				
				if(!pr_date.equals(""))
					sqlQuery += "record_approve_date = '"+pr_date+"' and ";
				
				if(!pr_month.equals(""))
					sqlQuery += "MONTH(record_approve_date) = '"+pr_month+"' and ";
				
				if(!pr_year.equals(""))
					sqlQuery += "YEAR(record_approve_date) = '"+pr_year+"' and ";
				
				sqlQuery += "docno != ''";
		
		conn = agent.getConnectMYSql();
		pStmt = conn.createStatement();
		rs = pStmt.executeQuery(sqlQuery);
		
		String forwhat = "prhd";
		
		while(rs.next()){
			ListPR.add(new TestRecordApproveModel(forwhat,rs.getString("docno"),rs.getString("record_approve_title"),rs.getString("record_approve_cen")
					,rs.getString("create_by"),rs.getString("year"),rs.getString("record_approve_date")));
		}
		
		if(!rs.isClosed())
			rs.close();
		if(pStmt.isClosed())
			pStmt.close();
		if(!conn.isClosed())
			conn.close();
		
		return ListPR;
	}
	public Map GetAllValueHeader_byDocno(String docno,String year) throws IOException, Exception{
		Map mapresultGet = new HashMap();
		
		String sqlQuery = "SELECT "
				+ "a.docno,a.`year`,a.record_approve_hd,a.record_approve_t,a.record_approve_date,a.record_approve_title,"
				+ "a.record_approve_rian,a.record_approve_des1,a.record_approve_des2,a.record_approve_des3,a.record_approve_cen,"
				+ "a.record_approve_dep,a.thaidate_report,a.create_by "
				+ "FROM "
				+ "record_approve_hd AS a "
				+ "WHERE "
				+ "a.docno = '"+docno+"' and year = '"+year+"'";
		
		conn = agent.getConnectMYSql();
		pStmt = conn.createStatement();
		rs = pStmt.executeQuery(sqlQuery);
		
		while (rs.next()) {
			mapresultGet.put("docno", rs.getString("docno"));
			mapresultGet.put("year", rs.getString("year"));
			mapresultGet.put("record_approve_hd", rs.getString("record_approve_hd"));
			mapresultGet.put("record_approve_t", rs.getString("record_approve_t"));
			mapresultGet.put("record_approve_date", rs.getString("record_approve_date"));
			mapresultGet.put("record_approve_title", rs.getString("record_approve_title"));
			mapresultGet.put("record_approve_rian", rs.getString("record_approve_rian"));
			mapresultGet.put("record_approve_des1", rs.getString("record_approve_des1"));
			mapresultGet.put("record_approve_des2", rs.getString("record_approve_des2"));
			mapresultGet.put("record_approve_des3", rs.getString("record_approve_des3"));
			mapresultGet.put("record_approve_cen", rs.getString("record_approve_cen"));
			mapresultGet.put("record_approve_dep", rs.getString("record_approve_dep"));
			mapresultGet.put("thaidate_report", rs.getString("thaidate_report"));
			mapresultGet.put("create_by", rs.getString("create_by"));
		}		
		
		if(!rs.isClosed())
			rs.close();
		if(pStmt.isClosed())
			pStmt.close();
		if(!conn.isClosed())
			conn.close();
		
		return mapresultGet;
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
	public List ListRecordApproveDT(String docno,String month, String year) throws IOException, Exception{
		String itemno = "", description = "", qty = "0", unit = "";
		
		String sqlWhere = "";
		if(!docno.equals("")){
			sqlWhere += "b.docno = '"+docno+"' AND ";
		}
		if(!year.equals("")){
			sqlWhere += "b.year = '"+year+"' AND ";
		}
		
		if(!month.equals("")){
			sqlWhere += "substr(a.record_approve_date from 6 for 2) = '"+month+"' AND ";
		}
		
		String sqlQuery = "SELECT "
				+ "b.docno,b.`year`,a.record_approve_date,b.itemno,b.numthai_itemno,b.description,"
				+ "b.qty,b.numthai_qty,b.unit,b.create_by "
				+ "FROM "
				+ "record_approve_hd AS a "
				+ "INNER JOIN record_approve_dt AS b ON a.docno = b.docno AND a.`year` = b.`year` "
				+ "where ";
				sqlQuery += sqlWhere;
		sqlQuery +=  "b.docno <> '' order by itemno ";
		
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
}
