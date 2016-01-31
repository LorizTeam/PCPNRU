<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@ page import="pcpnru.utilities.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="pcpnru.projectData.Receive1DB"%>
<%
	String projectCode = request.getParameter("projectCode");
	String year = request.getParameter("year");
	String gcostcode = request.getParameter("gcostcode");
	String unit = request.getParameter("unit");
	String priceperunit = request.getParameter("priceperunit");
	String frombalance = request.getParameter("frombalance");
	String tobalance = request.getParameter("tobalance");
	String day = request.getParameter("day");
	String ajax_type = request.getParameter("ajax_type");
	String requisiton_type = request.getParameter("requisiton_type");
	String description = request.getParameter("description");
	String amount = request.getParameter("amount");
	
	DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
	Calendar cal = Calendar.getInstance();
    String timeofday = dateFormat.format(cal.getTime());
    System.out.println(timeofday);
    day +=" "+timeofday; 
    
	DBConnect dbcon = new DBConnect();
	ResultSet rs = null; 
	List listJson = new LinkedList();
	System.out.println("Before Check if");
	if(ajax_type.equals("select")){
		String sql = "SELECT b.gcostcode, b.gcostcode_name "+
				 "from projectplan_detail a INNER JOIN groupcostcode_master b ON (b.gcostcode = a.gcostcode)  "+
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
	}else if(ajax_type.equals("add")){
		System.out.println("Stage Add");
		Receive1DB receive1DB = new Receive1DB();
		String docno = receive1DB.SelectUpdateDocNo(year, "requisition");
		
		System.out.println("--- frombalance ----");
		System.out.println(frombalance.trim());
		System.out.println("--- tobalance ----");
		System.out.println(tobalance.trim());
		
		day = day.replace("/", "-");
		String[] splitdatetime = day.split(" ");
		
		String[] splitdate = splitdatetime[0].split("-");
		
		day = String.valueOf((Integer.parseInt(splitdate[2])-543))+"-"+splitdate[1]+"-"+splitdate[0]+" "+splitdatetime[1];
		String sql = "INSERT INTO `requisition` (`requisition_docno`, `requisition_doc_type`, `project_code`, `project_year`, `docdate` "
				+ ", `takeby`, `requisition_type`, `gcostcode`, `description`, `priceperunit`, `unit`, `amount`, `fromamount`, `toamount`) " 
				+ " VALUES ('"+docno+"', '2', '"+projectCode+"', '"+year+"', '"+day+"', 'aof', '"+requisiton_type+"' "
				+ "	, '"+gcostcode+"', '"+description+"', '"+priceperunit+"', '"+unit+"', '"+amount+"' " 
				+ " , '"+frombalance.trim()+"', '"+tobalance.trim()+"')";
		
		System.out.println(sql);
		Connection conn = dbcon.getConnectMYSql();
		Statement pStmt = conn.createStatement();
		int rowsofupdate = pStmt.executeUpdate(sql); 
		System.out.println(rowsofupdate);
		
		
		pStmt.close(); 
		conn.close();
		
		
	}else if(ajax_type.equals("delete")){
		
	}
	
	
	  		
%>
  
 