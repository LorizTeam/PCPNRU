<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>ประมาณการรายได้ รายจ่าย โครงการ</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width; initial-scale=1.0">
		
		<link rel="shortcut icon" href="/favicon.ico">
		<link href="css/metro.css" rel="stylesheet">
        <link href="css/metro-icons.css" rel="stylesheet">
		<link href="css/metro-schemes.css" rel="stylesheet">
		<link href="css/docs.css" rel="stylesheet"> 
	 	<link href="css/style.css" rel="stylesheet"> 
	 	<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
	    <script src="js/docs.js"></script>
	    <script src="js/prettify/run_prettify.js"></script>
	    <script src="js/ga.js"></script>
  	
	</head>

	<body>
		 
		 		<%@include file="topmenu.jsp" %>
		 <div class="container-fluid">
		 	

			<div class="example"data-text="" >
			<h3 class="align-center margin30">ประมาณการรายได้ ของโครงการ ............</h3>
			
			<div class="example" data-text="เพิ่ม">
	         <div class="grid">
			  	<div class="row cells4">
			        
			        <div class="cell"> 
			        	รายการ
			        	 <div class="input-control text full-size"> 
	                          <input type="text" >
	                     </div>
					</div> 
					<div class="cell"> 
			        	จำนวนเงิน
			        	 <div class="input-control text full-size"> 
	                          <input type="text" >
	                     </div>
					</div> 
					<div class="cell"><br>
						  <button class="button success">เพิ่ม</button> 
						  <button class="button primary">บันทึก</button> 
						  <button class="button danger">ลบ</button> 
					</div> 
			    </div>
			 </div>  
			</div>  
			<div class="grid ">	
				<div class="window ">
					<div class="row cells12 align-center  window-caption bg-cyan fg-white" >
				  		<div class="cell colspan7">
				  			รายการ
				  		</div>
				  		<div class="cell colspan4">
				  			จำนวนเงิน
				  		</div>
				  		
				  	</div>
			  	</div>
			 <!-- รายรับ -->	
				<div class="example" data-text="รายได้">
				  
				  	<!-- ROW -->
					  <div class="row cells12 " >			  
					  	<h5 class="cell colspan7 subjob">
					  		ให้บริการนวด	
					  	</h5>
					  	<div class="cell colspan4 align-center">
					  		600,000 
					  	</div>
					  	<div class="cell colspan1">
				  			<a href="#"><span class="mif-pencil"></span></a>
				  		</div>
					  </div>
					<!-- ROW --> 
					<!-- ROW -->  
					   <div class="row cells12 " >			  
					  	<h5 class="cell colspan7 subjob">
					  		ให้บริการนวด	อโรม่า
					  	</h5>
					  	<div class="cell colspan4 align-center">
					  		200,000
					  	</div>
					  	<div class="cell colspan1">
				  			<a href="#"><span class="mif-pencil"></span></a>
				  		</div>
					  </div>
					  <!-- ROW -->
					  <!-- ROW -->  
					   <div class="row cells12 " >			  
					  	<h5 class="cell colspan7 subjob">
					  		ให้บริการนวดหน้า
					  	</h5>
					  	<div class="cell colspan4 align-center">
					  		150,000
					  	</div>
					  	<div class="cell colspan1">
				  			<a href="#"><span class="mif-pencil"></span></a>
				  		</div>
					  </div>
					  <!-- ROW -->
					  <!-- ROW -->  
					   <div class="row cells12 " >			  
					  	<h5 class="cell colspan7 subjob">
					  		ค่าสมาชิกรายปี
					  	</h5>
					  	<div class="cell colspan4 align-center">
					  		48,000 
					  	</div>
					  	<div class="cell colspan1 ">
				  			<a href="#"><span class="mif-pencil"></span></a>
				  		</div>
					  </div> 
					  <!-- ROW -->
					  
					  <!--Totle ROW -->  
					   <div class="row cells12 " >			  
					  	<div class="cell colspan7 align-right">
					  		<h4>รวม</h4>
					  	</div>
					  	<div class="cell colspan4 align-center">
					  		<h4>998,000</h4>
					  	</div>
					  </div>
					  <!--Totle ROW -->
				</div>
			<!-- รายรับ -->		
			
					 	  
				  </div>
				   <div class="row " >	
					  	<div class="cell align-center">
					  		<a href="projectdt.jsp" class="button">กลับ</a>
					  	</div>
					  </div>
			</div>
		</div>
		</div>
	</body>
</html>
