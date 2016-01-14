<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@ page import="pcpnru.utilities.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%
	String projectCode = request.getParameter("projectCode");
	String[] pjS = projectCode.split(" - ");
	projectCode = pjS[0];

	DBConnect dbcon = new DBConnect();
	ResultSet rs = null; 
	List listJson = new LinkedList();
	
	String sql = "SELECT b.costcode, b.costname "+
				 "from projectplan_detail a INNER JOIN costcode_master b ON (b.costcode = a.costcode)  "+
	 			 "WHERE a.project_code = '"+projectCode+"' and a.subjob_code = '0003' order by b.costcode";
	Connection conn = dbcon.getConnectMYSql();
	Statement pStmt = conn.createStatement();
	rs = pStmt.executeQuery(sql); 
	while(rs.next()){
		JSONObject obj=new JSONObject();
			 
    		obj.put("costcode",rs.getString("costcode"));
    		obj.put("costname",rs.getString("costname")); 
    		
    		listJson.add(obj); 
	}
	out.println(listJson);
	
	rs.close();
	pStmt.close(); 
	conn.close();
	  		
%>
  
 