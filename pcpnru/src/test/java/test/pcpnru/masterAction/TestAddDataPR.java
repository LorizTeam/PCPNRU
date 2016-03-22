package test.pcpnru.masterAction;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.junit.*;
import org.junit.Assert;

import pcpnru.utilities.DateUtil;
import pcpnru.utilities.Validate;
import test.pcpnru.masterData.TestRecordApproveDB;
import test.pcpnru.masterModel.TestRecordApproveModel;

public class TestAddDataPR {
	
	public JSONObject AddHD() throws Exception{
		String record_approve_hd = "TestHD",record_approve_t = "Test_approvet", record_approve_date = "04-03-2559", record_approve_title = "ขออนุมัติเบิกจ่าย งานจ้างทำ ตู้เมนแบบเคลื่อนที่ ขนาด 100 A. 380V.", record_approve_rian = "อธิการบดี",
		  record_approve_des1 = "ด้วยทางศูนย์วัฒนธรรมพระนครได้รับหนังสือแจ้งจาก บริษัท เวิร์ล พริ้นท์ แอน ดีไซน์ จำกัด ว่าได้เคยรับจ้างงานให้ดำเนินการทำตู้ไฟฟ้าเคลื่อนที่ และส่งมอบงานมาแล้ว แต่ยังไม่ได้รับการเบิกจ่าย จากทางศูนย์วัฒนธรรมพระนคร",
		  record_approve_des2 = "จากการตรวจสอบเอกสารและผลการเนินการพบว่า มีการทำงานดังกล่าวจริงและทำให้ศูนย์มีตู้ไฟฟ้าเคลื่อนที่ไว้บริการแก่ลูกค้าที่มาเช่าพื้นที่ใช้งาน และได้เคยสอบถามกับเจ้าหน้าที่โสตทัศนศึกษา ว่าได้ดำเนินการจริง และยังไม่ได้ทำเรื่องเบิกจ่าย ค่าจ้างเหมาดำเนินการ",
		  record_approve_des3 = "จากการตรวจสอบเอกสารและผลการเนินการพบว่า มีการทำงานดังกล่าวจริงและทำให้ศูนย์มีตู้ไฟฟ้าเคลื่อนที่ไว้บริการแก่ลูกค้าที่มาเช่าพื้นที่ใช้งาน และได้เคยสอบถามกับเจ้าหน้าที่โสตทัศนศึกษา ว่าได้ดำเนินการจริง และยังไม่ได้ทำเรื่องเบิกจ่าย ค่าจ้างเหมาดำเนินการ",
		  record_approve_cen = "รองศาสตราจารย์บุญเกียรติ ไทรชมภู่",
		  record_approve_dep = "รักษาการ ผู้อำนวยการศูนย์วัฒนธรรมพระนคร",
		  docno,
		  year = "2016",create_by = "00001",vendor_id = "0001";
		double total_amount=25045.25;
		TestRecordApproveDB TRAD = new TestRecordApproveDB();
		docno = TRAD.SelectUpdateDocNo("pr");
		record_approve_date = new DateUtil().CnvToYYYYMMDDEngYear(record_approve_date, '-');
		int rowsupdate = TRAD.AddRecordApprovehd(docno, year, record_approve_hd, record_approve_t, record_approve_date, 
				record_approve_title, record_approve_rian, record_approve_des1, record_approve_des2, record_approve_des3, 
				record_approve_cen, record_approve_dep,create_by,vendor_id,total_amount);
		JSONObject obj = new JSONObject();
		obj.put("docno", docno);
		obj.put("year", year);
		obj.put("create_by", create_by);
		obj.put("rowsupdate", rowsupdate);
		obj.put("record_approve_date", record_approve_date);
		return obj;
	}
	
