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
        <link href="css/metro-responsive.css" rel="stylesheet">
		<link href="css/metro-schemes.css" rel="stylesheet">
		<link href="css/docs.css" rel="stylesheet"> 
	 
	 	<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
	    <script src="js/docs.js"></script>
	    <script src="js/prettify/run_prettify.js"></script>
	    <script src="js/ga.js"></script> 
        <script src="includehtml.js"></script>
  	
	</head>

	<body>
		 <div><%@include file="topmenu.jsp" %></div>
		 <br>
		 <div class="example" data-text="รายรับ">
         <div class="grid">
		  	<div class="row cells4">
		        <div class="cell"> 
		        	กิจกรรม
			        <div class="input-control text full-size">
					    <select onchange="">
					    	<option>-- โปรดเลือก --</option>
					        <option>001 - โครงการแหล่งเรียนรู้และวิจัย กาซะลองสปา</option> 
					    </select>
					</div>
				</div>
		        <div class="cell"> 
		        		กิจกรรมย่อย
					    <div class="input-control text full-size">
                           <select onchange=""> 
					        <option>-- โปรดเลือก --</option>
					    </select> 
                        </div> 
				</div> 
				<div class="cell">
						รายการค่าใช้จ่าย
					    <div class="input-control text full-size">
                           <select onchange=""> 
					        <option>เงินเดือนพนักงานธุรการ ประจำโครงการ 1 คน x 13,200 บาท x 12 เดือน = 158,400</option>
					        <option>พนักงานนวด</option>
					        <option>ค่าตอบแทนล่วงเวลา</option>
					        <option>ค่าตอบแทนพนักงงานนวด(รายวัน)</option>
					        </select> 
                        </div>
				</div>
				<div class="cell">จำนวนเงินของรายได้
					<div class="input-control text full-size">
						<input type="text " />
						<button class="button danger"><span class="mif-minus"></span></button>
					</div>
					
				</div>   
				
				
		    </div>
		    <hr>
			<div class="align-center">				
				<button class="button success "><span class="mif-plus"></span></button> 
			</div>
		 </div>  
		</div>
		<div class="example" data-text="รายจ่าย">
         <div class="grid">
		  	<div class="row cells4">
		        <div class="cell"> 
		        	กิจกรรม
			        <div class="input-control text full-size">
					    <select onchange="">
					    	<option>-- โปรดเลือก --</option>
					    	<option>002 - งบบุคลากร</option>
					        <option>003 - หมวดค่าใช้สอย</option>
					    </select>
					</div>
				</div>
		        <div class="cell"> 
		        		กิจกรรมย่อย
					    <div class="input-control text full-size">
                           <select onchange=""> 
					        <option>-- โปรดเลือก --</option>
					    </select> 
                        </div> 
				</div> 
				<div class="cell">
						รายการค่าใช้จ่าย
					    <div class="input-control text full-size">
                           <select onchange=""> 
					        <option>เงินเดือนพนักงานธุรการ ประจำโครงการ 1 คน x 13,200 บาท x 12 เดือน = 158,400</option>
					        <option>พนักงานนวด</option>
					        <option>ค่าตอบแทนล่วงเวลา</option>
					        <option>ค่าตอบแทนพนักงงานนวด(รายวัน)</option>
					        </select> 
                        </div>
				</div>
				<div class="cell">จำนวนเงินของรายได้
					<div class="input-control text full-size">
						<input type="text " />
						<button class="button danger "><span class="mif-minus"></span></button>
					</div>
					
				</div>   
				
				
		    </div>
		     <hr>
			<div class="align-center">				
				<button class="button success "><span class="mif-plus"></span></button> 
			</div>
		 </div>  
		</div> 
	</body>
</html>
