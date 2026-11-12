USE WorkOrderDb;
GO

CREATE TABLE Users
(
    UserId          INT IDENTITY(1,1) PRIMARY KEY,
    Account         NVARCHAR(50)  NOT NULL UNIQUE,
    PasswordHash    NVARCHAR(200) NOT NULL,
    UserName        NVARCHAR(50)  NOT NULL,
    Role            NVARCHAR(20)  NOT NULL,
    IsEnable        BIT           NOT NULL DEFAULT 1,
    CreatedBy       NVARCHAR(100) NULL,
    CreatedAt       DATETIME2     NOT NULL DEFAULT SYSDATETIME(),
    LastModifiedBy  NVARCHAR(100) NULL,
    LastModifiedAt  DATETIME2     NULL
);
GO

CREATE TABLE Products
(
    ProductId       INT IDENTITY(1,1) PRIMARY KEY,
    ProductCode     NVARCHAR(30)  NOT NULL UNIQUE,
    ProductName     NVARCHAR(100) NOT NULL,
    Unit            NVARCHAR(10)  NOT NULL,
    IsEnable        BIT           NOT NULL DEFAULT 1,
    CreatedBy       NVARCHAR(100) NULL,
    CreatedAt       DATETIME2     NOT NULL DEFAULT SYSDATETIME(),
    LastModifiedBy  NVARCHAR(100) NULL,
    LastModifiedAt  DATETIME2     NULL
);
GO

CREATE TABLE WorkOrders
(
    WorkOrderId       INT IDENTITY(1,1) PRIMARY KEY,
    WorkOrderNo       NVARCHAR(30)  NOT NULL UNIQUE,
    ProductId         INT           NOT NULL FOREIGN KEY REFERENCES Products(ProductId),
    PlannedQty        INT           NOT NULL,
    CompletedQty      INT           NOT NULL DEFAULT 0,
    Status            NVARCHAR(20)  NOT NULL DEFAULT N'待排程',
    PlannedStartDate  DATE          NULL,
    PlannedEndDate    DATE          NULL,
    CreatedBy         NVARCHAR(100) NULL,
    CreatedAt         DATETIME2     NOT NULL DEFAULT SYSDATETIME(),
    LastModifiedBy    NVARCHAR(100) NULL,
    LastModifiedAt    DATETIME2     NULL,
    RowVersion        ROWVERSION
);
GO

CREATE TABLE WorkReports
(
    WorkReportId  INT IDENTITY(1,1) PRIMARY KEY,
    WorkOrderId   INT           NOT NULL FOREIGN KEY REFERENCES WorkOrders(WorkOrderId),
    ReportQty     INT           NOT NULL,
    ReportedBy    NVARCHAR(100) NOT NULL,
    ReportedAt    DATETIME2     NOT NULL DEFAULT SYSDATETIME()
);
GO