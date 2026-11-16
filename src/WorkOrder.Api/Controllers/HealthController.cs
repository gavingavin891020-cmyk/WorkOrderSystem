using Dapper;
using Microsoft.AspNetCore.Mvc;
using WorkOrder.Api.Data;

namespace WorkOrder.Api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class HealthController : ControllerBase
{
    private readonly IDbConnectionFactory _connectionFactory;

    public HealthController(IDbConnectionFactory connectionFactory)
    {
        _connectionFactory = connectionFactory;
    }

    // GET api/health/db
    [HttpGet("db")]
    public async Task<IActionResult> CheckDb()
    {
        using var connection = _connectionFactory.CreateConnection();
        var dbName = await connection.QuerySingleAsync<string>("SELECT DB_NAME()");
        return Ok(new { database = dbName });
    }
}