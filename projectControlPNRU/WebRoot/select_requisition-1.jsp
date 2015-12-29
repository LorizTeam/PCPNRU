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
    
    <title>หน้าดูรายการเบิกสินค้า</title>
    
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
        <link href="css/metro-responsive.css" rel="stylesheet">
		<link href="css/metro-schemes.css" rel="stylesheet">
		<link href="css/docs.css" rel="stylesheet"> 
	 
		<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
	    <script src="js/docs.js"></script>
	    <script src="js/prettify/run_prettify.js"></script>
	    <script src="js/ga.js"></script> 
 		<script src="js/jquery.dataTables.min.js"></script> 
        <script src="includehtml.js"></script>    

  </head>
  
  <body>
    <div><%@include file="topmenu.jsp" %></div>
	<br>
	<div class="example" data-text="รายละเอียด">
	<div class="flex-grid">
		  	<div class="row flex-just-center">
		        <div class="cell colspan2 "> 
		       	<h1 class="align-right">โครงการ &nbsp;</h1>
		    	</div>
		    	<div class="cell colspan5" > 
		       		 <h2><small class="input-control full-size"> 
		       		 <select onchange="">
					    	<option>-- โปรดเลือก --</option>
					        <option>521800001 - อาคารเรือนไทย</option>
					        <option>521800002 - แหล่งเรียนรู้และวิจัย กาซะลองสปา</option>
					        <option>521800003 - ถ่ายภาพพิมพ์บัตรและสื่อสารดิจตอล</option>
					        <option>521800004 - โรงแรม</option>
					        <option>521800005 - ศูนย์บริการ</option>
					        <option>521800006 - สปา & ฟิตเนส</option>
					        <option>521800007 - ศูนย์อาหารและร้านค้า</option> 
					   </select>
					   </small></h2>
		    	</div>
		    	<div class="cell colspan1"> 
		    			<h1 class="align-right">ปี&nbsp;</h1>  
		    	</div>
		    	<div class="cell colspan1">
		    		<h2><small class="input-control full-size"> 
					    <select onchange=""> 
					        <option>2555</option>
					        <option>2556</option>
					        <option>2557</option>
					        <option>2558</option>
					        <option>2559</option>
					        <option>2560</option>
					        <option>2561</option>
					        <option>2562</option>
					        <option>2563</option>
					        <option>2564</option>
					        <option>2565</option>
					        </select> 
					</small>
					</h2>
		    	</div>
		    </div>
	</div>
	<hr/> 
	<div class="flex-grid">
		  	<div class="row flex-just-center">
		        <div class="cell colspan2"> 
		       	<h2 align="right">กิจกรรม&nbsp;</h2> 	  
		    	</div> 
		    	<div class="cell colspan4">
		    		<h3><small class="input-control full-size"><select onchange="">
					    	<option>-- โปรดเลือก --</option>
					        <option>521800001 - อาคารเรือนไทย</option>
					        <option>521800002 - แหล่งเรียนรู้และวิจัย กาซะลองสปา</option>
					        <option>521800003 - ถ่ายภาพพิมพ์บัตรและสื่อสารดิจตอล</option>
					        <option>521800004 - โรงแรม</option>
					        <option>521800005 - ศูนย์บริการ</option>
					        <option>521800006 - สปา & ฟิตเนส</option>
					        <option>521800007 - ศูนย์อาหารและร้านค้า</option> 
					   </select></small>
					</h3>
		    	</div> 
		        <div class="cell colspan2"> 
		       	<h2 align="right">กิจกรรมย่อย&nbsp;</h2> 	  
		    	</div> 
		    	<div class="cell colspan4">
		    		<h3><small class="input-control full-size"><select onchange="">
					    	<option>-- โปรดเลือก --</option>
					        <option>521800001 - อาคารเรือนไทย</option>
					        <option>521800002 - แหล่งเรียนรู้และวิจัย กาซะลองสปา</option>
					        <option>521800003 - ถ่ายภาพพิมพ์บัตรและสื่อสารดิจตอล</option>
					        <option>521800004 - โรงแรม</option>
					        <option>521800005 - ศูนย์บริการ</option>
					        <option>521800006 - สปา & ฟิตเนส</option>
					        <option>521800007 - ศูนย์อาหารและร้านค้า</option> 
					   </select></small>
					</h3>
		    	</div>
		    </div>
	</div>
	<hr/> 
	<div class="flex-grid">
		  	<div class="row flex-just-left">
		        <div class="cell colspan2"> 
		       	<h2 align="right">ค่าใช้จ่าย&nbsp;</h2> 	  
		    	</div> 
		    	<div class="cell colspan10">
		    		<h3><small class="input-control full-size"><select onchange="">
					    	<option>-- โปรดเลือก --</option>
					        <option>521800001 - อาคารเรือนไทย</option>
					        <option>521800002 - แหล่งเรียนรู้และวิจัย กาซะลองสปา</option>
					        <option>521800003 - ถ่ายภาพพิมพ์บัตรและสื่อสารดิจตอล</option>
					        <option>521800004 - โรงแรม</option>
					        <option>521800005 - ศูนย์บริการ</option>
					        <option>521800006 - สปา & ฟิตเนส</option>
					        <option>521800007 - ศูนย์อาหารและร้านค้า</option> 
					   </select></small>
					</h3>
		    	</div>  
		    </div>
	</div> 
	<hr/>
	<div class="flex-grid">
		  	<div class="row flex-just-center"> 
		    	<div class="cell colspan2" align="center"><br> 
					  <a href="select_requisition-2.jsp"><button class="button success full-size" type="submit" name="add">ตกลง</button></a> 
				</div> 
		    </div>
	</div>
	<br/> 
	<hr/>
	</div> <!-- End of example --> 
	 
  </body>
</html>
