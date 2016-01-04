<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>topmenu</title>
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
		 	<button class="command-button primary">
			    <span class="icon mif-chart-dots"></span>
			  	  รายรับ
			    <small>จัดการรายรับของโครงการ</small>
			</button>
			<button class="command-button info">
			    <span class="icon mif-coins"></span>
			  	 ค่าใช้จ่าย
			    <small>จัดการค่าใช้จ่ายของโครงการ</small>
			</button>
			<button class="command-button success">
			    <span class="icon mif-printer"></span>
			  	 พิมพ์
			    <small>พิมพ์รายงานประมาณการรายได้ รายจ่าย</small>
			</button>

			<div class="example"data-text="" >
			<h3 class="align-center margin30">ประมาณการรายได้ รายจ่าย โครงการ ............</h3>
			<div class="grid ">	
				
				<div class="row cells2 align-center" >
			  		<div class="cell">
			  			รายการ
			  		</div>
			  		<div class="cell">
			  			จำนวนเงิน
			  		</div>
			  	</div>
			 <!-- รายรับ -->	
				<div class="example" data-text="รายได้">
				  <div class="container">
				  	<!-- ROW -->
					  <div class="row cells6 " >			  
					  	<h5 class="cell colspan4">
					  		ให้บริการนวด	
					  	</h5>
					  	<div class="cell colspan2 align-center">
					  		600,000 
					  	</div>
					  </div>
					<!-- ROW --> 
					<!-- ROW -->  
					   <div class="row cells6 " >			  
					  	<h5 class="cell colspan4">
					  		ให้บริการนวด	อโรม่า
					  	</h5>
					  	<div class="cell colspan2 align-center">
					  		200,000
					  	</div>
					  </div>
					  <!-- ROW -->
					  <!-- ROW -->  
					   <div class="row cells6 " >			  
					  	<h5 class="cell colspan4">
					  		ให้บริการนวดหน้า
					  	</h5>
					  	<div class="cell colspan2 align-center">
					  		150,000
					  	</div>
					  </div>
					  <!-- ROW -->
					  <!-- ROW -->  
					   <div class="row cells6 " >			  
					  	<h5 class="cell colspan4">
					  		ค่าสมาชิกรายปี
					  	</h5>
					  	<div class="cell colspan2 align-center">
					  		48,000 
					  	</div>
					  </div>
					  <!-- ROW -->
					  
					  <!--Totle ROW -->  
					   <div class="row cells6 " >			  
					  	<div class="cell colspan4 align-right">
					  		<h4>รวม</h4>
					  	</div>
					  	<div class="cell colspan2 align-center">
					  		<h4>998,000</h4>
					  	</div>
					  </div>
					  <!--Totle ROW -->
					  
					  
					  
				  </div> 
				</div>
			<!-- รายรับ -->		
			<!-- รายจ่าย -->
				<div class="example" data-text="รายจ่าย">
				  <div class="container">
				  	<!-- subjob -->
					  <div class="row cells6 " >			  
					  	<h5 class="cell colspan4">
					  		งบบุคลากร	
					  	</h5>
					  	<div class="cell colspan2 align-center">
					  		
					  	</div>
					  </div>
					<!-- subjob --> 
						<!-- costcode -->
						  <div class="row cells6 " >			  
						  	<p class="cell colspan4 costcode">
						  		เงินเดือนพนักงานธุรการ ประจำโครงการ 1 คน * 13,200 บาท * 12 เดือน	
						  	</p>
						  	<div class="cell colspan2 align-center">
						  		158,400
						  	</div>
						  </div>
						<!-- costcode --> 
						
					<!-- subjob -->
					  <div class="row cells6 " >			  
					  	<h5 class="cell colspan4">
					  		งบดำเนินงาน	
					  	</h5>
					  	<div class="cell colspan2 align-center">
					  		
					  	</div>
					  </div>
					<!-- subjob --> 
						<!-- child sub job -->
						  <div class="row cells6 " >			  
						  	<h5 class="cell colspan4 child-subjob">
						  		หมวดค่าตอบแทน	
						  	</h5>
						  	<div class="cell colspan2 align-center">
						  		
						  	</div>
						  </div>
						<!-- child sub job --> 
						<!-- costcode -->
						  <div class="row cells6 " >			  
						  	<p class="cell colspan4 costcode">
						  		พนักงานรายวัน ประจำโครงการ 2 คน * 250 บาท * 300 วัน		
						  	</p>
						  	<div class="cell colspan2 align-center">
						  		75,000
						  	</div>
						  </div>
						<!-- costcode --> 
					<!-- subjob -->
					
					
					  <!--Totle subjob -->  
					   <div class="row cells6 " >			  
					  	<div class="cell colspan4 align-right">
					  		<h4>รวม</h4>
					  	</div>
					  	<div class="cell colspan2 align-center">
					  		<h4>998,000</h4>
					  	</div>
					  </div>
					  <!--Totle subjob -->
				 <!-- รายจ่าย -->
					  
					  
				  </div> 
				</div>
				
			</div>
		</div>
		</div>
	</body>
</html>
