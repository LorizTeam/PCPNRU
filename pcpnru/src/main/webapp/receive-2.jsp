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
		<link href="css/metro-schemes.css" rel="stylesheet"> 
	 
		<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script> 
 		<script src="js/jquery.dataTables.min.js"></script>  

  </head>
  
  <script>
        function no_submit(){
            return false;
        }

        function notifyOnErrorInput(input){
            var message = input.data('validateHint');
            $.Notify({
                caption: 'Error',
                content: message,
                type: 'alert'
            });
        }
    </script>
  
  <body>
  
  	<% 		
  			String docNo		= (String) request.getAttribute("docNo");
  			String projectCode 	= (String) request.getAttribute("projectCode");
  			String dateTime 	= (String) request.getAttribute("dateTime");
  			String costCode 	= (String) request.getAttribute("costCode");
  			String amountFrom 	= (String) request.getAttribute("amountFrom");
  			String local 		= (String) request.getAttribute("local");
  	%>
  
    <div><%@include file="topmenu.jsp" %></div>
	<br> 
	<div class="example" data-text="รายการรับ">
	<div class="grid">
	<form action="receive2.action" method="post" data-role="validator" data-show-required-state="false" data-hint-mode="line" data-hint-background="bg-red" data-hint-color="fg-white" data-hide-error="5000">
		  	<div class="row cells10"> 
		    	<div class="cell colspan3" > 
		       		  โครงการ<div class="input-control full-size success"> 
		       		 	<input type="text" value="<%=projectCode%>" readonly="readonly">
					 </div> 
		    	</div>   
		    	<div class="cell colspan3">
		    		 ค่าใช้จ่าย<div class="input-control full-size success"> 
					    <input type="text" value="<%=costCode%>" readonly="readonly">
					</div> 
		    	</div>  
		    	<div class="cell colspan2">  
		        	 วันที่การรับ<div class="input-control full-size success"> 
                        <input type="text" value="<%=dateTime%>" readonly="readonly"> 
                    </div> 
				</div> 
		    	<div class="cell colspan2">  
		        	เลขที่เอกสาร<div class="input-control full-size success"> 
                        <input type="text" value="<%=docNo%>" readonly="readonly"> 
                    </div>
				</div> 
			</div>  
		  	<div class="row cells10">  
		    	<div class="cell colspan3">
		    		ได้รับเงินจาก<div class="input-control full-size success"> 
					    <input type="text" value="<%=amountFrom%>" readonly="readonly">
					</div>
		    	</div> 
		    	<div class="cell colspan3">
		    		สถานที่<div class="input-control full-size success"> 
					    <input type="text" value="<%=local%>" readonly="readonly">
					</div>
		    	</div> 
		    </div>  
		  	<div class="row cells10"> 
		    	<div class="cell colspan10">
		    		รายละเอียด<div class="input-control full-size success"> 
					    <input type="text" id="subjobcode" name="subjobCode"> 
					</div>
		    	</div>
		    </div>  
		  	<div class="row cells12">  
		    	<div class="cell colspan3">
		    		จำนวน<div class="input-control full-size success"> 
					    <input type="text" data-validate-func="required" data-validate-hint="This field can not be empty">
						<span class="input-state-error mif-warning"></span>
                       <span class="input-state-success mif-checkmark"></span>
					</div>
		    	</div> 
		    	<div class="cell colspan3">
		    		ราคาต่อหน่วย<div class="input-control full-size success"> 
					    <input type="text" >
					</div>
		    	</div> 
		    	<div class="cell colspan3">
		    		ราคารวม<div class="input-control full-size success"> 
					    <input type="text" >
					</div>
		    	</div> 
		    </div>  
		    </form>
		    <br>
		    <form action="receive2.action" method="post">
		  	<div class="row flex-just-center">
		    	<div class="cell colspan3" align="center">
					  <button class="button success" type="submit" name="add">เพิ่ม</button> 
					  <button class="button primary" type="submit" name="update">แก้ไข</button> 
					  <button class="button danger" type="submit" name="delete">ลบ</button>
				</div> 
		    </div>
		    <br>
		    <div class="row cells12">  
		    	<div class="cell colspan3">
		    		จำนวนเงินที่ได้รับ<div class="input-control full-size success"> 
					    <input type="text" data-validate-func="required" data-validate-hint="This field can not be empty">
						<span class="input-state-error mif-warning"></span>
                       <span class="input-state-success mif-checkmark"></span>
					</div>
		    	</div> 
		    	<div class="cell colspan3">
		    		ทอน<div class="input-control full-size success"> 
					    <input type="text" >
					</div>
		    	</div>  <br>
		    	<div class="cell colspan3"> 
					  <button class="button warning full-size" type="submit" name="print"><span class="mif-print mif-lg fg-black"></span></button>
				</div>
		    </div>    
		    </form>
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
	
  </body>
</html>
