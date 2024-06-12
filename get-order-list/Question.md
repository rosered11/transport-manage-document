## Get Order List

## Break Spec
- เอา default planloadDate ออก เนื่องจากใน กรณีไม่ส่งมา แล้ว ส่งมาแต่ orderNumber อาจจะหา order ไม่เจอ
- ใช้ validate กลางสำหรับ params page, pageItem และ sortDirection
- ตัด requestNumber ออกจาก response

### Path parameter
- planLoadDateFrom
- planLoadDateTo
- orderNumber
- originCode
- destinationCode
- driverCode
- truckCode
- tripNumber
- status
- orderType
- buCode
- page
- pageItem
- sortColumn
- sortDirection

### Fields for sorting
•	orderNumber -> Db query
•	tripNumber -> Db query
•	planLoadDate -> Db query
•	originCode -> Db query
•	destinationCode
•	buCode -> Db query
•	tripUsedSpace -> Compute
•	orderType -> Db query
•	statusCode -> Compute

