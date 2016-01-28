package pcpnru.projectData;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import pcpnru.utilities.DBConnect;
import pcpnru.utilities.DateUtil;

public class RequisitionDB {
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public String AddRequisitionHD(String requisition_docno,String project_code,String project_year,
			String docdate,String takeby,String from_budget) throws IOException, Exception{
		String returnstatus = "false";
		int resultrows = 0;
		String sqlQuery = "insert ignore into requisition_hd (`requisition_docno`, `project_code`"
				+ ", `project_year`, `docdate`, `takeby`, `from_budget`) "
				+ "VALUES ('"+requisition_docno+"', '"+project_code+"', '"+project_year+"'"
						+ ", '"+docdate+"', 'aof', '"+from_budget+"') ";
		conn = agent.getConnectMYSql();
		pStmt = conn.createStatement();
		resultrows = pStmt.executeUpdate(sqlQuery);
		if(resultrows > 0){
			returnstatus = "success";
		}
		return returnstatus;
	}
}
