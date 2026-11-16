using System.Data;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using WorkOrder.Api.Models;

namespace WorkOrder.Api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ProductsController : ControllerBase
{
    private readonly IConfiguration _configuration;

    public ProductsController(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    // GET api/products?keyword=外殼&isEnable=true
    [HttpGet]
    public async Task<IActionResult> Query(string? keyword, bool? isEnable)
    {
        var connectionString = _configuration.GetConnectionString("DefaultConnection");
        using var connection = new SqlConnection(connectionString);

        var products = await connection.QueryAsync<ProductVM>(
            "dbo.usp_Product_Query",
            new { Keyword = keyword?.Trim() ?? "", IsEnable = isEnable },
            commandType: CommandType.StoredProcedure);

        return Ok(products);
    }
}