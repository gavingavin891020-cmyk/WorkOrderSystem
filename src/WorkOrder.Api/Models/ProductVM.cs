namespace WorkOrder.Api.Models;

public class ProductVM
{
    public int ProductId { get; set; }
    public string ProductCode { get; set; } = "";
    public string ProductName { get; set; } = "";
    public string Unit { get; set; } = "";
    public bool IsEnable { get; set; }
}