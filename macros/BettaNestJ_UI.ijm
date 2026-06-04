// ไฟล์หน้ากาก BettaNestJ v1.1 (เพิ่มระบบสเกลเซนติเมตร)
<line>

<button>
label=1. เปิดภาพ (Open)
arg=<macro>
	run("Open...");
	// เปลี่ยนเมาส์ให้เป็นเครื่องมือวาดเส้นตรง (Line Tool) อัตโนมัติ
	setTool("line"); 
	showMessage("คำแนะนำ (Tip)", "หากคุณมีไม้บรรทัดหรือสเกลอ้างอิงในภาพ ให้ใช้เมาส์ลากเส้นตรงทับระยะ 1 เซนติเมตร แล้วกดปุ่มที่ 2 ครับ");
</macro>
</button>

<button>
label=2. ตั้งค่าสเกล (Set Scale)
arg=<macro>
	// เรียกหน้าต่างมาตรฐานของ ImageJ ให้ผู้ใช้กรอกระยะทางจริง
	run("Set Scale...");
</macro>
</button>

<button>
label=3. วิเคราะห์หวอดอัตโนมัติ
arg=<macro>
	setBatchMode(true); 
	
	// อัลกอริทึมมาตรฐาน: เปลี่ยนภาพเป็นขาวดำ และแยกฟองด้วย Otsu
	run("8-bit");
	setAutoThreshold("Otsu dark");
	run("Convert to Mask");
	
	// อัลกอริทึมมาตรฐาน: ใช้ Watershed ตัดฟองที่ติดกัน
	run("Watershed");
	
	// ตั้งค่าวัดผล: พื้นที่ (Area), ความกลมและกระชับ (Shape)
	run("Set Measurements...", "area shape display redirect=None decimal=3");
	
	// หมายเหตุ: ปรับค่า size ขั้นต่ำให้เล็กลง เพื่อรองรับหน่วย cm (เช่น ฟองขนาด 0.01 ตารางเซนติเมตร)
	run("Analyze Particles...", "size=0.01-Infinity display summarize");
	
	setBatchMode(false);
	showMessage("เสร็จสมบูรณ์!", "โปรดดูหน้าต่าง Results.. หากคุณตั้งค่าสเกลแล้ว หน่วยพื้นที่ (Area) จะกลายเป็นหน่วยจริงที่คุณกำหนดครับ");
</macro>
</button>

<button>
label=คู่มือ [ ? ]
arg=<macro>
	htmlText = "<html><body style='font-family:sans-serif; padding:10px;'>"
		+ "<h3 style='color:#2c3e50;'>คู่มือ BettaNestJ v1.1</h3>"
		+ "<b>ลำดับการใช้งาน:</b>"
		+ "<ol>"
		+ "<li>กดเปิดภาพ (เมาส์จะกลายเป็นเส้นตรงอัตโนมัติ)</li>"
		+ "<li>ลากเส้นทับสเกลในภาพ แล้วกดปุ่ม <b>ตั้งค่าสเกล</b> (กรอก Known distance = 1 และ Unit = cm)</li>"
		+ "<li>กดปุ่ม <b>วิเคราะห์หวอด</b> เพื่อสกัดผลลัพธ์</li>"
		+ "</ol>"
		+ "</body></html>";
	Dialog.create("เกี่ยวกับโปรแกรม");
	Dialog.addHelp(htmlText);
	Dialog.show();
</macro>
</button>

</line>
