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
    
    
    
    day +=" "+timeofday; 
    
    
    System.out.println("Before Checkif");
	DBConnect dbcon = new DBConnect();
	ResultSet rs = null; 
	List listJson = new LinkedList();
	
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
		System.out.println("stage add");
		Receive1DB receive1DB = new Receive1DB();
		String docno = request.getParameter("docno");
		if(docno.equals("")){
			docno = receive1DB.SelectUpdateDocNo(year, "requisition");
		}
		
		day = day.replace("/", "-");
		String[] splitdatetime = day.split(" ");
		
		String[] splitdate = splitdatetime[0].split("-");
		
		day = String.valueOf((Integer.parseInt(splitdate[2])-543))+"-"+splitdate[1]+"-"+splitdate[0]+" "+splitdatetime[1];
		String sql = "INSERT INTO `requisition` (`requisition_docno`,`project_code`, `project_year`, `docdate` "
				+ ", `takeby`, `requisition_type`, `gcostcode`, `description`, `priceperunit`, `unit`, `amount`, `frombalance`, `tobalance`) " 
				+ " VALUES ('"+docno+"','"+projectCode+"', '"+year+"', '"+day+"', 'aof', '"+requisiton_type+"' "
				+ "	, '"+gcostcode+"', '"+description+"', '"+priceperunit+"', '"+unit+"', '"+amount+"' " 
				+ " , '"+frombalance.trim()+"', '"+tobalance.trim()+"')";
		
		
		Connection conn = dbcon.getConnectMYSql();
		Statement pStmt = conn.createStatement();
		int rowsofupdate = pStmt.executeUpdate(sql);
		JSONObject obj=new JSONObject();
		 
   		obj.put("rowsofupdate",rowsofupdate);
   		obj.put("docno",docno); 
   		
   		out.println(obj);
		
		pStmt.close(); 
		conn.close();
		
		
	}else if(ajax_type.equals("delete")){
		
	}else if(ajax_type.equals("selectlist")){
		System.out.println("stage selectlist");
		String docno = request.getParameter("docno");
		
		String sql = "SELECT requisition.requisition_docno,project_master.project_name,requisition.project_year,requisition.docdate,requisition.takeby,"
			+ "requisition_type.requisition_typename,requisition.gcostcode,groupcostcode_master.gcostcode_name,requisition.description,requisition.priceperunit,"
			+ "requisition.unit,requisition.amount,requisition.frombalance,requisition.tobalance "
			+ "FROM "
			+ "requisition "
			+ "INNER JOIN project_master ON project_master.project_code = requisition.project_code "
			+ "INNER JOIN requisition_type ON requisition_type.requisition_type = requisition.requisition_type "
			+ "INNER JOIN groupcostcode_master ON groupcostcode_master.gcostcode = requisition.gcostcode "
			+ "where requisition.requisition_docno = '"+docno+"' and requisition.gcostcode = '"+gcostcode+"'";
		Connection conn = dbcon.getConnectMYSql();
		Statement pStmt = conn.createStatement();
		rs = pStmt.executeQuery(sql); 
		while(rs.next()){
			JSONObject obj=new JSONObject();
				 
	   		obj.put("requisition_docno",rs.getString("requisition_docno"));
	   		obj.put("project_name",rs.getString("project_name"));
	   		obj.put("project_year",rs.getString("project_year"));
	   		obj.put("docdate",rs.getString("docdate"));
	   		obj.put("takeby",rs.getString("takeby"));
	   		obj.put("requisition_typename",rs.getString("requisition_typename"));
	   		obj.put("gcostcode",rs.getString("gcostcode"));
	   		obj.put("gcostcode_name",rs.getString("gcostcode_name"));
	   		obj.put("description",rs.getString("description"));
	   		obj.put("priceperunit",rs.getString("priceperunit"));
	   		obj.put("unit",rs.getString("unit"));
	   		obj.put("amount",rs.getString("amount"));
	   		obj.put("frombalance",rs.getString("frombalance"));
	   		obj.put("tobalance",rs.getString("tobalance"));
	   		
	   		listJson.add(obj); 
		}
		System.out.println("Select Finished");
		System.out.println(listJson);
		out.println(listJson);
		
		rs.close();
		pStmt.close(); 
		conn.close();
	}
	
	
	  		
%>
  
 