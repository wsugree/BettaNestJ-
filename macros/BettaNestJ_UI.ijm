// ไฟล์หน้ากาก BettaNestJ v1.1 (เพิ่มระบบสเกลเซนติเมตร)
<line>

<button>
label=1. เปิดภาพ (Open)
arg=<macro>
	run("Open...");
	setTool("line"); 
	showMessage("คำแนะนำ (Tip)", "หากคุณมีไม้บรรทัดหรือสเกลอ้างอิงในภาพ ให้ใช้เมาส์ลากเส้นตรงทับระยะ 1 เซนติเมตร แล้วกดปุ่มที่ 2 ครับ");
</macro>
</button>

<button>
label=2. ตั้งค่าสเกล (Set Scale)
arg=<macro>
	run("Set Scale...");
</button>

<button>
label=3. วิเคราะห์หวอดอัตโนมัติ
arg=<macro>
	setBatchMode(true); 
	run("8-bit");
	setAutoThreshold("Otsu dark");
	run("Convert to Mask");
	run("Watershed");
	run("Set Measurements...", "area shape display redirect=None decimal=3");
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
