<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>บันทึกข้อความขออนุมัติดำเนินการ</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width; initial-scale=1.0">
		
		<link rel="shortcut icon" href="/favicon.ico">
		<link href="css/metro.css" rel="stylesheet">
        <link href="css/metro-icons.css" rel="stylesheet">
		<link href="css/metro-schemes.css" rel="stylesheet">
		<link href="css/jquery.dataTables.min.css" rel="stylesheet">
		
		<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
	    <script src="js/jquery.dataTables.min.js"></script>
	</head>
	<body>
		<div><%@include file="topmenu.jsp" %></div>
		
		<form>
			<div class="grid" >
				 <div class="row cells12 " >
		 			<div class="cell align-center colspan2">
	         	 	</div>
	         	 	<div class="cell align-center colspan3">
	         	 	</div>
		 			<div class="cell align-left colspan5"><h3>ข้อมูลผู้ขาย </h3></div>
		 			<div class="cell align-left colspan2">
					</div>
				</div>
			    <div class="example" data-text="Add">
			        <div class="row cells12 ">
				 		<div class="cell colspan1"> </div>
				 		<div class="cell colspan4">
				 			รหัสผู้ขาย
				 			<div class="input-control text full-size"> 
				 				<s:textfield name="vendermodel.vender_id" id="vender_id" required=""/>
				 			</div>
				 		</div>
				 		<div class="cell colspan4"> 
				 			ชื่อของผู้ขาย
				 			<div class="input-control text full-size">
				 				<s:textfield name="vendermodel.vender_name" id="vender_name" required=""/>
				 			</div>
				 		</div>
				 	</div>
				 	<div class="row cells12 ">
				 		<div class="cell colspan9 align-center"> 
				 			<button type="submit" class="button success" name="add" id="add"><span class="mif-plus mif-lg fg-white"></span></button>
						  	<button type="submit" class="button danger" name="delete" id="delete"><span class="mif-minus mif-lg fg-white"></span></button>
 						</div>
				 		<div class="cell colspan3 align-center"></div>
				 	</div>
			    </div>
			    <div class="example" data-text="Display">
			    	<table id="table_vender" class="cell-border hover display compact nowrap" cellspacing="0" width="100%">
		                <thead>
		                <tr>  
		                	<th>รหัสผู้ขาย</th>
		                	<th>ชื่อผู้ขาย</th>
		                    <th>วันที่เพิ่มข้อมูล</th>
		                </tr>
		                </thead> 
		                <tbody>
		                <tr>
		                	<td>0001</td>
		                	<td>qwer</td>
		                    <td>19/03/2559</td>
		                </tr>
		                </tbody>
		           	</table>
			    </div> 
		 	</div>
		</form>
		<script type="text/javascript">
		$(function(){
			var table = $('#table_vender').DataTable( { 
         		scrollY: '39vh',
         		scrollX: true, 
         		scrollCollapse: true,
                ordering: false,
                "lengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]] 
            } );
		});
		</script>
	</body>
</html>