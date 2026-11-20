USE WorkOrderDb;
GO

INSERT INTO dbo.WorkOrders
    (WorkOrderNo, ProductId, PlannedQty, CompletedQty, Status, PlannedStartDate, PlannedEndDate, CreatedBy)
SELECT v.WorkOrderNo, p.ProductId, v.PlannedQty, v.CompletedQty, v.Status, v.StartDate, v.EndDate, N'seed'
FROM (VALUES
    (N'WO-20261102-001', N'P-001', 500, 500, N'已完工', '2026-11-02', '2026-11-06'),
    (N'WO-20261109-001', N'P-001', 300, 120, N'生產中', '2026-11-09', '2026-11-20'),
    (N'WO-20261109-002', N'P-002', 1000, 400, N'生產中', '2026-11-09', '2026-11-18'),
    (N'WO-20261116-001', N'P-003', 200,   0, N'待排程', '2026-11-23', '2026-11-27'),
    (N'WO-20261116-002', N'P-003', 150,   0, N'待排程', NULL,         NULL),
    (N'WO-20261117-001', N'P-005', 80,   80, N'已完工', '2026-11-17', '2026-11-19')
) AS v (WorkOrderNo, ProductCode, PlannedQty, CompletedQty, Status, StartDate, EndDate)
JOIN dbo.Products AS p ON p.ProductCode = v.ProductCode;
GO