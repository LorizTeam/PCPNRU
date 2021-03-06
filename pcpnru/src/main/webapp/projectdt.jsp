<%@ page language="java" import="java.util.*,java.text.DecimalFormat" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ page import="pcpnru.projectData.*" %>
<%@ page import="pcpnru.projectModel.*" %>
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
	 	<link href="css/sweetalert.css" rel="stylesheet" />
	 	
	 	<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
	    <script src="js/docs.js"></script>
  		<script src="js/angular.min.js"></script>
  		<script src="js/sweetalert.min.js"></script>
	</head>
	
	<script>
	function printProj(tprojectcode, tyear){
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
    				var load = window.open("/pcpnru/report/project-report.jsp?projectcode="+tprojectcode+"&year="+tyear+"" 
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
	
	<body ng-app="" ng-init="">
		 <% String projectcode = (String) request.getParameter("projectcode");   
		 	String year = (String) request.getParameter("year");
		 	
		 	ProjectData pdb = new ProjectData();
		 	String projectname = pdb.selectProjectname(projectcode);
		 %>
		 <%@include file="topmenu.jsp" %>
		 <div class="container-fluid">
		 	<a href="projectdt-receive.jsp?projectcode=<%=projectcode%>&year=<%=year%>" class="command-button primary">
			    <span class="icon mif-chart-dots"></span>
			  	  รายได้
			    <small>จัดการรายรับของโครงการ</small>
			</a>
			<a href="projectdt-charges.jsp?projectcode=<%=projectcode%>&year=<%=year%>" class="command-button info">
			    <span class="icon mif-coins"></span>
			  	 ค่าใช้จ่าย
			    <small>จัดการค่าใช้จ่ายของโครงการ</small>
			</a>
		<!--  	<a href="projectplan.pdf" class="command-button success"> -->
			<a href="javascript:printProj('<%=projectcode%>','<%=year%>');" class="command-button success" >
			    <span class="icon mif-printer"></span>
			  	 พิมพ์
			    <small>พิมพ์รายงานประมาณการรายได้ รายจ่าย</small>
			</a>

			<div class="example"data-text="" >
			<h3 class="align-center margin30">ประมาณการรายได้ รายจ่าย โครงการ <%=projectname%></h3>
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
				<div class="example" data-text="รายได้" >
				  <%
				  	ProjectData pjdata = new ProjectData();
				  	List projectDTListreceive = pjdata.GetProjectDTDetailList(projectcode, year, "", "", "", "",
				  			"", "", "", "", "", "desc", "true", "");
				  	double pjdt_receivetotal = 0;
				  	if(projectDTListreceive != null){
				  		Iterator projectDTIter = projectDTListreceive.iterator();
				  		while(projectDTIter.hasNext()){
				  			ProjectModel pjmodel = (ProjectModel) projectDTIter.next();
				  			pjdt_receivetotal += Float.parseFloat(pjmodel.getBudget());
				  %>
				  			<!-- ROW -->
							  <div class="row cells12 " >			  
							  	<h5 class="cell colspan8 subjob">
							  		<%=pjmodel.getGcostcode_name() %>
							  	</h5>
							  	<div class="cell colspan4 align-center">
							  		{{ <%=pjmodel.getBudget() %> | currency:"฿"}}
							  	</div>
							  </div>
							<!-- ROW --> 
				  <%	
				  		}
				  	}
				  %>
				  	
					  
					  <!--Totle ROW -->  
					   <div class="row cells6 " >			  
					  	<div class="cell colspan4 align-right">
					  		<h4>รวม</h4>
					  	</div>
					  	<div class="cell colspan2 align-center">
					  		<h4>{{<%=pjdt_receivetotal %>| currency:"฿"}}</h4>
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
				<div class="example" data-text="รายจ่าย" >				  
				  	
					<%
					double pjdt_requisitiontotal = 0;
				  	List projectDTListRequisition_subjob = pjdata.GetProjectDTDetailList(projectcode, year, "", "", "", "",
				  			"", "", "", "", "", "desc", "", "a.subjob_code");
				  	
				  	if(projectDTListRequisition_subjob != null){
				  		Iterator projectDTIter_subjob = projectDTListRequisition_subjob.iterator();
				  		while(projectDTIter_subjob.hasNext()){
				  			ProjectModel pjmodel = (ProjectModel) projectDTIter_subjob.next();
				  			pjdt_receivetotal += Float.parseFloat(pjmodel.getBudget());
				  	%>
				  		<div class="row cells12 " >			  
						  	<h5 class="cell colspan8 subjob">
						  		<%=pjmodel.getSubjob_name() %>
						  	</h5>
						  	<div class="cell colspan4 align-center">
						  		
						  	</div>
						  </div>
						  <!-- child_subjob -->
						  <%
						  List projectDTListRequisition_childsubjob = pjdata.GetProjectDTDetailList(projectcode, year, "", pjmodel.getSubjob_code(), "", "",
						  			"", "", "", "", "", "desc", "", "a.childsubjobcode");
						  	
						  	if(projectDTListRequisition_childsubjob != null){
						  		Iterator projectDTIter_childsubjob = projectDTListRequisition_childsubjob.iterator();
						  		while(projectDTIter_childsubjob.hasNext()){
						  			ProjectModel pjmodel_childsubjob = (ProjectModel) projectDTIter_childsubjob.next();
						  			
					  				if(!pjmodel_childsubjob.getChildsubjobcode().equals("000")){
					  	  %>
					  	  				<div class="row cells12 " >			  
										  	<h5 class="cell colspan8 child-subjob">
										  		<%=pjmodel_childsubjob.getChildsubjobname() %>	
										  	</h5>
										  	<div class="cell colspan4 align-center">
										  		
										  	</div>
										  </div>
					  	  
					  	  <%
					  				}
						  %>
							  
							  		<!-- gcostcode -->
							  		<%
							  		
									  List projectDTListRequisition_gcostcode = pjdata.GetProjectDTDetailList(projectcode, year, "", "", "", pjmodel_childsubjob.getChildsubjobcode(),
									  			"", "", "", "", "", "desc", "", "");
									  	
									  	if(projectDTListRequisition_gcostcode != null){
									  		Iterator projectDTIter_gcostcode = projectDTListRequisition_gcostcode.iterator();
									  		while(projectDTIter_gcostcode.hasNext()){
									  			ProjectModel pjmodel_gcostcode = (ProjectModel) projectDTIter_gcostcode.next();
									  			pjdt_requisitiontotal += Float.parseFloat(pjmodel_gcostcode.getBudget());
									  			
									  %>
									  		<div class="row cells12 " >			  
											  	<p class="cell colspan8 costcode">
											  		<%=pjmodel_gcostcode.getGcostcode_name() %>	
											  	</p>
											  	<div class="cell colspan4 align-center">
											  		{{ <%=pjmodel_gcostcode.getBudget() %> | currency:"฿"}}
											  	</div>
											  </div>
									  
									  <%
									  		}
									  	}
									  %>
							  		<!-- gcostcode -->
						  <%
						
						  		}
						  	}
						  %>
						  <!-- child_subjob -->
						  
				  	<%
				  		}
				  	}
					
					%>
					<!-- subjob -->
					
					<!-- ------------------------------------------------------ -->
					
					  <!--Totle subjob -->  
					   <div class="row cells12 " >			  
					  	<div class="cell colspan8 align-right">
					  		<h4>รวม</h4>
					  	</div>
					  	<div class="cell colspan4 align-center">
					  		<h4>{{ <%=pjdt_requisitiontotal %> | currency:"฿" }}</h4>
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
