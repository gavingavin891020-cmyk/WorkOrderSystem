namespace WorkOrder.Api.Models;

public class WorkOrderVM
{
    public int WorkOrderId { get; set; }
    public string WorkOrderNo { get; set; } = "";
    public string ProductCode { get; set; } = "";
    public string ProductName { get; set; } = "";
    public string Unit { get; set; } = "";
    public int PlannedQty { get; set; }
    public int CompletedQty { get; set; }
    public string Status { get; set; } = "";
    public DateTime? PlannedStartDate { get; set; }
    public DateTime? PlannedEndDate { get; set; }
}