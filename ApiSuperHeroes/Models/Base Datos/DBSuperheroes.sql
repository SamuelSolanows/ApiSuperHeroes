USE [master]
GO
/****** Object:  Database [SuperHeroes]    Script Date: 12/11/2023 7:28:38 p. m. ******/
CREATE DATABASE [SuperHeroes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SuperHeroes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SuperHeroes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SuperHeroes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SuperHeroes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SuperHeroes] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SuperHeroes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SuperHeroes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SuperHeroes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SuperHeroes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SuperHeroes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SuperHeroes] SET ARITHABORT OFF 
GO
ALTER DATABASE [SuperHeroes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SuperHeroes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SuperHeroes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SuperHeroes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SuperHeroes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SuperHeroes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SuperHeroes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SuperHeroes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SuperHeroes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SuperHeroes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SuperHeroes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SuperHeroes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SuperHeroes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SuperHeroes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SuperHeroes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SuperHeroes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SuperHeroes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SuperHeroes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SuperHeroes] SET  MULTI_USER 
GO
ALTER DATABASE [SuperHeroes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SuperHeroes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SuperHeroes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SuperHeroes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SuperHeroes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SuperHeroes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SuperHeroes] SET QUERY_STORE = ON
GO
ALTER DATABASE [SuperHeroes] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SuperHeroes]
GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 12/11/2023 7:28:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[IDSuperHeroe] [int] NULL,
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Heroe_Grupo]    Script Date: 12/11/2023 7:28:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Heroe_Grupo](
	[IDHeroe] [int] NOT NULL,
	[IDGrupo] [int] NOT NULL,
 CONSTRAINT [PK_Heroe_Grupo] PRIMARY KEY CLUSTERED 
(
	[IDHeroe] ASC,
	[IDGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Heroe_Poder]    Script Date: 12/11/2023 7:28:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Heroe_Poder](
	[IDPoder] [int] NOT NULL,
	[IDHeroe] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Heroe_Poder] PRIMARY KEY CLUSTERED 
(
	[IDPoder] ASC,
	[IDHeroe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Heroes_Misiones]    Script Date: 12/11/2023 7:28:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Heroes_Misiones](
	[IDHeroe] [int] NOT NULL,
	[IDMisiones] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Heroes_Misiones] PRIMARY KEY CLUSTERED 
(
	[IDHeroe] ASC,
	[IDMisiones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Misiones]    Script Date: 12/11/2023 7:28:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Misiones](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [text] NULL,
	[IDTipo] [int] NULL,
 CONSTRAINT [PK_Misiones] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poder]    Script Date: 12/11/2023 7:28:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [text] NULL,
 CONSTRAINT [PK_Poder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuperHeroe]    Script Date: 12/11/2023 7:28:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuperHeroe](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[AñoDebut] [text] NULL,
	[PlanetaOrigen] [text] NULL,
 CONSTRAINT [PK_SuperHeroe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMision]    Script Date: 12/11/2023 7:28:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMision](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_TipoMision] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Grupo] ON 

INSERT [dbo].[Grupo] ([ID], [Nombre], [IDSuperHeroe]) VALUES (1, N'Liga de la justicia', NULL)
INSERT [dbo].[Grupo] ([ID], [Nombre], [IDSuperHeroe]) VALUES (2, N'X-men', NULL)
INSERT [dbo].[Grupo] ([ID], [Nombre], [IDSuperHeroe]) VALUES (3, N'Avengers', NULL)
SET IDENTITY_INSERT [dbo].[Grupo] OFF
GO
SET IDENTITY_INSERT [dbo].[Poder] ON 

INSERT [dbo].[Poder] ([ID], [Nombre]) VALUES (1, N'Fueza')
INSERT [dbo].[Poder] ([ID], [Nombre]) VALUES (2, N'Invisibilidad')
INSERT [dbo].[Poder] ([ID], [Nombre]) VALUES (3, N'Telepatía')
INSERT [dbo].[Poder] ([ID], [Nombre]) VALUES (4, N'Telequinesis')
INSERT [dbo].[Poder] ([ID], [Nombre]) VALUES (5, N'Teletransportación')
INSERT [dbo].[Poder] ([ID], [Nombre]) VALUES (6, N'Invulnerabilidad')
SET IDENTITY_INSERT [dbo].[Poder] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoMision] ON 

INSERT [dbo].[TipoMision] ([ID], [Nombre]) VALUES (1, N'MR ')
INSERT [dbo].[TipoMision] ([ID], [Nombre]) VALUES (2, N'MSU ')
SET IDENTITY_INSERT [dbo].[TipoMision] OFF
GO
ALTER TABLE [dbo].[Heroe_Grupo]  WITH CHECK ADD  CONSTRAINT [FK_Heroe_Grupo_Grupo] FOREIGN KEY([IDGrupo])
REFERENCES [dbo].[Grupo] ([ID])
GO
ALTER TABLE [dbo].[Heroe_Grupo] CHECK CONSTRAINT [FK_Heroe_Grupo_Grupo]
GO
ALTER TABLE [dbo].[Heroe_Grupo]  WITH CHECK ADD  CONSTRAINT [FK_Heroe_Grupo_SuperHeroe] FOREIGN KEY([IDHeroe])
REFERENCES [dbo].[SuperHeroe] ([ID])
GO
ALTER TABLE [dbo].[Heroe_Grupo] CHECK CONSTRAINT [FK_Heroe_Grupo_SuperHeroe]
GO
ALTER TABLE [dbo].[Heroe_Poder]  WITH CHECK ADD  CONSTRAINT [FK_Heroe_Poder_Poder] FOREIGN KEY([IDPoder])
REFERENCES [dbo].[Poder] ([ID])
GO
ALTER TABLE [dbo].[Heroe_Poder] CHECK CONSTRAINT [FK_Heroe_Poder_Poder]
GO
ALTER TABLE [dbo].[Heroe_Poder]  WITH CHECK ADD  CONSTRAINT [FK_Heroe_Poder_SuperHeroe] FOREIGN KEY([IDHeroe])
REFERENCES [dbo].[SuperHeroe] ([ID])
GO
ALTER TABLE [dbo].[Heroe_Poder] CHECK CONSTRAINT [FK_Heroe_Poder_SuperHeroe]
GO
ALTER TABLE [dbo].[Heroes_Misiones]  WITH CHECK ADD  CONSTRAINT [FK_Heroes_Misiones_Misiones] FOREIGN KEY([IDMisiones])
REFERENCES [dbo].[Misiones] ([ID])
GO
ALTER TABLE [dbo].[Heroes_Misiones] CHECK CONSTRAINT [FK_Heroes_Misiones_Misiones]
GO
ALTER TABLE [dbo].[Heroes_Misiones]  WITH CHECK ADD  CONSTRAINT [FK_Heroes_Misiones_SuperHeroe] FOREIGN KEY([IDHeroe])
REFERENCES [dbo].[SuperHeroe] ([ID])
GO
ALTER TABLE [dbo].[Heroes_Misiones] CHECK CONSTRAINT [FK_Heroes_Misiones_SuperHeroe]
GO
ALTER TABLE [dbo].[Misiones]  WITH CHECK ADD  CONSTRAINT [FK_Misiones_TipoMision] FOREIGN KEY([IDTipo])
REFERENCES [dbo].[TipoMision] ([ID])
GO
ALTER TABLE [dbo].[Misiones] CHECK CONSTRAINT [FK_Misiones_TipoMision]
GO
USE [master]
GO
ALTER DATABASE [SuperHeroes] SET  READ_WRITE 
GO
