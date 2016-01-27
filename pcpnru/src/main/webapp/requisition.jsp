<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="pcpnru.projectData.*" %>
<%@ page import="pcpnru.projectModel.*" %>
<%@ page import="pcpnru.utilities.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>หน้าเบิกสินค้า</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width; initial-scale=1.0">
	
		<link rel="shortcut icon" href="/favicon.ico">
		<link href="css/metro.css" rel="stylesheet">
        <link href="css/metro-icons.css" rel="stylesheet">     
		<link href="css/metro-schemes.css" rel="stylesheet">
		<link href="css/docs.css" rel="stylesheet"> 
	 	<link href="css/select2.css" rel="stylesheet">
	 	<link href="css/bootstrap-datepicker3.css" rel="stylesheet">
	 	
		<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
	    <script src="js/docs.js"></script>
 		<script src="js/jquery.dataTables.min.js"></script>     
		<script src="js/select2.js"></script>
		<script src="js/bootstrap-datepicker-th.js"></script>
		<script src="js/angular.min.js"></script>
  </head>
  
  <body>
    <div><%@include file="topmenu.jsp" %></div>
	<br>
	<form action="requisition.action" method="post">
		<div class="example" data-text="รายละเอียด">
			<div class="flex-grid">
			  	<div class="row flex-just-center">
			        <div class="cell colspan1 "> 
			       		<h4 class="align-right">โครงการ&nbsp;</h4>
			    	</div>
			    	<div class="cell colspan4" > 
			       		 <h4><small class="input-control full-size"> 
				       		 <select id="project_code" name="project_code" data-validate-func="required" data-validate-hint="กรุณาเลือกโครงการที่รับ">
							   <option value="" >กรุณาเลือกโครงการ</option>
							   <%
							   	List projectMasterList1 = null;
							   	ProjectMasterDB projM = new ProjectMasterDB();
							   	projectMasterList1 = projM.getListProject_Join_Projecthead("", "","","");
							   	List projectMasterList = projectMasterList1;
				        		if (projectMasterList != null) {
					        		for (Iterator iterPj = projectMasterList.iterator(); iterPj.hasNext();) {
					        			ProjectModel pjModel = (ProjectModel) iterPj.next();
			      				%>  
				      			<option value="<%=pjModel.getProject_code()%>" >
				       			 	<%=pjModel.getProject_code()%> - <%=pjModel.getProject_name()%> - ปี <%=pjModel.getYear() %>
				       			</option>
								<%		} 
									}
								%>
					   		</select>
						</small></h4>
			    	</div>
			    	<div class="cell colspan1 "> 
			       		<h4 class="align-right">วันที่&nbsp;</h4>
			    	</div>
			    	<div class="cell colspan4"> 
			    		<h4>
			    		<div class="input-control full-size"> 
						    <input id="day" name="requisition1model.day" />
						</div>
						</h4>
			    	</div>
			    </div>
			</div>
			<div class="flex-grid">
			  	<div class="row flex-just-center">
			        <div class="cell colspan2"> 
			       		<h4>ดำเนินการในการจัด&nbsp;</h4> 	  
			    	</div> 
			    	<div class="cell colspan1">
			    		<!-- Small radio button -->
						<label class="input-control radio small-check" >
						    <input type="radio" name="type">
						    <span class="check"></span>
						    <span class="caption">ซื้อ</span>
						</label>
						<label class="input-control radio small-check" >
						    <input type="radio" name="type">
						    <span class="check"></span>
						    <span class="caption">จ้าง</span>
						</label>
						<label class="input-control radio small-check" >
						    <input type="radio" name="type">
						    <span class="check"></span>
						    <span class="caption">อื่นๆ</span>
						</label>
			    	</div>
			    	
			    	 
			    	<div class="cell colspan1"> 
			      		<h4 align="right">คำอธิบาย&nbsp;</h4> 	  
			    	</div> 
			    	<div class="cell colspan6">
			    		<h4><small class="input-control full-size">
						    <input type="text" id="subjobcode" name="subjobCode"> 
						</small></h4>
			    	</div>
			    	
			    </div>
			</div>
					
			<div class="flex-grid">
			  	<div class="row flex-just-center">
			        <div class="cell colspan1"> 
			       		<h4 align="right">ค่าใช้จ่าย&nbsp;</h4> 	  
			    	</div> 
			    	<div class="cell colspan4">
			    		<h4><small class="input-control full-size">
			    			<select onchange="">
						    	<option>-- โปรดเลือก --</option>
						        <option selected>521800001 - อาคารเรือนไทย</option>
						        <option>521800002 - แหล่งเรียนรู้และวิจัย กาซะลองสปา</option>
						        <option>521800003 - ถ่ายภาพพิมพ์บัตรและสื่อสารดิจตอล</option>
						        <option>521800004 - โรงแรม</option>
						        <option>521800005 - ศูนย์บริการ</option>
						        <option>521800006 - สปา & ฟิตเนส</option>
						        <option>521800007 - ศูนย์อาหารและร้านค้า</option> 
						   </select>
						</small></h4>
			    	</div>  
			    	<div class="cell colspan1"> 
			       		<h4 align="right">จำนวน&nbsp;</h4> 	  
			    	</div> 
			    	<div class="cell colspan1">
			    		<h4><small class="input-control full-size">
						    <input type="text" id="subjobcode" name="subjobCode"> 
						</small></h4>
			    	</div> 
			    	<div class="cell colspan1"> 
			      		<h4 align="right">ราคา&nbsp;</h4> 	  
			    	</div> 
			    	<div class="cell colspan2">
			    		<h4><small class="input-control full-size">
						    <input type="text" id="subjobcode" name="subjobCode"> 
						</small></h4>
			    	</div> 
			    </div>
			</div> 
			
			<div class="flex-grid">
			  	<div class="row flex-just-center">
			        <div class="cell colspan2"> 
			       		<h4 align="left">คงเหลือ ยกมา&nbsp;</h4> 	  
			    	</div>
			    	<div class="cell colspan3">
			    		<h4><small class="input-control full-size">
						    <input type="text" id="frombalance" name="frombalance" value="455,000.00"> 
						</small></h4>
			    	</div>
			    	
			    	<div class="cell colspan2"> 
			       		<h4 align="left">คงเหลือ ยกไป&nbsp;</h4> 	  
			    	</div>
			    	<div class="cell colspan3">
			    		<h4><small class="input-control full-size">
						    <input type="text" id="tobalance" name="tofrombalance" value="400,000.00"> 
						</small></h4>
			    	</div>
			    </div>
			</div>
			
			<div class="flex-grid">
			  	<div class="row flex-just-center">
			    	<div class="cell colspan12" align="center">
						  <button class="button success" type="submit" name="add">บันทึกการเบิก</button> 
						  <button class="button success" type="submit" name="update">แก้ไขรายการ</button> 
						  <button class="button success" type="submit" name="delete">ลบรายการ</button>
					</div> 
			    </div>
			</div> 
		
		</div> <!-- End of example --> 
	</form>
	<div class="example" data-text="รายการ">
            <table id="table_project" class="dataTable striped border bordered" data-role="datatable" data-searching="true">
                <thead>
                <tr>  
                	<th>เลขที่</th>
                    <th>ชื่อโครงการ</th>
                    <th>ชื่อกิจกรรม</th> 
                    <th>ชื่อกิจกรรมย่อย</th>
                    <th>รายละเอียด</th>
                    <th>จำนวน</th>
                    <th>ราคา</th>
                    <th>ราคารวม</th>
                </tr>
                </thead> 
                  
                <tbody>
                <tr>  
                    <td>1</td>
                    <td>กาซะลอสปา</td>
                    <td>บุคลากร</td>
                    <td>เงินเดือน</td>
                    <td>1 คน x 13,200 บาท x 12</td>
                    <td>3</td>
                    <td>15,000 บาท</td>  
                    <td>45,000 บาท</td> 
                </tr>	 
                </tbody>
            </table>
        </div> <!-- End of example table --> 
    <script type="text/javascript">
		$(function(){
			$("#project_code").select2();
			$("#day").datepicker({
			    format: "dd/mm/yyyy",
		        todayBtn: true,
		        clearBtn: true,
		        autoclose: true,
		        todayHighlight: true
		    });
		});
	</script>
  </body>
</html>
