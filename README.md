# WorkOrderSystem 工單管理系統

個人練習專案，模擬工廠的工單與報工流程，用來練習後端 API 開發與資料庫設計。

> 目前狀態：**開發中**。已完成專案建立與資料表設計，API 功能陸續實作中。

## 技術

- ASP.NET Core Web API（.NET 10）
- SQL Server
- Dapper
- Stored Procedure

## 資料表

| 資料表 | 用途 |
|---|---|
| Users | 使用者帳號（密碼以雜湊值儲存） |
| Products | 產品資料 |
| WorkOrders | 工單 |
| WorkReports | 報工紀錄 |

建表 SQL 放在 `database/tables/`。

## 設計重點

- **報工使用交易（Transaction）**：新增報工紀錄與更新工單完成數量包在同一個交易中，避免只成功一半造成資料不一致；完成數量用原子更新，避免同時報工時數量算錯。
- **編輯工單使用樂觀鎖（Optimistic Lock）**：以 RowVersion 判斷資料在讀取後是否被別人修改過，避免後存檔的人覆蓋前一個人的修改。

## 開發進度

- [x] 建立 Web API 專案
- [x] 設計四張資料表並撰寫建表 SQL
- [x] API 連接資料庫
- [x] 產品查詢 API 與第一支 Stored Procedure
- [ ] 工單新增、查詢、編輯 API
- [ ] 報工 API（交易處理）