<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="pcpnru.projectModel.*" %>
<%@ page import="pcpnru.masterModel.GroupCostCodeMasterModel" %> 
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
  		<script src="js/angular.min.js"></script>
		<script src="js/app.js"></script>
	</head>

	<body ng-app="controllerCalculator" ng-controller="SettingsController">
		 <% String projectcode = (String) request.getParameter("projectcode"); 
		 	String year = (String) request.getParameter("year");
		 	
		 	ProjectData pdb = new ProjectData();
		 	String projectname = pdb.selectProjectname(projectcode);
		 	double target = pdb.getTarget(projectcode, year);
		 	
		 	ProjectDTReceiveDB PDTR = new ProjectDTReceiveDB();
		 	List childSubjobList = PDTR.GetChildSubjobList();
		 	List groupcostCodeList = PDTR.GetGroupCostCodeList(projectcode, year);
		 %>
		 		<%@include file="topmenu.jsp" %>
		 <form id="project-receivedt" action="projectdtreceive.action" method="post" >
		 <div class="container-fluid" >
		 	

			<div class="example"data-text="" >
			<h3 class="align-center margin30">ประมาณการรายได้ ของโครงการ <%=projectname%></h3>
			
			
			<div class="example" data-text="เพิ่ม">
	         <div class="grid">
			  	<div class="row cells12">
			        
			        <div class="cell colspan4"> 
			        	กิจกรรม
			        	 <div class="input-control text full-size"> 
			        	 <select id="csubjob" name="csubjob" data-validate-hint="ไม่ระบุ">
					   	 <option value="" >-- ไม่ระบุ --</option>
						    <% 
			        		if (childSubjobList != null) {
				        		for (Iterator iterPj = childSubjobList.iterator(); iterPj.hasNext();) {
				        			ChildSubjobMasterForm csjInfo = (ChildSubjobMasterForm) iterPj.next();
		      				%>  
				      			<option value="<%=csjInfo.getChildsubjobcode()%>" >
				       			 	<%=csjInfo.getChildsubjobcode()%> - <%=csjInfo.getChildsubjobname()%>
				       			</option>
								<%		} 
									}
								%>
					   </select>
	                     </div>
					</div> 
			    </div>
			    <div class="row cells12">
			        
			        <div class="cell colspan4"> 
			        	รายการ
			        	 <div class="input-control text full-size"> 
			        	 	<!--   <s:hidden id="projectcode" name="projModel.projectcode" />
	                          <s:textfield id="costname" name="projModel.costname" ng-model="name" />
	                        --> 
	                        <input type="hidden" id="projectcode" name="projectcode" value="<%=projectcode%>"> 
	                        <input type="hidden" id="year" name="year" value="<%=year%>">
	                        <input type="hidden" id="gcostcode" name="gcostcode">
	                     <select id="gcostname" name="gcostname" ng-model="name" data-validate-hint="ไม่ระบุ">
					   	 	<option value="" >-- ไม่ระบุ --</option>
						    <% 
			        		if (groupcostCodeList != null) {
				        		for (Iterator iterCC = groupcostCodeList.iterator(); iterCC.hasNext();) {
				        			GroupCostCodeMasterModel ccInfo = (GroupCostCodeMasterModel) iterCC.next();
		      				%>  
				      			<option value="<%=ccInfo.getCostName()%>" ><%=ccInfo.getCostCode()%> - <%=ccInfo.getCostName()%></option>
								<%		} 
									}
								%> 
					   	</select>
	                     </div>
					</div> 
					<div class="cell ">คำนวน<br>
			        	 <button type="button" class="button primary mif-calculator2" onclick="showCharm('right')"></button> 
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
				<div class="example" data-text="รายได้">
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
								  	<h5 class="cell colspan7 costname"><%=pjmodel.getGcostcode_name().trim()%></h5>
								  	<span class="costcodehd"><input type="hidden" id="gcostcodehd" name="gcostcodehd" value="<%=pjmodel.getGcostcode()%>"></span> 
								  	<div class="cell colspan4 align-center budget">{{<%=pjmodel.getBudget()%> | currency:"฿"}}</div>
								  	<div class="cell">
							  			<a href=""><span class="mif-cross deletebt"></span></a> 
							  		</div>
								  </div>
								<!-- ROW --> 
					  <%	
					  		}
					  	}
					  %> 
					<!-- ROW -->  
					  <!--Totle ROW -->  
					   <div class="row cells12 " >			  
					  	<div class="cell colspan7 align-right">
					  		<h4>รวม</h4>
					  	</div>
					  	<div class="cell colspan4 align-center">
					  		<h4>{{<%=pjdt_receivetotal%> | currency:"฿"}}</h4> 
					  	</div>
					  </div>
					  <!--Totle ROW -->
					  <!--Totle ROW Target -->  
					   <div class="row cells12 " >			  
					  	<div class="cell colspan7 align-right">
					  		<h4>เป้าหมาย</h4>
					  	</div>
					  	<div class="cell colspan4 align-center">
					  		<h4>{{<%=target%> | currency:"฿"}}</h4> 
					  	</div>
					  </div>
					  <!--Totle ROW Target--> 
				</div>
			<!-- รายรับ -->		
			
					 	  
				  </div>
				   <div class="row " >	
					  	<div class="cell align-center">
					  		<a href="projectdt.jsp?projectcode=<%=projectcode%>&year=<%=year%>" class="button">กลับ</a>
					  	</div>
					  </div>
			</div>
		</div>
		
		
		<div  class="charm right-side bg-gray" data-role="charm" data-position="right" id="right-charm" style="max-width:50%">
				<span class="charm-closer"></span>
				<h3 class="text-light">เพิ่มการคำนวน</h3>
				<div class="grid">
					<div class="row cells2 example bg-gray">
						<div class="cell">จำนวน
				        	<div class="input-control text full-size"> 
		                    	<input type="text" name="qty" ng-model="value1" >
		                    </div>
						</div> 
						<div class="cell"> 
				        	หน่วยนับ
					        <div class="input-control text full-size">
							    <select onchange="" name="unit" class="align-center" ng-model="type1">
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
							    <select class="align-center" name="aroperation" ng-model="cal.operation" id="select_{{$index}}">
							        <option>+</option>
							        <option>-</option>
							        <option>*</option>
							        <option>/</option> 
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
		                    	<input type="text" name="arqty" ng-model="cal.value" aria-labelledby="select_{{$index}}">
		                    </div>
						</div> 
						<div class="cell"> 
				        	หน่วยนับ
					        <div class="input-control text full-size">
							    <select onchange="" name="arunit" class="align-center" ng-model="cal.type" id="select_{{$index}}">
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
							<a href="" class="button primary"ng-click="addContact()">เพิ่มตัวคำนวน</a>
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
				 
			</div>
		
		</form>
		
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
	   			$("#gcostname").change(function () { 
	   				var text = $("#gcostname :selected").text();
	   				var text1 = text.split(" - "); 
	   				text = text1[0];  
	   				$("#gcostcode").val(text); 
	   			});
	   			
	   			$('.deletebt').click(function () {  
		        	 
		        		var index = $(".deletebt").index(this);
		        	//	var cc = $(".costcodehd > #gcostcodehd").eq(index).val();
		        	//	var cc = $("#gcostcodehd").eq(index).val();
		        	//	alert(cc);
		        		$("#gcostcode").val($(".costcodehd > #gcostcodehd").eq(index).val()); 
				    	$("#project-receivedt").submit();
		        	  
		    	});
	   			
		    /*   $('.clickbutton').click(function () {  
		        	if($("#costname").val() == ""){
		        		var index = $(".clickbutton").index(this);  
				    	$("#costname").val($(".costname").eq(index).text()); 
				    	$("#budget").val($(".budget").eq(index).text());
		        	}else{
		        		$("#costname").val(""); 
		        		$("#budget").val("");
		        	} 
		        		
		    	});  */
			});
		</script>
		
	</body>
</html>
