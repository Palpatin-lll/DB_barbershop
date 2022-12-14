USE [master]
GO
/****** Object:  Database [Barbershop2]    Script Date: 30.10.2022 20:12:02 ******/
CREATE DATABASE [Barbershop2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Barbershop2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS03\MSSQL\DATA\Barbershop2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Barbershop2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS03\MSSQL\DATA\Barbershop2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Barbershop2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Barbershop2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Barbershop2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Barbershop2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Barbershop2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Barbershop2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Barbershop2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Barbershop2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Barbershop2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Barbershop2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Barbershop2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Barbershop2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Barbershop2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Barbershop2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Barbershop2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Barbershop2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Barbershop2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Barbershop2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Barbershop2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Barbershop2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Barbershop2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Barbershop2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Barbershop2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Barbershop2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Barbershop2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Barbershop2] SET  MULTI_USER 
GO
ALTER DATABASE [Barbershop2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Barbershop2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Barbershop2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Barbershop2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Barbershop2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Barbershop2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Barbershop2] SET QUERY_STORE = OFF
GO
USE [Barbershop2]
GO
/****** Object:  User [Чернов Евгений Мэлорови]    Script Date: 30.10.2022 20:12:02 ******/
CREATE USER [Чернов Евгений Мэлорови] FOR LOGIN [Manager] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Каширин Владислав Максимович ]    Script Date: 30.10.2022 20:12:02 ******/
CREATE USER [Каширин Владислав Максимович ] FOR LOGIN [Boss] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 30.10.2022 20:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] NOT NULL,
	[Full_name_of_client] [varchar](50) NULL,
	[Phone_number] [varchar](50) NULL,
	[Date_of_birth] [date] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_of_service]    Script Date: 30.10.2022 20:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_of_service](
	[ID] [int] NOT NULL,
	[ID_master] [int] NOT NULL,
	[ID_name_of_service] [int] NOT NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_Master_of_service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master1]    Script Date: 30.10.2022 20:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master1](
	[ID] [int] NOT NULL,
	[Full_name_of_master] [varchar](50) NULL,
	[Phone_number] [varchar](50) NULL,
 CONSTRAINT [PK_Master1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Name_of_service]    Script Date: 30.10.2022 20:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Name_of_service](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Name_of_service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recording]    Script Date: 30.10.2022 20:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recording](
	[ID] [int] NOT NULL,
	[Recording_time] [time](7) NULL,
	[Date] [date] NULL,
	[ID_master1] [int] NOT NULL,
	[ID_client] [int] NOT NULL,
 CONSTRAINT [PK_Recording] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recording_service]    Script Date: 30.10.2022 20:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recording_service](
	[ID] [int] NOT NULL,
	[ID_recording] [int] NOT NULL,
	[ID_name_of_service] [int] NOT NULL,
	[Price] [money] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Master_of_service]  WITH CHECK ADD  CONSTRAINT [FK_Master_of_service_Master1] FOREIGN KEY([ID_master])
REFERENCES [dbo].[Master1] ([ID])
GO
ALTER TABLE [dbo].[Master_of_service] CHECK CONSTRAINT [FK_Master_of_service_Master1]
GO
ALTER TABLE [dbo].[Master_of_service]  WITH CHECK ADD  CONSTRAINT [FK_Master_of_service_Name_of_service] FOREIGN KEY([ID_name_of_service])
REFERENCES [dbo].[Name_of_service] ([ID])
GO
ALTER TABLE [dbo].[Master_of_service] CHECK CONSTRAINT [FK_Master_of_service_Name_of_service]
GO
ALTER TABLE [dbo].[Recording]  WITH CHECK ADD  CONSTRAINT [FK_Recording_Client] FOREIGN KEY([ID_client])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Recording] CHECK CONSTRAINT [FK_Recording_Client]
GO
ALTER TABLE [dbo].[Recording]  WITH CHECK ADD  CONSTRAINT [FK_Recording_Master1] FOREIGN KEY([ID_master1])
REFERENCES [dbo].[Master1] ([ID])
GO
ALTER TABLE [dbo].[Recording] CHECK CONSTRAINT [FK_Recording_Master1]
GO
ALTER TABLE [dbo].[Recording_service]  WITH CHECK ADD  CONSTRAINT [FK_Recording_service_Name_of_service] FOREIGN KEY([ID_name_of_service])
REFERENCES [dbo].[Name_of_service] ([ID])
GO
ALTER TABLE [dbo].[Recording_service] CHECK CONSTRAINT [FK_Recording_service_Name_of_service]
GO
ALTER TABLE [dbo].[Recording_service]  WITH CHECK ADD  CONSTRAINT [FK_Recording_service_Recording] FOREIGN KEY([ID_recording])
REFERENCES [dbo].[Recording] ([ID])
GO
ALTER TABLE [dbo].[Recording_service] CHECK CONSTRAINT [FK_Recording_service_Recording]
GO
/****** Object:  StoredProcedure [dbo].[PriceMax]    Script Date: 30.10.2022 20:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[PriceMax]
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @minPrice int; 
   Declare @service int; 

	set @minPrice = (select max([Price]) from [dbo].[Master_of_service]); 
	set @service = (select [ID_name_of_service] from [dbo].[Master_of_service] where [Price] = @minPrice );
	select [Name] from [dbo].[Name_of_service] where [ID] = @service;
	select  @minPrice; 
END
GO
/****** Object:  StoredProcedure [dbo].[PriceMin]    Script Date: 30.10.2022 20:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PriceMin]
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @minPrice int; 
   Declare @service int; 

	set @minPrice = (select min([Price]) from [dbo].[Master_of_service]); 
	set @service = (select [ID_name_of_service] from [dbo].[Master_of_service] where [Price] = @minPrice );
	select [Name] from [dbo].[Name_of_service] where [ID] = @service;
	select  @minPrice; 
END
GO
/****** Object:  StoredProcedure [dbo].[Информация_О_КЛИЕНТЕ]    Script Date: 30.10.2022 20:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Информация_О_КЛИЕНТЕ] 
 @INF INT = 0 
 
AS
BEGIN

	SET NOCOUNT ON;

   
	SELECT * FROM [dbo].[Recording] WHERE [ID_client] = @INF 
	SELECT * FROM [dbo].[Client] WHERE [ID] = @INF

END
GO
USE [master]
GO
ALTER DATABASE [Barbershop2] SET  READ_WRITE 
GO
