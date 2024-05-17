# Question

## Order
- ข้อมูล CarrierSortingNo ได้มาตอนไหน แล้ว example data เป็นยังไง สำหรับใช้ mapping เข้า StopId
- ค่า phone ที่ใช้ส่งไปหา lalamove ต้องส่งไป 2 ค่าถูกไหม (confirm?)
- fields อื่นๆ ที่ไม้มีการระบุการ mapping สามารถตัด key ที่จะส่งออกไปได้เลยไหม?

## Quotation (Clear)
1. Logic ในการ get C_3plAccess ไม่มีใน spec > outbound
2. scheduleAt ใน body ของ Quatation meaning? เนื่องจากถ้า set เป็นเวลาปัจจุบัน ตอน commit เข้าระบบมันจะมองเป็นเวลาย้อนหลัง ตัดออก
3. ข้อมูล Address ของ quatation ที่ concat string ต้องมี space ไหม => ขั้น black_space
4. ข้อมูล stops ต้องมีตั้งแต่ 2 ตัวขึ้นไป => sender
5. field specialRequests ต้อง mapping value ไหม => ตัดออก
ุ6. field weight ต้อง mapping ยังไง => รอ confirm lalamove
7. fields categories, handlingInstructions => ตัดออก