<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
	<head>
		<title>บันทึกข้อความขออนุมัติดำเนินการ</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width; initial-scale=1.0">
		
		<link rel="shortcut icon" href="/favicon.ico">
		<link href="css/metro.css" rel="stylesheet">
        <link href="css/metro-icons.css" rel="stylesheet">
		<link href="css/metro-schemes.css" rel="stylesheet"> 
		<link href="css/bootstrap-datepicker3.css" rel="stylesheet"> 
		<link href="css/jquery.dataTables.min.css" rel="stylesheet">
		
	 	<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
        <script src="js/jquery.dataTables.min.js"></script> 
  		<script src="js/bootstrap-datepicker-th.js"></script>
	</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>สร้างใบ PO</title>
</head>
<body>
	<div><%@include file="topmenu.jsp" %></div>
	<h3 class="align-center">ทำรายการสั่งซื้อ/สั่งจ้าง</h3>
	<form action="">
		<div class="example" data-text="ข้อมูลใบ PR"> 
	         <div class="grid">
	         	<div class="row cells12">
	         		<div class="cell colspan4"> </div> 
					<div class="cell colspan4 "> 
			        	รหัส PR
				        <div class="input-control text full-size"  data-role="input">
						    <s:textfield name="recordApproveModel.description" id="description" required="" />
						    <div class="button-group">
						    <button class="button primary" type="button" onclick="javascript:getpr()"> <span class="mif-search"></span></button>
							<button class="button danger" type="button" onclick="deletepr()"><span class="mif-bin"></span></button>
				 	 		<button class="button success" type="submit" name="pull_detailpr"><span class="mif-download"></span></button>
				 	 		</div>
						</div>
					</div>
					<div class="cell colspan4"> </div> 
			 	</div>
			</div>
		</div>
	</form>
	<form action="">
		<div class="example" data-text="ข้อมูลรายละเอียด PO"> 
	         <div class="grid">
	         	<div class="row cells12">
	         		<div class="cell colspan3"> </div> 
					<div class="cell colspan3 "> 
			        	รหัส PR
				        <div class="input-control text full-size"  data-role="input">
						    <s:textfield name="recordApproveModel.description" id="description" required="" readonly="true" />
						</div>
					</div>
					<div class="cell colspan3"> 
						วันที่สร้าง PR
				        <div class="input-control text full-size"  data-role="input">
						    <s:textfield name="recordApproveModel.description" id="description" required="" readonly="true"/>
						</div>
					</div>
					<div class="cell colspan3"> </div>
			 	</div>
			 	<div class="row cells12">
			 		<div class="cell colspan1"> </div> 
					<div class="cell colspan10"> 
			 		
			 			<table class="table striped hovered cell-hovered border bordered" >
			 				<thead>
			 					<tr>
			 						<th>ลำดับ</th>
			 						<th>รายการ</th>
			 						<th>จำนวน</th>
			 						<th>ราคาต่อหน่วย</th>
			 						<th>จำนวนเงิน (บาท)</th>
			 						<th>หมายเหตุ</th>
			 					</tr>
			 				</thead>
			 				<tbody>
			 					<tr>
			 						<td>1</td>
			 						<td>ค่าสัญญา</td>
			 						<td><input type="text" value="1"/></td>
			 						<td><input type="text" value="5"/></td>
			 						<td>5,000.00</td>
			 						<td>หมายเหตุ*</td>
			 					</tr>
			 				</tbody>
			 			</table>
			 		</div>
			 		<div class="cell colspan1"> </div>
			 	</div>
			 	<div class="row cells12">
			 		<div class="cell colspan5"> </div>
			 		<div class="cell colspan2">
			 			 <button class="button primary" type="submit" name="update_price">คำนวณราคา <span class="mif-loop2"></span></button>
			 		</div>
			 		<div class="cell colspan5"> </div>
			 	</div>
			 	<div class="row cells12">
	         		<div class="cell colspan3"> </div> 
					<div class="cell colspan3 "> 
			        	รหัส PO
				        <div class="input-control text full-size"  data-role="input">
				        	<s:textfield name="po.po_number" id="description" required="" readonly="true"/>
						    <s:hidden name="po.project_code" id="description" required=""/>
						</div>
					</div>
					<div class="cell colspan3"> 
						วันที่ทำรายการ PO
						<div class="input-control text full-size">
						    <s:textfield name="po.pocreate_date" id="pocreate_date" required=""/>
						</div>
					</div>
					<div class="cell colspan3"> </div>
			 	</div>
			 	<div class="row cells12">
	         		<div class="cell colspan3"> </div> 
	         		<div class="cell colspan3"> 
						ประเภท
						<label class="input-control radio">
						    <input type="radio" name="type_po" value="purchase1">
						    <span class="check"></span>
						    <span class="caption">จัดซื้อ</span>
						</label>
						<label class="input-control radio">
						    <input type="radio" name="type_po" value="purchase2">
						    <span class="check"></span>
						    <span class="caption">จัดจ้าง</span>
						</label>
					</div>
					<div class="cell colspan3 "> 
			        	เรียนผู้ขาย
				        <div class="input-control text full-size"  data-role="input">
						    <s:textfield name="po.vender" id="description" required=""/>
						</div>
					</div>
					<div class="cell colspan3"> </div>
			 	</div>
			 	<div class="row cells12">
	         		<div class="cell colspan3"> </div> 
	         		<div class="cell colspan3"> 
						จะส่งมอบงานจ้างหรือสิ่งของภายใน
						<div class="input-control text full-size"  data-role="input">
						    <s:textfield name="po.credit_date" id="description" required=""/>
						</div>
					</div>
					<div class="cell colspan3 "> 
			        	ค่าปรับวันละ
				        <div class="input-control text full-size"  data-role="input">
						    <s:textfield name="po.vender" id="description" required="" value="100"/>
						</div>
						หากส่งของช้า
					</div>
					<div class="cell colspan3"> </div>
			 	</div>
			</div>
		</div>
		<div class="example" data-text="ใบเสนอราคา"> 
	         <div class="grid">
	         	<div class="row cells12">
	         		<div class="cell colspan3"> </div> 
					<div class="cell colspan3 "> 
			        	อ้างอิงหมายเลขใบเสนอราคา
				        <div class="input-control text full-size"  data-role="input">
						    <s:textfield name="po.quotation_number" id="quotation_number" required=""/>
						</div>
					</div>
					<div class="cell colspan3"> 
						ลงวันที่ของใบเสนอราคา
						<div class="input-control text full-size">
						    <s:textfield name="po.quotation_date" id="quotation_date" required=""/>
						</div>
					</div>
					<div class="cell colspan3"> </div>
			 	</div>
			</div>
		</div>
		<div class="grid">
         	<div class="row cells12">
	       		<div class="cell colspan5"> </div> 
				<div class="cell colspan2"> 
		        	<button class="button success" type="submit" name="pull_detailpr"><span class="mif-floppy-disk mif-lg fg-white"></span></button>
		        	<a class="button danger" type="submit" href=""><span class="mif-cross mif-lg fg-white"></span></a>
				</div>
				<div class="cell colspan5"> 
		 		</div>
			</div>
		</div>
	</form>
<script type="text/javascript">
$(function(){
	$("#pocreate_date").datepicker({
    	format: "dd-mm-yyyy",autoclose:true,todayBtn: "linked",todayHighlight: true
    });
	$("#quotation_date").datepicker({
    	format: "dd-mm-yyyy",autoclose:true,todayBtn: "linked",todayHighlight: true
    });
});
</script>
</body>
</html>