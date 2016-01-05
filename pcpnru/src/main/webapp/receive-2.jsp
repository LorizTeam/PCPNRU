<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>หน้ารับสินค้า</title>
    
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
        <link href="css/metro-responsive.css" rel="stylesheet">
		<link href="css/metro-schemes.css" rel="stylesheet">
		<link href="css/docs.css" rel="stylesheet"> 
	 
		<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
	    <script src="js/docs.js"></script>
	    <script src="js/prettify/run_prettify.js"></script>
	    <script src="js/ga.js"></script> 
 		<script src="js/jquery.dataTables.min.js"></script> 
        <script src="includehtml.js"></script>    

  </head>
  
  <body>
  
  	<% 
  			String projectCode 	= (String) request.getAttribute("projectCode");
  			String dateTime 	= (String) request.getAttribute("dateTime");
  			String costCode 	= (String) request.getAttribute("costCode");
  			String amountFrom 	= (String) request.getAttribute("amountFrom");
  			String local 		= (String) request.getAttribute("local");
  	%>
  
    <div><%@include file="topmenu.jsp" %></div>
	<br>
	<form action="receive2.action" method="post">
	<div class="example" data-text="รายการรับ">
	<div class="grid">
		  	<div class="row cells10"> 
		    	<div class="cell colspan3" > 
		       		 <h4>โครงการ<small class="input-control full-size success"> 
		       		 	<input type="text" value="<%=projectCode%>" readonly="readonly">
					 </small></h4>
		    	</div>   
		    	<div class="cell colspan3">
		    		<h4>ค่าใช้จ่าย<small class="input-control full-size success"> 
					    <input type="text" value="<%=costCode%>" readonly="readonly">
					</small></h4>
		    	</div>  
		    	<div class="cell colspan2">  
		        	<h4>วันที่การรับ<small class="input-control full-size success"> 
                        <input type="text" value="<%=dateTime%>" readonly="readonly"> 
                    </small></h4>
				</div> 
		    	<div class="cell colspan2">  
		        	<h4>เลขที่เอกสาร<small class="input-control full-size success"> 
                        <input type="text" value="<%=dateTime%>" readonly="readonly"> 
                    </small></h4>
				</div> 
			</div> 
	<hr/>
	<div class="grid">
		  	<div class="row cells10">  
		    	<div class="cell colspan3">
		    		<h4>ได้รับเงินจาก<small class="input-control full-size success"> 
					    <input type="text" value="<%=amountFrom%>" readonly="readonly">
					</small></h4>
		    	</div> 
		    	<div class="cell colspan3">
		    		<h4>สถานที่<small class="input-control full-size success"> 
					    <input type="text" value="<%=local%>" readonly="readonly">
					</small></h4>
		    	</div> 
		    </div>
	</div> 
	<hr/>
	<div class="grid">
		  	<div class="row cells10"> 
		    	<div class="cell colspan10">
		    		<h4>รายละเอียด<small class="input-control full-size success"> 
					    <input type="text" id="subjobcode" name="subjobCode"> 
					</small></h4>
		    	</div>
		    </div>
		</div>
	<hr/>
	<div class="grid">
		  	<div class="row cells12">  
		    	<div class="cell colspan3">
		    		<h4>จำนวน<small class="input-control full-size success"> 
					    <input type="text" readonly="readonly">
					</small></h4>
		    	</div> 
		    	<div class="cell colspan3">
		    		<h4>ราคาต่อหน่วย<small class="input-control full-size success"> 
					    <input type="text"  readonly="readonly">
					</small></h4>
		    	</div> 
		    	<div class="cell colspan3">
		    		<h4>ราคารวม<small class="input-control full-size success"> 
					    <input type="text"  readonly="readonly">
					</small></h4>
		    	</div>
		    	<div class="cell colspan3">
		    		<h4>ทอน<small class="input-control full-size success"> 
					    <input type="text"  readonly="readonly">
					</small></h4>
		    	</div>
		    </div>
	</div> 
	<hr/>
	<div class="flex-grid">
		  	<div class="row flex-just-center">
		    	<div class="cell colspan3" align="center">
					  <button class="button success" type="submit" name="add">เพิ่ม</button> 
					  <button class="button primary" type="submit" name="update">แก้ไข</button> 
					  <button class="button danger" type="submit" name="delete">ลบ</button>
					  <button class="button warning" type="submit" name="print"><span class="mif-print mif-lg fg-black"></span></button>
				</div> 
		    </div>
	</div>
	<br/>  
	<hr/>
	</div> <!-- End of example --> 
	</div>
	
	<div class="example" data-text="รายการ">
            <table id="table_project" class="dataTable striped border bordered" data-role="datatable" data-searching="true">
                <thead>
                <tr>  
                	<th>เลขที่</th>
                    <th>รายละเอียด</th>
                    <th>จำนวน</th>
                    <th>ราคา</th>
                    <th>ราคารวม</th>
                </tr>
                </thead> 
                  
                <tbody>
                <tr>  
                    <td>1</td>
                    <td>ผู้ชาย</td>
                    <td>2</td>
                    <td>250 บาท</td>  
                    <td>500 บาท</td> 
                </tr>
                <tr>  
                    <td>2</td>
                    <td>ผู้หญิง</td>
                    <td>3</td>
                    <td>200 บาท</td>  
                    <td>600 บาท</td> 
                </tr>
                <tr>  
                    <td>3</td>
                    <td>เด็ก</td>
                    <td>2</td>
                    <td>150 บาท</td>  
                    <td>300 บาท</td> 
                </tr>	 
                </tbody>
            </table>
        </div> <!-- End of example table --> 
	</form>
  </body>
</html>
