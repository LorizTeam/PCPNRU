<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%
	if(session.getAttribute("username") == null)response.sendRedirect("login.jsp");

%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>แก้ไขข้อมูลส่วนตัว</title>
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
		 <h3 class="align-center">ข้อมูลส่วนตัว</h3>
		 <div class="example" data-text="ข้อมูลส่วนตัว">
         <div class="grid ">
		  	<div class="row cells12 ">
		        <div class="cell colspan4 offset4"> 
			       	ชื่อผู้ใช้งาน (Username) 
			    	<div class="input-control text full-size"> 
			       		 <input type="text">
					</div>
		    	</div>
		    </div> 
		  	<div class="row cells12 ">
		        <div class="cell colspan4 offset4"> 
			       	รหัสผ่าน 
			    	<div class="input-control password full-size"> 
			       		 <input type="password">
					</div>
		    	</div> 
		    </div>
		  	<div class="row cells12 ">
		        <div class="cell colspan4 offset4"> 
			       	ยืนยัน รหัสผ่าน  
			    	<div class="input-control password full-size"> 
			       		 <input type="password">
					</div>
		    	</div>
		    </div>
		    <div class="row cells12 "> 
		         <div class="cell colspan4 offset4"> 
			       	ชื่อ 
			    	<div class="input-control text full-size"> 
			       		 <input type="text">
					</div>
		    	</div>
		    </div>
		    <div class="row cells12 ">
		         <div class="cell colspan4 offset4"> 
			       	นามสกุล 
			    	<div class="input-control text full-size"> 
			       		 <input type="text">
					</div>
		    	</div>
		    </div>
		    <div class="row cells12 ">
		       <div class="cell colspan4 offset4"> 
			     	  วันเกิด 
			    	<div class="input-control text full-size"> 
			       		 <input type="text">
					</div>
		    	</div> 
			</div>
			<div class="row cells12 ">
		         <div class="cell colspan4  offset4 "> 
			       	เบอร์โทรศัพท์ 
			    	<div class="input-control text full-size"> 
			       		 <input type="text">
					</div>
		    	</div> 
			</div>
		  	<div class="row cells12 ">
		         <div class="cell colspan4  offset4 "> 
			       	ที่อยู่ 
			    	<div class="input-control text full-size"> 
			       		 <input type="text">
					</div>
		    	</div> 
			</div>
		  	<div class="row cells12">
		        <div class="cell colspan4  offset4"> 
			       	ตำแหน่งงาน 
			    	<div class="input-control text full-size"> 
			       		 <input type="text">
					</div>
		    	</div> 
			</div>
		  	<div class="row ">		        
		        <div class="cell align-center">  
		       		 <button class="button success" >ตกลง</button>
		       		 <button class="button danger" >ยกเลิก</button>
		    	</div>
			</div>
		</div>  
	 </div>
	</body>
</html>
