USE [master]
GO
/****** Object:  Database [Bd_CRUD]    Script Date: 12/5/2020 13:45:55 ******/
CREATE DATABASE [Bd_CRUD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bd_CRUD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Bd_CRUD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bd_CRUD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Bd_CRUD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Bd_CRUD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bd_CRUD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bd_CRUD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bd_CRUD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bd_CRUD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bd_CRUD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bd_CRUD] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bd_CRUD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bd_CRUD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bd_CRUD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bd_CRUD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bd_CRUD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bd_CRUD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bd_CRUD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bd_CRUD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bd_CRUD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bd_CRUD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bd_CRUD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bd_CRUD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bd_CRUD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bd_CRUD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bd_CRUD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bd_CRUD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bd_CRUD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bd_CRUD] SET RECOVERY FULL 
GO
ALTER DATABASE [Bd_CRUD] SET  MULTI_USER 
GO
ALTER DATABASE [Bd_CRUD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bd_CRUD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bd_CRUD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bd_CRUD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bd_CRUD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bd_CRUD', N'ON'
GO
ALTER DATABASE [Bd_CRUD] SET QUERY_STORE = OFF
GO
USE [Bd_CRUD]
GO
/****** Object:  Table [dbo].[Table_Lectores]    Script Date: 12/5/2020 13:45:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Lectores](
	[lectores_IdLector] [varchar](13) NOT NULL,
	[lectores_Nombre] [varchar](50) NULL,
	[lectorea_Telefono] [int] NULL,
	[lectores_Direccion] [varchar](100) NULL,
	[lectores_Observaciones] [varchar](100) NULL,
 CONSTRAINT [PK_Table_Lectores] PRIMARY KEY CLUSTERED 
(
	[lectores_IdLector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Table_Lectores] ([lectores_IdLector], [lectores_Nombre], [lectorea_Telefono], [lectores_Direccion], [lectores_Observaciones]) VALUES (N'1234567890123', N'Fernando', 123456, N'Lima', N'')
INSERT [dbo].[Table_Lectores] ([lectores_IdLector], [lectores_Nombre], [lectorea_Telefono], [lectores_Direccion], [lectores_Observaciones]) VALUES (N'1234567891234', N'Lopez', 123456789, N'Olmos', N'Se fue de visita')
/****** Object:  StoredProcedure [dbo].[Buscar_Lector]    Script Date: 12/5/2020 13:45:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Buscar_Lector]
@Busqueda varchar(50)
AS
SELECT lectores_IdLector as [N° Identidas],
		lectores_Nombre  as [Nombre],
		lectorea_Telefono as [Telefono],
		lectores_Direccion as [Dirección],
		lectores_Observaciones as [Obervaciones]
FROM Table_Lectores 
WHERE lectores_IdLector + lectores_Nombre LIKE '%' + @Busqueda + '%'
GO
/****** Object:  StoredProcedure [dbo].[Editar_Lector]    Script Date: 12/5/2020 13:45:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Editar_Lector]
@idLector varchar(13),
@Nombre varchar(50),
@Telefono int,
@Direccion varchar(100),
@Observaciones varchar(100)
as

	update Table_Lectores
	set lectores_Nombre = @Nombre,
		lectorea_Telefono = @Telefono, 
		lectores_Direccion = @Direccion,
		lectores_Observaciones = @Observaciones
	where lectores_IdLector = @idLector

GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Lector]    Script Date: 12/5/2020 13:45:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Eliminar_Lector]
@idLector varchar(13)
AS
DELETE FROM Table_Lectores WHERE lectores_IdLector = @idLector 
GO
/****** Object:  StoredProcedure [dbo].[Insertar_Lector]    Script Date: 12/5/2020 13:45:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[Insertar_Lector]
@idLector varchar(13),
@Nombre varchar(50),
@Telefono int,
@Direccion varchar(100),
@Observaciones varchar(100)
as
if exists (select lectores_IdLector from Table_Lectores where lectores_IdLector = @idLector)
	raiserror('El número de identidad que ha ingresado ya está registrado en el sistema', 16, 1)
else 
	insert into Table_Lectores
	values (@idLector, 
			@Nombre, 
			@Telefono, 
			@Direccion, 
			@Observaciones)
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Lector]    Script Date: 12/5/2020 13:45:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Mostrar_Lector]
AS
SELECT lectores_IdLector as [N° Identidad],
		lectores_Nombre  as [Nombre],
		lectorea_Telefono as [Telefono],
		lectores_Direccion as [Dirección],
		lectores_Observaciones as [Obervaciones]
from Table_Lectores 
GO
USE [master]
GO
ALTER DATABASE [Bd_CRUD] SET  READ_WRITE 
GO
