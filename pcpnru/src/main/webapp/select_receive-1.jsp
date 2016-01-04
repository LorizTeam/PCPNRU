<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
	<div class="example" data-text="รายละเอียดการรับ">
	<div class="flex-grid">
		  	<div class="row flex-just-center">
		        <div class="cell colspan2 "> 
		       	<h2 class="align-right">โครงการ&nbsp;</h2>
		    	</div>
		    	<div class="cell colspan5" > 
		       		 <h3><small class="input-control full-size"> 
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
					   </small></h3>
		    	</div>
		    	<div class="cell colspan2 align-right"><h2>วันที่การรับ&nbsp;</h2></div>
		    	<div class="cell colspan2">  
		        		<h3><small>
					    <div class="input-control text full-size " data-role="datepicker" data-format="dd-mm-yyyy" data-scheme="green">
                            <input type="text">
                            <button class="button"><span class="mif-calendar"></span></button>
                        </div>
                        </small></h3>
				</div>
	</div> 
	<hr/>
	<div class="flex-grid">
		  	<div class="row flex-just-center">
		        <div class="cell colspan2"> 
		       		<h2 class="align-right">ค่าใช้จ่าย&nbsp;</h2> 	  
		    	</div> 
		    	<div class="cell colspan9">
		    		<h3><small class="input-control full-size"> 
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
					</small></h3>
		    	</div>   
		    </div>
		</div>
	<hr/>
	<div class="flex-grid">
		  	<div class="row flex-just-center">
		        <div class="cell colspan2"> 
		       		<h2 class="align-right">ได้รับเงินจาก&nbsp;</h2> 	  
		    	</div> 
		    	<div class="cell colspan5">
		    		<h3><small class="input-control full-size"> 
					    <select onchange="">
					    	<option>-- โปรดเลือก --</option>
					    	<option>พานุวัฒน์ </option> 
					    	<option>คุณ พงศธร </option> 
					    	<option>จิราพร </option>
					   </select> 
					</small></h3>
		    	</div>  
		    	<div class="cell colspan2"> 
		       		<h2 class="align-right">สถานที่&nbsp;</h2> 	  
		    	</div> 
		    	<div class="cell colspan2">
		    		<h3><small class="input-control full-size"> 
					    <select onchange="">
					    	<option>-- โปรดเลือก --</option>
					    	<option>สมาร์ทไอซีที</option> 
					    	<option>สมาร์ทฮาดร์แวร์</option> 
					    	<option>ไอซีทีสมาร์ท</option>
					   </select>
					</small></h3>
		    	</div>  
		    </div>
		</div>
	<hr/> 
	<div class="flex-grid">
		  	<div class="row flex-just-center"> 
		    	<div class="cell colspan2" align="center"><br> 
					  <a href="select_receive-2.jsp"><button class="button success full-size" type="submit" name="add">ตกลง</button></a> 
				</div> 
		    </div>
	</div>
	<br/>  
	<hr/>
	</div> <!-- End of example --> 
	
  </body>
</html>
