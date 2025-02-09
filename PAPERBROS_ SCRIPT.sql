USE [master]
GO
/****** Object:  Database [PAPERBROS]    Script Date: 07/06/2023 10:25:28 p. m. ******/
CREATE DATABASE [PAPERBROS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PAPERBROS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PAPERBROS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PAPERBROS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PAPERBROS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PAPERBROS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PAPERBROS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PAPERBROS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PAPERBROS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PAPERBROS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PAPERBROS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PAPERBROS] SET ARITHABORT OFF 
GO
ALTER DATABASE [PAPERBROS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PAPERBROS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PAPERBROS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PAPERBROS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PAPERBROS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PAPERBROS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PAPERBROS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PAPERBROS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PAPERBROS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PAPERBROS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PAPERBROS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PAPERBROS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PAPERBROS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PAPERBROS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PAPERBROS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PAPERBROS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PAPERBROS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PAPERBROS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PAPERBROS] SET  MULTI_USER 
GO
ALTER DATABASE [PAPERBROS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PAPERBROS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PAPERBROS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PAPERBROS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PAPERBROS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PAPERBROS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PAPERBROS] SET QUERY_STORE = ON
GO
ALTER DATABASE [PAPERBROS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PAPERBROS]
GO
/****** Object:  Table [dbo].[BITACORA]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BITACORA](
	[Id_Bitacora] [int] IDENTITY(0,1) NOT NULL,
	[Responsable] [int] NULL,
	[Accion] [varchar](100) NULL,
	[Tabla] [varchar](50) NULL,
	[Fecha] [date] NULL,
	[Id_LOGUEO_FK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Bitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_CargarBitacora]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_CargarBitacora] AS
SELECT*FROM BITACORA
GO
/****** Object:  Table [dbo].[ADMINISTRADOR]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMINISTRADOR](
	[Id_ADMINISTRADOR] [int] IDENTITY(0,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[ApPaterno] [varchar](50) NULL,
	[ApMaterno] [varchar](50) NULL,
	[RFC] [varchar](15) NULL,
	[Id_TIPOS_ADMIN_FK] [int] NULL,
	[Imagen] [varchar](max) NULL,
	[Contratado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_ADMINISTRADOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOGINS]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOGINS](
	[Id_LOGUEO] [int] IDENTITY(0,1) NOT NULL,
	[NombreLog] [varchar](50) NULL,
	[Contrasena] [varchar](50) NULL,
	[Id_ADMINISTRADOR_FK] [int] NULL,
	[QR] [varchar](max) NULL,
	[QR_INFO] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_LOGUEO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_BitacoraNombre]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_BitacoraNombre] AS
SELECT Id_Bitacora,Responsable,Accion,Tabla,Fecha,Id_LOGUEO_FK FROM BITACORA INNER JOIN LOGINS ON LOGINS.Id_LOGUEO=BITACORA.Id_LOGUEO_FK
INNER JOIN ADMINISTRADOR ON LOGINS.Id_ADMINISTRADOR_FK=ADMINISTRADOR.Id_ADMINISTRADOR
WHERE ADMINISTRADOR.Nombre='Pablo'
GO
/****** Object:  Table [dbo].[DESCUENTO]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DESCUENTO](
	[ID_Descuento] [int] NOT NULL,
	[Precio_descuento] [money] NULL,
	[Id_Usuario_FK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Descuento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE](
	[Id_Detalle] [int] NOT NULL,
	[Total] [money] NULL,
	[Cantidad] [int] NULL,
	[Id_Producto_FK] [int] NULL,
	[Id_Factura_FK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACTURA]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACTURA](
	[Id_Factura] [int] NOT NULL,
	[Fecha] [date] NULL,
	[Total] [money] NULL,
	[Id_Usuario_FK] [int] NULL,
	[Id_ADMNISTRADOR_FK] [int] NULL,
	[Id_Descuento_FK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[Id_Producto] [int] NOT NULL,
	[Nombre] [varchar](70) NULL,
	[Disponibilidad] [int] NULL,
	[Precio] [money] NULL,
	[Lim_Stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPOS_ADMIN]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPOS_ADMIN](
	[Id_TIPOS_ADMIN] [int] NOT NULL,
	[Tipo] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_TIPOS_ADMIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[Id_Usuario] [int] NOT NULL,
	[ApPaterno] [varchar](35) NULL,
	[ApMaterno] [varchar](35) NULL,
	[Nombre] [varchar](35) NULL,
	[TipoUsuario] [int] NULL,
	[RFC] [varchar](35) NULL,
	[Puntos] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO_COPIA]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO_COPIA](
	[Id_Usuario] [int] NOT NULL,
	[ApPaterno] [varchar](35) NULL,
	[ApMaterno] [varchar](35) NULL,
	[Nombre] [varchar](35) NULL,
	[TipoUsuario] [int] NULL,
	[RFC] [varchar](35) NULL,
	[Puntos] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ADMINISTRADOR] ON 

INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (0, N'JUAN MANUEL', N'GUERECA', N'TIJERINA', N'JMGT123', 1, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1, N'KEVIN', N'NUÑEZ', N'CHAVEZ', N'KENC123', 2, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (2, N'PABLO', N'CERVANTES', N'ARREOLA', N'PACA123', 3, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (3, N'Christopher', N'Castañeda', N'Hernandez', N'CHCH123', 1, N'\CHCH123.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1003, N'Sergio Rene', N'Ramos', N'Villagrana', N'SRRV123', 3, N'\SRRV123.jpg', 0)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1004, N'dsad', N'asas', N'2313', N'prueba', 2, N'\prueba.jpg', 0)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1005, N'fdsf', N'ghg', N'weqew', N'erwre', 1, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1006, N'Cajero', N'Cajero', N'Cajero', N'Cajero', 3, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1007, N'Gerente', N'Gerente', N'Gerente', N'Gerente', 2, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1008, N'prueba', N'prueba', N'prueba', N'qrprueba', 3, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1009, N'32', N'132', N'32', N'qrprueba2', 3, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1010, N'3', N'321', N'21', N'qrprueba3', 2, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1011, N'323', N'2123', N'343', N'qr4', 2, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1012, N'32', N'21', N'43', N'qr5', 2, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1013, N'dsad', N'asd', N'asd', N'qr6', 3, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1014, N'323', N'2132', N'43', N'qr7', 3, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1015, N'23', N'3213', N'324', N'qr8', 3, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1016, N'213', N'3123', N'3123', N'qr9', 3, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1017, N'42', N'213', N'321', N'qr10', 3, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1018, N'432', N'13312', N'434', N'qr11', 3, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1019, N'321', N'321', N'qwe', N'qr12', 3, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1020, N'324', N'23', N'432', N'qr13', 3, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1021, N'c', N'a', N'b', N'pruebafoto', 1, N'\pruebafoto.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1022, N'c', N'a', N'v', N'fotoprueba', 1, N'\fotoprueba.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1023, N'Paola', N'Martínez', N'Leija', N'MALEPA', 1, N'\MALEPA.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1024, N'Pablo', N'Cervantes', N'Arreola', N'CEARPA', 3, N'\CEARPA.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1025, N'Kevin Yahir', N'Nuñez', N'Chavez', N'NUCHKE', 2, N'\NUCHKE.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1026, N'Sergio Rene', N'Ramos', N'Villagrana', N'RAVISE', 2, N'\RAVISE.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1027, N'Christopher', N'Hernandez', N'Castañeda', N'HECACH', 1, N'\HECACH.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1028, N'Juan Manuel', N'Guereca', N'Tijerina', N'GUTIJU', 1, N'\GUTIJU.jpg', 0)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1029, N'a', N'a', N'a', N'aaaa', 3, N'\aaaa.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1030, N'', N'', N'', N'a', 3, N'\a.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1031, N'a', N'a', N'a', N'ads', 3, N'\Default.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1032, N'ileana ', N'hurtado', N'flores', N'pruebax', 3, N'\pruebax.jpg', 0)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1033, N'lostres', N'lostres', N'lostres', N'chochoman', 3, N'\chochoman.jpg', 0)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1034, N'Gustavo Alberto', N'Mayorga', N'Zarate', N'MAGUAL', 2, N'\MAGUAL.jpg', 0)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1035, N'jesus', N'olivare', N'banda', N'oli', 3, N'\oli.jpg', 1)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1036, N'ELrober', N'ELrober', N'ELrober', N'rober', 3, N'\rober.jpg', 0)
INSERT [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR], [Nombre], [ApPaterno], [ApMaterno], [RFC], [Id_TIPOS_ADMIN_FK], [Imagen], [Contratado]) VALUES (1037, N'alexis', N'garcia', N'baltazar', N'gabaal', 3, N'\gabaal.jpg', 1)
SET IDENTITY_INSERT [dbo].[ADMINISTRADOR] OFF
GO
SET IDENTITY_INSERT [dbo].[BITACORA] ON 

INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (0, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-20' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-20' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-20' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (3, 2, N'REGISTRO CLIENTE', N'USUARIO', CAST(N'2022-11-20' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (4, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-20' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (5, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-20' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (6, 1, N'LOGUEO', N'LOGIN', CAST(N'2022-11-20' AS Date), 1)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (7, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-20' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (8, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-20' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (9, 2, N'REGISTRO CLIENTE', N'USUARIO', CAST(N'2022-11-20' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (10, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-20' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (11, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-20' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (12, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-20' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (13, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-20' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (14, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-20' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (15, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-21' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (16, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-21' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (17, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-21' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (18, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-21' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (19, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-21' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (20, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-21' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (21, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-21' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (22, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-21' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (23, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-21' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (24, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-21' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (25, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-21' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (26, 1, N'LOGUEO', N'LOGIN', CAST(N'2022-11-21' AS Date), 1)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (27, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-23' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (28, 0, N'REGISTRO CLIENTE', N'USUARIO', CAST(N'2022-11-23' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (29, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-23' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (30, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-23' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (31, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-23' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (32, 2, N'REGISTRO CLIENTE', N'USUARIO', CAST(N'2022-11-23' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (33, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-23' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (34, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-23' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (35, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-23' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (36, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-23' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (37, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-23' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (38, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-23' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (39, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-23' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (40, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-23' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (41, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-23' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (42, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-23' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (43, 1, N'LOGUEO', N'LOGIN', CAST(N'2022-11-23' AS Date), 1)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (44, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-23' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (45, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-23' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (46, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-24' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (47, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-24' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (48, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-24' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (49, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-24' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (50, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-24' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (51, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-24' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (52, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (53, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (54, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (55, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (56, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (57, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (58, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (59, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (60, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (61, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (62, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (63, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1063, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1064, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1065, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1066, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1067, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1068, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1069, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1070, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1071, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1072, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1073, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1074, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1075, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1076, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1077, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1078, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1079, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1080, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1081, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-25' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1082, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1083, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1084, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1085, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1086, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1087, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1088, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1089, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1090, 1, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 1)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1091, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1092, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1093, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (1094, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2064, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2065, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2066, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 3)
GO
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2067, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2068, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2069, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2070, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2071, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2072, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-26' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2073, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2074, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2075, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2076, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2077, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2078, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2079, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2080, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2081, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2082, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2083, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2084, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2085, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2086, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2087, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2088, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2089, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2090, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2091, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2092, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2093, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2094, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2095, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2096, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2097, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2098, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2099, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2100, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2101, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2102, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2103, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2104, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2105, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2106, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2107, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2108, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2109, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2110, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2111, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2112, 1, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 1)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2113, 1, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 1)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2114, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2115, 1, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 1)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2116, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2120, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2121, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2122, 1, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 1)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2123, 1, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 1)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2124, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2125, 1, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 1)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2126, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2127, 0, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2128, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2129, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2130, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2131, 2, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2132, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2133, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2134, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2135, 3, N'LOGUEO', N'LOGIN', CAST(N'2022-11-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2136, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-07' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2137, 0, N'LOGUEO', N'LOGIN', CAST(N'2023-03-07' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2138, 0, N'LOGUEO', N'LOGIN', CAST(N'2023-03-07' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2139, 0, N'LOGUEO', N'LOGIN', CAST(N'2023-03-07' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2140, 0, N'LOGUEO', N'LOGIN', CAST(N'2023-03-07' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2141, 1003, N'LOGUEO', N'LOGIN', CAST(N'2023-03-07' AS Date), 1003)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2142, 1003, N'LOGUEO', N'LOGIN', CAST(N'2023-03-07' AS Date), 1003)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2143, 1003, N'LOGUEO', N'LOGIN', CAST(N'2023-03-07' AS Date), 1003)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2144, 1003, N'LOGUEO', N'LOGIN', CAST(N'2023-03-07' AS Date), 1003)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2145, 1003, N'LOGUEO', N'LOGIN', CAST(N'2023-03-07' AS Date), 1003)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2146, 1003, N'LOGUEO', N'LOGIN', CAST(N'2023-03-07' AS Date), 1003)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2147, 1003, N'LOGUEO', N'LOGIN', CAST(N'2023-03-07' AS Date), 1003)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2148, 0, N'LOGUEO', N'LOGIN', CAST(N'2023-03-07' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2149, 1003, N'LOGUEO', N'LOGIN', CAST(N'2023-03-07' AS Date), 1003)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2150, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-14' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2151, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-14' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2152, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-14' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2153, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-03-14' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2154, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-16' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2155, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2156, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2157, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2158, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2159, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2160, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2161, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2162, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2163, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2164, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2165, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2166, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2167, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2168, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2169, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-27' AS Date), 3)
GO
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2170, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-03-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2171, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-03' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2172, 0, N'LOGUEO', N'LOGIN', CAST(N'2023-05-03' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2173, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-03' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2174, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-03' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2175, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-03' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2176, 3, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-03' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2177, 3, N'REGISTRO PRODUCTO', N'PRODUCTO', CAST(N'2023-05-03' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2178, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-06' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2179, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-06' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2180, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-16' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2181, 3, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-16' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2182, 2, N'LOGUEO', N'LOGIN', CAST(N'2023-05-16' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2183, 2, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-16' AS Date), 2)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2184, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-16' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2185, 1004, N'LOGUEO', N'LOGIN', CAST(N'2023-05-16' AS Date), 1004)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2186, 1004, N'REGISTRO PRODUCTO', N'PRODUCTO', CAST(N'2023-05-16' AS Date), 1004)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2187, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-16' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2188, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2189, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2190, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2191, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2192, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2193, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2194, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2195, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2196, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2197, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2198, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2199, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2200, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2201, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2202, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2203, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2204, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2205, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2206, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2207, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2208, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2209, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2210, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2211, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2212, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2213, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2214, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2215, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2216, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2217, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2218, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2219, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2220, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2221, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2222, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2223, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2224, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2225, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2226, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2227, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2228, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2229, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2230, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2231, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2232, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2233, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2234, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2235, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2236, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2237, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2238, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2239, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2240, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2241, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2242, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2243, 3, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2244, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2245, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2246, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2247, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2248, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2249, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2250, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2251, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2252, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2253, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2254, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2255, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2256, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2257, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2258, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2259, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2260, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2261, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2262, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2263, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2264, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2265, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2266, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-19' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2267, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2268, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2269, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
GO
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2270, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2271, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2272, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2273, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2274, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2275, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2276, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2277, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2278, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2279, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2280, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2281, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2282, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2283, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2284, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2285, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2286, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2287, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2288, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2289, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2290, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2291, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2292, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2293, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2294, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2295, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2296, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2297, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2298, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2299, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2300, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2301, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2302, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2303, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2304, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2305, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2306, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2307, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2308, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2309, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2310, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2311, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2312, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2313, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2314, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2315, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2316, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2317, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2318, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2319, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2320, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2321, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2322, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2323, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2324, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2325, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2326, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2327, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2328, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2329, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2330, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2331, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2332, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2333, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2334, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2335, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2336, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2337, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2338, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2339, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2340, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2341, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2342, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2343, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2344, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2345, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2346, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2347, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2348, 0, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 0)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2349, 1, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 1)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2350, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-20' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2351, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-21' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2352, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-23' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2353, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2354, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2355, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2356, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2357, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2358, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2359, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2360, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2361, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2362, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2363, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2364, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2365, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2366, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2367, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2368, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-25' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2369, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-27' AS Date), 3)
GO
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2370, 3, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2371, 3, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-27' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2372, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-27' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2373, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-05-27' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2374, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-05-27' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2375, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-27' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2376, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-05-27' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2377, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-05-27' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2378, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-05-27' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2379, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-05-27' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2380, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-05-27' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2381, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-05-27' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2382, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-05-27' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2383, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-27' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2384, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-27' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2385, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-05-27' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2386, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-27' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2387, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-27' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2388, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-05-27' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2389, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-05-27' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2390, 1007, N'LOGUEO', N'LOGIN', CAST(N'2023-05-27' AS Date), 1007)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2391, 1007, N'LOGUEO', N'LOGIN', CAST(N'2023-05-27' AS Date), 1007)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2392, 1007, N'LOGUEO', N'LOGIN', CAST(N'2023-05-27' AS Date), 1007)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2393, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-29' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2394, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2395, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2396, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2397, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2398, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2399, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2400, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2401, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2402, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2403, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2404, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2405, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2406, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2407, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2408, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2409, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2410, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2411, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2412, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2413, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2414, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2415, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2416, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2417, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2418, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2419, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2420, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2421, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2422, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2423, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-30' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2424, 1020, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1020)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2425, 1020, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1020)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2426, 1020, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1020)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2427, 1020, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1020)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2428, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2429, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2430, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2431, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2432, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2433, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2434, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2435, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2436, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2437, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2438, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2439, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2440, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2441, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2442, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2443, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2444, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2445, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2446, 1007, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1007)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2447, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2448, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2449, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2450, 1020, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1020)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2451, 1020, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1020)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2452, 1020, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1020)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2453, 1020, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1020)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2454, 1020, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1020)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2455, 1020, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1020)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2456, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2457, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2458, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-05-31' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2459, 1023, N'LOGUEO', N'LOGIN', CAST(N'2023-05-31' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2460, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2461, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2462, 1023, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2463, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2464, 1023, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2465, 1023, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2466, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2467, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2468, 1023, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2469, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
GO
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2470, 1023, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2471, 1023, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2472, 1023, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2473, 1023, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2474, 1022, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1022)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2475, 1023, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2476, 1023, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2477, 1023, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2478, 1023, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2479, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2480, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2481, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2482, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2483, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2484, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2485, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2486, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2487, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2488, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2489, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2490, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2491, 1027, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1027)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2492, 1027, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-06-01' AS Date), 1027)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2493, 1024, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1024)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2494, 1027, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1027)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2495, 1027, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-06-01' AS Date), 1027)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2496, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2497, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2498, 1005, N'SE AGREGO UN NUEVO CLIENTE', N'USUARIO', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2499, 1005, N'REGISTRO CLIENTE', N'USUARIO', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2500, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2501, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2502, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2503, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2504, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2505, 1005, N'SE AGREGO UN NUEVO CLIENTE', N'USUARIO', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2506, 1005, N'REGISTRO CLIENTE', N'USUARIO', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2507, 1005, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-06-01' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2508, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2509, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2510, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2511, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2512, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2513, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2514, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2515, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2516, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2517, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2518, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2519, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2520, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2521, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2522, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2523, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2524, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2525, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2526, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2527, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2528, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2529, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2530, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2531, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2532, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2533, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2534, 1024, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1024)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2535, 1024, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-05' AS Date), 1024)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2536, 1024, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1024)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2537, 1024, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-05' AS Date), 1024)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2538, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2539, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2540, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2541, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2542, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2543, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2544, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2545, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2546, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2547, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2548, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2549, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2550, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2551, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2552, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2553, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2554, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2555, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2556, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2557, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2558, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2559, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2560, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2561, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2562, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2563, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2564, 1007, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1007)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2565, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2566, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2567, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2568, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2569, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
GO
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2570, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2571, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2572, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2573, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2574, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2575, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2576, 1007, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1007)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2577, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2578, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2579, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-05' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2580, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2581, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2582, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2583, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2584, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2585, 1007, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1007)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2586, 1007, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1007)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2587, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2588, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2589, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2590, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2591, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2592, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2593, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2594, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2595, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2596, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2597, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2598, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2599, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2600, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2601, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2602, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2603, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2604, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2605, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2606, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2607, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2608, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2609, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2610, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2611, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2612, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2613, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2614, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2615, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2616, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2617, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2618, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2619, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2620, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2621, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2622, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2623, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2624, 1007, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1007)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2625, 1007, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1007)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2626, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2627, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2628, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2629, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2630, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2631, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2632, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2633, 1007, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1007)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2634, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2635, 1005, N'SE AGREGO UN NUEVO CLIENTE', N'USUARIO', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2636, 1005, N'REGISTRO CLIENTE', N'USUARIO', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2637, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2638, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2639, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2640, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2641, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2642, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2643, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2644, 1027, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1027)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2645, 1024, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1024)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2646, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2647, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2648, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2649, 1027, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1027)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2650, 1023, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2651, 1027, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1027)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2652, 1025, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1025)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2653, 1025, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-06-06' AS Date), 1025)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2654, 1032, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1032)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2655, 1032, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-06' AS Date), 1032)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2656, 1027, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1027)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2657, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2658, 1023, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2659, 1023, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-06-06' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2660, 1033, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1033)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2661, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2662, 1023, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2663, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2664, 1027, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1027)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2665, 1027, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-06-06' AS Date), 1027)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2666, 1034, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1034)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2667, 1006, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2668, 1006, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-06' AS Date), 1006)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2669, 1007, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1007)
GO
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2670, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2671, 3, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 3)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2672, 1023, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2673, 1023, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-06-06' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2674, 1035, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1035)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2675, 1035, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-06' AS Date), 1035)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2676, 1023, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2677, 1023, N'REGISTRO PRODUCTO', N'PRODUCTO', CAST(N'2023-06-06' AS Date), 1023)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2678, 1027, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1027)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2679, 1024, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1024)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2680, 1024, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-06' AS Date), 1024)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2681, 1027, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1027)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2682, 1027, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-06-06' AS Date), 1027)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2683, 1036, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1036)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2684, 1036, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-06' AS Date), 1036)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2685, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2686, 1027, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1027)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2687, 1027, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1027)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2688, 1027, N'SE AGREGO UN NUEVO ADMINISTRADOR', N'ADMINISTRADOR', CAST(N'2023-06-06' AS Date), 1027)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2689, 1037, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1037)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2690, 1037, N'COBRO DE PRODUCTOS', N'FACTURA', CAST(N'2023-06-06' AS Date), 1037)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2691, 1007, N'LOGUEO', N'LOGIN', CAST(N'2023-06-06' AS Date), 1007)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2692, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-07' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2693, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-07' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2694, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-07' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2695, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-07' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2696, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-07' AS Date), 1005)
INSERT [dbo].[BITACORA] ([Id_Bitacora], [Responsable], [Accion], [Tabla], [Fecha], [Id_LOGUEO_FK]) VALUES (2697, 1005, N'LOGUEO', N'LOGIN', CAST(N'2023-06-07' AS Date), 1005)
SET IDENTITY_INSERT [dbo].[BITACORA] OFF
GO
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (0, 0.0000, -1)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (1, 100.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (2, 20.0000, 4)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (3, 30.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (4, 10.0000, 4)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (5, 10.0000, 4)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (6, 10.0000, 4)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (7, 5.0000, 4)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (8, 3.0000, 3)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (9, 3.0000, 3)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (10, 10.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (11, 6.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (12, 67.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (13, 3.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (14, 3.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (15, 8.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (16, 8.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (17, 2.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (18, 5.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (19, 2.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (20, 2.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (21, 10.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (22, 2.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (23, 2.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (24, 3.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (25, 2.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (26, 4.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (27, 5.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (28, 5.0000, 6)
INSERT [dbo].[DESCUENTO] ([ID_Descuento], [Precio_descuento], [Id_Usuario_FK]) VALUES (29, 5.0000, 6)
GO
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (1, 70.0000, 14, 7, 1)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (2, 10.0000, 10, 5, 1)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (3, 20.0000, 4, 2, 2)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (4, 5.0000, 1, 7, 3)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (5, 90.0000, 6, 1, 3)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (6, 5.0000, 3, 2, 6)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (7, 5.0000, 3, 2, 7)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (8, 5.0000, 3, 2, 8)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (9, 10.0000, 3, 2, 9)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (10, 20.0000, 4, 7, 10)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (11, 20.0000, 4, 7, 11)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (12, 3.0000, 1, 3, 12)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (13, 12.0000, 4, 4, 13)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (15, NULL, NULL, NULL, 6)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (17, NULL, NULL, NULL, 6)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (18, 20.0000, 4, 7, 12)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (19, 20.0000, 4, 7, 12)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (20, 20.0000, 4, 7, 12)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (21, 20.0000, 4, 7, 12)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (22, 10.0000, 2, 2, 14)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (23, 10.0000, 2, 2, 14)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (24, 20.0000, 4, 1, 15)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (25, 20.0000, 4, 2, 15)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (26, 1.0000, 1, 5, 15)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (27, 20.0000, 6, 3, 16)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (28, 240.0000, 16, 1, 16)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (29, 3.0000, 3, 5, 16)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (30, 10.0000, 2, 2, 16)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (31, 6.0000, 2, 3, 17)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (32, 24.0000, 8, 3, 17)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (33, 60.0000, 12, 2, 17)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (34, 63.0000, 21, 3, 18)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (35, 3.0000, 1, 3, 18)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (36, 18.0000, 6, 3, 19)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (37, 90.0000, 3, 6, 19)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (38, 90.0000, 6, 1, 19)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (39, 12.0000, 4, 3, 20)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (40, 75.0000, 5, 1, 20)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (41, 10.0000, 2, 2, 20)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (42, 3.0000, 1, 3, 21)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (43, 6.0000, 2, 3, 21)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (44, 45.0000, 3, 1, 21)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (45, 45.0000, 3, 1, 22)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (46, 6.0000, 2, 4, 22)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (47, 6.0000, 2, 4, 23)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (48, 6.0000, 2, 3, 23)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (49, 45.0000, 3, 1, 24)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (50, 2.0000, 2, 5, 24)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (51, 60.0000, 4, 1, 25)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (52, 20.0000, 4, 2, 25)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (53, 15.0000, 3, 2, 26)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (54, 30.0000, 2, 1, 26)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (55, 3.0000, 1, 3, 26)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (56, 30.0000, 2, 1, 27)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (57, 3.0000, 1, 3, 27)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (58, 20.0000, 4, 2, 27)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (59, 30.0000, 2, 1, 28)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (60, 6.0000, 2, 3, 28)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (61, 12.0000, 4, 4, 28)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (62, 30.0000, 2, 1, 29)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (63, 3.0000, 1, 3, 29)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (64, 6.0000, 2, 3, 29)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (65, 30.0000, 2, 1, 30)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (66, 30.0000, 2, 1, 30)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (67, 10.0000, 2, 2, 30)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (68, 30.0000, 2, 1, 31)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (69, 30.0000, 2, 1, 32)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (70, 5.0000, 1, 2, 32)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (71, 30.0000, 2, 1, 33)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (72, 96.0000, 32, 12, 34)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (73, 15.0000, 3, 2, 35)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (74, 7.0000, 7, 8, 36)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (75, 231.0000, 11, 14, 37)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (76, 0.0000, 0, 14, 38)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (77, 42.0000, 2, 14, 39)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (78, 42.0000, 2, 14, 40)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (79, 3.0000, 3, 10, 41)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (80, 2.0000, 2, 8, 42)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (81, 6.0000, 2, 9, 42)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (82, 10.0000, 10, 10, 43)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (83, 10.0000, 1, 17, 43)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (84, 3.0000, 3, 8, 44)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (85, 5.0000, 5, 8, 45)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (86, 4.0000, 4, 8, 46)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (87, 10.0000, 2, 7, 47)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (88, 2.0000, 2, 8, 47)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (89, 6.0000, 2, 9, 47)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (90, 2.0000, 2, 8, 47)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (91, 2.0000, 2, 10, 48)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (92, 22.0000, 22, 10, 48)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (93, 2.0000, 2, 10, 49)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (94, 2.0000, 2, 10, 49)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (95, 2.0000, 2, 10, 49)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (96, 2.0000, 2, 10, 50)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (97, 2.0000, 2, 10, 50)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (98, 3.0000, 3, 10, 50)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (99, 10.0000, 2, 7, 51)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (100, 2.0000, 2, 10, 51)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (101, 3.0000, 3, 10, 52)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (102, 60.0000, 2, 6, 52)
GO
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (103, 90.0000, 3, 6, 52)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (104, 10.0000, 2, 7, 52)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (105, 2.0000, 2, 10, 53)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (106, 60.0000, 2, 6, 53)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (107, 2.0000, 2, 10, 54)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (108, 2.0000, 2, 10, 54)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (109, 2.0000, 2, 10, 54)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (110, 2.0000, 2, 10, 54)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (111, 10.0000, 2, 7, 55)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (112, 2.0000, 2, 10, 56)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (113, 10.0000, 2, 7, 57)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (114, 8.0000, 2, 11, 58)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (115, 5.0000, 5, 10, 58)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (116, 3.0000, 3, 8, 58)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (117, 8.0000, 2, 11, 59)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (118, 2.0000, 2, 10, 59)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (119, 12.0000, 3, 11, 59)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (120, 2.0000, 2, 10, 60)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (121, 3.0000, 3, 8, 60)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (122, 4.0000, 2, 5, 61)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (123, 9.0000, 3, 12, 61)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (124, 2.0000, 2, 10, 62)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (125, 12.0000, 3, 11, 62)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (126, 2.0000, 2, 8, 62)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (127, 2.0000, 2, 10, 63)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (128, 1.0000, 1, 8, 63)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (129, 6.0000, 2, 12, 63)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (130, 6.0000, 2, 12, 63)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (131, 8.0000, 2, 11, 64)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (132, 1.0000, 1, 10, 64)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (133, 8.0000, 2, 11, 64)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (134, 2.0000, 2, 10, 65)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (135, 4.0000, 1, 11, 65)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (136, 20.0000, 2, 17, 66)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (137, 10.0000, 1, 17, 67)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (138, 2.0000, 2, 10, 68)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (139, 2.0000, 2, 10, 69)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (140, 2.0000, 2, 10, 70)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (141, 6.0000, 2, 12, 71)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (142, 5.0000, 1, 7, 72)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (143, 4.0000, 2, 5, 73)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (144, 4.0000, 1, 11, 74)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (145, 5.0000, 1, 2, 75)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (146, 2.0000, 2, 10, 76)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (147, 6.0000, 2, 12, 76)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (148, 2.0000, 2, 8, 76)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (149, 2.0000, 2, 10, 77)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (150, 30.0000, 2, 1, 78)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (151, 45.0000, 3, 1, 78)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (152, 3.0000, 1, 3, 78)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (153, 10.0000, 2, 7, 78)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (154, 10.0000, 2, 2, 79)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (155, 10.0000, 2, 7, 79)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (156, 20.0000, 20, 10, 80)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (157, 15.0000, 5, 12, 80)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (158, 4.0000, 2, 5, 81)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (159, 10.0000, 2, 7, 82)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (160, 61.0000, 61, 10, 83)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (161, 2.0000, 2, 10, 83)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (162, 2.0000, 2, 10, 84)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (163, 2.0000, 2, 10, 85)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (164, 2.0000, 2, 10, 86)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (165, 5.0000, 1, 7, 86)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (166, 8.0000, 2, 11, 86)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (167, 12.0000, 4, 12, 87)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (168, 5.0000, 5, 8, 87)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (169, 15.0000, 3, 7, 88)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (170, 6.0000, 2, 9, 88)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (171, 16.0000, 4, 11, 88)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (172, 40.0000, 4, 17, 89)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (173, 10.0000, 10, 10, 90)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (174, 9.0000, 3, 3, 90)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (175, 16.0000, 4, 11, 91)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (176, 2.0000, 2, 10, 91)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (177, 800.0000, 80, 17, 92)
INSERT [dbo].[DETALLE] ([Id_Detalle], [Total], [Cantidad], [Id_Producto_FK], [Id_Factura_FK]) VALUES (178, 10.0000, 2, 7, 92)
GO
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (1, CAST(N'2022-10-14' AS Date), NULL, 6, NULL, NULL)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (2, CAST(N'2021-11-01' AS Date), NULL, 1, NULL, NULL)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (3, CAST(N'2022-05-21' AS Date), NULL, 3, NULL, NULL)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (6, CAST(N'2022-11-21' AS Date), NULL, 4, 2, NULL)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (7, CAST(N'2022-11-21' AS Date), 5.0000, 4, 2, NULL)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (8, CAST(N'2022-11-21' AS Date), NULL, 4, 2, NULL)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (9, CAST(N'2022-11-21' AS Date), 4.0000, 4, 2, 9)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (10, CAST(N'2022-11-23' AS Date), 20.0000, -1, 0, NULL)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (11, CAST(N'2022-11-23' AS Date), 20.0000, -1, 0, NULL)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (12, CAST(N'2022-11-23' AS Date), 83.0000, 6, 1, NULL)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (13, CAST(N'2022-11-23' AS Date), 2.0000, 6, 2, 10)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (14, CAST(N'2022-11-24' AS Date), 20.0000, 1, 2, NULL)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (15, CAST(N'2022-11-25' AS Date), 41.0000, -1, 2, NULL)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (16, CAST(N'2022-11-25' AS Date), 273.0000, -1, 2, NULL)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (17, CAST(N'2022-11-25' AS Date), 90.0000, -1, 2, NULL)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (18, CAST(N'2022-11-25' AS Date), 66.0000, -1, 2, NULL)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (19, CAST(N'2022-11-25' AS Date), 198.0000, -1, 2, NULL)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (20, CAST(N'2022-11-25' AS Date), 2.0000, 6, 2, 16)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (21, CAST(N'2022-11-25' AS Date), 54.0000, 6, 2, NULL)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (22, CAST(N'2022-11-25' AS Date), 49.0000, 6, 2, 17)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (23, CAST(N'2022-11-25' AS Date), 12.0000, -1, 2, NULL)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (24, CAST(N'2022-11-25' AS Date), 47.0000, 6, 2, NULL)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (25, CAST(N'2022-11-25' AS Date), 80.0000, 6, 2, 18)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (26, CAST(N'2022-11-25' AS Date), 48.0000, 6, 2, NULL)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (27, CAST(N'2022-11-25' AS Date), 53.0000, 6, 2, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (28, CAST(N'2022-11-25' AS Date), 48.0000, 6, 2, 19)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (29, CAST(N'2022-11-25' AS Date), 37.0000, 6, 0, 20)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (30, CAST(N'2022-11-25' AS Date), 70.0000, 6, 2, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (31, CAST(N'2022-11-25' AS Date), 30.0000, -1, 0, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (32, CAST(N'2022-11-25' AS Date), 35.0000, -1, 2, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (33, CAST(N'2022-11-25' AS Date), 30.0000, -1, 0, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (34, CAST(N'2022-11-26' AS Date), 96.0000, -1, 0, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (35, CAST(N'2022-11-26' AS Date), 15.0000, -1, 2, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (36, CAST(N'2022-11-26' AS Date), 7.0000, 6, 2, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (37, CAST(N'2022-11-27' AS Date), 231.0000, 6, 2, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (38, CAST(N'2022-11-27' AS Date), 0.0000, 6, 2, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (39, CAST(N'2022-11-27' AS Date), 42.0000, 6, 2, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (40, CAST(N'2022-11-27' AS Date), 42.0000, 6, 2, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (41, CAST(N'2023-03-14' AS Date), 3.0000, -1, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (42, CAST(N'2023-05-03' AS Date), 8.0000, -1, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (43, CAST(N'2023-05-16' AS Date), 10.0000, 6, 2, 21)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (44, CAST(N'2023-05-19' AS Date), 3.0000, -1, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (45, CAST(N'2023-05-19' AS Date), 5.0000, 6, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (46, CAST(N'2023-05-19' AS Date), 4.0000, -1, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (47, CAST(N'2023-05-19' AS Date), 20.0000, 6, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (48, CAST(N'2023-05-19' AS Date), 24.0000, -1, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (49, CAST(N'2023-05-19' AS Date), 6.0000, -1, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (50, CAST(N'2023-05-19' AS Date), 7.0000, -1, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (51, CAST(N'2023-05-19' AS Date), 12.0000, -1, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (52, CAST(N'2023-05-19' AS Date), 163.0000, 6, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (53, CAST(N'2023-05-19' AS Date), 62.0000, 6, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (54, CAST(N'2023-05-19' AS Date), 8.0000, -1, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (55, CAST(N'2023-05-19' AS Date), 10.0000, -1, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (56, CAST(N'2023-05-19' AS Date), 2.0000, 6, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (57, CAST(N'2023-05-19' AS Date), 10.0000, -1, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (58, CAST(N'2023-05-19' AS Date), 16.0000, -1, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (59, CAST(N'2023-05-19' AS Date), 22.0000, -1, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (60, CAST(N'2023-05-19' AS Date), 5.0000, -1, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (61, CAST(N'2023-05-19' AS Date), 13.0000, -1, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (62, CAST(N'2023-05-19' AS Date), 16.0000, -1, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (63, CAST(N'2023-05-19' AS Date), 15.0000, -1, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (64, CAST(N'2023-05-19' AS Date), 17.0000, -1, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (65, CAST(N'2023-05-19' AS Date), 6.0000, -1, 3, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (66, CAST(N'2023-05-27' AS Date), 20.0000, 6, 1006, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (67, CAST(N'2023-05-27' AS Date), 10.0000, 6, 1006, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (68, CAST(N'2023-05-27' AS Date), 2.0000, -1, 1006, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (69, CAST(N'2023-05-27' AS Date), 2.0000, -1, 1006, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (70, CAST(N'2023-06-05' AS Date), 2.0000, -1, 1006, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (71, CAST(N'2023-06-05' AS Date), 6.0000, -1, 1006, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (72, CAST(N'2023-06-05' AS Date), 5.0000, -1, 1006, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (73, CAST(N'2023-06-05' AS Date), 4.0000, -1, 1006, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (74, CAST(N'2023-06-05' AS Date), 4.0000, -1, 1006, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (75, CAST(N'2023-06-05' AS Date), 5.0000, -1, 1006, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (76, CAST(N'2023-06-05' AS Date), 10.0000, -1, 1006, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (77, CAST(N'2023-06-05' AS Date), 0.0000, 6, 1006, 22)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (78, CAST(N'2023-06-05' AS Date), 88.0000, 6, 1006, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (79, CAST(N'2023-06-05' AS Date), 20.0000, 6, 1006, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (80, CAST(N'2023-06-05' AS Date), 33.0000, 6, 1006, 23)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (81, CAST(N'2023-06-05' AS Date), 4.0000, -1, 1024, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (82, CAST(N'2023-06-05' AS Date), 7.0000, 6, 1024, 24)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (83, CAST(N'2023-06-05' AS Date), 63.0000, -1, 1006, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (84, CAST(N'2023-06-05' AS Date), 2.0000, -1, 1006, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (85, CAST(N'2023-06-05' AS Date), 2.0000, -1, 1006, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (86, CAST(N'2023-06-05' AS Date), 15.0000, -1, 1006, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (87, CAST(N'2023-06-06' AS Date), 15.0000, 6, 1032, 25)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (88, CAST(N'2023-06-06' AS Date), 33.0000, 6, 1006, 26)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (89, CAST(N'2023-06-06' AS Date), 40.0000, 6, 1035, 0)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (90, CAST(N'2023-06-06' AS Date), 14.0000, 6, 1024, 27)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (91, CAST(N'2023-06-06' AS Date), 13.0000, 6, 1036, 28)
INSERT [dbo].[FACTURA] ([Id_Factura], [Fecha], [Total], [Id_Usuario_FK], [Id_ADMNISTRADOR_FK], [Id_Descuento_FK]) VALUES (92, CAST(N'2023-06-06' AS Date), 805.0000, 6, 1037, 29)
GO
SET IDENTITY_INSERT [dbo].[LOGINS] ON 

INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (0, N'MANUEL GUERECA', N'HOLA', 0, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1, N'KEVIN TLAHUALILO', N'123', 1, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (2, N'PABLO LB', N'1234', 2, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (3, N'ModoHacker', N'1234', 3, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1003, N'Secho', N'1234', 1003, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1004, N'prueba', N'1234', 1004, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1005, N'admin', N'1234', 1005, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1006, N'Cajero', N'1234', 1006, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1007, N'Gerente', N'1234', 1007, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1008, N'qrprueba', N'1234', 1008, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1009, N'43', N'1234', 1009, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1010, N'132', N'1234', 1010, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1011, N'qr4', N'1234', 1011, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1012, N'qr5', N'1234', 1012, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1013, N'qr6', N'1234', 1013, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1014, N'qr7', N'1234', 1014, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1015, N'qr8', N'1234', 1015, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1016, N'qr9', N'1234', 1016, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1017, N'qr10', N'1234', 1017, N'12323', NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1018, N'qr11', N'1234', 1018, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1019, N'qr12', N'1234', 1019, NULL, NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1020, N'qr13u', N'1234', 1020, N'\qr13qr13u1234.png', N'qr13qr13u1234')
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1021, N'pruebafoto', N'1234', 1021, N'\pruebafoto.png', NULL)
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1022, N'fotoprueba', N'1234', 1022, N'\fotoprueba.png', N'fotopruebafotoprueba1234')
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1023, N'PaolaAdmin', N'1234', 1023, N'\MALEPA.png', N'MALEPAPaolaAdmin1234')
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1024, N'Pablo_Cajero', N'1234', 1024, N'\CEARPA.png', N'CEARPAPablo_cajero1234')
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1025, N'Kevin_Gerente', N'1234', 1025, N'\NUCHKE.png', N'NUCHKEKevin_Gerente1234')
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1026, N'Sergio_gerente', N'1234', 1026, N'\RAVISE.png', N'RAVISESergio_gerente1234')
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1027, N'Chris_Admin', N'1234', 1027, N'\HECACH.png', N'HECACHChris_Admin1234')
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1028, N'Manuel_despido', N'1234', 1028, N'\GUTIJU.png', N'GUTIJUManuel_despido1234')
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1029, N'aaaa', N'1234', 1029, N'\aaaa.png', N'aaaaaaaa1234')
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1030, N'', N'', 1030, N'\a.png', N'a')
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1031, N'a', N'1234', 1031, N'\ads.png', N'adsa1234')
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1032, N'dsad', N'1234', 1032, N'\pruebax.png', N'pruebaxdsad1234')
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1033, N'chochoman', N'1234', 1033, N'\chochoman.png', N'chochomanchochoman1234')
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1034, N'MAGUAL', N'1234', 1034, N'\MAGUAL.png', N'MAGUALMAGUAL1234')
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1035, N'Jesus', N'123', 1035, N'\oli.png', N'oliJesus123')
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1036, N'rober', N'1234', 1036, N'\rober.png', N'roberrober1234')
INSERT [dbo].[LOGINS] ([Id_LOGUEO], [NombreLog], [Contrasena], [Id_ADMINISTRADOR_FK], [QR], [QR_INFO]) VALUES (1037, N'alexis', N'1234', 1037, N'\gabaal.png', N'gabaalalexis1234')
SET IDENTITY_INSERT [dbo].[LOGINS] OFF
GO
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Disponibilidad], [Precio], [Lim_Stock]) VALUES (1, N'Digitalización', -1, 15.0000, 1)
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Disponibilidad], [Precio], [Lim_Stock]) VALUES (2, N'Impresión color', -1, 5.0000, 1)
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Disponibilidad], [Precio], [Lim_Stock]) VALUES (3, N'Impresión b/n', -1, 3.0000, 1)
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Disponibilidad], [Precio], [Lim_Stock]) VALUES (4, N'Copias color', -1, 100.0000, 1)
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Disponibilidad], [Precio], [Lim_Stock]) VALUES (5, N'Copias b/n', -1, 2.0000, 1)
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Disponibilidad], [Precio], [Lim_Stock]) VALUES (6, N'Engargolado', -1, 30.0000, 1)
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Disponibilidad], [Precio], [Lim_Stock]) VALUES (7, N'Pluma', 81, 5.0000, 1)
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Disponibilidad], [Precio], [Lim_Stock]) VALUES (8, N'Hoja blanca', 86, 1.0000, 1)
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Disponibilidad], [Precio], [Lim_Stock]) VALUES (9, N'Lápiz', 98, 3.0000, 1)
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Disponibilidad], [Precio], [Lim_Stock]) VALUES (10, N'Papel', 88, 1.0000, 10)
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Disponibilidad], [Precio], [Lim_Stock]) VALUES (11, N'palito', 76, 4.0000, 1)
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Disponibilidad], [Precio], [Lim_Stock]) VALUES (12, N'Hoja color', 82, 3.0000, 1)
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Disponibilidad], [Precio], [Lim_Stock]) VALUES (13, N'clip', 100, 0.5000, 1)
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Disponibilidad], [Precio], [Lim_Stock]) VALUES (14, N'regla', 100, 21.0000, 1)
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Disponibilidad], [Precio], [Lim_Stock]) VALUES (15, N'ESCUADRA', 100, 100.0000, 1)
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Disponibilidad], [Precio], [Lim_Stock]) VALUES (16, N'PEGAMNETO', 100, 18.0000, 1)
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Disponibilidad], [Precio], [Lim_Stock]) VALUES (17, N'tijera', 16, 10.0000, 20)
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Disponibilidad], [Precio], [Lim_Stock]) VALUES (18, N'hule', 100, 15.0000, 1)
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Disponibilidad], [Precio], [Lim_Stock]) VALUES (19, N'tijeras', 5, 23.0000, 1)
GO
INSERT [dbo].[TIPOS_ADMIN] ([Id_TIPOS_ADMIN], [Tipo]) VALUES (1, N'ADMINISTRADOR')
INSERT [dbo].[TIPOS_ADMIN] ([Id_TIPOS_ADMIN], [Tipo]) VALUES (2, N'GERENTE')
INSERT [dbo].[TIPOS_ADMIN] ([Id_TIPOS_ADMIN], [Tipo]) VALUES (3, N'CAJERO')
GO
INSERT [dbo].[USUARIO] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (-1, N'DESCONOCIDO', N'DESCONOCIDO', N'DESCONOCIDO', 3, N'DESC', 0)
INSERT [dbo].[USUARIO] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (1, N'Hernández', N'Castañeda', N'Christopher', 2, N'ABCD123', 97)
INSERT [dbo].[USUARIO] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (2, N'Ramos', N'Villagrana', N'Sergio Rene', 2, N'EFGH123', 147)
INSERT [dbo].[USUARIO] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (3, N'Núñez', N'Chavez', N'Kevin Yahir', 1, N'IJKL123', 93)
INSERT [dbo].[USUARIO] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (4, N'Martínez', N'Leíja', N'Paola Itzel', 3, N'MNOP123', 130)
INSERT [dbo].[USUARIO] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (5, N'Cervantes', N'Arreola', N'Pablo', 1, N'QRST123', 54)
INSERT [dbo].[USUARIO] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (6, N'Douglas', N'Johnson', N'Dwayne', 3, N'ROCA123', 798)
INSERT [dbo].[USUARIO] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (7, N'lopez', N'lopez', N'juan', 1, N'12345', -3)
INSERT [dbo].[USUARIO] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (8, N'perez', N'lopez', N'juan', 1, N'JUPELO', 0)
INSERT [dbo].[USUARIO] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (9, N'a', N'a', N'a', 1, N'a', 0)
INSERT [dbo].[USUARIO] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (10, N'juan', N'lopez', N'juarez', 1, N'juloju', 0)
GO
INSERT [dbo].[USUARIO_COPIA] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (-1, N'DESCONOCIDO', N'DESCONOCIDO', N'DESCONOCIDO', 3, N'DESC', 0)
INSERT [dbo].[USUARIO_COPIA] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (1, N'Hernández', N'Castañeda', N'Christopher', 2, N'ABCD123', 97)
INSERT [dbo].[USUARIO_COPIA] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (2, N'Ramos', N'Villagrana', N'Sergio Rene', 2, N'EFGH123', 147)
INSERT [dbo].[USUARIO_COPIA] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (3, N'Núñez', N'Chavez', N'Kevin Yahir', 1, N'IJKL123', 93)
INSERT [dbo].[USUARIO_COPIA] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (4, N'Martínez', N'Leíja', N'Paola Itzel', 3, N'MNOP123', 130)
INSERT [dbo].[USUARIO_COPIA] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (5, N'Cervantes', N'Arreola', N'Pablo', 1, N'QRST123', 54)
INSERT [dbo].[USUARIO_COPIA] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (6, N'Douglas', N'Johnson', N'Dwayne', 3, N'ROCA123', 798)
INSERT [dbo].[USUARIO_COPIA] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (7, N'lopez', N'lopez', N'juan', 1, N'12345', -3)
INSERT [dbo].[USUARIO_COPIA] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (8, N'perez', N'lopez', N'juan', 1, N'JUPELO', 0)
INSERT [dbo].[USUARIO_COPIA] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (9, N'a', N'a', N'a', 1, N'a', 0)
INSERT [dbo].[USUARIO_COPIA] ([Id_Usuario], [ApPaterno], [ApMaterno], [Nombre], [TipoUsuario], [RFC], [Puntos]) VALUES (10, N'juan', N'lopez', N'juarez', 1, N'juloju', 0)
GO
ALTER TABLE [dbo].[ADMINISTRADOR]  WITH CHECK ADD FOREIGN KEY([Id_TIPOS_ADMIN_FK])
REFERENCES [dbo].[TIPOS_ADMIN] ([Id_TIPOS_ADMIN])
GO
ALTER TABLE [dbo].[ADMINISTRADOR]  WITH CHECK ADD FOREIGN KEY([Id_TIPOS_ADMIN_FK])
REFERENCES [dbo].[TIPOS_ADMIN] ([Id_TIPOS_ADMIN])
GO
ALTER TABLE [dbo].[BITACORA]  WITH CHECK ADD FOREIGN KEY([Id_LOGUEO_FK])
REFERENCES [dbo].[LOGINS] ([Id_LOGUEO])
GO
ALTER TABLE [dbo].[BITACORA]  WITH CHECK ADD FOREIGN KEY([Id_LOGUEO_FK])
REFERENCES [dbo].[LOGINS] ([Id_LOGUEO])
GO
ALTER TABLE [dbo].[DESCUENTO]  WITH CHECK ADD FOREIGN KEY([Id_Usuario_FK])
REFERENCES [dbo].[USUARIO] ([Id_Usuario])
GO
ALTER TABLE [dbo].[DESCUENTO]  WITH CHECK ADD FOREIGN KEY([Id_Usuario_FK])
REFERENCES [dbo].[USUARIO] ([Id_Usuario])
GO
ALTER TABLE [dbo].[DETALLE]  WITH CHECK ADD FOREIGN KEY([Id_Factura_FK])
REFERENCES [dbo].[FACTURA] ([Id_Factura])
GO
ALTER TABLE [dbo].[DETALLE]  WITH CHECK ADD FOREIGN KEY([Id_Factura_FK])
REFERENCES [dbo].[FACTURA] ([Id_Factura])
GO
ALTER TABLE [dbo].[DETALLE]  WITH CHECK ADD FOREIGN KEY([Id_Producto_FK])
REFERENCES [dbo].[PRODUCTO] ([Id_Producto])
GO
ALTER TABLE [dbo].[DETALLE]  WITH CHECK ADD FOREIGN KEY([Id_Producto_FK])
REFERENCES [dbo].[PRODUCTO] ([Id_Producto])
GO
ALTER TABLE [dbo].[FACTURA]  WITH CHECK ADD FOREIGN KEY([Id_Usuario_FK])
REFERENCES [dbo].[USUARIO] ([Id_Usuario])
GO
ALTER TABLE [dbo].[FACTURA]  WITH CHECK ADD FOREIGN KEY([Id_Usuario_FK])
REFERENCES [dbo].[USUARIO] ([Id_Usuario])
GO
ALTER TABLE [dbo].[FACTURA]  WITH CHECK ADD  CONSTRAINT [Id_ADMNISTRADOR_FK] FOREIGN KEY([Id_ADMNISTRADOR_FK])
REFERENCES [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR])
GO
ALTER TABLE [dbo].[FACTURA] CHECK CONSTRAINT [Id_ADMNISTRADOR_FK]
GO
ALTER TABLE [dbo].[FACTURA]  WITH CHECK ADD  CONSTRAINT [Id_Descuento_FK] FOREIGN KEY([Id_Descuento_FK])
REFERENCES [dbo].[DESCUENTO] ([ID_Descuento])
GO
ALTER TABLE [dbo].[FACTURA] CHECK CONSTRAINT [Id_Descuento_FK]
GO
ALTER TABLE [dbo].[LOGINS]  WITH CHECK ADD FOREIGN KEY([Id_ADMINISTRADOR_FK])
REFERENCES [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR])
GO
ALTER TABLE [dbo].[LOGINS]  WITH CHECK ADD FOREIGN KEY([Id_ADMINISTRADOR_FK])
REFERENCES [dbo].[ADMINISTRADOR] ([Id_ADMINISTRADOR])
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarProducto]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AgregarProducto]
(
@NOMBRE VARCHAR(70),
@DISPONIBILIDAD INT,
@PRECIO MONEY
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		DECLARE @ID INT
		DECLARE @EXIST INT
		SET @EXIST=(SELECT Id_Producto FROM PRODUCTO WHERE NOMBRE LIKE ('%'+@NOMBRE+'%'))
			IF(@EXIST IS NULL)
				BEGIN
					SET @ID= (SELECT MAX(Id_Producto)+1 FROM PRODUCTO)
					INSERT INTO PRODUCTO(Id_Producto,Nombre,Disponibilidad,Precio,Lim_Stock) VALUES (@ID,@NOMBRE,@DISPONIBILIDAD,@PRECIO,1)
				END
			ELSE
				BEGIN
					PRINT 'El producto ya existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AltaUsuario]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AltaUsuario]
(
@ApPaterno VARCHAR(35),
@ApMaterno VARCHAR(35),
@Nombre VARCHAR(35),
@TipoUsuario INT,
@RFC VARCHAR(35),
@Puntos INT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		DECLARE @ID INT
		DECLARE @EXIST INT
		SET @EXIST=(SELECT Id_Usuario FROM USUARIO WHERE @RFC=RFC)
			IF(@EXIST IS NULL)
				BEGIN
					SET @ID= (SELECT MAX(Id_Usuario)+1 FROM USUARIO)
					INSERT INTO USUARIO VALUES (@ID,@ApPaterno,@ApMaterno,@Nombre,@TipoUsuario,@RFC,@Puntos)
				END
			ELSE
				BEGIN
					PRINT 'El usuario ya existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_BackUpDifferential]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_BackUpDifferential]
AS
	BEGIN
	BACKUP DATABASE [PAPERBROS] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\PAPERBROS.bak' WITH  DIFFERENTIAL , NOFORMAT, NOINIT,  NAME = N'PAPERBROS-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_BackUpFull]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_BackUpFull]
AS
	BEGIN
	BACKUP DATABASE [PAPERBROS] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\PAPERBROS.bak' WITH NOFORMAT, NOINIT,  NAME = N'PAPERBROS-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_BajaDisponibilidad]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_BajaDisponibilidad]
(
@WARNING BIT OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @AVISO INT
			SET @AVISO=(SELECT COUNT(Id_Producto) FROM PRODUCTO WHERE (Lim_Stock>=Disponibilidad) AND (Disponibilidad!=-1))

			IF(@AVISO!=0)
			BEGIN
				SET @WARNING=1
			END
			ELSE
			BEGIN
				SET @WARNING=0
			END

			PRINT @WARNING
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_BorrarUsuario]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_BorrarUsuario]
(
@RFC VARCHAR(35)
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		DECLARE @EXIST INT
		SET @EXIST=(SELECT Id_Usuario FROM USUARIO WHERE @RFC=RFC)
			IF(@EXIST IS NULL)
				BEGIN
					PRINT 'El usuario no existe'
				END
			ELSE
				BEGIN
					DELETE FROM USUARIO WHERE RFC=@RFC
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CobrarLimStock]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_CobrarLimStock]
(
@PRODUCTO_ID INT,
@LIM_STOCK INT OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		 SET @LIM_STOCK=( SELECT Lim_Stock FROM PRODUCTO WHERE Id_Producto=@PRODUCTO_ID)

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Cobro]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO DE COBRO, PARA LLAMAR SE NESECITA VALIDACION DE PUNTOS
CREATE PROCEDURE [dbo].[sp_Cobro]
(
@PRODUCTO INT,
@CANTIDAD INT,
@FACTURA INT,
@CLIENTE INT,
@DISPONIBILIDAD INT OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @TOTAL MONEY
			DECLARE @ID_DETALLE INT
			DECLARE @ADMINISTRADOR INT
			DECLARE @FACT_EXIST INT
			SET @ID_DETALLE=(SELECT MAX(Id_Detalle)+1 FROM DETALLE)
			SET @TOTAL=(SELECT PRECIO*@CANTIDAD FROM PRODUCTO WHERE @PRODUCTO=Id_Producto)
			SET @ADMINISTRADOR=(SELECT TOP(1)Responsable FROM BITACORA WHERE Accion='LOGUEO' ORDER BY Id_Bitacora DESC)
			SET @FACT_EXIST=(SELECT Id_Factura FROM FACTURA WHERE @FACTURA=Id_Factura)
			SET @DISPONIBILIDAD= (SELECT DISPONIBILIDAD FROM PRODUCTO WHERE Id_Producto=@PRODUCTO)
			DECLARE @TOTAL_FACTURADO MONEY

			IF(@DISPONIBILIDAD >=@CANTIDAD)
			BEGIN
				IF(@FACT_EXIST IS NULL)
				BEGIN
				INSERT INTO FACTURA (Id_Factura,Fecha,Total,Id_Usuario_FK,Id_ADMNISTRADOR_FK,Id_Descuento_FK)VALUES(@FACTURA,GETDATE(),@TOTAL_FACTURADO,@CLIENTE,@ADMINISTRADOR,0)
				END
			INSERT INTO DETALLE(Id_Detalle,Total,Cantidad,Id_Producto_FK,Id_Factura_FK) VALUES(@ID_DETALLE,@TOTAL,@CANTIDAD,@PRODUCTO,@FACTURA) 
			SET @TOTAL_FACTURADO=(SELECT SUM(Total) FROM DETALLE WHERE @FACTURA=Id_Factura_FK)
			UPDATE FACTURA SET Total=@TOTAL_FACTURADO WHERE @FACTURA=Id_Factura
			UPDATE PRODUCTO SET Disponibilidad=Disponibilidad-@CANTIDAD WHERE @PRODUCTO=PRODUCTO.Id_Producto
			END
			ELSE
			BEGIN
				IF(@DISPONIBILIDAD=-1)
				BEGIN
					IF(@FACT_EXIST IS NULL)
					BEGIN
					INSERT INTO FACTURA (Id_Factura,Fecha,Total,Id_Usuario_FK,Id_ADMNISTRADOR_FK,Id_Descuento_FK)VALUES(@FACTURA,GETDATE(),@TOTAL_FACTURADO,@CLIENTE,@ADMINISTRADOR,0)
					END
				INSERT INTO DETALLE(Id_Detalle,Total,Cantidad,Id_Producto_FK,Id_Factura_FK) VALUES(@ID_DETALLE,@TOTAL,@CANTIDAD,@PRODUCTO,@FACTURA) 
				SET @TOTAL_FACTURADO=(SELECT SUM(Total) FROM DETALLE WHERE @FACTURA=Id_Factura_FK)
				UPDATE FACTURA SET Total=@TOTAL_FACTURADO WHERE @FACTURA=Id_Factura
				END
				ELSE
				BEGIN
					PRINT 'PRODUCTO SIN DISPONIBILIDAD'
				END
				
			END

			
			

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CopiaTabla]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CopiaTabla]
(
@TABLA VARCHAR(50),
@EXIST BIT OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			IF EXISTS (SELECT 1 FROM sys.tables WHERE name = @TABLA)
			BEGIN
				SET @EXIST=1
				DECLARE @TABLA_NUEVA VARCHAR(60)
				SET @TABLA_NUEVA= @TABLA+'_COPIA'
				print '@tabla nueva'
				IF EXISTS (SELECT 1 FROM sys.tables WHERE name = @TABLA_NUEVA)
				BEGIN
					DECLARE @sql VARCHAR(MAX)
					SET @sql = 'DROP TABLE ' + QUOTENAME(@TABLA_NUEVA)
					EXEC(@sql)

					DECLARE @sql1 VARCHAR(MAX)
					SET @sql1 = 'SELECT * INTO ' + QUOTENAME(@TABLA_NUEVA) + ' FROM ' + QUOTENAME(@TABLA)
					EXEC(@sql1)
				END
				ELSE
				BEGIN
					DECLARE @sql2 VARCHAR(MAX)
					SET @sql2 = 'SELECT * INTO ' + QUOTENAME(@TABLA_NUEVA) + ' FROM ' + QUOTENAME(@TABLA)
					EXEC(@sql2)
				END

				PRINT 'SE CREO LA NUEVA TABLA'
			END
				
			ELSE
			BEGIN
				SET @EXIST=0
				PRINT 'LA TABLA NO EXISTE'
			END


		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Descuento]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Descuento]
(
@FACTURA INT,
@CLIENTE INT,
@DESCUENTO INT,
@DESC_OUT INT OUTPUT,
@TOTAL_OUT MONEY OUTPUT,
@PDIS_OUT INT OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @PUNTOS_DISP INT
			DECLARE @TOTAL_FACTURADO MONEY
			SET @TOTAL_FACTURADO=(SELECT Total FROM FACTURA WHERE @FACTURA=Id_Factura)
			SET @PUNTOS_DISP=(SELECT Puntos FROM USUARIO WHERE @CLIENTE=Id_Usuario)

			SET @DESC_OUT=@DESCUENTO
			SET @TOTAL_OUT=@TOTAL_FACTURADO
			SET @PDIS_OUT = @PUNTOS_DISP

			IF(@PUNTOS_DISP>=@DESCUENTO)
				BEGIN
				IF(@DESCUENTO<=@TOTAL_FACTURADO)
					BEGIN
					DECLARE @INDICE INT
					SET @INDICE=(SELECT MAX(ID_Descuento)+1 FROM DESCUENTO)
					INSERT INTO DESCUENTO VALUES (@INDICE,@DESCUENTO,@CLIENTE)
					UPDATE FACTURA SET Id_Descuento_FK=@INDICE, Total=Total-@DESCUENTO WHERE @FACTURA=Id_Factura
					UPDATE USUARIO SET Puntos=Puntos-@DESCUENTO WHERE Id_Usuario=@CLIENTE
					END
				ELSE
				BEGIN
					PRINT 'DESCUENTO EXCEDE AL TOTAL'
				END
				END
			ELSE
				BEGIN
				PRINT 'PUNTOS INSUFICIENTES'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Disponibilidad]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Disponibilidad]
(
@PRODUCTO INT,
@DISPONIBILIDAD INT OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			SET @DISPONIBILIDAD=(SELECT DISPONIBILIDAD FROM PRODUCTO WHERE @PRODUCTO=Id_Producto)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Gestion_Clientes]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Gestion_Clientes]
(
@ID INT,
@NOMBRE VARCHAR(50),
@PATERNO VARCHAR(50),
@MATERNO VARCHAR(50),
@NIVEL INT,
@RFC VARCHAR(15),
@PUNTOS INT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		--TABLAS AFECTADAS USuarios
			UPDATE USUARIO SET Nombre=@NOMBRE,ApPaterno=@PATERNO,ApMaterno=@MATERNO,TipoUsuario=@NIVEL,RFC=@RFC,Puntos=@PUNTOS WHERE Id_Usuario=@ID

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Gestion_Usuarios]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Gestion_Usuarios]
(
@CONTRATO BIT,
@ID INT,
@NOMBRE VARCHAR(50),
@PATERNO VARCHAR(50),
@MATERNO VARCHAR(50),
@RFC VARCHAR(15),
@TIPO INT,
@LOG VARCHAR(50),
@IMG VARCHAR(MAX)
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		--TABLAS AFECTADAS LOGIN Y ADMINISTRADOR
			UPDATE ADMINISTRADOR SET Contratado=@CONTRATO,Nombre=@NOMBRE,ApPaterno=@PATERNO, ApMaterno=@MATERNO,
			RFC=@RFC,Imagen=@IMG, Id_TIPOS_ADMIN_FK=@TIPO WHERE Id_ADMINISTRADOR=@ID

			UPDATE LOGINS SET NombreLog=@LOG WHERE Id_ADMINISTRADOR_FK=@ID
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Logueo]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Logueo]
(
@NOMBRE_LOG VARCHAR(50),
@CONTRASENA VARCHAR(50),
@TipoU int output,
@Status bit output,
@FOTO VARCHAR(MAX) output,
@RFC VARCHAR(15) OUTPUT,
@CONTRATADO BIT OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ID_LOG INT
			DECLARE @ID_RESPONSABLE INT
			DECLARE @CONTRATO BIT
			SET @ID_LOG=(SELECT id_LOGUEO FROM LOGINS WHERE @NOMBRE_LOG=NombreLog AND @CONTRASENA=Contrasena)
			IF(@ID_LOG IS NOT NULL)
				BEGIN
					SET @ID_RESPONSABLE=(SELECT Id_ADMINISTRADOR FROM ADMINISTRADOR WHERE @ID_LOG=Id_ADMINISTRADOR)
					SET @CONTRATO=(SELECT Contratado FROM ADMINISTRADOR WHERE (@ID_LOG=Id_ADMINISTRADOR) AND (Contratado=1))
					
					IF(@CONTRATO != 0)
					BEGIN
						DECLARE @NOMBRE VARCHAR(50)
						DECLARE @AP_PAT VARCHAR(50)
						DECLARE @AP_MAT VARCHAR(50)
						INSERT INTO BITACORA VALUES (@ID_RESPONSABLE,'LOGUEO','LOGIN',getdate(),@ID_LOG)
						SET @NOMBRE=(SELECT Nombre FROM ADMINISTRADOR WHERE @ID_RESPONSABLE=Id_ADMINISTRADOR)
						SET @AP_PAT=(SELECT ApPaterno FROM ADMINISTRADOR WHERE @ID_RESPONSABLE=Id_ADMINISTRADOR)
						SET @AP_MAT=(SELECT ApMaterno FROM ADMINISTRADOR WHERE @ID_RESPONSABLE=Id_ADMINISTRADOR)
						SET @TipoU=(SELECT Id_Tipos_Admin_FK FROM ADMINISTRADOR WHERE @ID_RESPONSABLE=Id_ADMINISTRADOR)
						SET @Foto=(SELECT Imagen FROM ADMINISTRADOR WHERE @ID_RESPONSABLE=Id_ADMINISTRADOR)
						PRINT @FOTO
						SET @Status=1
						PRINT @STATUS
						SET @CONTRATADO=1
						PRINT @CONTRATADO
						SET @RFC=(SELECT RFC FROM ADMINISTRADOR WHERE @ID_RESPONSABLE=ADMINISTRADOR.Id_ADMINISTRADOR)
						PRINT @RFC
						PRINT('BIENVENIDO '+ @NOMBRE+' '+@AP_PAT+' '+@AP_MAT)
					END
					ELSE
					BEGIN
						SET @Status=1
						SET @CONTRATADO=0
						PRINT ('PERSONA NO CONTRATADA')
					END
				END
			ELSE
				BEGIN
					SET @TipoU=-1
					SET @Status=0
					SET @CONTRATADO=0
					PRINT('EL ADMINISTRADOR NO EXISTE')
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModDetalle]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ModDetalle]
(
@FACTURA INT,
@PRODUCTO INT,
@SELECTOR INT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		DECLARE @TOTAL MONEY
		DECLARE @TOTAL_FACTURADO MONEY
		DECLARE @MAX INT
		SET @MAX=(SELECT CANTIDAD FROM DETALLE WHERE Id_Detalle=@PRODUCTO)
		IF(@SELECTOR=1)
			BEGIN
			UPDATE DETALLE SET Cantidad=Cantidad+1 WHERE Id_Detalle=@PRODUCTO
			END

		IF(@SELECTOR=2)
			BEGIN
			IF(@MAX > 0)
				BEGIN
				UPDATE DETALLE SET Cantidad=Cantidad-1 WHERE Id_Detalle=@PRODUCTO
				END
			ELSE
				BEGIN
				PRINT 'LA CANTIDAD MINIMA'
				END
			END

		SET @TOTAL=(SELECT PRECIO*CANTIDAD FROM PRODUCTO INNER JOIN DETALLE ON Id_Producto_FK=Id_Producto WHERE Id_Detalle=@PRODUCTO)
		UPDATE DETALLE SET TOTAL=@TOTAL WHERE Id_Detalle=@PRODUCTO
		SET @TOTAL_FACTURADO=(SELECT SUM(Total) FROM DETALLE WHERE @FACTURA=Id_Factura_FK)
		UPDATE FACTURA SET Total=@TOTAL_FACTURADO WHERE @FACTURA=Id_Factura
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModLimiteStock]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ModLimiteStock]
(
@ID_PRODUCTO INT,
@LIMITE INT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE PRODUCTO SET Lim_Stock=@LIMITE WHERE Id_Producto=@ID_PRODUCTO
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModProductos]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ModProductos]
(
@ID_PRODUCTO INT,
@DISPONIBILIDAD INT,
@PRECIO MONEY
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE PRODUCTO SET Precio=@PRECIO, Disponibilidad=@DISPONIBILIDAD WHERE Id_Producto=@ID_PRODUCTO
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_NuevoAdmin]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_NuevoAdmin]
(
@NOMBRE VARCHAR(50),
@PATERNO VARCHAR(50),
@MATERNO VARCHAR(50),
@RFC VARCHAR(15),
@TIPO_ADMIN INT,
@IMAGEN VARCHAR(MAX),
@USUARIO VARCHAR(50),
@CONTRA VARCHAR(50),
@EXIST BIT OUTPUT,
@EXIST_LOG BIT OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @U_ADMIN INT 
			DECLARE @EA INT
			DECLARE @EL INT
			SET @EA=(SELECT Id_ADMINISTRADOR FROM ADMINISTRADOR WHERE @RFC=RFC)
			SET @EL=(SELECT Id_LOGUEO FROM LOGINS WHERE @USUARIO=NombreLog)
			SET @EXIST='true'
			SET @EXIST_LOG='true'

			IF(@EA IS NULL)
				BEGIN
			SET @EXIST='false'
				IF(@EL IS NULL)
					BEGIN
					INSERT INTO ADMINISTRADOR VALUES(@NOMBRE,@PATERNO,@MATERNO,@RFC,@TIPO_ADMIN,@IMAGEN,'true')
					SET @U_ADMIN=(SELECT MAX(ID_ADMINISTRADOR) FROM ADMINISTRADOR)
					INSERT INTO LOGINS(NombreLog,Contrasena,Id_ADMINISTRADOR_FK,QR) VALUES(@USUARIO,@CONTRA,@U_ADMIN,null)
					SET @EXIST_LOG='false'
					END
				ELSE
					BEGIN
					SET @EXIST_LOG='true'
					END
				END
			ELSE
				BEGIN
				SET @EXIST='true'
				END
			
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_NumeroCliente]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_NumeroCliente]
(
@RFC VARCHAR(35),
@CLIENTE INT OUTPUT 
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			SET @CLIENTE =(SELECT Id_Usuario FROM USUARIO WHERE @RFC=RFC)
			print @cliente
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_PuntosDisponibles]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_PuntosDisponibles]
(
@CLIENTE INT,
@PUNTOS INT OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		 SET @PUNTOS=(SELECT PUNTOS FROM USUARIO WHERE Id_Usuario=@CLIENTE)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_qr]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SAlida qr
Create procedure [dbo].[sp_qr]
(
 @QR VARCHAR(MAX),
 @SALIDA VARCHAR(MAX) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		SET @QR=(SELECT QR_info FROM LOGINS WHERE  QR_info=@QR)
		IF(@QR IS NOT NULL)
		BEGIN
			SET @SALIDA=@QR
		END
		ELSE
		BEGIN
			SET @SALIDA='NO_VALIDO'
		END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_QR_Logueo]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_QR_Logueo]
(
@QR VARCHAR(MAX),
@NOMBRE_LOG VARCHAR(50) OUTPUT,
@CONTRASENA VARCHAR(50) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			SET @NOMBRE_LOG=(SELECT NombreLog FROM LOGINS WHERE @QR=QR_INFO)
			SET @CONTRASENA=(SELECT CONTRASENA FROM LOGINS WHERE @QR=QR_INFO)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SumaPuntos]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SumaPuntos]
(
@FACTURA INT,
@CLIENTE INT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		DECLARE @TOTAL_CLIENTE MONEY
		SET @TOTAL_CLIENTE=(SELECT SUM(Total) FROM FACTURA WHERE Id_Usuario_FK=@CLIENTE)
		DECLARE @NIVEL INT
		SET @NIVEL=(SELECT TipoUsuario FROM USUARIO WHERE Id_Usuario=@CLIENTE)
		DECLARE @TOTAL_UNA_COMPRA MONEY
		SET @TOTAL_UNA_COMPRA=(SELECT SUM(Total) FROM FACTURA WHERE Id_Factura=@FACTURA)
		DECLARE @PORCENTAJE FLOAT
		SET @PORCENTAJE=0
		

		SELECT*FROM USUARIO
		IF(@CLIENTE != -1)
		BEGIN
			IF(@NIVEL=1)
				BEGIN
				SET @PORCENTAJE=0.4
				END
			ELSE
				BEGIN
				IF(@NIVEL=2)
					BEGIN
					SET @PORCENTAJE=0.6
					END
				ELSE
					BEGIN
					SET @PORCENTAJE=0.8
					END
				END
		END
		DECLARE @PUNTOS INT
		SET @PUNTOS= ROUND((@TOTAL_UNA_COMPRA*@PORCENTAJE),1,0)
		UPDATE USUARIO SET Puntos=@PUNTOS+Puntos  WHERE Id_Usuario=@CLIENTE

		IF(@TOTAL_CLIENTE>=500 AND @NIVEL=1)
		 BEGIN
		 UPDATE USUARIO SET TipoUsuario=2 WHERE @CLIENTE=Id_Usuario 
		 END
		ELSE
		 BEGIN
			IF(@TOTAL_CLIENTE>=200 AND @NIVEL=2)
			UPDATE USUARIO SET TipoUsuario=3 WHERE @CLIENTE=Id_Usuario 
		 END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SuperAdmin]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SuperAdmin]
(
@CONTRATO BIT,
@ID INT,
@NOMBRE VARCHAR(50),
@PATERNO VARCHAR(50),
@MATERNO VARCHAR(50),
@RFC VARCHAR(15),
@TIPO INT,
@LOG VARCHAR(50),
@CONTRA VARCHAR(50),
@IMG VARCHAR(MAX)
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		--TABLAS AFECTADAS LOGIN Y ADMINISTRADOR
			UPDATE ADMINISTRADOR SET Contratado=@CONTRATO,Nombre=@NOMBRE,ApPaterno=@PATERNO, ApMaterno=@MATERNO,
			RFC=@RFC,Imagen=@IMG, Id_TIPOS_ADMIN_FK=@TIPO WHERE Id_ADMINISTRADOR=@ID

			UPDATE LOGINS SET NombreLog=@LOG, Contrasena=@CONTRA WHERE Id_ADMINISTRADOR_FK=@ID
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UltimaFactura]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UltimaFactura]
(
@FACTURA INT OUTPUT 
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			SET @FACTURA =(SELECT MAX(Id_Factura)+1 FROM FACTURA)
			print @factura
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewFecha]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ViewFecha]
(
@Inicio DATE,
@Fin DATE
)
AS
SELECT*FROM BITACORA WHERE Fecha>=@Inicio AND Fecha<=@Fin
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewNombreBitacora]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ViewNombreBitacora] (@NOMBRE VARCHAR(50))
AS
SELECT Id_Bitacora,Responsable,Accion,Tabla,Fecha,Id_LOGUEO_FK FROM BITACORA 
INNER JOIN LOGINS ON LOGINS.Id_LOGUEO=BITACORA.Id_LOGUEO_FK
INNER JOIN ADMINISTRADOR ON LOGINS.Id_ADMINISTRADOR_FK=ADMINISTRADOR.Id_ADMINISTRADOR
WHERE ADMINISTRADOR.Nombre LIKE '%'+@NOMBRE+'%'
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewTablas]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ViewTablas]
(
@Tabla VARCHAR(50)
)
AS 
SELECT Id_Bitacora,Responsable,Accion,Tabla,Fecha,Id_LOGUEO_FK FROM BITACORA INNER JOIN LOGINS ON LOGINS.Id_LOGUEO=BITACORA.Id_LOGUEO_FK 
              INNER JOIN ADMINISTRADOR ON LOGINS.Id_ADMINISTRADOR_FK=ADMINISTRADOR.Id_ADMINISTRADOR
              WHERE BITACORA.Tabla LIKE '%'+@Tabla+'%'

GO
/****** Object:  Trigger [dbo].[T_NUEVO_Administrador]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE TRIGGER [dbo].[T_NUEVO_Administrador] ON [dbo].[ADMINISTRADOR] AFTER INSERT 
as 
begin

DECLARE @ULTIMO_LOGUEO INT
	DECLARE @RESPONSABLE INT

	SET @ULTIMO_LOGUEO=(SELECT TOP(1) Id_LOGUEO_FK FROM BITACORA WHERE Accion='LOGUEO' ORDER BY Id_BITACORA DESC )
	SET @RESPONSABLE=(SELECT Id_ADMINISTRADOR FROM ADMINISTRADOR WHERE @ULTIMO_LOGUEO=Id_ADMINISTRADOR)
	INSERT INTO BITACORA VALUES(@RESPONSABLE,'SE AGREGO UN NUEVO ADMINISTRADOR','ADMINISTRADOR',GETDATE(),@ULTIMO_LOGUEO)
END
GO
ALTER TABLE [dbo].[ADMINISTRADOR] ENABLE TRIGGER [T_NUEVO_Administrador]
GO
/****** Object:  Trigger [dbo].[T_COBRAR]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--//25 DE NOVIEMBRE
CREATE TRIGGER [dbo].[T_COBRAR] on [dbo].[FACTURA] after insert 
as 
begin

DECLARE @ULTIMO_LOGUEO INT
	DECLARE @RESPONSABLE INT

	SET @ULTIMO_LOGUEO=(SELECT TOP(1) Id_LOGUEO_FK FROM BITACORA WHERE Accion='LOGUEO' ORDER BY Id_BITACORA DESC )
	SET @RESPONSABLE=(SELECT Id_ADMINISTRADOR FROM ADMINISTRADOR WHERE @ULTIMO_LOGUEO=Id_ADMINISTRADOR)
	INSERT INTO BITACORA VALUES(@RESPONSABLE,'COBRO DE PRODUCTOS','FACTURA',GETDATE(),@ULTIMO_LOGUEO)
END
GO
ALTER TABLE [dbo].[FACTURA] ENABLE TRIGGER [T_COBRAR]
GO
/****** Object:  Trigger [dbo].[T_NuevoProducto]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[T_NuevoProducto] on [dbo].[PRODUCTO] after insert 
as 
begin

DECLARE @ULTIMO_LOGUEO INT
	DECLARE @RESPONSABLE INT

	SET @ULTIMO_LOGUEO=(SELECT TOP(1) Id_LOGUEO_FK FROM BITACORA WHERE Accion='LOGUEO' ORDER BY Id_BITACORA DESC )
	SET @RESPONSABLE=(SELECT Id_ADMINISTRADOR FROM ADMINISTRADOR WHERE @ULTIMO_LOGUEO=Id_ADMINISTRADOR)
	INSERT INTO BITACORA VALUES(@RESPONSABLE,'REGISTRO PRODUCTO','PRODUCTO',GETDATE(),@ULTIMO_LOGUEO)
END
GO
ALTER TABLE [dbo].[PRODUCTO] ENABLE TRIGGER [T_NuevoProducto]
GO
/****** Object:  Trigger [dbo].[TR_Compras]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create trigger [dbo].[TR_Compras]
on [dbo].[PRODUCTO] for insert
AS
set nocount on
update DETALLE set DETALLE.Id_Producto_FK= DETALLE.Id_Producto_FK - inserted.Id_Producto from inserted
inner join DETALLE on DETALLE.Id_Producto_FK=inserted.Id_Producto
GO
ALTER TABLE [dbo].[PRODUCTO] ENABLE TRIGGER [TR_Compras]
GO
/****** Object:  Trigger [dbo].[T_NUEVO_CLIENTE]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--//Checa esto por que creo que es el misnmo para que lo borres


CREATE TRIGGER [dbo].[T_NUEVO_CLIENTE] ON [dbo].[USUARIO] AFTER INSERT 
as 
begin

DECLARE @ULTIMO_LOGUEO INT
	DECLARE @RESPONSABLE INT

	SET @ULTIMO_LOGUEO=(SELECT TOP(1) Id_LOGUEO_FK FROM BITACORA WHERE Accion='LOGUEO' ORDER BY Id_BITACORA DESC )
	SET @RESPONSABLE=(SELECT Id_ADMINISTRADOR FROM ADMINISTRADOR WHERE @ULTIMO_LOGUEO=Id_ADMINISTRADOR)
	INSERT INTO BITACORA VALUES(@RESPONSABLE,'SE AGREGO UN NUEVO CLIENTE','USUARIO',GETDATE(),@ULTIMO_LOGUEO)
END
GO
ALTER TABLE [dbo].[USUARIO] ENABLE TRIGGER [T_NUEVO_CLIENTE]
GO
/****** Object:  Trigger [dbo].[t_NuevoCliente]    Script Date: 07/06/2023 10:25:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[t_NuevoCliente] ON [dbo].[USUARIO] AFTER INSERT
AS
BEGIN
	DECLARE @ULTIMO_LOGUEO INT
	DECLARE @RESPONSABLE INT

	SET @ULTIMO_LOGUEO=(SELECT TOP(1) Id_LOGUEO_FK FROM BITACORA WHERE Accion='LOGUEO' ORDER BY Id_BITACORA DESC )
	SET @RESPONSABLE=(SELECT Id_ADMINISTRADOR FROM ADMINISTRADOR WHERE @ULTIMO_LOGUEO=Id_ADMINISTRADOR)
	INSERT INTO BITACORA VALUES(@RESPONSABLE,'REGISTRO CLIENTE','USUARIO',GETDATE(),@ULTIMO_LOGUEO)
END
GO
ALTER TABLE [dbo].[USUARIO] ENABLE TRIGGER [t_NuevoCliente]
GO
USE [master]
GO
ALTER DATABASE [PAPERBROS] SET  READ_WRITE 
GO
