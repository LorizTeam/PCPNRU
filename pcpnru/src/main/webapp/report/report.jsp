<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="net.sf.jasperreports.engine.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="com.smict.data.DBConnect"%> 
<%@ page contentType="application/pdf" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	DBConnect dbcon = new DBConnect();
	Connection conn = null;
	conn = dbcon.getConnectMYSql();
	
	
 	 	File testfolder = new File(application.getRealPath("TestFolder"));
 	 	if(!testfolder.exists())
 	 	testfolder.mkdir();
 	 	
 	 	String fileName = "trainreport_1.jasper";
 	 	String filejrxml = "trainreport_1.jrxml";
      	File reportFile = new File(application.getRealPath(fileName));
	    if (!reportFile.exists())
	    	System.out.println("File Not found");
	try{
		Map prm = new HashMap();
		String matcode = "KX";
		prm.put("prmmatcode",matcode);
		String report=application.getRealPath(filejrxml);
		JasperReport jr= JasperCompileManager.compileReport(report);
		JasperPrint jasperPrint = JasperFillManager.fillReport(jr,prm, conn);
		OutputStream outStream = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
    
	}catch(Exception exception){
		exception.printStackTrace();
	}
	
	
	
 %>
