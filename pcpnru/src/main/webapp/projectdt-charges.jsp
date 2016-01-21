<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="pcpnru.projectModel.*" %>
<%@ page import="pcpnru.masterModel.GroupCostCodeMasterModel" %> 
<%@ page import="pcpnru.projectData.*" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>ประมาณการค่าใช้จ่าย โครงการ</title>
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
	    <script src="js/angular.min.js"></script>
		<script src="js/app.js"></script>
	</head>

	<body ng-app="controllerCalculator" >
		 <% String projectcode = (String) request.getParameter("projectcode");
		 
		 	ProjectDTChargesDB PDTC = new ProjectDTChargesDB();
		 	String percentage = PDTC.getAmtValue("55");
		 	
		 	List SubjobList = PDTC.GetSubjobList();
		 %>
		 <%@include file="topmenu.jsp" %>
		 <div class="container-fluid"  ng-controller="SettingsController">
			<div class="example"data-text="" >
				<h3 class="align-center margin30">ประมาณค่าใช้จ่าย ของโครงการ ............จำนวนเงินที่สามารถใช้ได้ของ 55% ในงบประมาณการรายได้คือ  {{<%=percentage%> | currency:"฿"}}</h3>
				<div class="example" data-text="เพิ่ม">
			        <div class="grid">
			        	<div class="row cells12">
			        		<div class="cell colspan3"> 
					        	กิจกรรม
						        <div class="input-control text full-size">
								    <select id="subjobcode" name="subjobcode">
										    <% 
							        		if (SubjobList != null) {
								        		for (Iterator iterPj = SubjobList.iterator(); iterPj.hasNext();) {
								        			SubjobMasterForm sjInfo = (SubjobMasterForm) iterPj.next();
						      				%>  
								      			<option value="<%=sjInfo.getSubjobCode()%>" >
								       			 	<%=sjInfo.getSubjobCode()%> - <%=sjInfo.getSubjobName()%>
								       			</option>
												<%		} 
													}
												%> 
								    </select>
								</div>
							</div>
							<div class="cell colspan3"> 
					        	กิจกรรมย่อย
						        <div class="input-control text full-size">
								    <select id="childsubjobcode" name="childsubjobcode">
								    	<option value="0000">-- ไม่ระบุ --</option>
								    </select>
								</div>
							</div>  
			        	</div>
					  	<div class="row cells12">
					        <div class="cell colspan3"> 
					        	รายการ
					        	<div class="input-control text full-size"> 
			                    	<input type="text"   ng-model="name">
			                    </div>
							</div> 
							<div class="cell ">คำนวน<br>
					        	 <button class="button primary mif-calculator2" onclick="showCharm('right')"></button> 
							</div>
							
							<div class="cell colspan3"> 
					        	จำนวนเงิน
					        	<div class="input-control text full-size"> 
			                    	<input type="text" >
			                    </div>
							</div> 
							<div class="cell colspan5"><br>
								 <button class="button success">เพิ่ม</button> 
								 <button class="button primary">บันทึก</button> 
								 <button class="button ">ยกเลิก</button>
								 <button class="button danger">ลบ</button> </div>
					    </div>
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
					<div class="example" data-text="ค่าใช้จ่าย">
					  <!-- subjob -->
					  <div class="row cells12 " >			  
					  	<h5 class="cell colspan7 subjob">
					  		งบบุคลากร	
					  	</h5>
					  	<div class="cell colspan4 align-center">
					  	</div>
					  </div>
					<!-- subjob --> 
						<!-- costcode -->
						  <div class="row cells12 " >			  
						  	<p class="cell colspan7 costcode">
						  		เงินเดือนพนักงานธุรการ ประจำโครงการ 1 คน * 13,200 บาท * 12 เดือน (เพิ่มงบกลาง 5,000)
						  	</p>
						  	<div class="cell colspan4 align-center">
						  		158,400
						  	</div>
						  	<div class="cell ">
					  			<a href="#"><span class="mif-pencil"></span></a>
					  		</div>
						  </div>
						<!-- costcode --> 
						
					<!-- subjob -->
					  <div class="row cells12 " >			  
					  	<h5 class="cell colspan7 subjob">
					  		งบดำเนินงาน	
					  	</h5>
					  	<div class="cell colspan4 align-center">
					  		
					  	</div>
					  </div>
					<!-- subjob --> 
						<!-- child sub job -->
						  <div class="row cells12 " >			  
						  	<h5 class="cell colspan7 child-subjob">
						  		หมวดค่าตอบแทน	
						  	</h5>
						  	<div class="cell colspan4 align-center">
						  		
						  	</div>
						  </div>
						<!-- child sub job --> 
						<!-- costcode -->
						  <div class="row cells12 " >			  
						  	<p class="cell colspan7 costcode">
						  		พนักงานรายวัน ประจำโครงการ 2 คน * 250 บาท * 300 วัน		
						  	</p>
						  	<div class="cell colspan4 align-center">
						  		75,000
						  	</div>
						  	<div class="cell ">
					  			<a href="#"><span class="mif-pencil"></span></a>
					  		</div>
						  </div>
						<!-- costcode --> 
					<!-- subjob -->
					
					<!-- subjob --> 
						<!-- child sub job -->
						  <div class="row cells12 " >			  
						  	<h5 class="cell colspan7 child-subjob">
						  		หมวดงบกลาง	
						  	</h5>
						  	<div class="cell colspan4 align-center">
						  		
						  	</div>
						  </div>
						<!-- child sub job --> 
						<!-- costcode -->
						  <div class="row cells12 " >			  
						  	<p class="cell colspan7 costcode">
						  		พนักงานรายวัน ประจำโครงการ 2 คน * 250 บาท * 300 วัน		
						  	</p>
						  	<div class="cell colspan4 align-center">
						  		75,000
						  	</div>
						  	<div class="cell ">
					  			<a href="#"><span class="mif-pencil"></span></a>
					  		</div>
						  </div>
						<!-- costcode --> 
					<!-- subjob -->
					
					
					  <!--Totle subjob -->  
					   <div class="row cells12 " >			  
					  	<div class="cell colspan7 align-right">
					  		<h4>รวม</h4>
					  	</div>
					  	<div class="cell colspan4 align-center">
					  		<h4>998,000</h4>
					  	</div>
					  </div>
					  <!--Totle subjob -->
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
			// load
			var subjobcode = $("#subjobcode").val();
			var out = '';
			$.ajax({  // select history
			  	 
		          type: "post",
		          url: "ajax_projectdt-charges.jsp", //this is my servlet 
		          data: {subjobcode:subjobcode},
		          async:false, 
		          success: function(result){
		          
		          obj = JSON.parse(result);
		          	// alert(obj)
		          	
		          	var value = obj;
		          if( Object.keys(obj).length === 0){
		        	  $("#childsubjobcode").html('<option value="">-- ไม่ระบุ --</option>');
		          }else{
			          for(var i = 0 ; i < obj.length; i++){
							out +=  
							'<option value="'+obj[i].childsubjobcode+' - '+obj[i].childsubjobname+'">'+
							   obj[i].childsubjobcode+' - '+obj[i].childsubjobname+
							'</option>'; 
						}  
						$("#childsubjobcode").html(out);
			          }
		          }
		       }); 
			// load
			 
			$( "#subjobcode" ).change(function() {
		  		  
				var subjobcode = $("#subjobcode").val();
				var out = '';
				
				$.ajax({  // select history
				  	 
		          type: "post",
		          url: "ajax_projectdt-charges.jsp", //this is my servlet 
		          data: {subjobcode:subjobcode},
		          async:false, 
		          success: function(result){
		          
		          obj = JSON.parse(result);
		          	// alert(obj)
		          	
		          	var value = obj;
		          if( Object.keys(obj).length === 0){
		        	  $("#childsubjobcode").html('<option value="">-- ไม่ระบุ --</option>');
		          }else{
			          for(var i = 0 ; i < obj.length; i++){
							out +=  
							'<option value="'+obj[i].childsubjobcode+' - '+obj[i].childsubjobname+'">'+
							   obj[i].childsubjobcode+' - '+obj[i].childsubjobname+
							'</option>'; 
						}  
						$("#childsubjobcode").html(out);
			          }
		          }
		       }); 
			}); 
		}); 
		
		
		</script>
		
	</body>
</html>
