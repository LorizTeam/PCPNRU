package pcpnru.projectData;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import pcpnru.utilities.DBConnect;
import pcpnru.utilities.DateUtil;

public class PurchaseOrderDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public void AddPOHD(String po_docno, String year, String po_docdate, String type, String vender, int credit_day, double mulct_day
			, String quotation_number, String quotation_date)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "INSERT IGNORE INTO po_hd(po_docno, year, docdate, type, vender, creditday, penaltype_perday, ref_quotation, ref_quotationdate) " +
		"VALUES ('"+po_docno+"','"+year+"','"+po_docdate+"','"+type+"','"+vender+"',"+credit_day+","+mulct_day+",'"+quotation_number+"','"+quotation_date+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void UpdateProjectHD(String project_code, String target, String percen, String year)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE projectplan_header set project_code = '"+project_code+"', target = '"+target+"' , percen = '"+percen+"',"
				+ "year = '"+year+"' "+
				", datetime_response = now()" +
				"WHERE project_code = '"+project_code+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	
	public String SelectUpdateDocNo(String year) throws Exception {
		String requestno = "", typeR = "";
		try {
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT max(po_docno) as lno FROM po_hd "+
					"WHERE year = '"+year+"' ";
			//System.out.println(sqlStmt);
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);		
			while (rs.next()) {
				requestno	= rs.getString("lno");
				if(null==requestno||"".equals(requestno)){ 
					requestno = "0";
				} 
				requestno 	= String.valueOf(Integer.parseInt(requestno) + 1);  
			}
			
			if (requestno.length() == 1) {
				requestno = "0000" + requestno; 
			}else if (requestno.length() == 2) {
				requestno = "000" + requestno;   
			}else if (requestno.length() == 3) {
				requestno = "00" + requestno;   
			}else if (requestno.length() == 4) {
				requestno = "0" + requestno;   
			}  
			 
			rs.close();
			pStmt.close(); 
			conn.close();
			} catch (Exception e) {
			throw new Exception(e.getMessage());
		}  
		return requestno;
		}
}
