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
	
	if(session.getAttribute("username") == null){
		response.sendRedirect("login.jsp");
	}else{
		String username = session.getAttribute("username").toString();
		boolean chkAuthen = false;
		String page_code = "015";
		
		chkAuthen = new CheckAuthenPageDB().getCheckAuthen(username, page_code);
		
		if(chkAuthen==false){
			response.sendRedirect("no-authen.jsp");
		}
	}

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
		<link href="css/sweetalert.css" rel="stylesheet" />
		<link href="css/lightgallery.css" rel="stylesheet" />
		<link href="css/swiper.css" rel="stylesheet" />
		<link href="css/select2.css" rel="stylesheet">
		<style type="text/css">
		
.swiper-container {
    width: 600px;
    height: 300px;
}
		</style>
		
	 	<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
        <script src="js/jquery.dataTables.min.js"></script> 
  		<script src="js/bootstrap-datepicker-th.js"></script>
  		<script src="js/sweetalert.min.js"></script>
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js"></script>
		<script src="js/lightgallery.js"></script>
		<script src="js/lg-fullscreen.js"></script>
		<script src="js/lg-thumbnail.js"></script>
		<script src="js/lg-zoom.js"></script>
		<script src="js/lg-hash.js"></script>
		<script src="js/lg-pager.js"></script>
		<script src="js/swiper.js"></script>
		<script src="js/select2.js"></script>
	</head>
	
	<script>
	function print(){
			
			var tdocno = $("#docno").val();
			var tyear = $("#year").val();
			
    		swal({  title: "ยืนยันการพิมพ์เอกสาร ?",   
    				text: "หากคุณต้องการพิมพ์เอกสารให้กดปุ่มยืนยัน !",   
    				type: "warning",   
    				showCancelButton: true,   
    				confirmButtonColor: "#DD6B55",   
    				confirmButtonText: "ยืนยัน, ฉันต้องการพิมพ์เอกสาร !",   
    				cancelButtonText: "ไม่, ฉันไม่ต้องการพิมพ์เอกสาร !",   
    				closeOnConfirm: false,   
    				closeOnCancel: false,
    				showLoaderOnConfirm: true
    			},
    				 
    		function (isConfirm){
    		  	if (isConfirm) {
    			setTimeout(function(){
    				 
    				var load = window.open("/pcpnru/report/savetext-report.jsp?docno="+tdocno+"&year="+tyear+"" 
    						,'scrollbars=yes,menubar=no,height=600,width=800,resizable=yes,toolbar=no,location=no,status=no');
    			swal("พิมพ์เอกสารสำเร็จแล้ว!", "โปรดตรวจสอบรายละเอียดของเอกสารอีกครั้งเพื่อความถูกต้อง !", "success");
    			} 
    			 , 1000);
     
    			}else {    
    			 swal("ยกเลิกการพิมพ์เอกสาร", "คุณสามารถพิมพ์เอกสารได้อีกครั้งหลังจากปิดหน้าต่างนี้ !", "error");   
    			}
    		});
    		
	    }
    </script>
	
	<body>
		<s:set name="fromwindow" value="recordApproveModel.fromwindow"/>
		
		<s:if test="%{#fromwindow=='true'}">
			<div><%@include file="window-topmenu.jsp" %></div>
		</s:if>
		<s:else>
			<div><%@include file="topmenu.jsp" %></div>
		</s:else>
		 
		 <form action="recordApprove.action" method="post" enctype="multipart/form-data">
		 <s:hidden name="recordApproveModel.fromwindow"/>
		 <div class="grid" >
		 <div class="row cells12 " >
		 			<div class="cell align-center colspan2">

						<s:if test="%{#fromwindow=='true'}">
						<a class="button success" id="back" href="windowsPR.action"><span class="mif-lg fg-white">ย้อนกลับ</span></a>
						</s:if>
	         	 	</div>
	         	 	<div class="cell align-center colspan3">
	         	 	</div>
		 			<div class="cell align-left colspan5"><h3>บันทึกข้อความ </h3></div>
		 			<div class="cell align-left colspan2"><br>

						<s:if test="%{#fromwindow!='true'}">
						<a class="button success next" id="next" href="createrecordApprove.action"><span class="mif-lg fg-white">ทำรายการใหม่</span></a>
						</s:if>
					</div>
		</div>
		</div>
		<br>
		 
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
				        	<select id="unit" name="recordApproveModel.unit">
						    	<option value="">โปรดเลือก</option> 
						        <% 
						        UnitMasterDB unitM = new UnitMasterDB();
						    	List unitMasterList = unitM.GetUnitMasterList("");
						        
				        		if (unitMasterList != null) {
					        		for (Iterator iter = unitMasterList.iterator(); iter.hasNext();) {
					        			UnitMasterForm unitjMaster = (UnitMasterForm) iter.next();
			      				%>  
				      			<option value="<%=unitjMaster.getUnit()%>" ><%=unitjMaster.getUnit()%></option>
								<%		} 
									}
								%>
						    </select>
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
		<div class="example" data-text="ส่วนของร้านค้า">
			<div class="grid">
			 	<div class="row cells12">
	         		<div class="cell colspan1"> </div>
	         		<div class="cell colspan4"> 
			        	ชื่อร้านค้า
				        <div class="input-control text full-size">
				        	<s:hidden name="recordApproveModel.vender_id" id="vender_id" required=""/>
						    <s:textfield name="recordApproveModel.vender_name" id="vender_name" readonly="true"/>
						    <div class="button-group">
						 	<button class="button primary" type="button" onclick="getvender()"> <span class="mif-search"></span></button>
							<button class="button danger" type="button" id="delete"><span class="mif-bin"></span></button>
							</div>
						</div>
					</div> 
	         		<div class="cell colspan2"> 
			        	จำนวนเงินทั้งหมด
				        <div class="input-control text full-size">
						    <s:textfield name="recordApproveModel.total_amount" id="total_amount" required=""/>
						</div>
					</div>  
	         	</div>
	         	<div class="row cells12">
	         		<div class="cell colspan1"> </div>
	         		<div class="cell colspan4"> 
			        	แนบไฟล์รูปภาพ
				        <div class="input-control text full-size">
						    <s:file name="toBeUploaded" id="toBeUploaded"/> 
						</div>
					</div>
	         	</div>
	         	<div class="accordion" data-role="accordion">
			    	<div class="frame">
			            <div class="heading">รูปภาพไฟล์แนบ</div>
			            <div class="content">
			            	<div id="lightgallery">
			         	<%
			         		if(request.getAttribute("ResultImageList") != null){
			         			List ResultImageList = (List) request.getAttribute("ResultImageList");
			         			for(Iterator imageIter = ResultImageList.iterator();imageIter.hasNext();){
			         				RecordApproveModel recordapprovemodel = (RecordApproveModel) imageIter.next();
			         	%>		
			         			
									<a href="<%=recordapprovemodel.getImg_path()%>">
								      <img src="<%=recordapprovemodel.getImg_path()%>" style="width: 10%; height: 10%" />
								  	</a>
								
			         	<%
			         			}
			         		}
			         	%>
			         		</div>
			            </div>
			        </div>
         		</div>

         	</div>
		</div>
		<div class="example" data-text="ข้อมูลผู้ออกใบขออนุมัติเบิก"> 
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
	         	 	<div class="cell align-center colspan2">

						<s:if test="%{#fromwindow=='true'}">
						<a class="button success" id="back" href="windowsPR.action"><span class="mif-lg fg-white">ย้อนกลับ</span></a>
						</s:if>
	         	 	</div>
	         	 	<div class="cell align-center colspan3">
	         	 	</div>  
					<div class="cell align-left colspan5"><br>
						  <button class="button success" name="save" id="save"> <span class="mif-floppy-disk mif-lg fg-white"></span></button>   
						  <a href="javascript:print();" id="print" class="button warning size"><span class="mif-print mif-lg fg-white"></span></a>
						  
					</div>
					<div class="cell align-right colspan2"><br>

						<s:if test="%{#fromwindow!='true'}">
						<a class="button success next" id="next" href="createrecordApprove.action"><span class="mif-lg fg-white">ทำรายการใหม่</span></a>
						</s:if>
					</div>
			 	</div>
			</div>
		</div>
		 <s:hidden name="recordApproveModel.alertmsg" id="alertmsg"/>
        </form> 
		        
   		<script>
   		function getvender() {
   			var load = window.open('/pcpnru/windows_entrancvender.action','pr',
   			             'scrollbars=yes,menubar=no,height=700,width=1280,resizable=yes,toolbar=no,location=yes,status=no');
   		}
   		
        $(function(){
        	var select2unit = $("#unit").select2();
        	if($("#alertmsg").val() != ""){
        		swal("Error",$("#alertmsg").val() , "error");
        	}
        	$('#lightgallery').lightGallery();
        	$("#record_approve_date").datepicker({
            	format: "dd-mm-yyyy",autoclose:true,todayBtn: "linked",todayHighlight: true
            });   
        	$(".back").click(function(){
            	window.history.back();
            });
        	$("#delete").click(function(){
        		$("#description").val("-");
        		$("#qty").val(0);
        	});
            
        	$("#save").click(function(){
        		$("#description").val("-");
        		$("#qty").val(0);
        	});
        	$(".next").click(function(){
        		$("#description").val("-");
        		$("#qty").val(0);
        	}); 
        	
        }); // close function
    	</script>
    	<script>        
		  var mySwiper = new Swiper ('.swiper-container', {
		    // Optional parameters
		    loop: true,
		    
		    // If we need pagination
		    pagination: '.swiper-pagination',
		    
		    // Navigation arrows
		    nextButton: '.swiper-button-next',
		    prevButton: '.swiper-button-prev',
		    
		    // And if we need scrollbar
		    scrollbar: '.swiper-scrollbar',
		  })        
		  </script>
	</body>
</html>
