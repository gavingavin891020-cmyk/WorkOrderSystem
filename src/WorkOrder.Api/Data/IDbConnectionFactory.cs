using System.Data;

namespace WorkOrder.Api.Data;

public interface IDbConnectionFactory
{
    IDbConnection CreateConnection();
}