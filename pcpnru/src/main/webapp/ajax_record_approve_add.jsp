<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>  
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@ page import="pcpnru.masterData.*" %>
<%@ page import="pcpnru.masterModel.*" %>
<%  
	String docnodt = request.getParameter("docnodt").toString();
	String yeardt = request.getParameter("yeardt").toString();
	String description = request.getParameter("description").toString();
	String qty = request.getParameter("qty").toString();
	String unit = request.getParameter("unit").toString(); 
	 
	RecordApproveDB ra = new RecordApproveDB(); 
	
	ra.AddRecordApprovedt(docnodt, yeardt, description, qty, unit);
	List ListRecordApproveDT =  ra.ListRecordApproveDT(docnodt, yeardt);
    	
	String itemno = "", desJ = "", qtyJ = "", unitJ = "";
	
	List listJson = new LinkedList();
	
	Iterator Iterate = ListRecordApproveDT.iterator();
	while(Iterate.hasNext()){
		JSONObject obj=new JSONObject();
		RecordApproveModel raInfo = (RecordApproveModel) Iterate.next();
		itemno = raInfo.getItemno();
		desJ =  raInfo.getDescription();
		qtyJ = raInfo.getQty();
		unitJ = raInfo.getUnit();
		
		obj.put("itemno",itemno);
		obj.put("des",desJ);
		obj.put("qty",qtyJ);
		obj.put("unit",unitJ);
		
		listJson.add(obj); 
	}	 
	
	out.println(listJson); 	
%>
  
 