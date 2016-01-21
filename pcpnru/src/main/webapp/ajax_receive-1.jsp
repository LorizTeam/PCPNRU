<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@ page import="pcpnru.utilities.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%
	String projectCode = request.getParameter("projectCode");
	String year = request.getParameter("year");
	System.out.println(year);
	String[] pjS = projectCode.split(" - ");
	projectCode = pjS[0];

	DBConnect dbcon = new DBConnect();
	ResultSet rs = null; 
	List listJson = new LinkedList();
	
	String sql = "SELECT b.gcostcode, b.gcostcode_name "+
				 "from projectplan_detail a INNER JOIN groupcostcode_master b ON (b.gcostcode = a.gcostcode)  "+
	 			 "WHERE a.project_code = '"+projectCode+"' and year = '"+year+"'and a.subjob_code = '0003' order by b.gcostcode";
	Connection conn = dbcon.getConnectMYSql();
	Statement pStmt = conn.createStatement();
	rs = pStmt.executeQuery(sql); 
	while(rs.next()){
		JSONObject obj=new JSONObject();
			 
    		obj.put("gcostcode",rs.getString("gcostcode"));
    		obj.put("gcostcode_name",rs.getString("gcostcode_name")); 
    		
    		listJson.add(obj); 
	}
	out.println(listJson);
	
	rs.close();
	pStmt.close(); 
	conn.close();
	  		
%>
  
 