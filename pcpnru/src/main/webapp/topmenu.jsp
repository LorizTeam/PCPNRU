<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<div class="app-bar green" data-role="appbar">	
		 <a href="index.jsp" style="width: 20%;margin-top: 0;padding-top: 0" class="app-bar-element branding"><img  src="images/pnru.png" /></a>
		<ul class="app-bar-menu  small-dropdown">
        <li><a href="index.jsp">หน้าหลัก</a></li>
        <li>
            <a href="" class="dropdown-toggle">โครงการ</a>
            <ul class="d-menu " data-role="dropdown">
            	<li><a href="projecthd.jsp">ร่างรายละเอียด  โครงการ</a></li>
                <li><a href="projectmaster.jsp">สร้าง ชื่อโครงการ</a></li>   
                <li><a href="subjobmaster.jsp">สร้าง  กิจกรรม</a></li>
                <li><a href="childsubjobmaster.jsp">สร้าง  กิจกรรมย่อย</a></li>
                <li><a href="costcodemaster.jsp">สร้าง รายการค่าใช้จ่ายในแต่ละกิจกรรม</a></li>
            </ul>
        </li>
        <li>
			<a href="" class="dropdown-toggle">รายรับ-รายจ่าย</a>
            <ul class="d-menu" data-role="dropdown">
                <li class="divider"></li>
                <li><a href="" class="dropdown-toggle">รายรับ</a>
                    <ul class="d-menu" data-role="dropdown">
                        <li><a href="receive-1.jsp">ทำรายการรับ</a></li>
                        <li><a href="select_receive-1.jsp">รายละเอียดการรับ</a></li> 
                    </ul>
                </li>
                <li class="divider"></li>
                <li><a href="" class="dropdown-toggle">รายจ่าย</a>
                    <ul class="d-menu" data-role="dropdown">
                        <li><a href="requisition-1.jsp">ทำรายการจ่าย</a></li>
                        <li><a href="select_requisition-1.jsp">รายละเอียดการจ่าย</a></li> 
                    </ul>
                </li> 
            </ul>
        </li>  
        <li>
			<a href="" class="dropdown-toggle">รายงาน</a>
            <ul class="d-menu" data-role="dropdown">
                <li class="divider"></li>
                <li><a href="" class="dropdown-toggle">รายงานการรับ</a>
                    <ul class="d-menu" data-role="dropdown"> 
                        <li><a href="reportreceive.jsp">รายงาน ประจำวัน, เดือน, ไตรมาส, ปี</a></li> 
                    </ul>
                </li>
                <li class="divider"></li>
                <li><a href="" class="dropdown-toggle">รายงานการจ่าย</a>
                    <ul class="d-menu" data-role="dropdown"> 
                        <li><a href="reportreceive.jsp">รายงาน ประจำวัน, เดือน, ไตรมาส, ปี</a></li> 
                    </ul>
                </li> 
            </ul>
        </li>
        <li><a href="employee.jsp">ข้อมูลบุคลากร</a></li> 
    </ul>
     
    <div class="app-bar-element place-right"> 
        <a class="dropdown-toggle fg-white"> Name user</a>
        <form class="app-bar-drop-container bg-white fg-dark place-right padding10"
                data-role="dropdown" data-no-close="true">
             <a href="profile.jsp" class="button fullsize primary"><span class="mif-user"></span>Profile</a>
             <a class="button  danger"><span class="mif-enter"></span>Logout</a> 
        </form>
    </div> 
    
</div>