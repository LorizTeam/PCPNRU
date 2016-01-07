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
		<link href="css/bootstrap-datepicker3.css" rel="stylesheet"> 
	
	 	
	 	<script src="js/jquery-2.1.3.min.js"></script> 
	    <script src="js/metro.js"></script>
  		<script src="js/bootstrap-datepicker-th.js"></script>
  		
  		
	</head>

	<body>
		 <div><%@include file="topmenu.jsp" %></div>
		 <br>
		 <div class="example" data-text="รายวัน">
         <div class="grid">
		  	<div class="row cells4">
		        <div class="cell"> 
		        	รหัส-ชื่อ โครงการ
			        <div class="input-control text full-size">
					    <select onchange="">
					    	<option>-- โปรดเลือก --</option>
					        <option>521800001 - อาคารเรือนไทย</option>
					        <option>521800002 - กาสลอง</option>
					        <option>521800003 - ถ่ายภาพพิมพ์บัตรและสื่อสารดิจตอล</option>
					        <option>521800004 - โรงแรม</option>
					        <option>521800005 - ศูนย์บริการ</option>
					        <option>521800006 - สปา & ฟิตเนส</option>
					        <option>521800007 - ศูนย์อาหารและร้านค้า</option> 
					    </select>
					</div>
				</div> 
		        <div class="cell"> 
		        	วันที่โครงการ
		        	 <div class="input-control text full-size"> 
                          <input type="text" id="datepicker">
                     </div>
				</div> 
				<div class="cell"><br>
					  <button class="button success">Print</button> 
				</div> 
		    </div>
		 </div>  
		</div>  
		<div class="example" data-text="รายเดือน">
         <div class="grid">
		  	<div class="row cells4">
		        <div class="cell"> 
		        	รหัส-ชื่อ โครงการ
			        <div class="input-control text full-size">
					    <select onchange="">
					    	<option>-- โปรดเลือก --</option>
					        <option>521800001 - อาคารเรือนไทย</option>
					        <option>521800002 - กาสลอง</option>
					        <option>521800003 - ถ่ายภาพพิมพ์บัตรและสื่อสารดิจตอล</option>
					        <option>521800004 - โรงแรม</option>
					        <option>521800005 - ศูนย์บริการ</option>
					        <option>521800006 - สปา & ฟิตเนส</option>
					        <option>521800007 - ศูนย์อาหารและร้านค้า</option> 
					    </select>
					</div>
				</div>
		        <div class="cell"> 
		        		เดือน
					    <div class="input-control text full-size">
                           <select onchange=""> 
					        <option>01 - มกราคม</option>
					        <option>02 - กุมภาพันธ์</option>
					        <option>03 - มีนาคม</option>
					        <option>04 - เมษายน</option>
					        <option>05 - พฤษภาคม</option>
					        <option>06 - มิถุนายน</option>
					        <option>07 - กรกฎาคม</option> 
					        <option>08 - สิงหาคม</option>
					        <option>09 - กันยายน</option>
					        <option>10 - ตุลาคม</option>
					        <option>11 - พฤศจิกายน</option>
					        <option>12 - ธันวาคม</option>
					    </select> 
                        </div> 
				</div> 
				<div class="cell">
						ปี
					    <div class="input-control text full-size">
                           <select onchange=""> 
					        <option>2555</option>
					        <option>2556</option>
					        <option>2557</option>
					        <option>2558</option>
					        <option>2559</option>
					        <option>2560</option>
					        <option>2561</option>
					        <option>2562</option>
					        <option>2563</option>
					        <option>2564</option>
					        <option>2565</option>
					        </select> 
                        </div>
				</div>
				<div class="cell"><br>
					  <button class="button success">Print</button> 
				</div> 
		    </div>
		 </div>  
		</div>
		<div class="example" data-text="รายไตรมาส">
         <div class="grid">
		  	<div class="row cells4">
		        <div class="cell"> 
		        	รหัส-ชื่อ โครงการ
			        <div class="input-control text full-size">
					    <select onchange="">
					    	<option>-- โปรดเลือก --</option>
					        <option>521800001 - อาคารเรือนไทย</option>
					        <option>521800002 - กาสลอง</option>
					        <option>521800003 - ถ่ายภาพพิมพ์บัตรและสื่อสารดิจตอล</option>
					        <option>521800004 - โรงแรม</option>
					        <option>521800005 - ศูนย์บริการ</option>
					        <option>521800006 - สปา & ฟิตเนส</option>
					        <option>521800007 - ศูนย์อาหารและร้านค้า</option> 
					    </select>
					</div>
				</div>  
				<div class="cell">
						ไตรมาส
					    <div class="input-control text full-size">
                           <select onchange=""> 
					        <option>1</option>
					        <option>2</option>
					        <option>3</option> 
					        </select> 
                        </div>
				</div>
				<div class="cell"><br>
					  <button class="button success">Print</button> 
				</div> 
				<div class="cell"> </div>
		    </div>
		 </div>  
		</div>
		<div class="example" data-text="รายปี">
         <div class="grid">
		  	<div class="row cells4">
		        <div class="cell"> 
		        	รหัส-ชื่อ โครงการ
			        <div class="input-control text full-size">
					    <select onchange="">
					    	<option>-- โปรดเลือก --</option>
					        <option>521800001 - อาคารเรือนไทย</option>
					        <option>521800002 - กาสลอง</option>
					        <option>521800003 - ถ่ายภาพพิมพ์บัตรและสื่อสารดิจตอล</option>
					        <option>521800004 - โรงแรม</option>
					        <option>521800005 - ศูนย์บริการ</option>
					        <option>521800006 - สปา & ฟิตเนส</option>
					        <option>521800007 - ศูนย์อาหารและร้านค้า</option> 
					    </select>
					</div>
				</div>  
				<div class="cell">
						ปี
					    <div class="input-control text full-size">
                           <select onchange=""> 
					        <option>2555</option>
					        <option>2556</option>
					        <option>2557</option>
					        <option>2558</option>
					        <option>2559</option>
					        <option>2560</option>
					        <option>2561</option>
					        <option>2562</option>
					        <option>2563</option>
					        <option>2564</option>
					        <option>2565</option>
					        </select> 
                        </div>
				</div>
				<div class="cell"><br>
					  <button class="button success">Print</button> 
				</div> 
				<div class="cell"> </div>
		    </div>
		 </div>  
		</div>  
	</body>
	<script>
	    $(function(){
	        $("#datepicker").datepicker();
	        language: "th"
	    });
	</script>
</html>
