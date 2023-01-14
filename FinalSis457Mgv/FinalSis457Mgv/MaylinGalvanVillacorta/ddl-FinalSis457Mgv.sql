CREATE DATABASE FinalSis457Mgv

USE[master]
GO

CREATE LOGIN [usrfinal] WITH PASSWORD = N'12345678',
	DEFAULT_DATABASE = [FinalSis457Mgv],
	CHECK_EXPIRATION = OFF,
	CHECK_POLICY = ON
GO

USE [FinalSis457Mgv]
GO

CREATE USER [usrfinal] FOR LOGIN [usrfinal]
GO

ALTER ROLE [db_owner] ADD MEMBER [usrfinal]
GO

CREATE TABLE Serie (
	id INT Not null primary key identity (1,1),
	titulo varchar(250) not null,
	sinopsis varchar(5000) not null,
	director varchar(100) not null,
	duracion int not null,
);

DROP TABLE Usuario

Create table Usuario (
	id INT not null primary key identity (1,1),
	usuario varchar (12) not null,
	clave varchar (250) not null,
	rol varchar (20) not null,
);

ALTER TABLE Serie ADD fechaEstreno DATE NOT NULL;
ALTER TABLE Serie ADD usuarioRegistro VARCHAR(12) NULL DEFAULT SUSER_SNAME();
ALTER TABLE Serie ADD registroActivo BIT NULL DEFAULT 1;

ALTER TABLE Usuario ADD registroActivo BIT NULL DEFAULT 1;


Select * From Usuario
Select * From Serie

Scaffold-DbContext "Server=(localdb)\MSSQLLocalDB;Database=FinalSis457Mgv;User ID=usrfinal;Password=12345678" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models -F

builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<MinervaContext>(options =>

options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));