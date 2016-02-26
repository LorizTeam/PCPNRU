<%@page import="com.mysql.jdbc.IterateBlock"%>
<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="pcpnru.masterModel.*" %>
<%@ page import="pcpnru.masterData.*" %>
<%@ page import="pcpnru.projectData.*" %>
<%@ page import="pcpnru.projectModel.*" %>
<%@ page import="pcpnru.utilities.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	if(session.getAttribute("username") == null)response.sendRedirect("login.jsp");

	RecordApproveDB ra = new RecordApproveDB();
	DateUtil dateUtil = new DateUtil();
   

%>
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
		<link href="css/bootstrap-datepicker3.css" rel="stylesheet"> 
		<link href="css/jquery.dataTables.min.css" rel="stylesheet">
		
	 	<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
        <script src="js/jquery.dataTables.min.js"></script> 
  		<script src="js/bootstrap-datepicker-th.js"></script>
	</head>

	<body>
		 <div><%@include file="topmenu.jsp" %></div>
		 <h3 class="align-center">บันทึกข้อความ</h3>
		 <form action="recordApprove.action" method="post">
		 <div class="example" data-text="รายการ"> 
	         <div class="grid">
	         	<div class="row cells12">
	         		<div class="cell colspan1"> </div> 
					<div class="cell colspan5"> 
			        	รายการ
				        <div class="input-control text full-size">
						    <s:textfield name="recordApproveModel.description" id="description" required="" /> 
						</div>
					</div>      
	         		<div class="cell colspan1"> 
			        	จำนวน
				        <div class="input-control text full-size" dir="rtl">
						    <s:textfield type="number" name="recordApproveModel.qty" id="qty" required=""/> 
						</div>
					</div> 
	         		<div class="cell colspan1"> 
			        	หน่วย
				        <div class="input-control text full-size">
						    <s:textfield name="recordApproveModel.unit" id="unit" required=""/>
						</div>
					</div>  
	         	 	<div class="cell align-left colspan3"><br>
						  <button type="submit" class="button success" name="add" id="add"><span class="mif-plus mif-lg fg-white"></span></button>
						  <button type="submit" class="button danger" name="delete" id="delete"><span class="mif-minus mif-lg fg-white"></span></button>  
					</div>
			 	</div>  
			</div>
		</div>
		<div class="grid">	
			<div class="window ">
				<div class="row cells12 align-center  window-caption bg-cyan fg-white" >
					<div class="cell colspan1"></div>
			  		<div class="cell colspan6">รายละเอียด</div>
			  		<div class="cell colspan2 align-center">จำนวน</div>
			  		<div class="cell colspan2 align-center">หน่วย</div>
			  		<div class="cell colspan1"></div> 
			  	</div>
		  	</div>
		  	
		  	<div class="example ra_dt" data-text="รายละเอียด">
		  		<%
		  			if(request.getAttribute("ListRecordApproveDT") != null){
		  				List ListRecordApproveDT = (List) request.getAttribute("ListRecordApproveDT");
		  				Iterator recordApprovedtIter = ListRecordApproveDT.iterator();
		  				
		  				while(recordApprovedtIter.hasNext()){
		  					RecordApproveModel recordapprovemodel = (RecordApproveModel) recordApprovedtIter.next();
		  				%>
		  				<div class="row cells12 click" >	
				  			<div class="cell colspan1 bt" ></div>
				  			<h5 class="cell colspan6" > <input type="checkbox" name="itemno" id="itemno" value="<%=recordapprovemodel.getItemno() %>" /> <%=recordapprovemodel.getDescription() %></h5>
				  			<div class="cell colspan2 align-center"><%=recordapprovemodel.getQty() %></div>
				  			<div class="cell colspan2 align-center"><%=recordapprovemodel.getUnit() %></div> 
					  		<div class="cell align-right"></div>
				  		</div>
		  				<%
		  				}
		  			}
		  		
		  		%>
		  		
		  	</div>
		</div>
		 
		 <div class="example" data-text="รายละเอียด">
		 
	         <div class="grid">
	         	<div class="row cells12">
	         		<div class="cell colspan1"> </div> 
					<div class="cell colspan6"> 
			        	ส่วนราชการ
				        <div class="input-control text full-size">
						    <s:textfield name="recordApproveModel.record_approve_hd" id="record_approve_hd" required=""/> 
						</div>
					</div> 
					<div class="cell align-right colspan4"> 
			        	<p class="sub-header fg-black">เลขที่เอกสาร <s:property value="recordApproveModel.docno"/> </p>
				        <s:hidden name="recordApproveModel.docno" id="docno" />
				        <s:hidden name="recordApproveModel.year" id="year" />
					</div>   
	         	</div>
	         	<div class="row cells12">
	         		<div class="cell colspan1"> </div>
	         		<div class="cell colspan4"> 
			        	ที่
				        <div class="input-control text full-size">
						    <s:textfield name="recordApproveModel.record_approve_t" id="record_approve_t" required=""/> 
						</div>
					</div> 
	         		<div class="cell colspan2"> 
			        	วันที่
				        <div class="input-control text full-size">
						    <s:textfield name="recordApproveModel.record_approve_date" id="record_approve_date" required=""/>
						</div>
					</div>  
	         	</div>
	         	<div class="row cells12">
	         		<div class="cell colspan1"> </div>
	         		<div class="cell colspan10"> 
			        	เรื่อง
				        <div class="input-control text full-size">
						    <s:textfield name="recordApproveModel.record_approve_title" id="record_approve_title" required=""/> 
						</div>
					</div>  
	         	</div>
	         	<div class="row cells12">
	         		<div class="cell colspan1"> </div>
	         		<div class="cell colspan4"> 
			        	เรียน
				        <div class="input-control text full-size">
						    <s:textfield name="recordApproveModel.record_approve_rian" id="record_approve_rian" required=""/> 
						</div>
					</div>  
	         	</div>
			  	<div class="row cells12">
			  		<div class="cell colspan1"> </div>
			  		<div class="cell colspan10"> 
			  			<div class="input-control textarea full-size"
						    data-role="input" data-text-auto-resize="true">
						    <s:textarea name="recordApproveModel.record_approve_des1"/>
						</div>
			  		</div>  
			    </div> 
			    
			    <div class="row cells12">
			  		<div class="cell colspan1"> </div>
			  		<div class="cell colspan10"> 
			  			<div class="input-control textarea full-size"
						    data-role="input" data-text-auto-resize="true">
						    <s:textarea name="recordApproveModel.record_approve_des2"/>
						</div>
			  		</div>  
			    </div> 
			 </div> 
		</div>    
		
		<div class="example" data-text="ส่วนที่สอง"> 
	         <div class="grid">
	         	<div class="row cells12">
	         		<div class="cell colspan1"> </div>  
			  		<div class="cell colspan10"> 
			  			<div class="input-control textarea full-size"
						    data-role="input" data-text-auto-resize="true">
						    <s:textarea name="recordApproveModel.record_approve_des3"/>
						</div>
			  		</div>   
			 	</div>  
			 	<div class="row cells12">
	         		<div class="cell colspan1"> </div>  
			  		<div class="cell colspan5"> 
			        	ชื่อ ผู้ออกใบบันทึกข้อความ
				        <div class="input-control text full-size">
						    <s:textfield name="recordApproveModel.record_approve_cen" id="record_approve_cen" required=""/>
						</div>
					</div>  
					<div class="cell colspan5 sub-alt-header fg-crimson" ><br>
						ตัวอย่าง เช่น (นาย,นาง,นางสาว,ศาสตราจารย์,รองศาสตราจารย์,ดร.ชื่อ นามสกุล)
					</div>
			 	</div>
			 	<div class="row cells12">
	         		<div class="cell colspan1"> </div>  
			  		<div class="cell colspan5"> 
			        	ตำแหน่ง ผู้ออกใบบันทึกข้อความ
				        <div class="input-control text full-size">
						    <s:textfield name="recordApproveModel.record_approve_dep" id="record_approve_dep" required=""/>
						</div>
					</div>  
					<div class="cell colspan5 sub-alt-header fg-crimson" ><br>
						ตัวอย่าง เช่น อธิการบดี,รองอธิการบดี,ผู้อำนวยการ,รองผู้อำนวยการ
					</div>
			 	</div>
			 	<div class="row cells12"> 
	         	 	<div class="cell align-center colspan12"><br>
						  <button class="button success" name="save" id="save"> <span class="mif-floppy-disk mif-lg fg-white"></span></button>   
						  <a id="print" class="button warning size"><span class="mif-print mif-lg fg-white"></span></a>
					</div>  
			 	</div>
			</div>
		</div> 
        </form> 
        
   		<script>
        $(function(){
        	 
        	$("#record_approve_date").datepicker({
            	format: "dd-mm-yyyy",autoclose:true,todayBtn: "linked",todayHighlight: true
            	
            });   
        	
        	$("#delete").click(function(){
        		$("#description").val("-");
        		$("#qty").val(0);
        		$("#unit").val("-");
        	});
            
        	$("#save").click(function(){
        		$("#description").val("-");
        		$("#qty").val(0);
        		$("#unit").val("-");
        	});
        }); // close function
    	</script>
	</body>
</html>
