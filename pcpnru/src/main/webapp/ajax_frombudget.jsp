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
	
	String sql = "SELECT IFNULL((a.budget - sum(b.amount)),a.budget) as frombalance "
			+ " FROM projectplan_detail a "
			+ " LEFT JOIN requisition b on (a.gcostcode = b.gcostcode) "
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
  
 