	public JSONObject AddDetail(String docno, String year, String description, String qty, String unit,String create_by) throws Exception{
		TestRecordApproveDB TRAD = new TestRecordApproveDB();
		int rowsupdate =  0;
		for (int i = 1 ; i<=10;i++){
			rowsupdate += TRAD.AddRecordApprovedt(docno, year, description, qty, unit, create_by);
		}
		JSONObject obj = new JSONObject();
		obj.put("rowsupdate", rowsupdate);
		return obj;
	}
	
	public void delete_itemno(String docno,String year,String itemno) throws Exception{
		new TestRecordApproveDB().DeleteRecordApprovedt(docno, year, itemno);
	}
	
	
	@Test
	public void AddHeader_Detail() throws Exception{
		JSONObject jsonobj = new JSONObject();
		jsonobj = AddHD();
		String docno = (String) jsonobj.get("docno");
		String year = (String) jsonobj.get("year");
		String create_by = (String) jsonobj.get("create_by");
		int getbyjson = (Integer) jsonobj.get("rowsupdate");
		Assert.assertTrue(getbyjson>0);
		String description="ปลั๊กเพาเวอร์ 63A. 380V.",qty = "5",unit = "ชุด";
		JSONObject jsonobjdetail = new JSONObject();
		jsonobjdetail = AddDetail(docno,year,description,qty,unit,create_by);
		Assert.assertTrue((Integer) jsonobjdetail.get("rowsupdate") > 0);
	}
	
	@Test
	public void delete_andsortitemno () throws Exception{
		
			JSONObject jsonobj = new JSONObject();
			jsonobj = AddHD();
			String docno = (String) jsonobj.get("docno");
			String year = (String) jsonobj.get("year");
			String create_by = (String) jsonobj.get("create_by");
			int getbyjson = (Integer) jsonobj.get("rowsupdate");
			Assert.assertTrue(getbyjson>0);
			String description="ปลั๊กเพาเวอร์ 63A. 380V.",qty = "5",unit = "ชุด";
			JSONObject jsonobjdetail = new JSONObject();
			jsonobjdetail = AddDetail(docno,year,description,qty,unit,create_by);
			Assert.assertTrue((Integer) jsonobjdetail.get("rowsupdate") > 0);
			String del_itemno[] = {"001","003","005","007","009"}; 
			for(String value_del_itemno:del_itemno){
				delete_itemno(docno, year, value_del_itemno);
			}
			new TestRecordApproveDB().update_itemno(docno, year);
			List<TestRecordApproveModel> detailList = new TestRecordApproveDB().GetListDetail(docno, year);
			int itemno = 1;
			for(TestRecordApproveModel aa : detailList){
				String itemno_Update = String.valueOf(itemno);
				if (itemno_Update.length() == 1) {
					itemno_Update = "00" + itemno_Update; 
				} else if (itemno_Update.length() == 2) {
					itemno_Update = "0" + itemno_Update;   
				}
				Assert.assertEquals(itemno_Update, aa.getItemno());
				itemno++;
			}
	}
	
	@Test
	public void Add_PR_Image() throws IOException, Exception{
		String docno = "00001",year = "2559",img_path ="dwadwadwa.jpg";
		TestRecordApproveDB TRAD = new TestRecordApproveDB();
		TRAD.Add_PurchaseRequest_Image(docno, year, img_path);
		Assert.assertTrue(!TRAD.GET_PurchaseRequest_Image(docno, year,img_path).isEmpty());
		TRAD.Delete_PR_Image(docno, year, img_path);
	}
	
	@Test
	public void Delete_PR_Image() throws IOException, Exception{
		String docno = "00001",year = "2559",img_path ="dwadwadwa.jpg";
		TestRecordApproveDB TRAD = new TestRecordApproveDB();
		TRAD.Add_PurchaseRequest_Image(docno, year, img_path);
		Assert.assertTrue(!TRAD.GET_PurchaseRequest_Image(docno, year,img_path).isEmpty());
		TRAD.Delete_PR_Image(docno, year, img_path);
		Assert.assertTrue(TRAD.GET_PurchaseRequest_Image(docno, year,img_path).isEmpty());
	}
}
