<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>ประมาณการค่าใช้จ่าย โครงการ</title>
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
	</head>

	<body>
		 
		 <%@include file="topmenu.jsp" %>
		 <div class="container-fluid">
			<div class="example"data-text="" >
				<h3 class="align-center margin30">ประมาณค่าใช้จ่าย ของโครงการ ............</h3>
				<div class="example" data-text="เพิ่ม">
			        <div class="grid">
			        	<div class="row cells4">
			        		<div class="cell"> 
					        	กิจกรรมย่อย
						        <div class="input-control text full-size">
								    <select onchange="">
								    	<option>------------ โปรดเลือก ------------</option>
								        <option>งบบุคลากร</option>
								        <option>งบดำเนินการ</option>
								        <option>งบลงทุน</option>
								        <option>รายจ่ายอื่นๆ</option> 
								    </select>
								</div>
							</div> 
			        	</div>
					  	<div class="row cells12">
					        <div class="cell colspan3"> 
					        	รายการ
					        	<div class="input-control text full-size"> 
			                    	<input type="text" >
			                    </div>
							</div> 
							<div class="cell ">คำนวน<br>
					        	 <button class="button primary mif-calculator2" onclick="showCharm('right')"></button> 
							</div>
							
							<div class="cell colspan3"> 
					        	จำนวนเงิน
					        	<div class="input-control text full-size"> 
			                    	<input type="text" >
			                    </div>
							</div> 
							<div class="cell colspan5"><br>
								 <button class="button success">เพิ่ม</button> 
								 <button class="button primary">บันทึก</button> 
								 <button class="button ">ยกเลิก</button>
								 <button class="button danger">ลบ</button> </div>
					    </div>
					    <div  class="charm right-side bg-gray" data-role="charm" data-position="right" id="right-charm" style="max-width:50%">
							<span class="charm-closer"></span>
							<h3 class="text-light">เพิ่มการคำนวน</h3>
							<div class="grid">
								<div class="row cells2">
									<div class="cell">จำนวน
							        	<div class="input-control text full-size"> 
					                    	<input type="text" >
					                    </div>
									</div> 
									<div class="cell"> 
							        	หน่วยนับ
								        <div class="input-control text full-size">
										    <select onchange="" class="align-center">
										    	<option>------- โปรดเลือก -------</option>
										        <option>บาท</option>
										        <option>คน</option>
										        <option>วัน</option>
										        <option>เดือน</option> 
										    </select>
										</div>
									</div> 
								</div>
								
								
						<!-- เพิ่ม operation -->
								<div class="row cells2">
									<div class="cell">
								        <div class="input-control text full-size ">
										    <select onchange="" class="align-center">
										    	<option>---- Operation ----</option>
										        <option> + </option>
										        <option> - </option>
										        <option> * </option>
										        <option> / </option> 
										    </select>
										</div>
										
									</div> 
								</div>
								<div class="row cells2">
									<div class="cell">จำนวน
							        	<div class="input-control text full-size"> 
					                    	<input type="text" >
					                    </div>
									</div> 
									<div class="cell"> 
							        	หน่วยนับ
								        <div class="input-control text full-size">
										    <select onchange="" class="align-center">
										    	<option>------- โปรดเลือก -------</option>
										        <option>บาท</option>
										        <option>คน</option>
										        <option>วัน</option>
										        <option>เดือน</option> 
										    </select>
										</div>
										
									</div>
									 
								</div>
								<div class="row">
									<div class="cell align-center">
										<a href="#" class="button success">เพิ่ม</a>
									</div>
								</div>
						<!-- เพิ่ม operation -->
						
						
						
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
					<div class="example" data-text="ค่าใช้จ่าย">
					  <!-- subjob -->
					  <div class="row cells12 " >			  
					  	<h5 class="cell colspan7 subjob">
					  		งบบุคลากร	
					  	</h5>
					  	<div class="cell colspan4 align-center">
					  	</div>
					  </div>
					<!-- subjob --> 
						<!-- costcode -->
						  <div class="row cells12 " >			  
						  	<p class="cell colspan7 costcode">
						  		เงินเดือนพนักงานธุรการ ประจำโครงการ 1 คน * 13,200 บาท * 12 เดือน (เพิ่มงบกลาง 5,000)
						  	</p>
						  	<div class="cell colspan4 align-center">
						  		158,400
						  	</div>
						  	<div class="cell ">
					  			<a href="#"><span class="mif-pencil"></span></a>
					  		</div>
						  </div>
						<!-- costcode --> 
						
					<!-- subjob -->
					  <div class="row cells12 " >			  
					  	<h5 class="cell colspan7 subjob">
					  		งบดำเนินงาน	
					  	</h5>
					  	<div class="cell colspan4 align-center">
					  		
					  	</div>
					  </div>
					<!-- subjob --> 
						<!-- child sub job -->
						  <div class="row cells12 " >			  
						  	<h5 class="cell colspan7 child-subjob">
						  		หมวดค่าตอบแทน	
						  	</h5>
						  	<div class="cell colspan4 align-center">
						  		
						  	</div>
						  </div>
						<!-- child sub job --> 
						<!-- costcode -->
						  <div class="row cells12 " >			  
						  	<p class="cell colspan7 costcode">
						  		พนักงานรายวัน ประจำโครงการ 2 คน * 250 บาท * 300 วัน		
						  	</p>
						  	<div class="cell colspan4 align-center">
						  		75,000
						  	</div>
						  	<div class="cell ">
					  			<a href="#"><span class="mif-pencil"></span></a>
					  		</div>
						  </div>
						<!-- costcode --> 
					<!-- subjob -->
					
					<!-- subjob --> 
						<!-- child sub job -->
						  <div class="row cells12 " >			  
						  	<h5 class="cell colspan7 child-subjob">
						  		หมวดงบกลาง	
						  	</h5>
						  	<div class="cell colspan4 align-center">
						  		
						  	</div>
						  </div>
						<!-- child sub job --> 
						<!-- costcode -->
						  <div class="row cells12 " >			  
						  	<p class="cell colspan7 costcode">
						  		พนักงานรายวัน ประจำโครงการ 2 คน * 250 บาท * 300 วัน		
						  	</p>
						  	<div class="cell colspan4 align-center">
						  		75,000
						  	</div>
						  	<div class="cell ">
					  			<a href="#"><span class="mif-pencil"></span></a>
					  		</div>
						  </div>
						<!-- costcode --> 
					<!-- subjob -->
					
					
					  <!--Totle subjob -->  
					   <div class="row cells12 " >			  
					  	<div class="cell colspan7 align-right">
					  		<h4>รวม</h4>
					  	</div>
					  	<div class="cell colspan4 align-center">
					  		<h4>998,000</h4>
					  	</div>
					  </div>
					  <!--Totle subjob -->
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
		<script>
			function showCharm(id){
	            var  charm = $("#right-charm").data("charm");
	            if (charm.element.data("opened") === true) {
	                charm.close();
	            } else {
	                charm.open();
	            }
	        }
		</script>
	</body>
</html>
