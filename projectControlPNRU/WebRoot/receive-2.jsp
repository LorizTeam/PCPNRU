<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
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
    <div><%@include file="topmenu.jsp" %></div>
	<br>
	<div class="example" data-text="รายการรับ">
	<div class="flex-grid">
		  	<div class="row flex-just-center">
		        <div class="cell colspan2 "> 
		       	<h4 class="align-right">โครงการ&nbsp;</h4>
		    	</div>
		    	<div class="cell colspan5" > 
		       		 <h4><small class="input-control full-size"> 
		       		 <select onchange="" disabled>
					        <option>521800002 - แหล่งเรียนรู้และวิจัย กาซะลองสปา</option>
					   </select>
					   </small></h4>
		    	</div>
		    	<div class="cell colspan2 align-right"><h4>วันที่การรับ&nbsp;</h4></div>
		    	<div class="cell colspan2">  
		        		<h4><small>
					    <div class="input-control text full-size ">
                            <input type="text" value="11-01-2559" disabled>
                            <button class="button"><span class="mif-calendar"></span></button>
                        </div>
                        </small></h4>
				</div>
	</div> 
	<hr/>
	<div class="flex-grid">
		  	<div class="row flex-just-center">
		        <div class="cell colspan2"> 
		       		<h4 class="align-right">ค่าใช้จ่าย&nbsp;</h4> 	  
		    	</div> 
		    	<div class="cell colspan9">
		    		<h4><small class="input-control full-size"> 
					    <select onchange="" disabled> 
					        <option>521800003 - บริการนวดอโรมา</option> 
					   </select> 
					</small></h4>
		    	</div>   
		    </div>
		</div>
	<hr/>
	<div class="flex-grid">
		  	<div class="row flex-just-center">
		        <div class="cell colspan2"> 
		       		<h4 class="align-right">ได้รับเงินจาก&nbsp;</h4> 	  
		    	</div> 
		    	<div class="cell colspan5">
		    		<h4><small class="input-control full-size"> 
					    <input type="text" disabled id="subjobcode" name="subjobCode" value="คุณ พานุวัฒน์"> 
					</small></h4>
		    	</div>  
		    	<div class="cell colspan2"> 
		       		<h4 class="align-right">สถานที่&nbsp;</h4> 	  
		    	</div> 
		    	<div class="cell colspan2">
		    		<h4><small class="input-control full-size"> 
					    <input type="text" disabled id="subjobcode" name="subjobCode" value="สมาร์ทไอซีที"> 
					</small></h4>
		    	</div>  
		    </div>
		</div>
	<hr/>
	<div class="flex-grid">
		  	<div class="row flex-just-center">
		        <div class="cell colspan2"> 
		       		<h4 class="align-right">รายละเอียด&nbsp;</h4> 	  
		    	</div> 
		    	<div class="cell colspan4">
		    		<h4><small class="input-control full-size"> 
					    <input type="text" id="subjobcode" name="subjobCode"> 
					</small></h4>
		    	</div>  
		    	<div class="cell colspan1"> 
		       		<h4 class="align-right">จำนวน&nbsp;</h4> 	  
		    	</div>
		    	<div class="cell colspan1">
		    		<h4><small class="input-control full-size"> 
					    <input type="text" id="subjobcode" name="subjobCode"> 
					</small></h4>
		    	</div> 
		    	<div class="cell colspan2"> 
		       		<h4 class="align-right">ราคาต่อหน่วย&nbsp;</h4> 	  
		    	</div> 
		    	<div class="cell colspan1">
		    		<h4><small class="input-control full-size"> 
					    <input type="text" id="subjobcode" name="subjobCode"> 
					</small></h4>
		    	</div>  
		    </div>
		</div>
	<hr/>
	<div class="flex-grid">
		  	<div class="row flex-just-center">
		    	<div class="cell colspan3" align="center">
					  <button class="button success" type="submit" name="add">เพิ่ม</button> 
					  <button class="button success" type="submit" name="update">แก้ไข</button> 
					  <button class="button success" type="submit" name="delete">ลบ</button>
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
	
  </body>
</html>
