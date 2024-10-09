### Install Entity Framework Core and Configuration Packages

To add the necessary packages for Entity Framework Core and configuration, use the following commands:

```bash
# Add Entity Framework Core
dotnet add package Microsoft.EntityFrameworkCore --version 8.0.5

# Add SQL Server provider for Entity Framework Core
dotnet add package Microsoft.EntityFrameworkCore.SqlServer --version 8.0.5

# Add Entity Framework Core Tools for migrations and scaffolding
dotnet add package Microsoft.EntityFrameworkCore.Tools --version 8.0.5

# Add Microsoft Extensions Configuration for dependency injection
dotnet add package Microsoft.Extensions.Configuration --version 8.0.0

# Add support for JSON-based configuration files
dotnet add package Microsoft.Extensions.Configuration.Json --version 8.0.0

// Method to fetch connection string from appsettings.json
public static string GetConnectionString(string connectionStringName)
{
    var config = new ConfigurationBuilder()
        .SetBasePath(AppDomain.CurrentDomain.BaseDirectory)
        .AddJsonFile("appsettings.json")
        .Build();

    string connectionString = config.GetConnectionString(connectionStringName);
    return connectionString;
}

// DbContext configuration to use SQL Server
protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    => optionsBuilder.UseSqlServer(GetConnectionString("DefaultConnection"));
