<%@ page language="java" import="java.util.*,java.text.DecimalFormat" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>  
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
		 <% String projectcode = (String) request.getParameter("projectcode"); 
		 %>
		 <%@include file="topmenu.jsp" %>
		 <div class="container-fluid">
		 	<a href="projectdt-receive.jsp?projectcode=<%=projectcode%>" class="command-button primary">
			    <span class="icon mif-chart-dots"></span>
			  	  รายได้
			    <small>จัดการรายรับของโครงการ</small>
			</a>
			<a href="projectdt-charges.jsp" class="command-button info">
			    <span class="icon mif-coins"></span>
			  	 ค่าใช้จ่าย
			    <small>จัดการค่าใช้จ่ายของโครงการ</small>
			</a>
			<a href="projectplan.pdf" class="command-button success">
			    <span class="icon mif-printer"></span>
			  	 พิมพ์
			    <small>พิมพ์รายงานประมาณการรายได้ รายจ่าย</small>
			</a>

			<div class="example"data-text="" >
			<h3 class="align-center margin30">ประมาณการรายได้ รายจ่าย โครงการ ............</h3>
			<div class="grid ">	
				<div class="window ">
					<div class="row cells12 align-center  window-caption bg-cyan fg-white" >
				  		<div class="cell colspan8">
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
					  	<h5 class="cell colspan8 subjob">
					  		ให้บริการนวด	
					  	</h5>
					  	<div class="cell colspan4 align-center">
					  		600,000 
					  	</div>
					  </div>
					<!-- ROW --> 
					<!-- ROW -->  
					   <div class="row cells12 " >			  
					  	<h5 class="cell colspan8 subjob">
					  		ให้บริการนวด	อโรม่า
					  	</h5>
					  	<div class="cell colspan4 align-center">
					  		200,000
					  	</div>
					  </div>
					  <!-- ROW -->
					  <!-- ROW -->  
					   <div class="row cells12 " >			  
					  	<h5 class="cell colspan8 subjob">
					  		ให้บริการนวดหน้า
					  	</h5>
					  	<div class="cell colspan4 align-center">
					  		150,000
					  	</div>
					  </div>
					  <!-- ROW -->
					  <!-- ROW -->  
					   <div class="row cells12 " >			  
					  	<h5 class="cell colspan8 subjob">
					  		ค่าสมาชิกรายปี
					  	</h5>
					  	<div class="cell colspan4 align-center">
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
			<!-- รายรับ -->		
			<!-- รายจ่าย -->
				<div class="window ">
					<div class="row cells12 align-center  window-caption bg-cyan fg-white" >
				  		<div class="cell colspan8">
				  			รายการ
				  		</div>
				  		<div class="cell colspan4">
				  			จำนวนเงิน 
				  		</div>
				  	</div>
			  	</div>
				<div class="example" data-text="รายจ่าย">				  
				  	<!-- subjob -->
					  <div class="row cells12 " >			  
					  	<h5 class="cell colspan8 subjob">
					  		งบบุคลากร	
					  	</h5>
					  	<div class="cell colspan4 align-center">
					  	</div>
					  </div>
					<!-- subjob --> 
						<!-- costcode -->
						  <div class="row cells12 " >			  
						  	<p class="cell colspan8 costcode">
						  		เงินเดือนพนักงานธุรการ ประจำโครงการ 1 คน * 13,200 บาท * 12 เดือน	
						  	</p>
						  	<div class="cell colspan4 align-center">
						  		158,400
						  	</div>
						  </div>
						<!-- costcode --> 
						
					<!-- subjob -->
					  <div class="row cells12 " >			  
					  	<h5 class="cell colspan8 subjob">
					  		งบดำเนินงาน	
					  	</h5>
					  	<div class="cell colspan4 align-center">
					  		
					  	</div>
					  </div>
					<!-- subjob --> 
						<!-- child sub job -->
						  <div class="row cells12 " >			  
						  	<h5 class="cell colspan8 child-subjob">
						  		หมวดค่าตอบแทน	
						  	</h5>
						  	<div class="cell colspan4 align-center">
						  		
						  	</div>
						  </div>
						<!-- child sub job --> 
						<!-- costcode -->
						  <div class="row cells12 " >			  
						  	<p class="cell colspan8 costcode">
						  		พนักงานรายวัน ประจำโครงการ 2 คน * 250 บาท * 300 วัน		
						  	</p>
						  	<div class="cell colspan4 align-center">
						  		75,000
						  	</div>
						  </div>
						<!-- costcode --> 
					<!-- subjob -->
					
					
					  <!--Totle subjob -->  
					   <div class="row cells12 " >			  
					  	<div class="cell colspan8 align-right">
					  		<h4>รวม</h4>
					  	</div>
					  	<div class="cell colspan4 align-center">
					  		<h4>998,000</h4>
					  	</div>
					  </div>
					  <!--Totle subjob -->
				 <!-- รายจ่าย -->
					 	  
				  </div>
				   <div class="row " >	
					  	<div class="cell align-center">
					  		<a href="projecthd.jsp" class="button">กลับ</a>
					  	</div>
					  </div>
			</div>
		</div>
		</div>
	</body>
</html>
