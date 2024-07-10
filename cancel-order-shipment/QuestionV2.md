# Question

1. จังหวะนำ shipment กลับไป update order ในส่วนของการ mapping sum Pallet Plan โดยขึ้นอยู่กับ productName สามารถใช้ productCode แทนได้ไหม ถ้าไม่ได้ สามารถ group productName มาใช้แทนได้ไหม
2. จังหวะลง log OrderNumber มีใน shipment Number?

# SQL for test
SELECT 'OrderBranch' as Name, Id, OrderType, OrderNumber, IsActive, StatusCode, CancelCode,CancelRemark,CancelDate, TotalWeight, TotalCBM, TotalQty,TotalUsedSpace, TotalBox, TotalOverhang FROM [dbo].[D_OrderBranch] where ProviderCode = 'BDCDC' and Id = 6554
SELECT 'OrderProductBranch' as Name, Id,StatusCode, OrderSequence,ProductName, ProductCode, IsActive, Qty, Overhang, OverhangCancel, OverhangPlan, Weight, CBM, QtyCancel,CancelCode,CancelRemark,CancelDate, Box, UsedSpace FROM [D_OrderProductBranch] WHERE dOrderBranchID = 6554
SELECT 'ShipmentProductBranch' as Name, Id,ShipmentSequence, ProductCode, OrderNumber, OrderSequence, dShipmentBranchID, StatusCode, OrderSequence, IsActive, OverhangPlan,CancelCode,CancelRemark,CancelDate FROM [D_ShipmentProductBranch] where OrderNumber = 'OBD2404-000340'
SELECT 'ShipmentBranch' as Name,Id, OrderType, StatusCode, IsActive,CancelCode,CancelRemark,CancelDate, ShipmentNumber FROM D_ShipmentBranch where OrderNumber = 'OBD2404-000340'
SELECT 'ShipmentRequestBranch' as Name, Id, StatusCode, IsActive,CancelCode,CancelRemark,CancelDate,dShipmentBranchID, dShipmentProductBranchID FROM D_ShipmentRequestBranch where dShipmentBranchID in (1635, 1674)

-- Old OrderType = MHD
--update D_OrderBranch set OrderType = 'RETURN', StatusCode = '15510', TotalOverhang = null, IsActive = 1, CancelCode = null, CancelRemark = null where ProviderCode = 'BDCDC' and Id = 6554
--update D_OrderProductBranch set StatusCode = '15510', IsActive = 1,OverhangCancel = null, CancelCode = null, CancelRemark = null WHERE dOrderBranchID = 6554
--update D_ShipmentProductBranch set StatusCode = '15510', IsActive = 1, CancelCode = null, CancelRemark = null where OrderNumber = 'OBD2404-000340'
--update D_ShipmentBranch set OrderType = 'RETURN', StatusCode = '15510', IsActive = 1, CancelCode = null, CancelRemark = null where OrderNumber = 'OBD2404-000340'
--update D_ShipmentRequestBranch set StatusCode = '15510', IsActive = 1, CancelCode = null, CancelRemark = null where dShipmentBranchID in (1635, 1674)

-- For test
--update D_ShipmentRequestBranch Set IsActive = 0 where dShipmentBranchID in (1635, 1674)
--update D_ShipmentProductBranch Set StatusCode = '15500' where id = 2130
--update D_ShipmentBranch Set StatusCode = '15510' where id = 1635
--update D_OrderProductBranch set StatusCode = '15510' where id = 7677
--update D_OrderBranch set StatusCode = '15510' where id = 6554
--update D_OrderProductBranch Set ProductCode = 'P0000001' where id = 7727