# Question

## order return
1. การต่อ remark จุดต่างๆ เราต่อตรงๆเลยไม่ต้องมีไรคั่นถูกไหม เช่น ส่งไป function กลาง ระหว่าง remark ของ order กับ orderProduct /
2. จังหวะ update ShipmentRequest เอาข้อมูล ShipmentProduct จากไหนมา update /
3. เรามีการ save statusBranchLog 2 ครั้งใช่ไหม
save ใน function กลาง 1 ครั้ง และ save ใน function เรา 1 ครั้ง /
4. เราส่ง height เข้า function save order จาก orderBranch หรือ orderProductBranch
5. เราส่ง remark ของ order เข้า save order function เราใช้ remark ของ product ตัวไหนส่งเข้าไป
6. isNeedAttention ที่เราส่งเข้า save order function โดยเชค remark ว่าเป็นค่าว่างไหม เราเชค remark ของ order หรือ orderProduct แล้วมันจะ relate กับข้อ 5. ในกรณีที่ remark ที่ส่งเข้าไปคือของ orderBranch เราจำเป็นจะต้อง set isNeedAttention ของเดิมด้วยเหรอ เนื่องจากเราไม่มีการเปลี่ยนแปลงค่า remark ของ order
7. ความสัมพัน ระหว่าง requestProduct กับ orderProduct ในการ map ข้อมูลเพื่อส่งเข้า function save order function ไม่ได้ระบุไว้ ในกรณีที่ shipmentProduct มากกว่า 1 ตัว relate กับ orderProduct เราจะ mapping remark ลง orderProduct ยังไง
8. จังหวะ update shipmentProduct 
    - ในส่วนของ field ProductSerial ควรจะเอา field ProductName หรือ ProductSerial ของ orderProduct มา update
    - ในกรณีที่ shipmentProduct มีมากกว่า 1 ตัว ที่ relate กับ orderProduct เราจะนำข้อมูลจาก orderProduct มา update ที่ฝั่ง shipmentProduct ที่มากกว่ายังไง
9. จังหวะ update shipmentRequest 
    - ในส่วนของการคำนวน CBMLoad ตามสูตร ในส่วนของ shipmentProduct ที่อยู่ในสูตร ไม่มี field Qty
    - ในส่วนของการ mapping Product Serial เราเอาค่า Product Serial ของ shipmentProduct มา mapping shipmentRequest ตรงๆ เลยหรือป่าว ไม่ต้องใช้ productName
10. จังหวะ update tripDrop ในส่วนของ field
IsNeedAttention มีการพูดถึง ShipmentUpdateGive ซึ่งไม่แน่ใจว่า ShipmentUpdateGive ได้มาจากไหน

11. Re-confirm update tripDropLast in case ช้อ10
