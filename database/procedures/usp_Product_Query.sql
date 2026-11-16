USE WorkOrderDb;
GO

CREATE OR ALTER PROCEDURE dbo.usp_Product_Query
    @Keyword  NVARCHAR(100) = N'',
    @IsEnable BIT           = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT ProductId, ProductCode, ProductName, Unit, IsEnable
    FROM dbo.Products
    WHERE (@Keyword = N''
           OR ProductCode LIKE N'%' + @Keyword + N'%'
           OR ProductName LIKE N'%' + @Keyword + N'%')
      AND (@IsEnable IS NULL OR IsEnable = @IsEnable)
    ORDER BY ProductCode;
END
GO