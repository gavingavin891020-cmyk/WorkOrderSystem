using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace WorkOrder.Api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class HealthController : ControllerBase
{
    private readonly IConfiguration _configuration;

    public HealthController(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    // GET api/health/db
    [HttpGet("db")]
    public async Task<IActionResult> CheckDb()
    {
        var connectionString = _configuration.GetConnectionString("DefaultConnection");
        using var connection = new SqlConnection(connectionString);
        var dbName = await connection.QuerySingleAsync<string>("SELECT DB_NAME()");
        return Ok(new { database = dbName });
    }
}