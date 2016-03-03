<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@ page import="pcpnru.utilities.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%
	String projectCode = request.getParameter("projectCode");
	String year = request.getParameter("year");
	String gcostcode = request.getParameter("gcostcode");
	
	String[] pjS = projectCode.split(" - ");
	projectCode = pjS[0];
	
	DBConnect dbcon = new DBConnect();
	ResultSet rs = null; 
	
	String sql = "SELECT ((IFNULL(SUM(a.budget),0)-IFNULL(SUM(c.amount_rock),0)+IFNULL(SUM(b.amount),0))) as frombalance "
			+ " FROM projectplan_detail a "
			+ " LEFT JOIN requisition b on (a.gcostcode = b.gcostcode and a.project_code = b.project_code and a.year = b.project_year) " 
			+ " LEFT JOIN rocking_budget c on (a.gcostcode = c.gcostcode and a.project_code = c.project_code and a.year = c.year and c.approve_status = 'AP') "
			+ " where a.project_code = '"+projectCode+"' and a.`year` = '"+year+"' and a.gcostcode = '"+gcostcode+"'";
	Connection conn = dbcon.getConnectMYSql();
	Statement pStmt = conn.createStatement();
	rs = pStmt.executeQuery(sql); 
	while(rs.next()){
			 
		out.println(rs.getString("frombalance"));
    		
	}
	
	rs.close();
	pStmt.close(); 
	conn.close();
	  		
%>
  
 