<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Profile</title>
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
		        <div class="cell colspan5 "> 
		       	<h3 class="align-right">รหัส&nbsp;</h3>
		    	</div>
		    	<div class="cell colspan6" > 
		       		 <h3><small class="input-control"> 
		       		 <input type="text">
					   </small></h3>
		    	</div> 
			</div>
			<!-- close row -->
			<!-- open row -->
		  	<div class="row flex-just-center">
		        <div class="cell colspan5 "> 
		       	<h3 class="align-right">ชื่อ&nbsp;</h3>
		    	</div>
		    	<div class="cell colspan6" > 
		       		 <h3><small class="input-control"> 
		       		 <input type="text">
					   </small></h3>
		    	</div> 
			</div>
			<!-- close row -->
			<!-- open row -->
		  	<div class="row flex-just-center">
		        <div class="cell colspan5 "> 
		       	<h3 class="align-right">นามสกุล&nbsp;</h3>
		    	</div>
		    	<div class="cell colspan6" > 
		       		 <h3><small class="input-control"> 
		       		 <input type="text">
					   </small></h3>
		    	</div> 
			</div>
			<!-- close row -->
			<!-- open row -->
		  	<div class="row flex-just-center">
		        <div class="cell colspan5 "> 
		       	<h3 class="align-right">วันเกิด&nbsp;</h3>
		    	</div>
		    	<div class="cell colspan6" > 
		       		 <h3><small class="input-control"> 
		       		 <input type="text">
					   </small></h3>
		    	</div> 
			</div>
			<!-- close row -->
			<!-- open row -->
		  	<div class="row flex-just-center">
		        <div class="cell colspan5 "> 
		       	<h3 class="align-right">เบอร์โทรศัพท์&nbsp;</h3>
		    	</div>
		    	<div class="cell colspan6" > 
		       		 <h3><small class="input-control"> 
		       		 <input type="text">
					   </small></h3>
		    	</div> 
			</div>
			<!-- close row -->
			<!-- open row -->
		  	<div class="row flex-just-center">
		        <div class="cell colspan5 "> 
		       	<h3 class="align-right">ที่อยู่&nbsp;</h3>
		    	</div>
		    	<div class="cell colspan6" > 
		       		 <h3><small class="input-control"> 
		       		 <input type="text">
					   </small></h3>
		    	</div> 
			</div>
			<!-- close row -->
			<!-- open row -->
		  	<div class="row flex-just-center">
		        <div class="cell colspan5 "> 
		       	<h3 class="align-right">ตำแหน่งงาน&nbsp;</h3>
		    	</div>
		    	<div class="cell colspan6" > 
		       		 <h3><small class="input-control"> 
		       		 <input type="text">
					   </small></h3>
		    	</div> 
			</div>
			<!-- close row -->
			<!-- open row -->
		  	<div class="row flex-just-center">
		        
		        <div class="cell colspan5 ">  
		    	</div>
		    	<div class="cell colspan6" > 
		       		 <button class="button success" >ตกลง</button>
		       		 <button class="button danger" >ยกเลิก</button>
		    	</div>  
		    	
			</div>
			<!-- close row -->
		  </div>
		</div>  
	 
	</body>
</html>
