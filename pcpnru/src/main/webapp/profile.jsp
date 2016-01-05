<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>ข้อมูลส่วนตัว</title>
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
		 <div class="example" data-text="ข้อมูลส่วนตัว">
         <div class="flex-grid">
		  	<!-- open row -->
		  	<div class="row flex-just-center">
		        <div class="cell colspan2 "> 
			       	รหัส 
			    	<div class="input-control text full-size"> 
			       		 <input type="text">
					</div>
		    	</div> 
			</div>
			<!-- close row -->
			<!-- open row -->
		  	<div class="row flex-just-center">
		         <div class="cell colspan2 "> 
			       	ชื่อ 
			    	<div class="input-control text full-size"> 
			       		 <input type="text">
					</div>
		    	</div> 
			</div>
			<!-- close row -->
			<!-- open row -->
		  	<div class="row flex-just-center">
		         <div class="cell colspan2 "> 
			       	นามสกุล 
			    	<div class="input-control text full-size"> 
			       		 <input type="text">
					</div>
		    	</div> 
			</div>
			<!-- close row -->
			<!-- open row -->
		  	<div class="row flex-just-center">
		       <div class="cell colspan2 "> 
			     	  วันเกิด 
			    	<div class="input-control text full-size"> 
			       		 <input type="text">
					</div>
		    	</div> 
			</div>
			<!-- close row -->
			<!-- open row -->
		  	<div class="row flex-just-center">
		         <div class="cell colspan2 "> 
			       	เบอร์โทรศัพท์ 
			    	<div class="input-control text full-size"> 
			       		 <input type="text">
					</div>
		    	</div> 
			</div>
			<!-- close row -->
			<!-- open row -->
		  	<div class="row flex-just-center">
		         <div class="cell colspan2 "> 
			       	ที่อยู่ 
			    	<div class="input-control text full-size"> 
			       		 <input type="text">
					</div>
		    	</div> 
			</div>
			<!-- close row -->
			<!-- open row -->
		  	<div class="row flex-just-center">
		        <div class="cell colspan2 "> 
			       	ตำแหน่งงาน 
			    	<div class="input-control text full-size"> 
			       		 <input type="text">
					</div>
		    	</div> 
			</div>
			<!-- close row -->
			<!-- open row -->
		  	<div class="row flex-just-center">		        
		        <div class="cell colspan2 align-center">  
		       		 <button class="button success" >ตกลง</button>
		       		 <button class="button danger" >ยกเลิก</button>
		    	</div>  
		    	
			</div>
			<!-- close row -->
		  </div>
		</div>  
	 
	</body>
</html>
