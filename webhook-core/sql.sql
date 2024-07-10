select top(1) 'TMS2SMSLog' as Name,* FROM [dbo].[D_TMS2SMSLog] where ReferenceNo = 'WH202406110009-1'
select top(1) 'TMS2OrderTypeLog' as Name, * FROM [dbo].[D_TMS2OrderTypeLog] where ReferenceNo = 'WH202406110009-1' order by id desc
select 'D_3PLShipment' as Name,[ID]
      ,[CreateDate]
      ,[CreateUser]
      ,[UpdateDate]
      ,[UpdateUser]
      ,[mOrderTypeID]
      ,[BUCode]
      ,[ReferenceNo]
      ,[TrackingNo]
      ,StatusCode
	  ,CarrierTrackingURL
	  ,ReceiverPhoneNumber1
	  ,mOrderTypeID FROM [dbo].[D_3PLShipment]
  where ReferenceNo = 'WH202406110009-1'

select top(1) 'D_3PLShipmentAudit' as Name, [ID]
      ,[CreateDate]
      ,[CreateUser]
      ,[UpdateDate]
      ,[UpdateUser]
      ,[mOrderTypeID]
      ,[BUCode]
      ,[ReferenceNo]
      ,[TrackingNo]
      ,StatusCode
	  ,CarrierTrackingURL
	  ,ReceiverPhoneNumber1
	  ,mOrderTypeID FROM [dbo].D_3PLShipmentAudit
  where ReferenceNo = 'WH202406110009-1'
  order by id desc

  select 'D_3PLStatusLog' as Name, * FROM [dbo].[D_3PLStatusLog] where ReferenceNo = 'WH202406110009-1' order by id desc

  select 'D_TMS2DatalakeLog' as Name, Id, CreateDate, BUCode, ReferenceNo, ResponseCode, ResponseDescription, INTFType FROM [dbo].[D_TMS2DatalakeLog] where ReferenceNo = 'WH202406110009-1' order by id desc 

  --delete D_3plstatuslog where id = 244322