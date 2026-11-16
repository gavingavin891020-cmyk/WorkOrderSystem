USE WorkOrderDb;
GO

INSERT INTO dbo.Products (ProductCode, ProductName, Unit, IsEnable, CreatedBy)
VALUES
    (N'P-001', N'鋁合金外殼',   N'個', 1, N'seed'),
    (N'P-002', N'不鏽鋼螺絲 M3', N'包', 1, N'seed'),
    (N'P-003', N'電源控制板',   N'片', 1, N'seed'),
    (N'P-004', N'散熱風扇',     N'個', 1, N'seed'),
    (N'P-005', N'舊型外殼',     N'個', 0, N'seed');
GO