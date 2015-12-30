<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>หน้ารายละเอียดการรับ</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width; initial-scale=1.0">
	
		<link rel="shortcut icon" href="/favicon.ico">
		<link href="css/metro.css" rel="stylesheet">
        <link href="css/metro-icons.css" rel="stylesheet">
		<link href="css/metro-schemes.css" rel="stylesheet">
		<link href="css/docs.css" rel="stylesheet"> 
	 
		<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
	    <script src="js/docs.js"></script>
	    <script src="js/prettify/run_prettify.js"></script>
	    <script src="js/ga.js"></script> 
 		<script src="js/jquery.dataTables.min.js"></script>

  </head>
  
  <body>
    <div><%@include file="topmenu.jsp" %></div>
	<br>
	
	<div class="example" data-text="รายการ">
            <table id="table_project" class="dataTable striped border bordered" data-role="datatable" data-searching="true">
                <thead>
                <tr>  
                	<th>เลขที่</th>
                    <th>รายละเอียด</th>
                    <th>ได้รับเงินจาก</th>
                    <th>สถานที่</th>
                </tr>
                </thead> 
                  
                 <tbody>
                <tr>  
                    <td><a href="select_receive-3.jsp"><button class="toolbar-button"><span class="mif-pencil"></span></button></a> 1</td>
                    <td>ผู้ชาย</td> 
                    <td>คุณ พงษธง</td>  
                    <td>สมาร์ทไอซีที</td> 
                </tr>
                <tr>  
                    <td><a href="select_receive-3.jsp"><button class="toolbar-button"><span class="mif-pencil"></span></button></a> 2</td>
                    <td>ผู้หญิง</td> 
                    <td>คุณ พานุวัฒน์</td>  
                    <td>สมาร์ทไอซีที</td> 
                </tr>
                 
                </tbody>
            </table>
        </div> <!-- End of example table --> 
  </body>
</html>
