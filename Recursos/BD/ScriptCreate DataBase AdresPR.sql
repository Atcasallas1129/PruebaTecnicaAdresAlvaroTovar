USE [AdresPR]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateAdquisicion]    Script Date: 12/08/2024 6:29:35 p. m. ******/
DROP PROCEDURE [dbo].[sp_UpdateAdquisicion]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertDocumentacionAdquisicion]    Script Date: 12/08/2024 6:29:35 p. m. ******/
DROP PROCEDURE [dbo].[sp_insertDocumentacionAdquisicion]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertAdquisicion]    Script Date: 12/08/2024 6:29:35 p. m. ******/
DROP PROCEDURE [dbo].[sp_insertAdquisicion]
GO
/****** Object:  StoredProcedure [dbo].[sp_historial_adquisicion]    Script Date: 12/08/2024 6:29:35 p. m. ******/
DROP PROCEDURE [dbo].[sp_historial_adquisicion]
GO
/****** Object:  StoredProcedure [dbo].[sp_consultaHistorialAdquisicion]    Script Date: 12/08/2024 6:29:35 p. m. ******/
DROP PROCEDURE [dbo].[sp_consultaHistorialAdquisicion]
GO
/****** Object:  StoredProcedure [dbo].[sp_consulta_UnidadAdministrativa]    Script Date: 12/08/2024 6:29:35 p. m. ******/
DROP PROCEDURE [dbo].[sp_consulta_UnidadAdministrativa]
GO
/****** Object:  StoredProcedure [dbo].[sp_consulta_TipoServicio]    Script Date: 12/08/2024 6:29:35 p. m. ******/
DROP PROCEDURE [dbo].[sp_consulta_TipoServicio]
GO
/****** Object:  StoredProcedure [dbo].[sp_consulta_Proveedor]    Script Date: 12/08/2024 6:29:35 p. m. ******/
DROP PROCEDURE [dbo].[sp_consulta_Proveedor]
GO
/****** Object:  StoredProcedure [dbo].[sp_consulta_DocumentacionAdquisicion]    Script Date: 12/08/2024 6:29:35 p. m. ******/
DROP PROCEDURE [dbo].[sp_consulta_DocumentacionAdquisicion]
GO
/****** Object:  StoredProcedure [dbo].[sp_consulta_Adquisicion]    Script Date: 12/08/2024 6:29:35 p. m. ******/
DROP PROCEDURE [dbo].[sp_consulta_Adquisicion]
GO
ALTER TABLE [dbo].[HistorialAdquisicion] DROP CONSTRAINT [FK__Historial__Adqui__4D94879B]
GO
ALTER TABLE [dbo].[Documentacion] DROP CONSTRAINT [FK__Documenta__Adqui__4222D4EF]
GO
ALTER TABLE [dbo].[Adquisicion] DROP CONSTRAINT [FK__Adquisici__Unida__3D5E1FD2]
GO
ALTER TABLE [dbo].[Adquisicion] DROP CONSTRAINT [FK__Adquisici__TipoB__3F466844]
GO
ALTER TABLE [dbo].[Adquisicion] DROP CONSTRAINT [FK__Adquisici__Prove__3E52440B]
GO
/****** Object:  Table [dbo].[UnidadAdministrativa]    Script Date: 12/08/2024 6:29:35 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UnidadAdministrativa]') AND type in (N'U'))
DROP TABLE [dbo].[UnidadAdministrativa]
GO
/****** Object:  Table [dbo].[TipoServicio]    Script Date: 12/08/2024 6:29:35 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoServicio]') AND type in (N'U'))
DROP TABLE [dbo].[TipoServicio]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 12/08/2024 6:29:35 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proveedor]') AND type in (N'U'))
DROP TABLE [dbo].[Proveedor]
GO
/****** Object:  Table [dbo].[HistorialAdquisicion]    Script Date: 12/08/2024 6:29:35 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HistorialAdquisicion]') AND type in (N'U'))
DROP TABLE [dbo].[HistorialAdquisicion]
GO
/****** Object:  Table [dbo].[Documentacion]    Script Date: 12/08/2024 6:29:35 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Documentacion]') AND type in (N'U'))
DROP TABLE [dbo].[Documentacion]
GO
/****** Object:  Table [dbo].[Adquisicion]    Script Date: 12/08/2024 6:29:35 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Adquisicion]') AND type in (N'U'))
DROP TABLE [dbo].[Adquisicion]
GO
USE [master]
GO
/****** Object:  Database [AdresPR]    Script Date: 12/08/2024 6:29:35 p. m. ******/
DROP DATABASE [AdresPR]
GO
/****** Object:  Database [AdresPR]    Script Date: 12/08/2024 6:29:35 p. m. ******/
CREATE DATABASE [AdresPR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdresPR', FILENAME = N'D:\source\DataBases\AdresPR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AdresPR_log', FILENAME = N'D:\source\DataBases\AdresPR_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdresPR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdresPR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AdresPR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AdresPR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AdresPR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AdresPR] SET ARITHABORT OFF 
GO
ALTER DATABASE [AdresPR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AdresPR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AdresPR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AdresPR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AdresPR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AdresPR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AdresPR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AdresPR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AdresPR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AdresPR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AdresPR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AdresPR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AdresPR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AdresPR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AdresPR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AdresPR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AdresPR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AdresPR] SET RECOVERY FULL 
GO
ALTER DATABASE [AdresPR] SET  MULTI_USER 
GO
ALTER DATABASE [AdresPR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AdresPR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AdresPR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AdresPR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AdresPR] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AdresPR] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AdresPR', N'ON'
GO
ALTER DATABASE [AdresPR] SET QUERY_STORE = ON
GO
ALTER DATABASE [AdresPR] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AdresPR]
GO
/****** Object:  Table [dbo].[Adquisicion]    Script Date: 12/08/2024 6:29:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adquisicion](
	[AdquisicionId] [int] IDENTITY(1,1) NOT NULL,
	[Presupuesto] [money] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[ValorUnitario] [money] NOT NULL,
	[ValorTotal]  AS ([Cantidad]*[ValorUnitario]) PERSISTED,
	[Activo] [bit] NOT NULL,
	[FechaAdquisicion] [datetime] NOT NULL,
	[UnidadAdministrativaId] [int] NOT NULL,
	[ProveedorId] [int] NOT NULL,
	[TipoBienServicio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdquisicionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documentacion]    Script Date: 12/08/2024 6:29:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documentacion](
	[DocumentacionId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL,
	[Detalles] [nvarchar](max) NOT NULL,
	[AdquisicionId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DocumentacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorialAdquisicion]    Script Date: 12/08/2024 6:29:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialAdquisicion](
	[HistorialAdquisicionId] [int] IDENTITY(1,1) NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[CambioRealizado] [nvarchar](max) NOT NULL,
	[ValorInicial] [nvarchar](max) NULL,
	[ValorActualizado] [nvarchar](max) NULL,
	[AdquisicionId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HistorialAdquisicionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 12/08/2024 6:29:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[ProveedorId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoServicio]    Script Date: 12/08/2024 6:29:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoServicio](
	[TipoServicioId] [int] IDENTITY(1,1) NOT NULL,
	[TipoServicioNombre] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TipoServicioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnidadAdministrativa]    Script Date: 12/08/2024 6:29:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnidadAdministrativa](
	[UnidadAdministrativaId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UnidadAdministrativaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adquisicion] ON 

INSERT [dbo].[Adquisicion] ([AdquisicionId], [Presupuesto], [Cantidad], [ValorUnitario], [Activo], [FechaAdquisicion], [UnidadAdministrativaId], [ProveedorId], [TipoBienServicio]) VALUES (1, 2000000.0000, 22000, 200.0000, 1, CAST(N'2024-08-12T00:00:00.000' AS DateTime), 1, 2, 2)
INSERT [dbo].[Adquisicion] ([AdquisicionId], [Presupuesto], [Cantidad], [ValorUnitario], [Activo], [FechaAdquisicion], [UnidadAdministrativaId], [ProveedorId], [TipoBienServicio]) VALUES (2, 999999.0000, 8888, 98989.0000, 1, CAST(N'2024-08-04T00:00:00.000' AS DateTime), 3, 3, 4)
INSERT [dbo].[Adquisicion] ([AdquisicionId], [Presupuesto], [Cantidad], [ValorUnitario], [Activo], [FechaAdquisicion], [UnidadAdministrativaId], [ProveedorId], [TipoBienServicio]) VALUES (4, 10000.0000, 10000, 1000.0000, 1, CAST(N'2024-08-12T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Adquisicion] ([AdquisicionId], [Presupuesto], [Cantidad], [ValorUnitario], [Activo], [FechaAdquisicion], [UnidadAdministrativaId], [ProveedorId], [TipoBienServicio]) VALUES (5, 10000.0000, 10000, 1000.0000, 1, CAST(N'2024-08-18T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Adquisicion] ([AdquisicionId], [Presupuesto], [Cantidad], [ValorUnitario], [Activo], [FechaAdquisicion], [UnidadAdministrativaId], [ProveedorId], [TipoBienServicio]) VALUES (6, 1000000.0000, 100, 1000.0000, 1, CAST(N'2024-08-12T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Adquisicion] ([AdquisicionId], [Presupuesto], [Cantidad], [ValorUnitario], [Activo], [FechaAdquisicion], [UnidadAdministrativaId], [ProveedorId], [TipoBienServicio]) VALUES (7, 99999.0000, 99, 99.0000, 1, CAST(N'2024-08-12T00:00:00.000' AS DateTime), 1, 1, 3)
INSERT [dbo].[Adquisicion] ([AdquisicionId], [Presupuesto], [Cantidad], [ValorUnitario], [Activo], [FechaAdquisicion], [UnidadAdministrativaId], [ProveedorId], [TipoBienServicio]) VALUES (8, 88888.0000, 88, 999.0000, 1, CAST(N'2024-08-12T00:00:00.000' AS DateTime), 3, 2, 4)
SET IDENTITY_INSERT [dbo].[Adquisicion] OFF
GO
SET IDENTITY_INSERT [dbo].[Documentacion] ON 

INSERT [dbo].[Documentacion] ([DocumentacionId], [Descripcion], [Detalles], [AdquisicionId]) VALUES (1, N'Cotizacion de elementos', N'Cotizacion de los elementos requeridos', 4)
INSERT [dbo].[Documentacion] ([DocumentacionId], [Descripcion], [Detalles], [AdquisicionId]) VALUES (2, N'Cotizacion de elementos', N'Cotizacion de los elementos requeridos', 5)
INSERT [dbo].[Documentacion] ([DocumentacionId], [Descripcion], [Detalles], [AdquisicionId]) VALUES (3, N'estudios previos', N'estudios Previos', 5)
INSERT [dbo].[Documentacion] ([DocumentacionId], [Descripcion], [Detalles], [AdquisicionId]) VALUES (4, N'Cotizacion de servicios', N'Cotizacion de servicios para soportar presupuesto', 6)
INSERT [dbo].[Documentacion] ([DocumentacionId], [Descripcion], [Detalles], [AdquisicionId]) VALUES (5, N'Detalle', N'Descripcion', 7)
INSERT [dbo].[Documentacion] ([DocumentacionId], [Descripcion], [Detalles], [AdquisicionId]) VALUES (6, N'Detalle', N'Desc', 8)
SET IDENTITY_INSERT [dbo].[Documentacion] OFF
GO
SET IDENTITY_INSERT [dbo].[HistorialAdquisicion] ON 

INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (1, CAST(N'2024-08-12T10:52:45.783' AS DateTime), N'Creación Inicial Adquisición', NULL, NULL, 2)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (2, CAST(N'2024-08-12T10:53:15.560' AS DateTime), N'Presupuesto', N'10000000,0000', N'5000000', 1)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (3, CAST(N'2024-08-12T10:53:18.863' AS DateTime), N'Cantidad', N'1000', N'25000', 1)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (4, CAST(N'2024-08-12T10:53:21.430' AS DateTime), N'Valor Unitario', N'50,0000', N'100', 1)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (5, CAST(N'2024-08-12T10:53:23.320' AS DateTime), N'Id Unidad Administrativa', N'1', N'2', 1)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (6, CAST(N'2024-08-12T10:53:26.820' AS DateTime), N'Proveedor Id', N'2', N'1', 1)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (7, CAST(N'2024-08-12T10:53:28.433' AS DateTime), N'Tipo Bien/Servicio', N'3', N'1', 1)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (8, CAST(N'2024-08-12T11:03:44.763' AS DateTime), N'Presupuesto', N'5000000,0000', N'2000000', 1)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (9, CAST(N'2024-08-12T11:03:44.763' AS DateTime), N'Cantidad', N'25000', N'22000', 1)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (10, CAST(N'2024-08-12T11:03:44.763' AS DateTime), N'Valor Unitario', N'100,0000', N'200', 1)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (11, CAST(N'2024-08-12T11:03:44.763' AS DateTime), N'Id Unidad Administrativa', N'2', N'1', 1)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (12, CAST(N'2024-08-12T11:03:44.763' AS DateTime), N'Proveedor Id', N'1', N'2', 1)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (13, CAST(N'2024-08-12T11:03:44.763' AS DateTime), N'Tipo Bien/Servicio', N'1', N'2', 1)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (14, CAST(N'2024-08-12T15:00:43.857' AS DateTime), N'Creación Inicial Adquisición', NULL, NULL, 4)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (15, CAST(N'2024-08-12T15:02:16.690' AS DateTime), N'Creación Inicial Adquisición', NULL, NULL, 5)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (16, CAST(N'2024-08-12T16:58:23.207' AS DateTime), N'Creación Inicial Adquisición', NULL, NULL, 6)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (17, CAST(N'2024-08-12T17:02:41.173' AS DateTime), N'Creación Inicial Adquisición', NULL, NULL, 7)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (18, CAST(N'2024-08-12T17:07:13.803' AS DateTime), N'Creación Inicial Adquisición', NULL, NULL, 8)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (19, CAST(N'2024-08-12T18:19:26.953' AS DateTime), N'Presupuesto', N'5000000,0000', N'999999', 2)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (20, CAST(N'2024-08-12T18:19:26.953' AS DateTime), N'Fecha Adquisicion', N'2024-00-12', N'2024-00-04', 2)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (21, CAST(N'2024-08-12T18:19:26.953' AS DateTime), N'Cantidad', N'25000', N'8888', 2)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (22, CAST(N'2024-08-12T18:19:26.953' AS DateTime), N'Valor Unitario', N'100,0000', N'98989', 2)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (23, CAST(N'2024-08-12T18:19:26.953' AS DateTime), N'Id Unidad Administrativa', N'2', N'3', 2)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (24, CAST(N'2024-08-12T18:19:26.953' AS DateTime), N'Proveedor Id', N'1', N'3', 2)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (25, CAST(N'2024-08-12T18:19:26.953' AS DateTime), N'Tipo Bien/Servicio', N'1', N'4', 2)
INSERT [dbo].[HistorialAdquisicion] ([HistorialAdquisicionId], [FechaModificacion], [CambioRealizado], [ValorInicial], [ValorActualizado], [AdquisicionId]) VALUES (26, CAST(N'2024-08-12T18:20:52.257' AS DateTime), N'Fecha Adquisicion', N'2024-08-12', N'2024-08-18', 5)
SET IDENTITY_INSERT [dbo].[HistorialAdquisicion] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedor] ON 

INSERT [dbo].[Proveedor] ([ProveedorId], [Nombre]) VALUES (1, N'Laboratorios Bayer S.A.')
INSERT [dbo].[Proveedor] ([ProveedorId], [Nombre]) VALUES (2, N'Servicios Médicos S.A.')
INSERT [dbo].[Proveedor] ([ProveedorId], [Nombre]) VALUES (3, N'Tecnologías Medicos S.A.')
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoServicio] ON 

INSERT [dbo].[TipoServicio] ([TipoServicioId], [TipoServicioNombre]) VALUES (1, N'Medicamentos')
INSERT [dbo].[TipoServicio] ([TipoServicioId], [TipoServicioNombre]) VALUES (2, N'Equipos Médicos')
INSERT [dbo].[TipoServicio] ([TipoServicioId], [TipoServicioNombre]) VALUES (3, N'Instrumentos Médicos')
INSERT [dbo].[TipoServicio] ([TipoServicioId], [TipoServicioNombre]) VALUES (4, N'Dotación Personal')
SET IDENTITY_INSERT [dbo].[TipoServicio] OFF
GO
SET IDENTITY_INSERT [dbo].[UnidadAdministrativa] ON 

INSERT [dbo].[UnidadAdministrativa] ([UnidadAdministrativaId], [Nombre]) VALUES (1, N'Dirección de Medicamentos y Tecnologías en Salud')
INSERT [dbo].[UnidadAdministrativa] ([UnidadAdministrativaId], [Nombre]) VALUES (2, N'Dirección de Recursos Humanos')
INSERT [dbo].[UnidadAdministrativa] ([UnidadAdministrativaId], [Nombre]) VALUES (3, N'Dirección de Finanzas')
SET IDENTITY_INSERT [dbo].[UnidadAdministrativa] OFF
GO
ALTER TABLE [dbo].[Adquisicion]  WITH CHECK ADD FOREIGN KEY([ProveedorId])
REFERENCES [dbo].[Proveedor] ([ProveedorId])
GO
ALTER TABLE [dbo].[Adquisicion]  WITH CHECK ADD FOREIGN KEY([TipoBienServicio])
REFERENCES [dbo].[TipoServicio] ([TipoServicioId])
GO
ALTER TABLE [dbo].[Adquisicion]  WITH CHECK ADD FOREIGN KEY([UnidadAdministrativaId])
REFERENCES [dbo].[UnidadAdministrativa] ([UnidadAdministrativaId])
GO
ALTER TABLE [dbo].[Documentacion]  WITH CHECK ADD FOREIGN KEY([AdquisicionId])
REFERENCES [dbo].[Adquisicion] ([AdquisicionId])
GO
ALTER TABLE [dbo].[HistorialAdquisicion]  WITH CHECK ADD FOREIGN KEY([AdquisicionId])
REFERENCES [dbo].[Adquisicion] ([AdquisicionId])
GO
/****** Object:  StoredProcedure [dbo].[sp_consulta_Adquisicion]    Script Date: 12/08/2024 6:29:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_consulta_Adquisicion]
	@idAdquisicion int NULL
as
	select
		Adquisicion.AdquisicionId
		, Adquisicion.Presupuesto
		, Adquisicion.Cantidad
		, Adquisicion.ValorUnitario
		, Adquisicion.ValorTotal
		, Adquisicion.Activo
		, try_cast(Adquisicion.FechaAdquisicion as date) FechaAdquisicion
		, Adquisicion.UnidadAdministrativaId
		, UnidadAdministrativa.Nombre UnidadAdministrativaNombre
		, Adquisicion.ProveedorId
		, Proveedor.Nombre ProveedorNombre
		, Adquisicion.TipoBienServicio
		, TipoServicio.TipoServicioNombre
	from Adquisicion
		inner join UnidadAdministrativa on Adquisicion.UnidadAdministrativaId = UnidadAdministrativa.UnidadAdministrativaId
		inner join Proveedor on Proveedor.ProveedorId =Adquisicion.ProveedorId
		inner join TipoServicio on TipoServicio.TipoServicioId = Adquisicion.TipoBienServicio
		
	where Adquisicion.AdquisicionId = ISNULL(@idAdquisicion, Adquisicion.AdquisicionId)
GO
/****** Object:  StoredProcedure [dbo].[sp_consulta_DocumentacionAdquisicion]    Script Date: 12/08/2024 6:29:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_consulta_DocumentacionAdquisicion]
	@idAdquisicion int
as
	select
		Documentacion.AdquisicionId
		, Documentacion.DocumentacionId
		, Documentacion.Descripcion
		, Documentacion.Detalles
	from Documentacion
	where AdquisicionId = @idAdquisicion
GO
/****** Object:  StoredProcedure [dbo].[sp_consulta_Proveedor]    Script Date: 12/08/2024 6:29:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[sp_consulta_Proveedor] 
as
	select *
	from Proveedor 
GO
/****** Object:  StoredProcedure [dbo].[sp_consulta_TipoServicio]    Script Date: 12/08/2024 6:29:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[sp_consulta_TipoServicio]
as
	select *
	from TipoServicio 
GO
/****** Object:  StoredProcedure [dbo].[sp_consulta_UnidadAdministrativa]    Script Date: 12/08/2024 6:29:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[sp_consulta_UnidadAdministrativa] 
as
	select *
	from UnidadAdministrativa 
GO
/****** Object:  StoredProcedure [dbo].[sp_consultaHistorialAdquisicion]    Script Date: 12/08/2024 6:29:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_consultaHistorialAdquisicion]
	@idAdquisicion int
as
begin
	select *
	from HistorialAdquisicion
	where AdquisicionId = @idAdquisicion
	order by FechaModificacion desc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_historial_adquisicion]    Script Date: 12/08/2024 6:29:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[sp_historial_adquisicion] 
	@fechaModificacion datetime,
	@cambioRealizado nvarchar(max),
	@valorInicial nvarchar(max),
	@valorActualizado nvarchar(max),
	@AdquisicionId int
as
	insert into HistorialAdquisicion
	values (
		@fechaModificacion
		, @cambioRealizado
		, @valorInicial
		, @valorActualizado
		, @AdquisicionId
		)
GO
/****** Object:  StoredProcedure [dbo].[sp_insertAdquisicion]    Script Date: 12/08/2024 6:29:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[sp_insertAdquisicion]
    @Presupuesto Money,
    @Cantidad INT,
    @ValorUnitario Money,
	@FechaAdquisicion datetime,
    @UnidadAdministrativaId INT,
    @ProveedorId INT,
	@TipoBienServicio Int
as
	begin
		INSERT INTO Adquisicion (Presupuesto, Cantidad, ValorUnitario, FechaAdquisicion, Activo, UnidadAdministrativaId, ProveedorId, TipoBienServicio)
		values
		(@Presupuesto, @Cantidad, @ValorUnitario, @FechaAdquisicion, 1, @UnidadAdministrativaId, @ProveedorId, @TipoBienServicio)

		select convert(int, SCOPE_IDENTITY()) AdquisicionId

	end
GO
/****** Object:  StoredProcedure [dbo].[sp_insertDocumentacionAdquisicion]    Script Date: 12/08/2024 6:29:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[sp_insertDocumentacionAdquisicion]
    @Descripcion NVARCHAR(255),
    @Detalles NVARCHAR(MAX),
    @AdquisicionId INT
as
	begin
		INSERT INTO Documentacion (Descripcion, Detalles, AdquisicionId) VALUES
		(@Descripcion, @Detalles, @AdquisicionId)
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateAdquisicion]    Script Date: 12/08/2024 6:29:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[sp_UpdateAdquisicion]
	@AdquisicionId int,
    @Presupuesto Money,
	@fechaAdquisicion datetime,
    @Cantidad INT,
    @ValorUnitario Money,
    @UnidadAdministrativaId INT,
	@Activo bit,
    @ProveedorId INT,
	@TipoBienServicio Int
as
	begin
		Declare @cambioAdquisicion nvarchar(max) = ''

		update Adquisicion set			
			Presupuesto = @Presupuesto
			, Cantidad = @Cantidad
			, ValorUnitario = @ValorUnitario
			, FechaAdquisicion = @fechaAdquisicion
			, Activo = @Activo
			, UnidadAdministrativaId = @UnidadAdministrativaId
			, ProveedorId = @ProveedorId
			, TipoBienServicio = @TipoBienServicio
		where AdquisicionId = @AdquisicionId
	end
GO
USE [master]
GO
ALTER DATABASE [AdresPR] SET  READ_WRITE 
GO
