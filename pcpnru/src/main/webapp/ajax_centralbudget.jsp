<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@ page import="pcpnru.utilities.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="pcpnru.projectData.Receive1DB"%>
<%@page import="pcpnru.utilities.*"%> 
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<% 
	DateUtil dateUtil = new DateUtil();
	
	String ajax_type = request.getParameter("ajax_type");
	String projectCode = request.getParameter("projectCode");
	String year = request.getParameter("year");
	
	DBConnect dbcon = new DBConnect();
	ResultSet rs = null;   
	List listJson = new LinkedList();
	
	if(ajax_type.equals("select")){
		String sql = "";
		 
			sql = "SELECT b.gcostcode, b.gcostcode_name "+
					 "from projectplan_detail a INNER JOIN groupcostcode_master b ON (b.gcostcode = a.gcostcode and a.project_code = b.project_code)  "+
		 			 "WHERE a.project_code = '"+projectCode+"' and year = '"+year+"' and type_gcostcode = '2' order by b.gcostcode";
		 
		 
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
	} 
	 		
%> 