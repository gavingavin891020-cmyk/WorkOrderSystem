USE WorkOrderDb;
GO

CREATE OR ALTER PROCEDURE dbo.usp_WorkOrder_Query
    @Keyword NVARCHAR(100) = N'',
    @Status  NVARCHAR(20)  = N''
AS
BEGIN
    SET NOCOUNT ON;

    SELECT w.WorkOrderId,
           w.WorkOrderNo,
           p.ProductCode,
           p.ProductName,
           p.Unit,
           w.PlannedQty,
           w.CompletedQty,
           w.Status,
           w.PlannedStartDate,
           w.PlannedEndDate
    FROM dbo.WorkOrders AS w
    JOIN dbo.Products   AS p ON p.ProductId = w.ProductId
    WHERE (@Keyword = N''
           OR w.WorkOrderNo LIKE N'%' + @Keyword + N'%'
           OR p.ProductCode LIKE N'%' + @Keyword + N'%'
           OR p.ProductName LIKE N'%' + @Keyword + N'%')
      AND (@Status = N'' OR w.Status = @Status)
    ORDER BY w.WorkOrderNo DESC;
END
GO