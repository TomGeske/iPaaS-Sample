using Microsoft.AspNetCore.OData;
using Microsoft.EntityFrameworkCore;
using Sample.iPaaS.OData.Model;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();

builder.Services.AddControllers().AddOData(options => options.Select().Filter().OrderBy());
builder.Services.AddDbContext<RetailDbContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("RetailDbContext")));

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
//if (app.Environment.IsDevelopment())
//{
    app.UseSwagger();
    app.UseSwaggerUI();
//}

using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;

    var context = services.GetRequiredService<RetailDbContext>();
    context.Database.CanConnect();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();