<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="pcpnru.projectModel.*" %>
<%@ page import="pcpnru.projectData.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		
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

	<body ng-app="controllerCalculator" >
		 <% String projectcode = (String) request.getParameter("projectcode");  %>
		 		<%@include file="topmenu.jsp" %>
		 <div class="container-fluid" ng-controller="SettingsController">
		 	

			<div class="example"data-text="" >
			<h3 class="align-center margin30">ประมาณการรายได้ ของโครงการ ............</h3>
			
			<form action="projectdtreceive.action" method="post">
			<div class="example" data-text="เพิ่ม">
	         <div class="grid">
			  	<div class="row cells12">
			        
			        <div class="cell colspan4"> 
			        	รายการ
			        	 <div class="input-control text full-size"> 
			        	 	<!--   <s:hidden id="projectcode" name="projModel.projectcode" />
	                          <s:textfield id="costname" name="projModel.costname" ng-model="name" />
	                        --> 
	                        <input type="hidden" id="projectcode" name="projectcode" value="<%=projectcode%>">
	                        <input type="text" id="costname" name="costname" ng-model="name">
	                     </div>
					</div> 
					<div class="cell ">คำนวน<br>
			        	 <button class="button primary mif-calculator2" onclick="showCharm('right')"></button> 
					</div>
					<div class="cell colspan2"> 
			        	จำนวนเงิน
			        	 <div class="input-control text full-size"> 
			        	 	<!--
			        	 	  <s:textfield id="budget" name="projModel.budget" /> 
			        	 	-->
			        	 	<input type="text" id="budget" name="budget">
	                     </div> 
					</div>  
					<div class="cell colspan5"><br>
						  <button class="button success" type="submit" name="add">เพิ่มประมาณการรายได้</button> 
						  <button class="button primary">บันทึกการแก้ไข</button> 
						  <button class="button danger">ลบรายการ</button> 
					</div> 
			    </div>
			 </div>  
			</div>  
			</form>
			
			<div  class="charm right-side bg-gray" data-role="charm" data-position="right" id="right-charm" style="max-width:50%">
				<span class="charm-closer"></span>
				<h3 class="text-light">เพิ่มการคำนวน</h3>
				<div class="grid">
					<div class="row cells2 example bg-gray">
						<div class="cell">จำนวน
				        	<div class="input-control text full-size"> 
		                    	<input type="text"ng-model="value1" >
		                    </div>
						</div> 
						<div class="cell"> 
				        	หน่วยนับ
					        <div class="input-control text full-size">
							    <select onchange="" class="align-center" ng-model="type1">
							        <option>บาท</option>
							        <option>คน</option> 
							        <option>วัน</option>
							        <option>เดือน</option> 
							    </select>
							</div>
						</div> 
					</div>
					
					
			<!-- เพิ่ม operation -->
			<div ng-repeat="cal in calculator "class="example bg-gray">
					<div class="row cells4" >
						<div class="cell">
					        <div class="input-control text full-size ">
							    <select class="align-center" ng-model="cal.operation" id="select_{{$index}}">
							        <option> + </option>
							        <option> - </option>
							        <option> * </option>
							        <option> / </option> 
							    </select>
							</div>
							
						</div>
						<div class="cell colspan3 align-right">
						      <button class="button danger" ng-click="removeContact(cal)">X</button>
					      </div> 
					</div>
					<div class="row cells2">
						<div class="cell">จำนวน
				        	<div class="input-control text full-size"> 
		                    	<input type="text" ng-model="cal.value" aria-labelledby="select_{{$index}}">
		                    </div>
						</div> 
						<div class="cell"> 
				        	หน่วยนับ
					        <div class="input-control text full-size">
							    <select onchange="" class="align-center" ng-model="cal.type" id="select_{{$index}}">
							        <option>บาท</option>
							        <option>คน</option>
							        <option>วัน</option>
							        <option>เดือน</option> 
							    </select>
							</div>
							
						</div>
						 
					</div>
					
			<!-- เพิ่ม operation -->
				</div>
				<div class="row" >
						<div class="cell align-center">
							<a href="#" class="button success"ng-click="addContact()">เพิ่มตัวคำนวน</a>
						</div>
					</div>
				</div>
				<div class="example bg-gray">
					<div class="row"  >
						{{name+' '+value1+' '+type1+' '}}
						 <span ng-repeat="cal in calculator">
						   {{ cal.operation+' '+cal.value+' '+cal.type+' ' }}
						 </span>
					</div>
				</div>
				<div class="row">
					<div class="cell align-center">
							<a href="#" class="button primary">บันทึกการคำนวน</a>
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
				<div class="example" data-text="รายได้">
				  	<% 
		  			if (request.getParameter("projectcode") != null) {
		  				ProjectDTReceiveDB PDTR = new ProjectDTReceiveDB();
		  				List ProjDTReceive = PDTR.GetProjDTReceiveList(projectcode);
		  				String amttotal = "0", projcode = "";
		  				for (Iterator iter = ProjDTReceive.iterator(); iter.hasNext();) {
		  					ProjectModel pjDTR = (ProjectModel) iter.next();
		  				 	projcode = pjDTR.getProject_code().trim();
		  					String amt = pjDTR.getBudget();
		  					amttotal = Float.toString(Float.parseFloat(amttotal)+Float.parseFloat(amt));
				 	%>	
				  	<!-- ROW -->
					  <div class="row cells12 " >			  
					  	<h5 class="cell colspan7 costname"><%=pjDTR.getCostname().trim()%></h5>
					  	<div class="cell colspan4 align-center budget">{{<%=pjDTR.getBudget()%> | currency:"฿"}}</div>
					  	<div class="cell clickbutton">
				  			<a href=""><span class="mif-pencil"></span></a> 
				  		</div>
					  </div>
					<!-- ROW --> 
					<% 		} 
					%>
					  <!--Totle ROW -->  
					   <div class="row cells12 " >			  
					  	<div class="cell colspan7 align-right">
					  		<h4>รวม</h4>
					  	</div>
					  	<div class="cell colspan4 align-center">
					  		<h4>{{<%=amttotal%> | currency:"฿"}}</h4> 
					  	</div>
					  </div>
					  <!--Totle ROW -->
					  <% 		} 
					%>
				</div>
			<!-- รายรับ -->		
			
					 	  
				  </div>
				   <div class="row " >	
					  	<div class="cell align-center">
					  		<a href="projectdt.jsp?projectcode=<%=projectcode%>" class="button">กลับ</a>
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
			 
	   		$(function(){
		       
		        $('.clickbutton').click(function () { 
		        		 
			        		var index = $(".clickbutton").index(this);  
		    	            $("#costname").val($(".costname").eq(index).text()); 
		    	            $("#budget").val($(".budget").eq(index).text());
		        		
		    	});
	   		}); 
		</script>
		<script src="js/angular.min.js"></script>
		<script src="js/app.js"></script>
	</body>
</html>
