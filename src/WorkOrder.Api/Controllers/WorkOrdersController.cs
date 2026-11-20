using System.Data;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using WorkOrder.Api.Data;
using WorkOrder.Api.Models;

namespace WorkOrder.Api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class WorkOrdersController : ControllerBase
{
    private readonly IDbConnectionFactory _connectionFactory;

    public WorkOrdersController(IDbConnectionFactory connectionFactory)
    {
        _connectionFactory = connectionFactory;
    }

    // GET api/workorders?keyword=外殼&status=生產中
    [HttpGet]
    public async Task<IActionResult> Query(string? keyword, string? status)
    {
        using var connection = _connectionFactory.CreateConnection();

        var workOrders = await connection.QueryAsync<WorkOrderVM>(
            "dbo.usp_WorkOrder_Query",
            new { Keyword = keyword?.Trim() ?? "", Status = status?.Trim() ?? "" },
            commandType: CommandType.StoredProcedure);

        return Ok(workOrders);
    }
}