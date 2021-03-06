USE [master]
GO
/****** Object:  Database [BACommerces]    Script Date: 25.01.2018 03:17:29 ******/
CREATE DATABASE [BACommerces]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BACommerces', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BACommerces.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BACommerces_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BACommerces_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BACommerces] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BACommerces].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BACommerces] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BACommerces] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BACommerces] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BACommerces] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BACommerces] SET ARITHABORT OFF 
GO
ALTER DATABASE [BACommerces] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BACommerces] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BACommerces] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BACommerces] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BACommerces] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BACommerces] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BACommerces] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BACommerces] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BACommerces] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BACommerces] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BACommerces] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BACommerces] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BACommerces] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BACommerces] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BACommerces] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BACommerces] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BACommerces] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BACommerces] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BACommerces] SET  MULTI_USER 
GO
ALTER DATABASE [BACommerces] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BACommerces] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BACommerces] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BACommerces] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BACommerces] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BACommerces', N'ON'
GO
ALTER DATABASE [BACommerces] SET QUERY_STORE = OFF
GO
USE [BACommerces]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [BACommerces]
GO
/****** Object:  User [basri]    Script Date: 25.01.2018 03:17:29 ******/
CREATE USER [basri] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BASR]    Script Date: 25.01.2018 03:17:29 ******/
CREATE USER [BASR] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 25.01.2018 03:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Rights] [int] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 25.01.2018 03:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 25.01.2018 03:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[AdminID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ComplateDate] [datetime] NULL,
	[IsComplate] [bit] NULL,
	[IsCancelled] [bit] NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[UnitPrice] [int] NOT NULL,
	[UnitInStock] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 25.01.2018 03:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [int] NOT NULL,
	[Quantity] [smallint] NULL,
	[Discount] [real] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 25.01.2018 03:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[UnitPrice] [int] NOT NULL,
	[UnitInStock] [int] NOT NULL,
	[UnitsInOrder] [int] NOT NULL,
	[ImagePath] [nvarchar](50) NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 25.01.2018 03:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nchar](11) NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Status] [bit] NULL,
	[DGunu] [nchar](2) NULL,
	[DAyi] [nchar](2) NULL,
	[DYili] [nchar](4) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminID], [AdminName], [Password], [Rights]) VALUES (1, N'admin', N'123', 1)
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [CreatedBy]) VALUES (5, N'Hikaye ', N'Hikaye Türü kitaplar', NULL)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [CreatedBy]) VALUES (6, N'Roman', N'Roman türü kitaplar', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitInStock], [UnitsInOrder], [ImagePath], [CategoryID]) VALUES (10, N'Vadideki Zambak', N'Sizi hızla  olayların içinde sürükleyebilen kitap', 15, 100, 0, N'k1.jpg', 6)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitInStock], [UnitsInOrder], [ImagePath], [CategoryID]) VALUES (11, N'Suç ve Ceza', N'Pişman olmayacaksınız.!', 35, 80, 0, N'k5.jpg', 5)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitInStock], [UnitsInOrder], [ImagePath], [CategoryID]) VALUES (12, N'Başın Öne Eğilmesin', N'Başını öne eğmeyenlerin kitabı', 20, 70, 0, N'k3.jpg', 6)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitInStock], [UnitsInOrder], [ImagePath], [CategoryID]) VALUES (13, N'Genç Weartherin Acıları', N'Hikaye türünde anlatılır', 30, 150, 0, N'k4.jpg', 5)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [UnitPrice], [UnitInStock], [UnitsInOrder], [ImagePath], [CategoryID]) VALUES (15, N'TÜRK BAYRAĞI', N'PAHA BİÇİLEMEZ PARAYLA ALINAMAZ', 0, 0, 0, N'k6.jpg', 6)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [FirstName], [LastName], [Email], [Phone], [Password], [Status], [DGunu], [DAyi], [DYili]) VALUES (1, N'ozge', N'ozge', N'ozge', N'ozge@hotmail.com', N'123        ', N'123', NULL, N'1 ', N'1 ', N'2   ')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Admin] FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Admin]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderDetailsID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [BACommerces] SET  READ_WRITE 
GO
