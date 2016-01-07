<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>สร้าง รายการค่าใช้จ่าย</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width; initial-scale=1.0">
		
		<link rel="shortcut icon" href="/favicon.ico">
		<link href="css/metro.css" rel="stylesheet">
        <link href="css/metro-icons.css" rel="stylesheet">
		<link href="css/metro-schemes.css" rel="stylesheet">
	 	<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
        <script src="js/jquery.dataTables.min.js"></script>
  		
	</head>

	<body>
		 <div><%@include file="topmenu.jsp" %></div>
		 <h3 class="align-center">สร้าง รายการค่าใช้จ่าย</h3>
		 <div class="example" data-text="รายละเอียด">
         <div class="grid">
		  	<div class="row cells12">
		  		<div class="cell colspan2"> 
		        	รหัส รายการค่าใช้จ่าย
			        <div class="input-control text full-size">
					    <input type="text">
					</div>
				</div>
		        <div class="cell colspan4"> 
		        	 รายการค่าใช้จ่าย
			        <div class="input-control text full-size">
					    <input type="text">
					</div>
				</div> 
				<div class="cell colspan6"><br>
					  <button class="button success">สร้างชื่อรายการค่าใช้จ่าย</button> 
					  <button class="button primary">แก้ไขชื่อรายการค่าใช้จ่าย</button> 
					  <button class="button danger">ลบชื่อรายการค่าใช้จ่าย</button> 
				</div> 
		    </div>
		 </div>  
		</div>  
		 
        <div class="example" data-text="รายการ">
            <table id="table_project" class="dataTable striped border bordered" data-role="datatable" data-searching="true">
                <thead>
                <tr>  
                    <th>รหัส-รายการค่าใช้จ่าย</th>
                    <th>ชื่อ-รายการค่าใช้จ่าย</th> 
                </tr>
                </thead> 
                  
                <tbody>
                <tr>  
                    <td>001</td>
                    <td>เงินเดือนพนักงานธุรการ</td>   
                </tr>	
                <tr>  
                    <td>002</td>
                    <td>พนักงานนวด</td>  
                </tr>
                <tr>  
                    <td>003</td>
                    <td>ค่าตอบแทนล่วงเวลา</td>  
                </tr> 
                <tr>  
                    <td>004</td>
                    <td>ค่าตอบแทนพนักงงานนวด(รายวัน)</td>  
                </tr> 
                </tbody>
            </table>
        </div> <!-- End of example table -->  
         
   		<script>
        $(function(){
            $('#table_project').dataTable();
        });
    	</script>
	</body>
</html>
