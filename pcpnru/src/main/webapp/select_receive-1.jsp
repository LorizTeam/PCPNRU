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
    
    <title>รายละเอียดรายรับ</title>
    
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
		<link href="css/bootstrap-datepicker3.css" rel="stylesheet">
	 	<link href="css/select2.css" rel="stylesheet"> 
	 
		<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
 		<script src="js/jquery.dataTables.min.js"></script>
  		<script src="js/bootstrap-datepicker-th.js"></script>
		<script src="js/select2.js"></script>
		
  </head>
  
  <body>
    <div><%@include file="topmenu.jsp" %></div>
	<h3 class="align-center">รายละเอียดรายรับ</h3>
	<div class="example" data-text="รายละเอียดรายรับ">
		<div class="grid">
		  	<div class="row cells12">
		    	<div class="cell colspan5 offset2" > 
		    		โครงการ
		       		 <div class="input-control full-size"> 
		       		 <select onchange="" id="project_code">
					    	<option>-- โปรดเลือก --</option>
					        <option>521800001 - อาคารเรือนไทย</option>
					        <option>521800002 - แหล่งเรียนรู้และวิจัย กาซะลองสปา</option>
					        <option>521800003 - ถ่ายภาพพิมพ์บัตรและสื่อสารดิจตอล</option>
					        <option>521800004 - โรงแรม</option>
					        <option>521800005 - ศูนย์บริการ</option>
					        <option>521800006 - สปา & ฟิตเนส</option>
					        <option>521800007 - ศูนย์อาหารและร้านค้า</option> 
					   </select>
					   </div>
		    	</div>
		    	<div class="cell colspan2">  
		        		วันที่การรับ
					    <div class="input-control text full-size ">
                            <input type="text" required id="datepicker">
                        </div>
                        
				</div>
			</div> 
		<div class="grid">
		  	<div class="row cells12">
		    	<div class="cell colspan7 offset2">
		    		ค่าใช้จ่าย
		    		<div class="input-control full-size"> 
					    <select onchange="" id="cost_code">
					    	<option>-- โปรดเลือก --</option>
					        <option>521800001 - อาคารเรือนไทย</option>
					        <option>521800002 - แหล่งเรียนรู้และวิจัย กาซะลองสปา</option>
					        <option>521800003 - ถ่ายภาพพิมพ์บัตรและสื่อสารดิจตอล</option>
					        <option>521800004 - โรงแรม</option>
					        <option>521800005 - ศูนย์บริการ</option>
					        <option>521800006 - สปา & ฟิตเนส</option>
					        <option>521800007 - ศูนย์อาหารและร้านค้า</option> 
					   </select> 
					</div>
		    	</div>   
		    </div>
		  	<div class="row cells12">
		    	<div class="cell colspan4 offset2">
		    		ชื่อลูกค้า
		    		<div class="input-control full-size"> 
					    <select onchange=""id="cus_name">
					    	<option>-- โปรดเลือก --</option>
					    	<option>พานุวัฒน์ </option>  
					    	<option>คุณ พงศธร </option> 
					    	<option>จิราพร </option>
					   </select> 
					</div>
		    	</div>
		    	<div class="cell colspan3">
		    		สถานที่
		    		<div class="input-control full-size"> 
					    <select onchange="" id="location">
					    	<option>-- โปรดเลือก --</option>
					    	<option>สมาร์ทไอซีที</option> 
					    	<option>สมาร์ทฮาดร์แวร์</option> 
					    	<option>ไอซีทีสมาร์ท</option>
					   </select>
					</div>
		    	</div>  
		    </div>
		</div>
	  	<div class="row cells12"> 
	    	<div class="cell colspan2 offset2" align="center"><br> 
				 <button class="button success full-size" type="submit" name="add">ตกลง</button>
			</div> 
	    </div>
		
		<br/>  
		</div>
	</div> <!-- End of example --> 
	<script>
		$(function(){
	        $("#project_code").select2();
	        $("#cost_code").select2();
	        $("#cus_name").select2();
	        $("#location").select2();
	    });
	    $(function(){
	        $("#datepicker").datepicker();
	        
	    });
	</script>
  </body>
</html>
