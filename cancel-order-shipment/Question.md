# SQL for test
SELECT 'OrderBranch' as Name, Id, OrderNumber, IsActive, StatusCode, CancelCode,CancelRemark,CancelDate, TotalWeight, TotalCBM, TotalQty,TotalUsedSpace, TotalBox FROM [dbo].[D_OrderBranch] where ProviderCode = 'BDCDC' and Id = 6554
SELECT 'OrderProductBranch' as Name, Id,StatusCode, OrderSequence, IsActive, Qty, Weight, CBM, QtyCancel,CancelCode,CancelRemark,CancelDate, Box, UsedSpace FROM [D_OrderProductBranch] WHERE dOrderBranchID = 6554
SELECT 'ShipmentProductBranch' as Name, Id,ShipmentSequence, OrderNumber, OrderSequence, dShipmentBranchID, StatusCode, OrderSequence, IsActive,CancelCode,CancelRemark,CancelDate FROM [D_ShipmentProductBranch] where OrderNumber = 'OBD2404-000340'
SELECT 'ShipmentBranch' as Name,Id, StatusCode, IsActive,CancelCode,CancelRemark,CancelDate, ShipmentNumber FROM D_ShipmentBranch where OrderNumber = 'OBD2404-000340'
SELECT 'ShipmentRequestBranch' as Name, Id, StatusCode, IsActive,CancelCode,CancelRemark,CancelDate,dShipmentBranchID, dShipmentProductBranchID FROM D_ShipmentRequestBranch where dShipmentBranchID in (1635, 1674)

-- Set Default
--update D_OrderBranch set StatusCode = '11000', IsActive = 1, CancelCode = null, CancelRemark = null,CancelDate = null where id = 6554
--update D_OrderProductBranch set StatusCode = '11000', IsActive = 1, CancelCode = null, CancelRemark = null, QtyCancel = null, CancelDate = null where dOrderBranchID = 6554
--update [D_ShipmentProductBranch] set StatusCode = '11000', IsActive = 1, CancelCode = null, CancelRemark = null, CancelDate = null where OrderNumber = 'OBD2404-000340'
--update D_ShipmentRequestBranch set StatusCode = '11000', IsActive = 1, CancelCode = null, CancelRemark = null, CancelDate = null where dShipmentBranchID in (1635, 1674)
--update D_ShipmentBranch set StatusCode = '11000', IsActive = 1, CancelCode = null, CancelRemark = null, CancelDate = null where OrderNumber = 'OBD2404-000340'

-- Set InActive RequestBranch
--update D_ShipmentRequestBranch set StatusCode = '15500', IsActive = 1 where dShipmentBranchID in (1635, 1674)

# Request order for test
```json
{ 
   "referenceType":"ORDER",
   "references":[
      {
         "referenceNumber":"OBD2404-000340",
         "referenceSequence":[
            1,2
         ]
      }
   ],
   "cancelCode":"CC0002",
   "remark":"น้ำท่วมถนนทางเข้าคลังสินค้า"
}
```

# Request request for test
```json
{ 
   "referenceType":"SHIPMENT",
   "references":[
      {
         "referenceNumber":"PBDC2404-0000358",
         "referenceSequence":[
           
         ]
      },
      {
         "referenceNumber":"TPBDC2404-0000358",
         "referenceSequence":[
           
         ]
      }
   ],
   "cancelCode":"CC0002",
   "remark":"น้ำท่วมถนนทางเข้าคลังสินค้า"
}

```

# Question

- Confirm flow
- การ log StatusBranchLog
* ตอน mapping response ของ Order ใช้ order ที่ status 15500 ช่ายไหม

# TODO Task

# Question


## Note
1. ปรับ query order product ให้ check status
2. เพิ่ม detail เกียวกับการหา min status มา set
3. ปรับ logic var_ShipmentProductCancelQTY ให้ match ตัวอื่นๆ

## Flow Improve
- Process Order ต้องปรับ flow ทำงานเฉพาะในกรณีที่ referenceType = "ORDER" เท่านั้น

## Dictionary Variable
- var_orders => 15500, req.orderNumbers
- var_orderProducts => 15500, req.orderNumber req.sequence?
- var_shipmentProducts => 15500, var_orders, var_orderProducts
- var_shipments = var_shipmentProducts
- var_shipmentRequests = 15500, var_shipmentProducts

Process
- var_shipmentProductWithShipment
- var_tripDrops = var_shipments
- var_shipmentWithTripdrop
- var_trips = var_tripDrops
- var_tripDropFromTrip
* var_orderProductGroupKey = var_shipmentProduct.GroupKey
* var_orderProductGroupKeyAndSum
- var_shipmentProductWithOrderProduct
- var_orderProductWithOrder


## Grouping Dictionary

### Order
- var_orders => 15500, req.orderNumbers

### OrderProduct
- var_orderProducts => 15500, req.orderNumber req.sequence?
- var_orderProductWithOrder

### ShipmentProduct
- var_shipmentProducts => 15500, var_orders, var_orderProducts
- var_shipmentProductWithShipment
- var_shipmentProductWithOrderProduct

### Shipment
- var_shipments = var_shipmentProducts
- var_shipmentWithTripdrop

### ShipmentRequest
- var_shipmentRequests = 15500, var_shipmentProducts

### TripDrop
- var_tripDrops = var_shipments
- var_tripDropFromTrip

### Trip
- var_trips = var_tripDrops