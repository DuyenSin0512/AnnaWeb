USE [master]
GO
/****** Object:  Database [QLAnnastore]    Script Date: 5/13/2023 9:45:31 PM ******/
CREATE DATABASE [QLAnnastore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLAnnastore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QLAnnastore.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLAnnastore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QLAnnastore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QLAnnastore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLAnnastore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLAnnastore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLAnnastore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLAnnastore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLAnnastore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLAnnastore] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLAnnastore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLAnnastore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLAnnastore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLAnnastore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLAnnastore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLAnnastore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLAnnastore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLAnnastore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLAnnastore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLAnnastore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLAnnastore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLAnnastore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLAnnastore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLAnnastore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLAnnastore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLAnnastore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLAnnastore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLAnnastore] SET RECOVERY FULL 
GO
ALTER DATABASE [QLAnnastore] SET  MULTI_USER 
GO
ALTER DATABASE [QLAnnastore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLAnnastore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLAnnastore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLAnnastore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLAnnastore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLAnnastore] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLAnnastore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [QLAnnastore]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [QLAnnastore]
GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 5/13/2023 9:45:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[ParentId] [int] NULL,
	[Orders] [int] NULL,
	[Metakey] [nvarchar](max) NULL,
	[Metadesc] [nvarchar](max) NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [int] NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_dbo.Categorys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 5/13/2023 9:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Phone] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Detail] [nvarchar](max) NOT NULL,
	[Flag] [int] NOT NULL,
	[Reply] [nvarchar](max) NULL,
	[Created_at] [datetime] NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_dbo.Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Links]    Script Date: 5/13/2023 9:48:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Links](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[TableId] [int] NULL,
 CONSTRAINT [PK_dbo.Links] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 5/13/2023 9:49:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Link] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[TableId] [int] NULL,
	[ParentId] [int] NULL,
	[Position] [nvarchar](max) NULL,
	[Orders] [int] NOT NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [int] NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [int] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Menus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/13/2023 9:51:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Amount] [float] NOT NULL,
 CONSTRAINT [PK_dbo.OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/13/2023 9:52:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[CustemerId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ExportDate] [datetime] NULL,
	[DeliveryAddress] [nvarchar](max) NULL,
	[DeliveryName] [nvarchar](max) NULL,
	[DeliveryPhone] [nvarchar](max) NULL,
	[DeliveryEmail] [nvarchar](max) NULL,
	[Updated_by] [int] NULL,
	[Updated_at] [datetime] NULL,
	[Status] [int] NULL,
	[Trash] [int] NULL,
	[DeliveryPaymentMethod] [nvarchar](max) NULL,
	[StatusPayment] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 5/13/2023 9:54:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Topid] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Slug] [nvarchar](max) NULL,
	[Detail] [nvarchar](max) NULL,
	[Img] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[MetaKey] [nvarchar](max) NULL,
	[MetaDesc] [nvarchar](max) NULL,
	[Created_At] [datetime] NOT NULL,
	[Created_By] [int] NULL,
	[Updated_At] [datetime] NOT NULL,
	[Updated_By] [int] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductRate]    Script Date: 5/13/2023 9:54:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductRate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Rate] [float] NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[UName] [nvarchar](50) NULL,
	[CreateAt] [datetime] NULL,
 CONSTRAINT [PK_ProductRate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/13/2023 9:54:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[CateID] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[NewPromotion] [nvarchar](max) NULL,
	[Installment] [int] NOT NULL,
	[Discount] [int] NULL,
	[Detail] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Specification] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProPrice] [float] NOT NULL,
	[MetaKey] [nvarchar](max) NULL,
	[MetaDesc] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[Created_at] [datetime] NOT NULL,
	[Created_by] [int] NOT NULL,
	[Updated_at] [datetime] NOT NULL,
	[Updated_by] [int] NOT NULL,
	[ProRate] [float] NULL,
	[img1] [varchar](255) NULL,
	[img2] [varchar](255) NULL,
	[img3] [varchar](255) NULL,
	[img4] [varchar](255) NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 5/13/2023 9:54:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Link] [nvarchar](max) NULL,
	[Position] [nvarchar](max) NULL,
	[Img] [nvarchar](max) NULL,
	[Orders] [int] NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [int] NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_dbo.Sliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 5/13/2023 9:54:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[ParentId] [int] NULL,
	[Orders] [int] NULL,
	[Metakey] [nvarchar](max) NULL,
	[Metadesc] [nvarchar](max) NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [int] NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_dbo.Topics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/13/2023 9:54:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Gender] [int] NOT NULL,
	[Phone] [int] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Access] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Created_at] [datetime] NOT NULL,
	[Created_by] [int] NOT NULL,
	[Updated_at] [datetime] NOT NULL,
	[Updated_by] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorys] ON 

INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (1, N'GỌNG KÍNH', N'gong-kinh', 4, NULL, N'Gọng kính', N'Gọng kính', CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, CAST(N'2023-04-22T16:35:47.447' AS DateTime), 12, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (2, N'KÍNH RÂM', N'kinh-thoi-trang', 4, NULL, N'Kính thời trang', N'Kính thời trang', CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (3, N'KÍNH ÁP TRÒNG', N'trong-kinh', 4, NULL, N'Tròng Kính', N'Tròng Kính', CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (4, N'Sản Phẩm', N'san-pham', 0, NULL, N'Kính mắt', N'Kính mắt', CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (5, N'TRÒNG KÍNH', N'mat-kinh', 4, NULL, N'Mắt kính', N'Mắt kính', CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (6, N'Gọng Khoan', N'gong-khoan', 1, NULL, N'Gọng khoan', N'Gọng khoan', CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (7, N'Gọng Vành', N'gong-vanh', 1, NULL, N'Gọng Vành', N'Gọng Vành', CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (8, N'Gọng Xẻ Cước', N'gong-xe-cuoc', 1, NULL, N'Gọng Xẻ Cước', N'Gọng Xẻ Cước', CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (9, N'Gọng Khoan Cao Cấp', N'gong-khoan-cao-cap', 1, NULL, N'Gọng Khoan Cao Cấp', N'Gọng Khoan Cao Cấp', CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (10, N'Gọng Vành Cao Cấp', N'Gọng Vành Cao Cấp', 1, NULL, N'Gọng Vành Cao Cấp', N'Gọng Vành Cao Cấp', CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (11, N'Gọng Xẻ Cước Cao Cấp', N'Gọng Xẻ Cước Cao Cấp', 1, NULL, N'Gọng Xẻ Cước Cao Cấp', N'Gọng Xẻ Cước Cao Cấp', CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (12, N'Kính Râm Phổ Thông', N'Kính Thời Trang Phổ Thông', 2, NULL, N'Kính Thời Trang Phổ Thông', N'Kính Thời Trang Phổ Thông', CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (13, N'Kính Râm Cao Cấp', N'Kính Thời Trang Cao Cấp', 2, NULL, N'Kính Thời Trang Cao Cấp', N'Kính Thời Trang Cao Cấp', CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (14, N'Tròng Đổi Màu', N'Mắt Đơn Tròng', 5, NULL, N'Mắt Đơn Tròng', N'Mắt Đơn Tròng', CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (15, N'Tròng Tráng Gương', N'Mắt Hai Tròng', 5, NULL, N'Mắt Hai Tròng', N'Mắt Hai Tròng', CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (16, N'Tròng Phân Cực ', N'Mắt Đa Tròng', 5, NULL, N'Mắt Đa Tròng', N'Mắt Đa Tròng', CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (17, N'Tròng Đa Phân Tròng', N'Mắt Đơn Tròng Blue Cut', 5, NULL, N'Mắt Đơn Tròng Blue Cut', N'Mắt Đơn Tròng Blue Cut', CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, CAST(N'2023-03-12T21:33:47.350' AS DateTime), 1, 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (20, N'Tất cả sản phẩm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categorys] OFF
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Id], [FullName], [Email], [Phone], [Title], [Detail], [Flag], [Reply], [Created_at], [Updated_at], [Updated_by], [Status]) VALUES (1, N'thieu tri dung', N'hvhust1998@gmail.com', 836288052, N'khá là nhàn ', N'tôi chưa biết bạn làm gì nhưng làm website này khá kém nhé.', 1, N'oke =))', CAST(N'2023-03-14T15:30:04.000' AS DateTime), CAST(N'2023-04-22T13:38:13.353' AS DateTime), 12, 1)
INSERT [dbo].[Contacts] ([Id], [FullName], [Email], [Phone], [Title], [Detail], [Flag], [Reply], [Created_at], [Updated_at], [Updated_by], [Status]) VALUES (2, N'Duyên', N'Tranduyen051201@gmail.com', 961187193, N'Mắt kính', N'Tôi cần bạn liên hệ với tôi ngay lập tức', 1, N'Bạn hay đợi tôi một chút nhé', CAST(N'2023-04-23T20:31:42.000' AS DateTime), CAST(N'2023-04-23T20:33:24.293' AS DateTime), 1008, 1)
INSERT [dbo].[Contacts] ([Id], [FullName], [Email], [Phone], [Title], [Detail], [Flag], [Reply], [Created_at], [Updated_at], [Updated_by], [Status]) VALUES (3, N'Trần Thị Duyên', N'Tranduyen051201@gmail.com', 961187193, N'Mặt trái xoan đeo kính gì thì đẹp?', N'Tôi muốn được tư vấn', 0, NULL, CAST(N'2023-04-28T07:31:29.807' AS DateTime), CAST(N'2023-04-28T07:31:29.807' AS DateTime), 1, 1)
INSERT [dbo].[Contacts] ([Id], [FullName], [Email], [Phone], [Title], [Detail], [Flag], [Reply], [Created_at], [Updated_at], [Updated_by], [Status]) VALUES (4, N'thieu dung', N'admin@gmail.com', 1231231, N'12312', N'3123', 0, NULL, CAST(N'2023-05-04T20:26:29.440' AS DateTime), CAST(N'2023-05-04T20:26:29.440' AS DateTime), 1, 1)
INSERT [dbo].[Contacts] ([Id], [FullName], [Email], [Phone], [Title], [Detail], [Flag], [Reply], [Created_at], [Updated_at], [Updated_by], [Status]) VALUES (5, N'Trần thị Duyên', N'duyen@gmail.com', 961187193, N'Muốn tìm hiểu kính mắt', N'Tôi muốn được hỗ trợ', 0, NULL, CAST(N'2023-05-13T11:26:18.033' AS DateTime), CAST(N'2023-05-13T11:26:18.033' AS DateTime), 1, 1)
INSERT [dbo].[Contacts] ([Id], [FullName], [Email], [Phone], [Title], [Detail], [Flag], [Reply], [Created_at], [Updated_at], [Updated_by], [Status]) VALUES (6, N'Trần thị Duyên', N'duyen@gmail.com', 456677883, N'mắt kinhs', N'kính mới như nào', 0, NULL, CAST(N'2023-05-13T19:47:41.177' AS DateTime), CAST(N'2023-05-13T19:47:41.177' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Contacts] OFF
SET IDENTITY_INSERT [dbo].[Links] ON 

INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (1, N'Sản Phẩm', N'san-pham', N'category', 4)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (2, N'Thông tin web', N'thong-tin-web', N'topic', 1)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (3, N'KÍNH THỜI TRANG', N'kinh-thoi-trang', N'category', 2)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (4, N'GỌNG KÍNH', N'gong-kinh', N'category', 1)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (5, N'TRÒNG KÍNH', N'trong-kinh', N'category', 3)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (6, N'Cách chọn kính mắt hợp với khuôn mặt', N'cach-chon-kinh-mat-hop-voi-khuon-mat', N'topic', 2)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (7, N'Giới thiệu', N'gioi-thieu', N'page', 5)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (8, N'Hướng dẫn mua hàng', N'huong-dan-mua-hang', N'page', 6)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (9, N'Gọng Khoan', N'gong-khoan', N'category', 6)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (10, N'Chính sách đổi, trả hàng', N'chinh-sach-doi--tra-hang', N'page', 8)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (11, N'Gọng Khoan', N'gong-khoan', N'category', 6)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (12, N'Gọng Vành', N'gong-vanh', N'category', 7)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (13, N'Gọng Xẻ Cước', N'gong-xe-cuoc', N'category', 8)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (14, N'Gọng Khoan Cao Cấp', N'gong-khoan-cao-cap', N'category', 9)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (15, N'Gọng Vành Cao Cấp', N'Gọng Vành Cao Cấp', N'category', 10)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (16, N'Gọng Xẻ Cước Cao Cấp', N'Gọng Xẻ Cước Cao Cấp', N'category', 11)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (17, N'Kính Thời Trang Phổ Thông', N'Kính Thời Trang Phổ Thông', N'category', 12)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (18, N'Kính Thời Trang Cao Cấp', N'Kính Thời Trang Cao Cấp', N'category', 13)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (19, N'Mắt Đơn Tròng', N'Mắt Đơn Tròng', N'category', 14)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (20, N'Mắt Hai Tròng', N'Mắt Hai Tròng', N'category', 15)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (21, N'Mắt Đa Tròng', N'Mắt Đa Tròng', N'category', 16)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (22, N'Mắt Đơn Tròng Blue Cut', N'Mắt Đơn Tròng Blue Cut', N'category', 17)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (23, N'Mắt Màu / Đổi Màu', N'Mắt Màu / Đổi Màu', N'category', 18)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (24, N'Áp Tròng', N'Áp Tròng', N'category', 19)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (25, N'MẮT KÍNH', N'mat-kinh', N'category', 5)
INSERT [dbo].[Links] ([Id], [Name], [Slug], [Type], [TableId]) VALUES (26, N'gioi thieu', N'gioi-thieu', N'page', 1)
SET IDENTITY_INSERT [dbo].[Links] OFF
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([Id], [Name], [Link], [Type], [TableId], [ParentId], [Position], [Orders], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (1, N'Liên hệ', N'lien-he', N'page', NULL, 0, N'mainmenu', 1, CAST(N'2021-02-14T09:56:13.000' AS DateTime), NULL, CAST(N'2023-04-22T16:50:01.883' AS DateTime), 12, 1)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [Type], [TableId], [ParentId], [Position], [Orders], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (2, N'Tin tức', N'tin-tuc', N'custom', NULL, 0, N'mainmenu', 1, CAST(N'2021-02-15T09:23:14.240' AS DateTime), NULL, CAST(N'2023-04-22T16:50:01.430' AS DateTime), 12, 1)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [Type], [TableId], [ParentId], [Position], [Orders], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (3, N'Giới thiệu', N'gioi-thieu', N'page', 5, 2, N'ád', 1, CAST(N'2021-02-15T09:32:52.000' AS DateTime), NULL, CAST(N'2023-04-22T16:50:00.907' AS DateTime), 12, 1)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [Type], [TableId], [ParentId], [Position], [Orders], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (4, N'Thông tin web', N'thong-tin-web', N'topic', 1, 0, N'mainmenu', 1, CAST(N'2023-04-22T16:52:37.800' AS DateTime), NULL, CAST(N'2023-04-22T16:55:23.040' AS DateTime), 12, 2)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [Type], [TableId], [ParentId], [Position], [Orders], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (5, N'Mắt Đơn Tròng Blue Cut', N'Mắt Đơn Tròng Blue Cut', N'category', 17, 0, N'mainmenu', 1, CAST(N'2023-04-22T16:52:51.557' AS DateTime), NULL, CAST(N'2023-04-22T16:54:04.243' AS DateTime), 12, 2)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [Type], [TableId], [ParentId], [Position], [Orders], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (6, N'Mắt Màu / Đổi Màu', N'Mắt Màu / Đổi Màu', N'category', 18, 0, N'mainmenu', 1, CAST(N'2023-04-22T16:52:51.620' AS DateTime), NULL, CAST(N'2023-04-22T16:54:03.893' AS DateTime), 12, 2)
SET IDENTITY_INSERT [dbo].[Menus] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1, 1, 4, 25000, 2, 50000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (2, 2, 14, 3800000, 2, 7600000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (3, 2, 1, 1380000, 1, 1380000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1002, 1002, 12, 460000, 3, 1380000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1003, 1002, 13, 4250000, 3, 12750000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1004, 1004, 4, 25000, 1, 25000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1005, 1005, 14, 3800000, 1, 3800000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1006, 1006, 14, 3800000, 2, 7600000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1007, 1006, 12, 460000, 1, 460000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1008, 1007, 11, 1300000, 1, 1300000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1009, 1008, 14, 3950000, 3, 11850000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1010, 1009, 15, 3800000, 1, 3800000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1011, 1010, 15, 3800000, 2, 7600000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1012, 1011, 1, 1380000, 1, 1380000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1013, 1011, 3, 5800000, 1, 5800000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1014, 1011, 15, 3800000, 1, 3800000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1015, 1012, 3, 5800000, 1, 5800000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1016, 1013, 2, 450000, 1, 450000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1017, 1014, 1, 1380000, 1, 1380000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1018, 1015, 1, 1380000, 1, 1380000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1019, 1016, 1, 1380000, 1, 1380000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1020, 1017, 2, 450000, 1, 450000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1021, 1018, 2, 450000, 1, 450000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1022, 1019, 2, 450000, 1, 450000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1023, 1020, 2, 450000, 1, 450000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1024, 1021, 2, 450000, 1, 450000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1025, 1022, 2, 450000, 1, 450000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1026, 1023, 2, 450000, 1, 450000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1027, 1024, 2, 450000, 1, 450000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1028, 1025, 1, 1380000, 1, 1380000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1029, 1026, 1, 1380000, 1, 1380000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1030, 1028, 1, 1380000, 1, 1380000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1031, 1029, 1, 138000, 3, 414000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1032, 1030, 8, 28800000, 1, 28800000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1033, 1031, 8, 28800000, 1, 28800000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1034, 1031, 2, 450000, 1, 450000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1035, 1031, 3, 5800000, 1, 5800000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1036, 1032, 10, 13000000, 1, 13000000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1037, 1033, 1, 138000, 1, 138000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1038, 1034, 7, 1299000, 3, 3897000)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1039, 1035, 1, 138000, 1, 138000)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1, N'20230405040439', 10, CAST(N'2023-04-05T16:16:39.723' AS DateTime), CAST(N'2023-04-05T16:20:14.120' AS DateTime), N'Ha Noi', N'dung1', N'01231412314', N'hvhust1998@gmail.com', 12, CAST(N'2023-04-05T16:20:14.120' AS DateTime), 3, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (2, N'20230405040419', 10, CAST(N'2023-04-05T16:18:19.570' AS DateTime), CAST(N'2023-04-05T16:21:37.650' AS DateTime), N'Ha Noi', N'dung1', N'01231412314', N'hvhust1998@gmail.com', 12, CAST(N'2023-04-05T16:21:37.650' AS DateTime), 3, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (3, N'20230405040437', 10, CAST(N'2023-04-05T16:18:37.587' AS DateTime), NULL, N'Ha Noi', N'dung1', N'01231412314', N'hvhust1998@gmail.com', NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1002, N'20230422030433', 1004, CAST(N'2023-04-22T15:37:33.807' AS DateTime), NULL, N'ha noi thoi b oi', N'dungthieu', N'123124123124123', N'admin@gmail.com', NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1003, N'20230422030446', 1004, CAST(N'2023-04-22T15:39:49.377' AS DateTime), NULL, N'ha noi thoi b oi', N'dungthieu', N'123124123124123', N'admin@gmail.com', NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1004, N'20230423070416', 1007, CAST(N'2023-04-23T19:43:16.480' AS DateTime), NULL, N'Hà nội', N'Trần Thị Duyên', N'0853859629', N'Tranduyen051201@gmail.com', NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1005, N'20230423080459', 1007, CAST(N'2023-04-23T20:05:59.757' AS DateTime), NULL, N'Thanh Hoá', N'Trần Thị Duyên', N'0853859629', N'Tranduyen051201@gmail.com', NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1006, N'20230423080430', 1007, CAST(N'2023-04-23T20:32:30.480' AS DateTime), NULL, N'Thanh Hoá', N'Trần Thị Duyên', N'0853859629', N'Tranduyen051201@gmail.com', NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1007, N'20230423100445', 1007, CAST(N'2023-04-23T22:43:45.733' AS DateTime), NULL, N'Thanh Hoá', N'Trần Thị Duyên', N'0853859629', N'Tranduyen051201@gmail.com', NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1008, N'20230426110452', 1010, CAST(N'2023-04-26T23:10:52.157' AS DateTime), NULL, N'Thanh Hoá', N'Nguyen Văn A', N'0961187765', N'Tranduyen010378@gmail.com', 1, CAST(N'2023-04-27T00:49:33.357' AS DateTime), 2, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1009, N'20230427120454', 1010, CAST(N'2023-04-27T00:31:54.353' AS DateTime), NULL, N'Nghệ An', N'Nguyen Văn A', N'0961187765', N'Tranduyen010378@gmail.com', -1, CAST(N'2023-05-06T22:00:59.543' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1010, N'20230428070403', 1010, CAST(N'2023-04-28T07:46:03.940' AS DateTime), NULL, N'Thanh Hoá', N'Nguyen Văn A', N'0961187765', N'Tranduyen010378@gmail.com', -1, CAST(N'2023-05-06T22:00:27.343' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1011, N'momo20230504080545', 12, CAST(N'2023-05-04T20:29:45.650' AS DateTime), NULL, N'Ha noi', N'dung2', N'0123124123', N'dugn3@gmail.com', -1, CAST(N'2023-05-04T20:32:34.213' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1012, N'thanh toan 20230504080522', 12, CAST(N'2023-05-04T20:33:22.020' AS DateTime), NULL, N'Ha noi', N'dung2', N'0123124123', N'dugn3@gmail.com', -1, CAST(N'2023-05-04T20:33:27.400' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1013, N'thanh toan 20230504080507', 12, CAST(N'2023-05-04T20:35:07.923' AS DateTime), NULL, N'Ha noi', N'dung2', N'0123124123', N'dugn3@gmail.com', -1, CAST(N'2023-05-04T20:35:37.757' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1014, N'thanh toan 20230504080532', 12, CAST(N'2023-05-04T20:38:32.513' AS DateTime), NULL, N'Ha noi', N'dung2', N'0123124123', N'dugn3@gmail.com', -1, CAST(N'2023-05-04T20:38:36.897' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1015, N'thanh toan 20230504080539', 12, CAST(N'2023-05-04T20:39:39.593' AS DateTime), NULL, N'Ha noi', N'dung2', N'0123124123', N'dugn3@gmail.com', -1, CAST(N'2023-05-04T20:41:04.563' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1016, N'thanh toan 20230504080541', 12, CAST(N'2023-05-04T20:48:41.407' AS DateTime), NULL, N'Ha noi', N'dung2', N'0123124123', N'dugn3@gmail.com', -1, CAST(N'2023-05-04T20:48:45.460' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1017, N'thanh toan 20230504080500', 12, CAST(N'2023-05-04T20:50:00.720' AS DateTime), NULL, N'Ha noi', N'dung2', N'0123124123', N'dugn3@gmail.com', -1, CAST(N'2023-05-04T20:50:10.020' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1018, N'thanh toan 20230504080506', 12, CAST(N'2023-05-04T20:55:06.560' AS DateTime), NULL, N'Ha noi', N'dung2', N'0123124123', N'dugn3@gmail.com', -1, CAST(N'2023-05-04T20:55:12.573' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1019, N'thanh toan 20230504090539', 12, CAST(N'2023-05-04T21:04:39.967' AS DateTime), NULL, N'Ha noi', N'dung2', N'0123124123', N'dugn3@gmail.com', -1, CAST(N'2023-05-04T21:04:47.907' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1020, N'thanh toan 20230504090534', 12, CAST(N'2023-05-04T21:06:34.477' AS DateTime), NULL, N'Ha noi', N'dung2', N'0123124123', N'dugn3@gmail.com', -1, CAST(N'2023-05-04T21:06:46.510' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1021, N'thanh toan 20230504090517', 12, CAST(N'2023-05-04T21:08:17.300' AS DateTime), NULL, N'Ha noi', N'dung2', N'0123124123', N'dugn3@gmail.com', -1, CAST(N'2023-05-04T21:08:26.043' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1022, N'thanh toan 20230504090544', 12, CAST(N'2023-05-04T21:12:44.193' AS DateTime), NULL, N'Ha noi', N'dung2', N'0123124123', N'dugn3@gmail.com', -1, CAST(N'2023-05-04T21:13:41.213' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1023, N'thanh toan 20230504090545', 12, CAST(N'2023-05-04T21:14:45.473' AS DateTime), NULL, N'Ha noi', N'dung2', N'0123124123', N'dugn3@gmail.com', -1, CAST(N'2023-05-04T21:14:59.500' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1024, N'thanh toan 20230504090524', 12, CAST(N'2023-05-04T21:18:24.807' AS DateTime), NULL, N'Ha noi', N'dung2', N'0123124123', N'dugn3@gmail.com', -1, CAST(N'2023-05-04T21:19:43.697' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1025, N'thanh toan 20230504090543', 12, CAST(N'2023-05-04T21:22:43.567' AS DateTime), NULL, N'Ha noi', N'dung2', N'0123124123', N'dugn3@gmail.com', -1, CAST(N'2023-05-04T21:23:44.567' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1026, N'thanh toan 20230504090554', 12, CAST(N'2023-05-04T21:24:54.480' AS DateTime), NULL, N'Ha noi', N'dung2', N'0123124123', N'dugn3@gmail.com', -1, CAST(N'2023-05-04T21:25:00.420' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1027, N'thanh toan 20230504090523', 12, CAST(N'2023-05-04T21:26:23.333' AS DateTime), NULL, N'Ha noi', N'dung2', N'0123124123', N'dugn3@gmail.com', NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1028, N'thanh toan 20230504090541', 12, CAST(N'2023-05-04T21:26:41.093' AS DateTime), NULL, N'Ha noi', N'dung2', N'0123124123', N'dugn3@gmail.com', 12, CAST(N'2023-05-04T21:30:16.960' AS DateTime), 3, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1029, N'thanh toan 20230506050530', 1010, CAST(N'2023-05-06T17:33:30.783' AS DateTime), NULL, N'Thanh Hoá', N'Nguyen Văn A', N'0961187765', N'Tranduyen010378@gmail.com', -1, CAST(N'2023-05-06T22:11:37.880' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1030, N'momo20230506050544', 1010, CAST(N'2023-05-06T17:35:44.557' AS DateTime), NULL, N'Thanh Hoá', N'Nguyen Văn A', N'0961187765', N'Tranduyen010378@gmail.com', NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1031, N'thanh toan 20230506050519', 1010, CAST(N'2023-05-06T17:51:19.427' AS DateTime), NULL, N'Thanh Hoá', N'Nguyen Văn A', N'0961187765', N'Tranduyen010378@gmail.com', -1, CAST(N'2023-05-13T19:52:00.143' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1032, N'thanh toan 20230506090556', 1010, CAST(N'2023-05-06T21:19:56.413' AS DateTime), NULL, N'Thanh Hoá', N'Nguyen Văn A', N'0961187765', N'Tranduyen010378@gmail.com', 1, CAST(N'2023-05-07T21:37:59.877' AS DateTime), 2, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1033, N'momo20230510070511', 1008, CAST(N'2023-05-10T19:44:11.567' AS DateTime), NULL, N'Hà Tĩnh', N'Trần Thị Duyên', N'0123450864', N'Colennhe@gmail.com', -1, CAST(N'2023-05-12T21:39:54.167' AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1034, N'thanh toan 20230513070517', 1010, CAST(N'2023-05-13T19:51:17.713' AS DateTime), NULL, N'Thái Bình', N'Nguyen Văn A', N'0961187765', N'Tranduyen010378@gmail.com', NULL, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[Orders] ([Id], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1035, N'momo20230513070544', 1010, CAST(N'2023-05-13T19:52:44.177' AS DateTime), NULL, N'Thanh Hoá', N'Nguyen Văn A', N'0961187765', N'Tranduyen010378@gmail.com', NULL, NULL, 1, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [Topid], [Title], [Slug], [Detail], [Img], [Type], [MetaKey], [MetaDesc], [Created_At], [Created_By], [Updated_At], [Updated_By], [Status]) VALUES (1, 1, N'Giới thiệu về Anna', N'gioi-thieu-ve-anna', N'<h2 style="font-style:inherit">VŨ TRỤ TRUYỀN TH&Ocirc;NG</h2>

<p>K&iacute;nh mắt Anna chắc kh&ocirc;ng c&ograve;n qu&aacute; xa lạ với giới trẻ nữa. Đ&acirc;y l&agrave; k&ecirc;nh th&ocirc;ng tin mua sắm v&agrave; giải tr&iacute; d&agrave;nh cho giới trẻ, l&agrave; &ldquo;m&oacute;n ăn tinh thần&rdquo; hằng ng&agrave;y kh&ocirc;ng thể thiếu của mỗi người trẻ.</p>

<p>Được th&agrave;nh lập từ năm 2015, trải qua hơn 7 năm ph&aacute;t triển k&iacute;nh mắt Anna đ&atilde;, đang v&agrave; sẽ chiếm vị tr&iacute; kh&ocirc;ng thể thiếu đối với c&aacute;c bạn trẻ. Cập nhật th&ocirc;ng tin thời trang nhanh ch&oacute;ng v&agrave; ph&ugrave; hợp với thị hiếu của kh&aacute;n giả th&ocirc;ng qua c&aacute;c mạng x&atilde; hội như Facebook, Tiktok, Instagram, Youtube, k&iacute;nh mắt Anna l&agrave; lựa chọn h&agrave;ng đầu cho những ai muốn tận hưởng c&aacute;c b&agrave;i viết, video vừa mang t&iacute;nh giải tr&iacute; m&agrave; vẫn c&oacute; đầy đủ th&ocirc;ng tin cần thiết.</p>
', N'gioi-thieu-ve-anna.PNG', N'post', NULL, NULL, CAST(N'2021-04-14T18:03:29.000' AS DateTime), 27, CAST(N'2023-04-27T22:53:54.310' AS DateTime), 1008, 1)
INSERT [dbo].[Posts] ([Id], [Topid], [Title], [Slug], [Detail], [Img], [Type], [MetaKey], [MetaDesc], [Created_At], [Created_By], [Updated_At], [Updated_By], [Status]) VALUES (2, 1, N'3 cách đeo kính không bị lồi mắt', N'3-cach-deo-kinh-khong-bi-loi-mat', N'<h1>HƯỚNG DẪN 3 C&Aacute;CH ĐEO K&Iacute;NH CẬN KH&Ocirc;NG BỊ LỒI MẮT</h1>

<p>Lồi mắt l&agrave; một trong những nỗi lo ngại của nhiều người bị cận thị khi đeo k&iacute;nh. Liệu rằng đeo k&iacute;nh c&oacute; thực sự l&agrave; nguy&ecirc;n nh&acirc;n dẫn đến mắt bị lồi v&agrave; l&agrave;m c&aacute;ch n&agrave;o để đeo k&iacute;nh kh&ocirc;ng bị lồi mắt? H&atilde;y c&ugrave;ng&nbsp;<a href="https://kinhmatanna.com/">K&iacute;nh mắt Anna</a>&nbsp;t&igrave;m hiểu ngay sau đ&acirc;y nh&eacute;!</p>

<h2 style="font-style:inherit"><strong>T&igrave;nh trạng lồi mắt l&agrave; g&igrave;? Nguy&ecirc;n nh&acirc;n g&acirc;y ra lồi mắt</strong></h2>

<h3 style="color:var(--ast-global-color-2); font-style:inherit"><strong><em>T&igrave;nh trạng lồi mắt l&agrave; g&igrave;?</em></strong></h3>

<p>T&igrave;nh trạng lồi mắt xuất hiện l&agrave; do tổ chức hốc mắt bị tăng thể t&iacute;ch l&agrave;m đẩy nh&atilde;n cầu ra ph&iacute;a trước. Độ lồi của nh&atilde;n cầu được t&iacute;nh bằng đường chiếu từ đỉnh gi&aacute;c mạc xuống đường thẳng đi ngang qua bờ ngo&agrave;i của hai hốc mắt.</p>

<h3 style="color:var(--ast-global-color-2); font-style:inherit"><strong><em>Nguy&ecirc;n nh&acirc;n g&acirc;y lồi mắt ở người bị cận?&nbsp;</em></strong></h3>

<p>Nhiều người cho rằng đeo k&iacute;nh nhiều sẽ l&agrave;m mắt bị lồi. V&igrave; thế khi biết m&igrave;nh bị cận thị họ đ&atilde; lựa chọn việc kh&ocirc;ng đeo k&iacute;nh. Họ chấp nhận việc tầm nh&igrave;n xa hạn chế, họ chấp nhận việc c&oacute; thể bị tăng độ cận chỉ v&igrave; sợ mắt bị lồi, sợ bị xấu. Thế nhưng c&oacute; thực sự mắt bị lồi l&agrave; do đeo k&iacute;nh?&nbsp;</p>

<p>Thực tế, theo c&aacute;c chuy&ecirc;n gia về nh&atilde;n khoa t&igrave;nh trạng mắt lồi xuất hiện ở người bị cận c&oacute; thể l&agrave; do một trong ba nguy&ecirc;n nh&acirc;n sau:</p>

<ul>
	<li>Nguy&ecirc;n nh&acirc;n bệnh l&yacute;: bệnh cường tuyến gi&aacute;p (Basedow),&nbsp;&nbsp;u m&aacute;u, u tổ chức ngoại vi ở mắt, vi&ecirc;m m&ocirc; tế b&agrave;o quanh hốc mắt, &hellip; Trong đ&oacute; bệnh cường tuyến gi&aacute;p v&agrave; c&aacute;c t&igrave;nh trạng vi&ecirc;m l&agrave; phổ biến nhất.&nbsp;</li>
</ul>

<p><img alt="Bệnh cường tuyến giáp có triệu chứng là mắt bị lồi" src="https://kinhmatanna.com/wp-content/uploads/2023/04/basedow-16387124141261436246950.png" style="height:auto; margin-left:77.6875px; margin-right:auto; width:621.594px" /></p>

<p><em>Bệnh cường tuyến gi&aacute;p c&oacute; triệu chứng l&agrave; mắt bị lồi</em></p>

<ul>
	<li>Nguy&ecirc;n nh&acirc;n chấn thương: tr&agrave;n kh&iacute; trong hốc mắt, r&ograve; động mạch cảnh xoang hang, &hellip;</li>
	<li>Nguy&ecirc;n nh&acirc;n từ th&oacute;i quen sinh hoạt: đeo k&iacute;nh kh&ocirc;ng đ&uacute;ng c&aacute;ch, đeo k&iacute;nh kh&ocirc;ng đ&uacute;ng độ cận, độ cận cao nhưng kh&ocirc;ng đeo k&iacute;nh, th&oacute;i quen phụ thuộc v&agrave;o k&iacute;nh, học tập trong m&ocirc;i trường thiếu &aacute;nh s&aacute;ng, &hellip;</li>
</ul>

<p><strong>Xem ngay: 5 nguy&ecirc;n tắc chọn&nbsp;<a href="https://kinhmatanna.com/5-nguyen-tac-chon-mat-kinh-phu-hop-voi-khuan-mat-nguoi-viet/">mắt k&iacute;nh ph&ugrave; hợp với khu&acirc;n mặt</a>&nbsp;người Việt</strong></p>

<h2 style="font-style:inherit"><strong>C&aacute;ch nhận biết mắt bị lồi</strong></h2>

<p>C&aacute;ch dễ ph&aacute;t nhận biết mắt bị lồi nhất l&agrave; khi thấy nh&atilde;n cầu bị nhổ ra khỏi ổ mắt. B&igrave;nh thường độ lồi của nh&atilde;n cầu l&agrave; 12mm, nếu vượt mức n&agrave;y được xem l&agrave; bị lồi mắt.&nbsp;</p>

<p>Khi mắt bị lồi c&oacute; nghĩa l&agrave; cấu tr&uacute;c của mắt đ&atilde; bị thay đổi. Bằng mắt thường bạn sẽ thấy mắt hơi trợn, kh&ocirc;ng tự nhi&ecirc;n. Triệu chứng đi k&egrave;m thường l&agrave; chảy nước mắt nhiều, ch&oacute;i mắt, &iacute;t chớp mắt, mắt sợ &aacute;nh s&aacute;ng,&hellip; Thường th&igrave; sẽ bị lồi cả 2 b&ecirc;n mắt, &iacute;t c&oacute; trường hợp bị lồi 1 b&ecirc;n.&nbsp;</p>

<p><img alt="Nhận biết mắt bị lồi bằng mắt thường" src="https://kinhmatanna.com/wp-content/uploads/2023/04/nguyen-nhan-mat-loi-5.jpeg" style="height:auto; margin-left:60px; margin-right:auto; width:480px" /></p>

<p><em>Nhận biết mắt bị lồi bằng mắt thường</em></p>

<p>Đ&oacute; l&agrave; c&aacute;ch nhận biết đơn giản bằng mắt thường, c&ograve;n đối với c&aacute;c b&aacute;c sĩ nh&atilde;n khoa sẽ đo v&agrave; ph&acirc;n loại độ cận th&agrave;nh 4 mức độ: mức độ 1 (13 &ndash; 16mm), mức độ 2 (17 &ndash; 20mm), mức độ 3 (20 &ndash; 23mm) v&agrave; mức độ 4 (&gt;24mm) đ&acirc;y l&agrave; mức độ nghi&ecirc;m trọng nhất thường l&agrave; do nguy&ecirc;n nh&acirc;n bệnh l&yacute; hoặc chấn thương.</p>

<h2 style="font-style:inherit"><strong>3 c&aacute;ch đeo k&iacute;nh kh&ocirc;ng bị lồi mắt</strong></h2>

<p>Một trong những nguy&ecirc;n nh&acirc;n dẫn đến việc bị lồi mắt ở người bị cận l&agrave; do th&oacute;i quen sinh hoạt h&agrave;ng ng&agrave;y, đặc biệt l&agrave; th&oacute;i quen đeo k&iacute;nh sai c&aacute;ch. Vậy những th&oacute;i quen đeo k&iacute;nh sai đ&oacute; l&agrave; g&igrave;? V&agrave; c&aacute;ch đeo k&iacute;nh kh&ocirc;ng bị lồi mắt như thế n&agrave;o? H&atilde;y c&ugrave;ng t&igrave;m hiểu ngay sau đ&acirc;y nh&eacute;!&nbsp;&nbsp;</p>

<h3 style="color:var(--ast-global-color-2); font-style:inherit"><strong><em>Điều chỉnh k&iacute;nh đ&uacute;ng tầm nh&igrave;n</em></strong></h3>

<p>Khi đeo k&iacute;nh trong qu&aacute; tr&igrave;nh học tập v&agrave; l&agrave;m việc mọi người thường gặp t&igrave;nh trạng k&iacute;nh bị trễ xuống dưới hoặc bị lệch. Khi đ&oacute; đa số mọi người khi tập trung v&agrave;o c&aacute;c hoạt động đang thực hiện sẽ kh&ocirc;ng điều chỉnh lại k&iacute;nh đ&uacute;ng vị tr&iacute; m&agrave; c&oacute; xu hướng nh&igrave;n theo hướng &ldquo;tr&ocirc;i&rdquo; lệch của mắt k&iacute;nh. Đ&acirc;y l&agrave; th&oacute;i quen sai c&aacute;ch rất nguy hiểm. Nếu t&igrave;nh trạng n&agrave;y k&eacute;o d&agrave;i sẽ dẫn đến việc m&iacute; mắt bị sụp, lồi mắt mất tự nhi&ecirc;n.&nbsp;</p>

<p><img alt="Đeo kính bị trễ, bị lệch so với tầm nhìn khiến mắt bị lồi" src="https://kinhmatanna.com/wp-content/uploads/2023/04/5-meo-deo-kinh-khong-bi-tuot-xuong-mui-0-1.png" style="height:auto; margin-left:56px; margin-right:auto; width:448px" /></p>

<p><em>Đeo k&iacute;nh bị trễ, bị lệch so với tầm nh&igrave;n khiến mắt bị lồi</em></p>

<p>Ch&iacute;nh v&igrave; thế ngay từ b&acirc;y giờ bạn h&atilde;y bắt đầu ch&uacute; &yacute; hơn về vị tr&iacute; của k&iacute;nh, tạo th&oacute;i quen đẩy k&iacute;nh v&agrave; điều chỉnh mắt k&iacute;nh về đ&uacute;ng vị tr&iacute; tầm nh&igrave;n để giảm nguy cơ bị lồi mắt, giảm thẩm mỹ khu&ocirc;n mặt.</p>

<h3 style="color:var(--ast-global-color-2); font-style:inherit"><strong><em>Đeo k&iacute;nh đ&uacute;ng độ cận</em></strong></h3>

<p>Khi người bị cận thị đeo k&iacute;nh c&oacute; độ cận thấp hơn hoặc cao hơn so với độ cận thực của mắt th&igrave; mắt phải điều tiết nhiều, g&acirc;y l&ecirc;n t&igrave;nh trạng mắt bị tăng độ cận, mắt bị nhức mỏi, suy giảm thị lực.&nbsp;</p>

<p>Ngo&agrave;i ra, việc mắt phải điều tiết li&ecirc;n tục, mắt chịu căng thẳng thường xuy&ecirc;n cũng khiến cấu tạo mắt bị dao động, dẫn đến hiện tượng bị lồi mắt. C&aacute;c chuy&ecirc;n gia về nh&atilde;n khoa khuy&ecirc;n bạn n&ecirc;n kiểm tra độ cận của mắt định kỳ 6 th&aacute;ng một lần để kịp thời điều chỉnh mắt k&iacute;nh c&oacute; độ cận ph&ugrave; hợp.&nbsp;</p>

<p><strong>Xem ngay:&nbsp;<a href="https://kinhmatanna.com/mat-trai-xoan-deo-kinh-gi-hop-tips-chon-kinh-cho-khuon-mat-trai-xoan/">Mặt tr&aacute;i xoan đeo k&iacute;nh g&igrave; hợp</a>? Tips chọn k&iacute;nh cho khu&ocirc;n mặt tr&aacute;i xoan</strong></p>

<h3 style="color:var(--ast-global-color-2); font-style:inherit"><strong><em>Tần suất đeo k&iacute;nh ph&ugrave; hợp với độ cận của mắt</em></strong></h3>

<p>Với những người bị cận dưới 1 độ (cận nhẹ) chưa cần đeo k&iacute;nh thường xuy&ecirc;n v&agrave; kh&ocirc;ng n&ecirc;n phụ thuộc qu&aacute; nhiều v&agrave;o k&iacute;nh. Ở độ cận n&agrave;y, tầm nh&igrave;n xa của mắt chưa bị hạn chế qu&aacute; nhiều. Nếu đeo k&iacute;nh nhiều sẽ tạo th&oacute;i quen đeo k&iacute;nh cho mắt đặc biệt l&agrave; ở trẻ em (giai đoạn mắt chưa ổn định) sẽ bị tăng độ cận v&agrave; xuất hiện t&igrave;nh trạng phụ thuộc v&agrave;o k&iacute;nh.&nbsp;</p>

<p>Chỉ n&ecirc;n đeo k&iacute;nh khi thực sự cần thiết, cần nh&igrave;n xa, hạn chế đeo k&iacute;nh li&ecirc;n tục cả ng&agrave;y. Điều n&agrave;y sẽ gi&uacute;p mắt &iacute;t phải điều tiết hơn, giảm mệt mỏi, căng thẳng cho mắt.&nbsp;</p>

<p><img alt="" src="https://kinhmatanna.com/wp-content/uploads/2023/04/nen-deo-kinh-can-khi-nao-la-hop-ly-thoi-diem-can-deo-kinh1.png" style="height:auto; margin-left:70px; margin-right:auto; width:560px" /></p>

<p><em>Cận dưới 1 độ, đeo k&iacute;nh thường xuy&ecirc;n sẽ khiến mắt mỏi</em></p>

<p>Với những người c&oacute; độ cận cao th&igrave; lại cần phải đeo k&iacute;nh thường xuy&ecirc;n. Nhiều người bị cận thị năng nhưng lại c&oacute; quan niệm sai lầm l&agrave; đeo k&iacute;nh nhiều sẽ bị lồi mắt. Quan niệm n&agrave;y l&agrave; kh&ocirc;ng đ&uacute;ng v&agrave; sự thật l&agrave; ho&agrave;n to&agrave;n ngược lại.&nbsp;</p>

<p>Khi bị cận nặng nhưng kh&ocirc;ng đeo k&iacute;nh sẽ khiến mắt phải điều tiết nhiều hơn v&agrave; g&acirc;y ức chế, mệt mỏi cho mắt, lồi mắt, nghi&ecirc;m trọng hơn l&agrave; dẫn đến giảm thị lực, tăng độ cận.&nbsp;</p>

<p>Ngo&agrave;i ra để mắt s&aacute;ng khỏe, xinh đẹp bạn n&ecirc;n lựa chọn v&agrave; sử dụng&nbsp; mắt k&iacute;nh ch&iacute;nh h&atilde;ng, uy t&iacute;n, chất lượng tại K&iacute;nh mắt Anna. H&atilde;y lựa để mắt được hoạt động trong m&ocirc;i trường đủ &aacute;nh s&aacute;ng, c&oacute; những b&agrave;i tập cho mắt nh&igrave;n xa v&agrave; đặc biệt l&agrave; h&atilde;y cho mắt được nghỉ ngơi, thư gi&atilde;n khoảng 30 gi&acirc;y mỗi 30-50 ph&uacute;t một lần.&nbsp;</p>

<p>Chế độ dinh dưỡng khoa học cũng l&agrave; yếu tố rất quan trọng để đảm bảo mắt của bạn khoẻ mạnh v&agrave; hoạt động tốt.</p>

<h2 style="font-style:inherit"><strong>C&acirc;u hỏi thường gặp</strong></h2>

<p>Lồi mắt l&agrave; t&igrave;nh trạng m&agrave; kh&ocirc;ng ai mong muốn gặp phải đặc biệt l&agrave; đối với những người bị cận thị. V&igrave; đối với những người c&oacute; bệnh l&yacute; về mắt như cận thị th&igrave; nguy cơ dẫn đến lồi mắt sẽ cao hơn những người b&igrave;nh thường. Dưới đ&acirc;y l&agrave; những c&acirc;u hỏi m&agrave; những người cận thị thường thắc mắc về t&igrave;nh trạng lồi mắt:</p>

<h3 style="color:var(--ast-global-color-2); font-style:inherit"><strong><em>Bị cận kh&ocirc;ng đeo k&iacute;nh c&oacute; bị lồi mắt</em></strong></h3>

<p>Bị cận thị kh&ocirc;ng đeo k&iacute;nh c&oacute; bị lồi mắt kh&ocirc;ng? C&acirc;u trả lời l&agrave; c&oacute;. Tuy nhi&ecirc;n đối với những người c&oacute; độ cận dưới 1 độ, khi kh&ocirc;ng đeo k&iacute;nh sẽ kh&ocirc;ng c&oacute; ảnh hưởng qu&aacute; nghi&ecirc;m trọng. C&ograve;n đối với những người c&oacute; độ cận từ 1 độ trở l&ecirc;n đặc biệt l&agrave; những người c&oacute; độ cận c&agrave;ng cao khi kh&ocirc;ng đeo k&iacute;nh nguy cơ bị lồi mắt c&agrave;ng lớn.&nbsp;</p>

<p>Do khi đ&oacute; mắt phải cố gắng điều tiết để nh&igrave;n r&otilde; hơn khiến nh&atilde;n cầu phồng l&ecirc;n, g&acirc;y t&igrave;nh trạng lồi mắt, mất thẩm mỹ. V&igrave; thế h&atilde;y kiểm tra độ cận định kỳ 6 th&aacute;ng một lần để c&oacute; giải ph&aacute;p bảo vệ thị lực v&agrave; thẩm mỹ kịp thời.</p>

<h3 style="color:var(--ast-global-color-2); font-style:inherit"><strong><em>Đeo k&iacute;nh cận nhiều c&oacute; bị lồi mắt kh&ocirc;ng</em></strong></h3>

<p>Đeo k&iacute;nh cận nhiều c&oacute; bị lồi mắt kh&ocirc;ng? C&acirc;u trả lời l&agrave; kh&ocirc;ng. Nguy&ecirc;n nh&acirc;n g&acirc;y lồi mắt kh&ocirc;ng xuất ph&aacute;t từ việc đeo k&iacute;nh nhiều hay &iacute;t m&agrave; thường xuất ph&aacute;t từ việc đeo k&iacute;nh sai c&aacute;ch như: đeo k&iacute;nh kh&ocirc;ng đ&uacute;ng độ cận, đeo k&iacute;nh kh&ocirc;ng đ&uacute;ng tầm nh&igrave;n v&agrave; tần suất đeo k&iacute;nh kh&ocirc;ng ph&ugrave; hợp với độ cận.&nbsp;</p>

<p>Nếu bạn cận nặng th&igrave; việc đeo k&iacute;nh thường xuy&ecirc;n c&ograve;n gi&uacute;p mắt bạn ổn định v&agrave; hỗ trợ qu&aacute; tr&igrave;nh sinh hoạt nữa. Tuy nhi&ecirc;n nếu bạn cận nhẹ dưới 1 độ th&igrave; chỉ n&ecirc;n đeo k&iacute;nh khi cần thiết để tr&aacute;nh t&igrave;nh trạng mắt bị phụ thuộc v&agrave;o k&iacute;nh.&nbsp;</p>

<p>Tr&ecirc;n đ&acirc;y, K&iacute;nh mắt Anna đ&atilde; hướng dẫn bạn 3 c&aacute;ch đeo k&iacute;nh kh&ocirc;ng bị lồi mắt. Rất mong những chia sẻ n&agrave;y sẽ gi&uacute;p &iacute;ch cho bạn để c&oacute; một đ&ocirc;i mắt khỏe đẹp. Nếu c&oacute; bất k&igrave; một thắc mắc g&igrave; về mắt h&atilde;y li&ecirc;n hệ với K&iacute;nh mắt Anna qua hotline 1900 0359 để được tư vấn r&otilde; hơn nh&eacute;!</p>
', N'3-cach-deo-kinh-khong-bi-loi-mat.PNG', N'post', NULL, NULL, CAST(N'2023-04-27T22:56:29.073' AS DateTime), 1008, CAST(N'2023-04-27T22:56:29.073' AS DateTime), 1008, 1)
INSERT [dbo].[Posts] ([Id], [Topid], [Title], [Slug], [Detail], [Img], [Type], [MetaKey], [MetaDesc], [Created_At], [Created_By], [Updated_At], [Updated_By], [Status]) VALUES (3, 1, N'Top 5 kiểu tóc dành cho người đeo kính mắt nam', N'top-5-kieu-toc-danh-cho-nguoi-deo-kinh-mat-nam', N'<ul>
	<li><a href="https://kinhmatanna.com/2023/04/23/">Th&aacute;ng Tư 23, 2023</a></li>
</ul>

<ul>
	<li><a href="https://kinhmatanna.com/author/kinhmatanna/">KinhMatAnna</a></li>
</ul>

<h1>TOP 5+ KIỂU T&Oacute;C PH&Ugrave; HỢP VỚI NGƯỜI ĐEO K&Iacute;NH NAM</h1>

<h2 style="font-style:inherit"><strong>1. Kiểu t&oacute;c Slicked Back</strong></h2>

<p>Nhiều người đ&agrave;n &ocirc;ng th&iacute;ch Slicked Back l&agrave; một trong những kiểu t&oacute;c ph&ugrave; hợp với người đeo k&iacute;nh nam. Phần t&oacute;c hai b&ecirc;n m&aacute;i được tỉa cẩn thận s&aacute;t da đầu trong kiểu t&oacute;c n&agrave;y. Phần t&oacute;c tr&ecirc;n đỉnh đầu sẽ được n&acirc;ng cao đủ d&agrave;i để tạo độ phồng ho&agrave;n hảo khi chải l&ecirc;n. Chẳng hạn, kiểu t&oacute;c Slicked Back c&oacute; thể phối hợp với nhiều phong c&aacute;ch thời trang, phụ kiện v&agrave; gi&agrave;y d&eacute;p. Đ&acirc;y cũng l&agrave; những kiểu t&oacute;c ph&ugrave; hợp với người đeo k&iacute;nh nam m&agrave; kh&ocirc;ng ai n&ecirc;n bỏ qua.</p>

<p><img alt="Kiểu tóc Slicked Back khá phù hợp với nam giới có gương mặt điển trai" src="https://kinhmatanna.com/wp-content/uploads/2023/04/2969786569d0b58eecc1-1.jpg" style="height:auto; margin-left:89.5938px; margin-right:auto; width:716.797px" /></p>

<p><em>Kiểu t&oacute;c Slicked Back kh&aacute; ph&ugrave; hợp với nam giới c&oacute; gương mặt điển trai</em></p>

<p><strong><em>XEM NGAY: HƯỚNG DẪN&nbsp;</em></strong><a href="https://kinhmatanna.com/huong-dan-chon-size-mat-kinh-vua-khuon-mat/"><strong><em>CHỌN SIZE MẮT K&Iacute;NH VỪA KHU&Ocirc;N MẶT</em></strong></a></p>

<h2 style="font-style:inherit"><strong>2. Kiểu t&oacute;c hai m&aacute;i H&agrave;n Quốc</strong></h2>

<p>Bạn c&oacute; thể chọn kiểu t&oacute;c hai m&aacute;i H&agrave;n Quốc nếu l&agrave; sinh vi&ecirc;n trẻ trung, s&ocirc;i nổi với một cặp k&iacute;nh thời trang. Kiểu t&oacute;c nam đeo k&iacute;nh n&agrave;y sẽ khiến bạn tr&ocirc;ng l&atilde;ng tử v&agrave; trẻ trung hơn.</p>

<p>Bạn chỉ cần tỉa t&oacute;c hai b&ecirc;n v&agrave; nu&ocirc;i t&oacute;c m&aacute;i. Sau đ&oacute;, t&ugrave;y theo sở th&iacute;ch của bạn m&agrave; rẽ ng&ocirc;i giữa hay ng&ocirc;i lệch. Việc sử dụng c&aacute;c c&ocirc;ng cụ tạo kiểu t&oacute;c để tạo ra một vẻ ngo&agrave;i tuyệt vời v&agrave; giữ cho m&aacute;i t&oacute;c của bạn v&agrave;o nếp phức tạp hơn một ch&uacute;t.</p>

<p>Rất nhiều ca sĩ, diễn vi&ecirc;n, người nổi tiếng lựa chọn kiểu t&oacute;c n&agrave;y để gi&uacute;p khu&ocirc;n mặt h&agrave;i h&ograve;a, c&acirc;n đối hơn. V&igrave; vậy, nếu bạn đang tự hỏi những người đ&agrave;n &ocirc;ng đeo k&iacute;nh n&agrave;o c&oacute; kiểu t&oacute;c nam tuyệt đẹp v&agrave;o năm 2023, h&atilde;y tiếp tục v&agrave; t&igrave;m kiếm kiểu t&oacute;c n&agrave;y.&nbsp;</p>

<p><img alt="Kiểu tóc rẽ hai mái chuẩn Hàn Quốc" src="https://kinhmatanna.com/wp-content/uploads/2023/04/Picture1-1.png" style="height:auto; margin-left:89.5938px; margin-right:auto; width:716.797px" /></p>

<p><em>Kiểu t&oacute;c rẽ hai m&aacute;i chuẩn H&agrave;n Quốc</em></p>

<h2 style="font-style:inherit"><strong>3. Kiểu t&oacute;c Side part classic</strong></h2>

<p>Kiểu t&oacute;c Side part classic sẽ d&agrave;nh cho những bạn nam th&iacute;ch sự cổ điển v&agrave; hơi hướng nội. Những người đi l&agrave;m thường xuy&ecirc;n nhấn mạnh kiểu t&oacute;c n&agrave;y bởi sự chỉn chu, lịch sự v&agrave; sang trọng cần c&oacute; h&agrave;ng ng&agrave;y. Hơn nữa, kiểu t&oacute;c n&agrave;y khiến bạn tr&ocirc;ng trưởng th&agrave;nh v&agrave; đ&aacute;ng tin cậy hơn với đồng nghiệp.</p>

<p>Tr&ecirc;n thực tế, kiểu t&oacute;c Side part classic ra đời từ đầu thế kỷ XX. Kể từ khi được giới thiệu, kiểu t&oacute;c n&agrave;y đ&atilde; thu h&uacute;t sự quan t&acirc;m của mọi người ở mọi lứa tuổi. Trong khi đ&oacute;, việc tạo kiểu với kiểu t&oacute;c n&agrave;y cũng kh&aacute; dễ d&agrave;ng. Bạn chỉ cần cắt hai b&ecirc;n v&agrave; để d&agrave;i phần t&oacute;c ph&iacute;a tr&ecirc;n. Sau đ&oacute;, d&ugrave;ng sản phẩm tạo kiểu để giữ nếp cho t&oacute;c. Gi&uacute;p t&oacute;c trở n&ecirc;n b&oacute;ng mượt v&agrave; cố định hơn.</p>

<p>Đ&acirc;y cũng một trong c&aacute;c kiểu t&oacute;c nam hợp với người đeo k&iacute;nh cận cho d&acirc;n văn ph&ograve;ng.</p>

<p><em><img alt="Kiểu tóc Side part classic cho người đeo kính" src="https://kinhmatanna.com/wp-content/uploads/2023/04/Picture2-1.png" style="height:auto; margin-left:89.5938px; margin-right:auto; width:716.797px" />Kiểu t&oacute;c Side part classic cho người đeo k&iacute;nh</em></p>

<p><strong><em>XEM NGAY: 5&nbsp;</em></strong><a href="https://kinhmatanna.com/5-nguyen-tac-chon-mat-kinh-phu-hop-voi-khuan-mat-nguoi-viet/"><strong><em>NGUY&Ecirc;N TẮC CHỌN MẮT K&Iacute;NH PH&Ugrave; HỢP</em></strong></a><strong><em>&nbsp;VỚI KHU&Ocirc;N MẶT NGƯỜI VIỆT</em></strong></p>

<h2 style="font-style:inherit"><strong>4. Kiểu t&oacute;c Pompadour</strong></h2>

<p>Nếu ch&uacute;ng ta muốn c&oacute; một kiểu t&oacute;c nam tuyệt đẹp cho năm 2023 với ch&agrave;ng trai với cặp k&iacute;nh cận, ch&uacute;ng ta sẽ c&oacute; một phong c&aacute;ch hợp thời trang kh&aacute;c b&ecirc;n dưới. Chắc hẳn c&aacute;c ch&agrave;ng trai đ&atilde; từng nghe đến c&aacute;i t&ecirc;n Pompadour. Đ&acirc;y l&agrave; một kiểu t&oacute;c ph&ugrave; hợp với người đeo k&iacute;nh nam nhưng gần đ&acirc;y đ&atilde; nổi l&ecirc;n như một xu hướng kh&ocirc;ng thể thiếu trong bộ sưu tập kiểu t&oacute;c của nhiều nam giới.</p>

<p>Để tạo kiểu Pompadour, bạn chỉ cần tỉa hai b&ecirc;n t&oacute;c để tạo sự ch&uacute; &yacute; cho khu&ocirc;n mặt. Phần t&oacute;c c&ograve;n lại được vuốt ngược v&agrave; tạo kiểu bằng g&ocirc;m, sắp. M&aacute;i t&oacute;c bồng bềnh đầy tự nhi&ecirc;n. Bạn chắc chắn sẽ chiếm được cảm t&igrave;nh của nhiều c&ocirc; g&aacute;i nếu để kiểu t&oacute;c n&agrave;y.</p>

<p><em><img alt="Kiểu tóc nam Pompadour cho người đeo kính hiện đại" src="https://kinhmatanna.com/wp-content/uploads/2023/04/Picture3-1.png" style="height:auto; margin-left:89.5938px; margin-right:auto; width:716.797px" />Kiểu t&oacute;c nam Pompadour cho người đeo k&iacute;nh hiện đại</em></p>

<h2 style="font-style:inherit"><strong>5. Kiểu t&oacute;c Undercut</strong></h2>

<p>Khi nhắc đến kiểu t&oacute;c Undercut, người ta nghĩ ngay đến sự nam t&iacute;nh mạnh mẽ. Họ thường cho rằng những kiểu t&oacute;c ph&ugrave; hợp với người đeo k&iacute;nh nam. Kiểu t&oacute;c undercut ph&ugrave; hợp với hầu hết c&aacute;c khu&ocirc;n mặt v&agrave; kiểu k&iacute;nh tr&ecirc;n thị trường.</p>

<p>Những người đ&agrave;n c&oacute; thể chọn kiểu t&oacute;c ph&ugrave; hợp với người đeo k&iacute;nh nam c&oacute; thể &aacute;p dụng một phi&ecirc;n bản&nbsp; Undercut, chẳng hạn như Undercut Disconnected. Khu&ocirc;n mặt bạn sẽ thu h&uacute;t hơn với phần t&oacute;c m&aacute;i hơi xoăn v&agrave; rối tr&ecirc;n đỉnh đầu.</p>

<p>Với những những kiểu t&oacute;c ph&ugrave; hợp với người đeo k&iacute;nh nam được giới thiệu tr&ecirc;n đ&acirc;y, hi vọng c&aacute;c bạn sẽ t&igrave;m được cho m&igrave;nh một lựa chọn ph&ugrave; hợp nhất.</p>

<p><img alt="Kiểu tóc Undercut phù hợp với nam đeo kính cận" src="https://kinhmatanna.com/wp-content/uploads/2023/04/Picture4-1.png" style="height:auto; margin-left:89.5938px; margin-right:auto; width:716.797px" /></p>

<p><em>Kiểu t&oacute;c Undercut ph&ugrave; hợp với nam đeo k&iacute;nh cận</em></p>

<h2 style="font-style:inherit"><strong>Địa chỉ mua k&iacute;nh đẹp nhất thị trường</strong></h2>

<p>Kh&ocirc;ng kh&oacute; khi tr&ecirc;n nhiều trang thương mại điện tử v&agrave; c&aacute;c cửa h&agrave;ng b&aacute;n lẻ mắt k&iacute;nh c&oacute; rất nhiều mẫu k&iacute;nh với mức gi&aacute; rất rẻ chỉ từ v&agrave;i chục ngh&igrave;n đến v&agrave;i trăm ngh&igrave;n. Tuy nhi&ecirc;n, nhiều kh&aacute;ch h&agrave;ng lại th&iacute;ch mua k&iacute;nh kh&ocirc;ng r&otilde; nguồn gốc, dễ bị bong tr&oacute;c sơn, g&acirc;y hại cho mắt khi đeo. Ngo&agrave;i ra, nếu bạn chỉ mua gọng m&agrave; kh&ocirc;ng thay tr&ograve;ng th&igrave; sẽ kh&ocirc;ng c&oacute; t&aacute;c dụng bảo vệ mắt như hạn chế ch&oacute;i, chống tia UV, chống l&oacute;a&hellip;, dẫn đến c&aacute;c t&igrave;nh trạng bệnh nguy hiểm về mắt.&nbsp;</p>

<p>Để bảo vệ sự an to&agrave;n của bạn, h&atilde;y mua k&iacute;nh từ c&aacute;c c&ocirc;ng ty k&iacute;nh mắt đ&aacute;ng tin cậy cung cấp chương tr&igrave;nh chăm s&oacute;c sau b&aacute;n h&agrave;ng. K&iacute;nh mắt Anna l&agrave; c&ocirc;ng ty sản xuất v&agrave; ph&acirc;n phối k&iacute;nh đ&aacute;ng tin cậy với chi ph&iacute; rẻ v&agrave; c&oacute; ch&iacute;nh s&aacute;ch bảo h&agrave;nh uy t&iacute;n. Ngo&agrave;i ra, K&iacute;nh mắt Anna cung cấp dịch vụ bảo tr&igrave; cơ bản (thay ốc v&iacute;t, thay miếng đệm mũi, chỉnh k&iacute;nh) cũng như l&agrave;m sạch v&agrave; đ&aacute;nh b&oacute;ng cho tất cả kh&aacute;ch h&agrave;ng trong suốt thời gian sử dụng sản phẩm.&nbsp;</p>

<p>Với 10 năm kinh nghiệm trong lĩnh vực kinh doanh k&iacute;nh mắt, Anna tự h&agrave;o l&agrave; cửa h&agrave;ng mắt k&iacute;nh uy t&iacute;n v&agrave; sở hữu sản phẩm chất lượng h&agrave;ng đầu Việt Nam.</p>

<p><em><img alt="Cửa hàng kính mắt Anna" src="https://kinhmatanna.com/wp-content/uploads/2023/04/afb3e54178f4a4aafde5.jpg" style="height:auto; margin-left:89.5938px; margin-right:auto; width:716.797px" />Cửa h&agrave;ng k&iacute;nh mắt Anna</em></p>

<p><strong><em>XEM NGAY:&nbsp;</em></strong><a href="https://kinhmatanna.com/kinh-mat-anna-thay-doi-dien-mao-genz/"><strong><em>K&Iacute;NH MẮT ANNA THAY ĐỔI DIỆN MẠO GENZ</em></strong></a></p>

<p><img alt="Author Image" src="https://kinhmatanna.com/wp-content/uploads/2023/04/kinh-mat-anna.jpg.jpg" style="height:200px; margin-left:20px; width:200px" /></p>

<p>KinhMatAnna</p>

<p>K&iacute;nh mắt Anna l&agrave; thương hiệu k&iacute;nh mắt lớn được nhiều người biết đến, đặc biệt l&agrave; kh&aacute;ch h&agrave;ng trẻ tuổi. Với nhiều năm kinh nghiệm trong lĩnh vực n&agrave;y, K&iacute;nh mắt Anna sẽ mang tới bạn đọc những kiến thức hữu &iacute;ch về tư vấn chọn k&iacute;nh đẹp v&agrave; c&aacute;c bệnh về mắt, gi&uacute;p bạn đọc tự tin lựa chọn cho m&igrave;nh chiếc k&iacute;nh ph&ugrave; hợp nhất.</p>
', N'top-5-kieu-toc-danh-cho-nguoi-deo-kinh-mat-nam.PNG', N'post', NULL, NULL, CAST(N'2023-04-27T22:58:28.173' AS DateTime), 1008, CAST(N'2023-04-27T22:58:28.173' AS DateTime), 1008, 1)
INSERT [dbo].[Posts] ([Id], [Topid], [Title], [Slug], [Detail], [Img], [Type], [MetaKey], [MetaDesc], [Created_At], [Created_By], [Updated_At], [Updated_By], [Status]) VALUES (4, 1, N'Mặt trái xoan đeo kính gì thì đẹp', N'mat-trai-xoan-deo-kinh-gi-thi-dep', N'<h1>MẶT TR&Aacute;I XOAN ĐEO K&Iacute;NH G&Igrave; HỢP? TIPS CHỌN K&Iacute;NH CHO KHU&Ocirc;N MẶT TR&Aacute;I XOAN</h1>

<p>Mặt tr&aacute;i xoan l&agrave; gương mặt được nhiều người th&iacute;ch v&agrave; đ&aacute;nh gi&aacute; l&agrave; gương mặt chuẩn. V&igrave; thế m&agrave; việc lựa chọn gọng k&iacute;nh c&oacute; kiểu mặt n&agrave;y cũng dễ hơn rất nhiều. Tuy nhi&ecirc;n, c&oacute; một số lưu &yacute; bạn cần quan t&acirc;m khi chọn k&iacute;nh cho mặt tr&aacute;i xoan. H&atilde;y c&ugrave;ng&nbsp;<a href="https://kinhmatanna.com//"><em>K&iacute;nh mắt Anna</em></a>&nbsp;t&igrave;m hiểu kỹ hơn mặt tr&aacute;i xoan đeo k&iacute;nh g&igrave; hợp v&agrave; thu h&uacute;t nh&eacute;.</p>

<h2 style="font-style:inherit"><strong>Đặc điểm của gương mặt tr&aacute;i xoan</strong></h2>

<p>Trước khi lựa chọn d&aacute;ng k&iacute;nh cho mặt tr&aacute;i xoan th&igrave; ch&uacute;ng ta cần x&aacute;c định lại một lần nữa xem c&oacute; chắc chắn bạn thuộc kiểu người c&oacute; gương mặt tr&aacute;i xoan kh&ocirc;ng nh&eacute;. X&aacute;c định đ&uacute;ng sẽ gi&uacute;p bạn lựa chọn được gọng k&iacute;nh ph&ugrave; hợp.</p>

<p>Một số đặc điểm của người c&oacute; gương mặt tr&aacute;i xoan:</p>

<ul>
	<li>Đường cằm thon: Đ&acirc;y l&agrave; đặc điểm ch&iacute;nh của gương mặt tr&aacute;i xoan. Đường cằm của người c&oacute; gương mặt n&agrave;y thường rất thon v&agrave; kh&ocirc;ng qu&aacute; d&agrave;i.</li>
	<li>Thanh mảnh: Gương mặt tr&aacute;i xoan thường c&oacute; k&iacute;ch thước nhỏ hơn so với c&aacute;c kiểu gương mặt kh&aacute;c, tạo ra sự nhẹ nh&agrave;ng v&agrave; thanh mảnh.</li>
	<li>G&oacute;c cạnh: Gương mặt tr&aacute;i xoan thường c&oacute; c&aacute;c g&oacute;c cạnh kh&ocirc;ng qu&aacute; sắc n&eacute;t, như g&oacute;c cằm, mũi v&agrave; tr&aacute;n. G&ograve; m&aacute; v&agrave; cằm cũng rất c&acirc;n đối v&agrave; thon gọn.</li>
	<li>Đ&ocirc;i m&aacute; hơi rộng v&agrave; nở ra ph&iacute;a dưới, khiến khu&ocirc;n mặt nh&igrave;n tr&ocirc;ng hơi đầy.</li>
	<li>Tr&aacute;n thường hơi thấp v&agrave; hẹp hơn so với mặt.</li>
	<li>Ngũ quan h&agrave;i ho&agrave;, đ&ocirc;i khi gương mặt nh&igrave;n hơi đầy đặn, tạo thiện cảm cho người nh&igrave;n.</li>
</ul>

<p><img alt="Gương mặt trái xoan thường tạo thiện cảm cho người đối diện" src="https://kinhmatanna.com/wp-content/uploads/2023/04/mat-trai-xoan-deo-kinh-gi-1-1.png" style="height:auto; margin-left:60px; margin-right:auto; width:480px" /></p>

<p><em>Gương mặt tr&aacute;i xoan thường tạo thiện cảm cho người đối diện</em></p>

<p>Gương mặt tr&aacute;i xoan thường được coi l&agrave; gương mặt chuẩn mực m&agrave; nhiều người mong muốn sở hữu v&igrave; n&oacute; hợp với nhiều kiểu k&iacute;nh v&agrave; nhiều kiểu trang điểm kh&aacute;c nhau. Thế nhưng vẫn c&oacute; những gọng k&iacute;nh m&agrave; gương mặt tr&aacute;i xoan kh&ocirc;ng n&ecirc;n đeo để tr&aacute;nh lộ nhược điểm. H&atilde;y c&ugrave;ng xem gương mặt tr&aacute;i xoan đeo k&iacute;nh g&igrave; th&igrave; ph&ugrave; hợp nh&eacute;.</p>

<h2 style="font-style:inherit"><strong>Mặt tr&aacute;i xoan đeo k&iacute;nh g&igrave; hợp?</strong></h2>

<p>Mặt tr&aacute;i xoan l&agrave; gương mặt c&oacute; thể đeo nhiều gọng k&iacute;nh kh&aacute;c nhau. V&agrave; dưới đ&acirc;y sẽ l&agrave; một số gọng k&iacute;nh ph&ugrave; hợp m&agrave; bạn c&oacute; thể chọn cho m&igrave;nh nếu sở hữu gương mặt chuẩn mực n&agrave;y.</p>

<ul>
	<li>K&iacute;nh gọng tr&ograve;n hoặc oval: đeo c&aacute;c dạng k&iacute;nh c&oacute; đường cong sẽ gi&uacute;p cho gương mặt của bạn trở n&ecirc;n thon gọn v&agrave; nhẹ nh&agrave;ng hơn. Loại k&iacute;nh n&agrave;y c&oacute; thiết kế mềm mại v&agrave; trẻ trung, gi&uacute;p l&agrave;m mềm c&aacute;c đường n&eacute;t tr&ecirc;n khu&ocirc;n mặt, tạo ra sự tươi trẻ v&agrave; thanh tho&aacute;t.</li>
</ul>

<p><img alt="Mặt trái xoan có thể đeo kính gọng tròn gợi sự trẻ trung" src="https://kinhmatanna.com/wp-content/uploads/2023/04/mat-trai-xoan-deo-kinh-gi-2.jpeg" style="height:auto; margin-left:56.2969px; margin-right:auto; width:450.391px" /></p>

<p><em>Mặt tr&aacute;i xoan c&oacute; thể đeo k&iacute;nh gọng tr&ograve;n gợi sự trẻ trung</em></p>

<ul>
	<li>K&iacute;nh gọng vu&ocirc;ng hoặc gọng chữ nhật: Loại k&iacute;nh n&agrave;y gi&uacute;p l&agrave;m nổi bật đường viền của khu&ocirc;n mặt tr&aacute;i xoan, tạo ra sự c&acirc;n đối v&agrave; thon gọn cho gương mặt. Kiểu k&iacute;nh n&agrave;y cũng gi&uacute;p tạo cảm gi&aacute;c gương mặt tr&aacute;i xoan trở n&ecirc;n thon gọn v&agrave; mềm mại hơn gương mặt tr&ograve;n bầu bĩnh</li>
	<li>K&iacute;nh phi c&ocirc;ng (gọng Aviator): Loại k&iacute;nh n&agrave;y c&oacute; đặc điểm lớn v&agrave; b&egrave; dần xuống ph&iacute;a dưới của hai b&ecirc;n mắt k&iacute;nh. Kiểu d&aacute;ng k&iacute;nh phi c&ocirc;ng đem lại sự s&agrave;nh điệu v&agrave; c&aacute; t&iacute;nh cho người đeo. Mẫu k&iacute;nh n&agrave;y đặc biệt ph&ugrave; hợp với c&aacute;c bạn nữ</li>
	<li>K&iacute;nh Browline: Loại k&iacute;nh n&agrave;y c&oacute; đặc điểm phần tr&ecirc;n của mặt trước gọng thường c&oacute; k&iacute;ch thước d&agrave;y v&agrave; m&agrave;u đậm hơn phần dưới. Kiểu k&iacute;nh n&agrave;y cực ph&ugrave; hợp với c&aacute;c bạn nam c&oacute; gương mặt tr&aacute;i xoan v&igrave; n&oacute; sẽ đem lại sự thu h&uacute;t v&agrave; nam t&iacute;nh cho đ&ocirc;i mắt. Đặc biệt kiểu k&iacute;nh n&agrave;y c&ograve;n rất ph&ugrave; hợp với người c&oacute; tr&aacute;n to v&agrave; gương mặt h&igrave;nh quả l&ecirc;.</li>
</ul>

<p>XEM NGAY:&nbsp;<em>HƯỚNG DẪN&nbsp;<a href="https://kinhmatanna.com/huong-dan-chon-size-mat-kinh-vua-khuon-mat/">CHỌN SIZE MẮT K&Iacute;NH</a>&nbsp;VỪA KHU&Ocirc;N MẶT</em></p>

<h2 style="font-style:inherit"><strong>Lưu &yacute; khi chọn k&iacute;nh</strong></h2>

<p>Tuy việc chọn k&iacute;nh cho người c&oacute; gương mặt tr&aacute;i xoan kh&ocirc;ng qu&aacute; kh&oacute; nhưng cũng c&oacute; một số lưu &yacute; sau đ&acirc;y m&agrave; bạn cần biết:</p>

<ul>
	<li>Chọn k&iacute;nh c&oacute; h&igrave;nh d&aacute;ng kh&aacute;ng chiếu: Người c&oacute; gương mặt tr&aacute;i xoan thường c&oacute; tr&aacute;n hẹp, v&igrave; vậy n&ecirc;n chọn k&iacute;nh c&oacute; h&igrave;nh d&aacute;ng kh&aacute;ng chiếu để tạo cảm gi&aacute;c mở rộng cho v&ugrave;ng tr&aacute;n.</li>
	<li>Chọn k&iacute;nh c&oacute; chiều rộng vừa phải: Khi chọn k&iacute;nh, cần ch&uacute; &yacute; tới chiều rộng của k&iacute;nh, nếu chọn k&iacute;nh qu&aacute; rộng sẽ l&agrave;m cho khu&ocirc;n mặt tr&ocirc;ng to hơn. Nếu chọn k&iacute;nh qu&aacute; nhỏ sẽ l&agrave;m cho khu&ocirc;n mặt tr&ocirc;ng nhỏ hơn.</li>
	<li>Chọn m&agrave;u sắc ph&ugrave; hợp: Khi chọn k&iacute;nh, cần ch&uacute; &yacute; đến m&agrave;u sắc để tạo sự h&agrave;i h&ograve;a với m&agrave;u da v&agrave; t&oacute;c của người đeo k&iacute;nh.</li>
	<li>Đặc biệt n&ecirc;n hạn chế chọn c&aacute;c gọng k&iacute;nh c&oacute; h&igrave;nh bầu dục, k&iacute;nh mắt m&egrave;o v&agrave; k&iacute;nh đa gi&aacute;c. C&aacute;c loại k&iacute;nh n&agrave;y hầu như đều l&agrave;m cho gương mặt trở n&ecirc;n mất c&acirc;n đối, mất đi n&eacute;t h&agrave;i ho&agrave; v&agrave; trở n&ecirc;n gi&agrave; hơn.</li>
</ul>

<p><img alt="Kính mắt mèo khiến cho gương mặt trở nên sắc sảo, cá tính" src="https://kinhmatanna.com/wp-content/uploads/2023/04/mat-trai-xoan-deo-kinh-gi-3.png" style="height:auto; margin-left:60px; margin-right:auto; width:480px" /></p>

<p><em>K&iacute;nh mắt m&egrave;o khiến cho gương mặt trở n&ecirc;n sắc sảo, c&aacute; t&iacute;nh</em></p>

<ul>
	<li>Chọn k&iacute;nh c&oacute; tr&ograve;ng k&iacute;nh ph&ugrave; hợp: Người c&oacute; gương mặt tr&aacute;i xoan thường c&oacute; đường viền mắt thấp hơn so với gương mặt tr&ograve;n hoặc vu&ocirc;ng, v&igrave; vậy n&ecirc;n chọn k&iacute;nh c&oacute; tr&ograve;ng k&iacute;nh thấp hơn để gi&uacute;p tạo sự c&acirc;n đối v&agrave; tăng độ cao cho đường viền mắt.</li>
	<li>Thử k&iacute;nh trực tiếp trước khi mua: Để chắc chắn chọn được kiểu k&iacute;nh ph&ugrave; hợp với gương mặt tr&aacute;i xoan, n&ecirc;n thử k&iacute;nh trực tiếp trước khi mua để kiểm tra v&agrave; đ&aacute;nh gi&aacute; hiệu quả nhất.</li>
	<li>Chọn k&iacute;nh ph&ugrave; hợp với nhu cầu sử dụng: Nếu người đeo k&iacute;nh thường xuy&ecirc;n phải sử dụng m&aacute;y t&iacute;nh hoặc l&agrave;m việc trong m&ocirc;i trường &aacute;nh s&aacute;ng mạnh, n&ecirc;n chọn k&iacute;nh chống tia UV hoặc k&iacute;nh chống ch&oacute;i để bảo vệ mắt.</li>
</ul>
', N'mat-trai-xoan-deo-kinh-gi-thi-dep.PNG', N'post', NULL, NULL, CAST(N'2023-04-27T23:04:59.120' AS DateTime), 1008, CAST(N'2023-04-27T23:04:59.120' AS DateTime), 1008, 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
SET IDENTITY_INSERT [dbo].[ProductRate] ON 

INSERT [dbo].[ProductRate] ([ID], [ProductID], [UserID], [Rate], [Comment], [UName], [CreateAt]) VALUES (1, 14, 1007, 10, N'Rất là hài lòng', N'Trần Thị Duyên', CAST(N'2023-04-23T20:06:40.540' AS DateTime))
INSERT [dbo].[ProductRate] ([ID], [ProductID], [UserID], [Rate], [Comment], [UName], [CreateAt]) VALUES (2, 11, 1007, 10, N'bdnhdd', N'Trần Thị Duyên', CAST(N'2023-04-23T22:45:52.950' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductRate] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate], [img1], [img2], [img3], [img4]) VALUES (1, N'GỌNG  SI-92424', N'gong--si-92424', 6, N'Pic2.jpg', N'Không có', 2, 2, N'<p>- Thương hiệu:&nbsp;Chemi</p>

<p>- M&atilde; sản phẩm: SI-92424</p>

<p>- Vật Liệu: Titanium</p>

<p>-&nbsp;&nbsp;K&iacute;ch thước: 53-16-135</p>

<p>- Xuất Xứ : H&agrave;n Quốc</p>

<p>- Cảnh b&aacute;o: Bảo quản trong hộp k&iacute;nh</p>

<p>- Chịu tr&aacute;ch nhiệm sản phẩm (Nhập khẩu v&agrave; ph&acirc;n phối):</p>

<p>C&Ocirc;NG TY TNHH K&Iacute;NH MẮT ANNA</p>

<p>Địa chỉ: 254 Đống Đa&nbsp;- H&agrave; Nội</p>
', N'<h1>QUY C&Aacute;CH Đ&Oacute;NG G&Oacute;I</h1>

<p>- Hộp đựng k&iacute;nh</p>

<p>- Khăn lau k&iacute;nh</p>

<p>- Thẻ bảo h&agrave;nh</p>

<p>- T&uacute;i đựng k&iacute;nh</p>

<h1>CH&Iacute;NH S&Aacute;CH VẬN CHUYỂN</h1>

<p><strong>1. THỜI GIAN GIAO H&Agrave;NG</strong></p>

<p>K&iacute;nh Mắt Việt Nam - VINAOPTIC hiểu được mong muốn nhận h&agrave;ng sớm của qu&yacute; kh&aacute;ch, tuy nhi&ecirc;n, thời gian giao h&agrave;ng của K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC c&ograve;n phụ thuộc v&agrave;o đơn vị vận chuyển của ch&uacute;ng t&ocirc;i. Th&ocirc;ng thường, thời gian giao h&agrave;ng thường mất 1 &ndash; 7 ng&agrave;y l&agrave;m việc (kh&ocirc;ng bao gồm thứ Bảy, Chủ Nhật v&agrave; Ng&agrave;y nghỉ lễ). Qu&yacute; kh&aacute;ch c&oacute; thể tham khảo bảng thời gian vận chuyển dưới đ&acirc;y của ch&uacute;ng t&ocirc;i. Xin vui l&ograve;ng lưu &yacute; rằng K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC bảo lưu quyền thay đổi thời gian giao h&agrave;ng m&agrave; kh&ocirc;ng cần b&aacute;o trước trong trường hợp chịu ảnh hưởng của thi&ecirc;n tai hoặc c&aacute;c sự kiện đặc biệt kh&aacute;c.</p>

<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td><strong>Địa chỉ nhận h&agrave;ng</strong></td>
			<td><strong>Thời gian vận chuyển</strong></td>
		</tr>
		<tr>
			<td>Nội th&agrave;nh H&agrave; Nội</td>
			<td>1 - 2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>Ngoại th&agrave;nh H&agrave; Nội</td>
			<td>2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c th&agrave;nh phố lớn</td>
			<td>2 &ndash; 4 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c tỉnh kh&aacute;c, huyện, x&atilde;, v&ugrave;ng s&acirc;u v&ugrave;ng xa</td>
			<td>2 - 7 ng&agrave;y l&agrave;m việc</td>
		</tr>
	</tbody>
</table>

<p>Trong trường hợp qu&yacute; kh&aacute;ch chọn h&igrave;nh thức thanh to&aacute;n bằng thẻ t&iacute;n dụng (credit card) hoặc chuyển khoản ng&acirc;n h&agrave;ng, thời gian xử l&yacute; đơn h&agrave;ng sẽ được t&iacute;nh kể từ khi K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC nhận được khoản thanh to&aacute;n ho&agrave;n tất của qu&yacute; kh&aacute;ch.</p>

<p>Đơn h&agrave;ng của qu&yacute; kh&aacute;ch sẽ chỉ được giao tối đa 2 lần. Trong trường hợp lần giao thứ nhất kh&ocirc;ng th&agrave;nh c&ocirc;ng, khi đ&oacute; nh&acirc;n vi&ecirc;n giao h&agrave;ng sẽ li&ecirc;n hệ với qu&yacute; kh&aacute;ch để x&aacute;c nhận ng&agrave;y giao h&agrave;ng lần 2 sau 1- 2 ng&agrave;y l&agrave;m việc kế tiếp. Ch&uacute;ng t&ocirc;i sẽ cố gắng li&ecirc;n hệ giao h&agrave;ng cho qu&yacute; kh&aacute;ch trong v&ograve;ng 02 ng&agrave;y l&agrave;m việc (th&ocirc;ng qua tin nhắn hoặc gọi trực tiếp). Trong trường hợp vẫn kh&ocirc;ng thể li&ecirc;n lạc lại được hoặc kh&ocirc;ng nhận được bất k&igrave; phản hồi n&agrave;o từ ph&iacute;a qu&yacute; kh&aacute;ch, đơn h&agrave;ng sẽ bị hủy nếu qu&yacute; kh&aacute;ch lựa chọn h&igrave;nh thức thanh to&aacute;n COD (nhờ thu hộ) hoặc sẽ được lưu giữ tại kho h&agrave;ng của ch&uacute;ng t&ocirc;i hoặc b&ecirc;n vận chuyển nếu qu&yacute; kh&aacute;ch đ&atilde; thanh to&aacute;n đơn h&agrave;ng rồi trong v&ograve;ng 24 giờ.</p>

<p>Qu&yacute; kh&aacute;ch được xem h&agrave;ng trước khi nhận h&agrave;ng v&agrave; thanh to&aacute;n. Trong trường hợp bạn gặp vấn đề ph&aacute;t sinh, bạn li&ecirc;n hệ ngay đến Sale Online&nbsp;<strong>024.3736.5505</strong>&nbsp;của ch&uacute;ng t&ocirc;i để được hỗ trợ kịp thời.</p>

<p><strong>2.CƯỚC PH&Iacute; VẬN CHUYỂN TẠI NH&Agrave;</strong></p>

<p>Để đảm bảo đơn h&agrave;ng được chuyển đến tay bạn sớm nhất, ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch bạn đặt h&agrave;ng trước 15h00 mỗi ng&agrave;y.</p>

<p><strong>3. TRA CỨU ĐƠN H&Agrave;NG Đ&Atilde; ĐẶT</strong></p>

<p>Để tra cứu trạng th&aacute;i đơn h&agrave;ng đ&atilde; đặt, qu&yacute; kh&aacute;ch vui l&ograve;ng li&ecirc;n hệ Bộ phận B&aacute;n h&agrave;ng Online&nbsp;<strong>024.3736.5505</strong>&nbsp;(Thời gian l&agrave;m việc 8:30 - 17:30 từ Thứ 2 đến Thứ 6) để được hỗ trợ nhanh nhất.</p>

<p>&nbsp;</p>

<h1>HƯỚNG DẪN C&Aacute;CH SỬ DỤNG V&Agrave; BẢO QUẢN K&Iacute;NH</h1>

<p><strong>1. KHI ĐEO V&Agrave; GỠ K&Iacute;NH PHẢI D&Ugrave;NG 2 TAY</strong></p>

<p>Một số người vẫn c&oacute; th&oacute;i quen d&ugrave;ng một tay, điều n&agrave;y thường g&acirc;y c&aacute;c t&aacute;c hại kh&ocirc;ng nhỏ đến chiếc k&iacute;nh như g&acirc;y n&ecirc;n sai lệch gọng k&iacute;nh v&agrave; t&acirc;m của mắt k&iacute;nh, qua đ&oacute; sẽ c&oacute; những ảnh hưởng đến tuổi thọ k&iacute;nh, yếu tố thẩm mỹ, thị trường nh&igrave;n.. từ đ&oacute; c&oacute; thể g&acirc;y ảnh hưởng kh&ocirc;ng tốt cho đ&ocirc;i mắt, l&agrave;m giảm hiệu quả l&agrave;m việc.</p>

<p><strong>2. KH&Ocirc;NG N&Ecirc;N THAY ĐỔI HAY CẢI BIẾN H&Igrave;NH DẠNG CỦA GỌNG K&Iacute;NH THỜI TRANG</strong></p>

<p>- Kh&ocirc;ng được tự &yacute; thay đổi hay cải biến h&igrave;nh dạng ban đầu của k&iacute;nh, tr&aacute;nh để gọng k&iacute;nh bị trầy xước, v&igrave; đ&oacute; c&oacute; thể l&agrave; nguy&ecirc;n nh&acirc;n l&agrave;m yếu v&agrave; gẫy gọng.</p>

<p>- Đối với gọng dẻo, tuy l&agrave; loại gọng kh&oacute; g&acirc;y ra c&aacute;c biến dạng. Nhưng nếu cố &yacute; bẻ cong, vặn hoặc t&aacute;c động lực mạnh th&igrave; vẫn c&oacute; thể g&acirc;y hỏng, g&atilde;y hoặc biến dạng. Do vậy, kh&ocirc;ng được cố t&igrave;nh bẻ hay vặn gọng k&iacute;nh v&agrave; tr&aacute;nh c&aacute;c va đập mạnh.</p>

<p>- Đối với loại gọng k&iacute;nh xẻ cước (gọng v&agrave;nh): Loại gọng n&agrave;y c&oacute; cấu tr&uacute;c mắt k&iacute;nh được đỡ bằng nẹp dạng nguy&ecirc;n liệu sợi (chủ yếu l&agrave; sợi nylon - cước) n&ecirc;n c&oacute; thể xảy ra trường hợp khi d&ugrave;ng l&acirc;u sẽ bị hao m&ograve;n, yếu đi dẫn tới bị đứt, l&agrave;m cho mắt k&iacute;nh bị rơi ra. Ngo&agrave;i ra, c&aacute;c loại sợi n&agrave;y cũng c&oacute; thể bị yếu, đứt do nhiệt hoặc do bị k&eacute;o căng, n&ecirc;n kh&ocirc;ng được đặt ở những nơi c&oacute; nhiệt độ cao v&agrave; tr&aacute;nh c&aacute;c va đập mạnh.</p>

<p>- Với loại gọng khoan (kh&ocirc;ng c&oacute; phần bao đỡ mắt k&iacute;nh): Loại gọng n&agrave;y c&oacute; cấu tr&uacute;c mắt k&iacute;nh được khoan c&aacute;c lỗ v&iacute;t để bắt v&agrave;o gọng k&iacute;nh. Vậy n&ecirc;n, cần đặc biệt ch&uacute; &yacute; tới độ chặt của c&aacute;c lỗ v&iacute;t hay sự biến dạng của gọng. So với c&aacute;c loại gọng k&iacute;nh liền v&agrave;nh v&agrave; b&aacute;n v&agrave;nh th&igrave; loại n&agrave;y thường rất dễ vỡ mắt n&ecirc;n phải cẩn thận khi sử dụng. V&agrave; tốt hơn l&agrave; phải sử dụng loại mắt chuy&ecirc;n dụng cho loại gọng n&agrave;y.</p>

<p>- Với loại gọng d&ugrave;ng bản lề dạng l&ograve; xo (c&oacute; thể gọi l&agrave; nh&iacute;p): Cần tr&aacute;nh việc mở hai c&agrave;ng của gọng k&iacute;nh qu&aacute; mạnh hay qu&aacute; rộng cũng dễ g&acirc;y hỏng, tr&aacute;nh tiếp x&uacute;c với kh&iacute; ẩm, bụi c&oacute; thể g&acirc;y gỉ s&eacute;t hay kẹt l&ograve; xo. Khi v&agrave;o nh&agrave; tắm, tắm hơi, tắm biển.. n&ecirc;n th&aacute;o k&iacute;nh.</p>

<p>- Khi ốc v&iacute;t của gọng k&iacute;nh bị hỏng hoặc gọng k&iacute;nh bị biến dạng dễ l&agrave;m cho mắt k&iacute;nh bị rơi ra, trong trường hợp như vậy tuyệt đối kh&ocirc;ng dung keo để gắn lại sẽ l&agrave;m cho mắt k&iacute;nh bị ảnh hưởng như mất thị trường nh&igrave;n v&agrave; những mảnh mắt k&iacute;nh bị vỡ rơi ra l&agrave;m tổn thương đến mắt, n&ecirc;n ngưng sử dụng v&agrave; mang k&iacute;nh đến K&iacute;nh Mắt Việt Nam - VinaOptic để được sửa chữa, nắn chỉnh&nbsp;v&agrave; thay ve, v&iacute;t miễn ph&iacute;.</p>

<p><strong>3. KH&Ocirc;NG ĐƯỢC CẦN TAY V&Agrave;O MẮT K&Iacute;NH</strong></p>

<p>Cầm tay v&agrave;o mắt k&iacute;nh thường l&agrave;m cho mắt k&iacute;nh bị mờ đi v&igrave; mắt k&iacute;nh rất dễ bắt d&iacute;nh dầu v&agrave; mồ h&ocirc;i, tay bị bụi bẩn cũng c&oacute; thể l&agrave;m cho k&iacute;nh bị trầy xước, ố m&agrave;u l&agrave;m cho khả năng quan s&aacute;t bị hạn chế c&oacute; thể g&acirc;y n&ecirc;n nhức mỏi mắt, đau đầu.</p>

<p><strong>4. TR&Aacute;NH KH&Iacute; N&Oacute;NG, LỬA</strong></p>

<p>- C&aacute;c loại gọng k&iacute;nh l&agrave;m bằng chất liệu nhựa v&agrave; mắt k&iacute;nh l&agrave;m bằng nhựa thường bị biến dạng ở nhiệt độ khoảng 600C, bị n&oacute;ng chảy ở nhiệt độ tr&ecirc;n 1700C.&nbsp;</p>

<p>- Kh&ocirc;ng được đặt k&iacute;nh gần c&aacute;c vật c&oacute; nhiệt độ cao như bếp ga, l&ograve; nướng, l&ograve; sưởi, b&agrave;n l&agrave; n&oacute;ng.</p>

<p>- Kh&ocirc;ng được rửa k&iacute;nh bằng nước n&oacute;ng, kh&ocirc;ng sử dụng k&iacute;nh khi tắm hơi hoặc dung m&aacute;y sấy, l&ograve; sấy để l&agrave;m kh&ocirc; k&iacute;nh.&nbsp;</p>

<p>- Kh&ocirc;ng để k&iacute;nh tr&ecirc;n c&aacute;c vật hấp thụ nhiệt mạnh như mặt b&agrave;n, b&atilde;i c&aacute;t.. dưới &aacute;nh nắng mặt trời tr&ecirc;n 300C.&nbsp;</p>

<p>- Kh&ocirc;ng n&ecirc;n để k&iacute;nh trong xe &ocirc;t&ocirc; khi đỗ xe dưới trời nắng.&nbsp;</p>

<p>- Kh&ocirc;ng để k&iacute;nh trong cốp xe m&aacute;y v&igrave; nhiệt độ trong cốp xe sẽ l&agrave;m chảy những lớp phủ chống c&aacute;c tia UV, tia hồng ngoại... của tr&ograve;ng k&iacute;nh.</p>

<p><strong>5. C&Aacute;C THAO T&Aacute;C VỆ SINH K&Iacute;NH</strong></p>

<p>- Trong qu&aacute; tr&igrave;nh sử dụng, k&iacute;nh sẽ thường xuy&ecirc;n bị b&aacute;m bụi bẩn v&agrave; việc vệ sinh k&iacute;nh cần phải tiến h&agrave;nh thường xuy&ecirc;n.&nbsp;</p>

<p>- Khi vệ sinh k&iacute;nh&nbsp;bạn n&ecirc;n d&ugrave;ng một &iacute;t nước rửa b&aacute;t để l&agrave;m sạch k&iacute;nh, sau đ&oacute; lau kh&ocirc; bằng vải mềm hoặc giấy ăn (mềm, mịn, dai, c&oacute; độ thấm nước cao)&nbsp;.&nbsp;</p>

<p>- Ch&uacute; &yacute; lau nhẹ nh&agrave;ng để tr&aacute;nh l&agrave;m trầy xước mắt k&iacute;nh, gẫy gọng k&iacute;nh, đứt sợi nylon (cước), đặc biệt với c&aacute;c loại gọng k&iacute;nh khoan v&agrave; k&iacute;nh c&oacute; thể th&aacute;o rời mắt.&nbsp;</p>

<p>- Tuyệt đối kh&ocirc;ng lau k&iacute;nh bằng quần &aacute;o đang mặc, một số người đeo k&iacute;nh do sự tiện lợi thường lau k&iacute;nh bằng c&aacute;ch n&agrave;y. Quần &aacute;o đang mặc thường c&oacute; b&aacute;m bụi bẩn, v&agrave; ch&uacute;ng cũng sẽ l&agrave;m trầy xước k&iacute;nh rất nhanh.&nbsp;</p>

<p>- Ve k&iacute;nh (miếng đệm để tỳ l&ecirc;n sống mũi): l&agrave; vật dễ bị hao m&ograve;n, n&ecirc;n s&aacute;u th&aacute;ng hay một năm một lần h&atilde;y đến K&iacute;nh mắt Việt Nam để kiểm tra v&agrave;&nbsp;thay thế miễn ph&iacute; nếu cần thiết</p>

<p><strong>6. N&Ecirc;N CẤT K&Iacute;NH V&Agrave;O HỘP KHI KH&Ocirc;NG ĐEO</strong></p>

<p>Khi kh&ocirc;ng đeo k&iacute;nh bạn n&ecirc;n bảo quản k&iacute;nh ở trong hộp (hay vỏ bao), như vậy sẽ tr&aacute;nh được c&aacute;c trường hợp k&iacute;nh v&ocirc; t&igrave;nh bị va đập, rơi vỡ, trầy xước. Hay thậm ch&iacute; trẻ em nghịch ngợm g&acirc;y hỏng h&oacute;c v.v..&nbsp;</p>

<p><strong>7. CẨN THẬN KHI MẮT K&Iacute;NH TIẾP X&Uacute;C VỚI MỸ PHẨM</strong></p>

<p>- Khi d&ugrave;ng mỹ phẩm, đồ trang điểm n&ecirc;n th&aacute;o k&iacute;nh. Nếu những ho&aacute; mỹ phẩm n&agrave;y d&iacute;nh v&agrave;o gọng hoặc mắt k&iacute;nh, ta n&ecirc;n rửa v&agrave; lau sạch.&nbsp;</p>

<p>- Kh&ocirc;ng để k&iacute;nh tiếp x&uacute;c với c&aacute;c loại etxăng (benzine), thinner hay cồn v&igrave; đ&oacute; l&agrave; nguy&ecirc;n nh&acirc;n l&agrave;m cho k&iacute;nh bị hỏng như gọng bị ăn m&ograve;n, mắt bị rỗ, biến chất, đổi m&agrave;u.</p>

<p><strong>8. VỚI NHỮNG NGƯỜI DỄ BỊ DỊ ỨNG</strong></p>

<p>- Trong trường hợp gọng k&iacute;nh bị trầy xước, gỉ s&eacute;t hay vỡ lớp bọc ngo&agrave;i c&ugrave;ng, nếu cứ tiếp tục sử dụng c&oacute; thể g&acirc;y ảnh hưởng kh&ocirc;ng tốt cho da.&nbsp;</p>

<p>- Khi bị ngứa, tr&oacute;c da hay c&oacute; hiện tượng l&agrave; ở những phần da tiếp x&uacute;c với k&iacute;nh, h&atilde;y ngưng sử dụng v&agrave; đến ph&ograve;ng kh&aacute;m để kh&aacute;m. Khi đ&oacute; c&ugrave;ng với việc điều trị c&aacute;c dị ứng, sẽ phải dung những loại gọng k&iacute;nh c&oacute; chất liệu ph&ugrave; hợp với cơ địa của m&igrave;nh.</p>

<p><strong>9. KIỂM TRA MẮT ĐỊNH KỲ&nbsp;</strong></p>

<p>- Cơ thể con người lu&ocirc;n ph&aacute;t triển hay tho&aacute;i triển, g&acirc;y n&ecirc;n hiện tượng thay đổi số độ sau một thời gian, chiếc k&iacute;nh đeo mắt cũng sẽ bị hao m&ograve;n v&agrave; chỉ c&oacute; tuổi thọ nhất định, mắt k&iacute;nh c&oacute; thể bị ngả m&agrave;u, trầy xước.&nbsp;</p>

<p>- Sau 6 th&aacute;ng bạn n&ecirc;n đến K&iacute;nh Mắt Việt Nam để kiểm tra t&igrave;nh trạng chiếc k&iacute;nh đang sử dụng, để thay thế mắt k&iacute;nh bị l&atilde;o ho&aacute; v&agrave; kiểm tra lại thị lực của m&igrave;nh.</p>
', N'123', 138000, 9, 118000, N'Gọng kính chemi', N'Gọng kính chemi', 1, CAST(N'2023-05-04T20:05:57.000' AS DateTime), 20, CAST(N'2023-05-08T22:27:01.717' AS DateTime), 1008, 0, N'Pic2_sup1.jpg', N'Pic2_sup2.jpg', N'Pic2_sup3.jpg', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate], [img1], [img2], [img3], [img4]) VALUES (2, N'TRÒNG KÍNH ĐỔI MÀU - TRÁNG CÚNG TRIẾT SUỐT 156', N'trong-kinh-doi-mau---trang-cung-triet-suat-156', 14, N'mat1.jpg', NULL, 2, 2, N'<p>- Thương hiệu: Đang cập nhật</p>

<p>- M&atilde; sản phẩm:&nbsp;1.59 blue cut, HMC</p>

<p>- Vật Liệu: Plastic</p>

<p>-&nbsp;&nbsp;K&iacute;ch thước:&nbsp;65mm-75mm</p>

<p>- Xuất Xứ : Đang cập nhật</p>

<p>-T&iacute;nh năng: Chất liệu Polycarbonate chống vỡ, ngăn đến &aacute;nh s&aacute;ng xanh, chống phản quang, giảm ch&oacute;i l&oacute;a, ngăn b&aacute;m dầu, b&aacute;m bụi, ngăn tia UV400</p>

<p>- Cảnh b&aacute;o: Bảo quản trong hộp k&iacute;nh</p>

<p>- Chịu tr&aacute;ch nhiệm sản phẩm (Nhập khẩu v&agrave; ph&acirc;n phối):</p>

<p>C&Ocirc;NG TY TNHH K&Iacute;NH MẮT VIỆT NAM</p>

<p>Địa chỉ: 138B Giảng V&otilde; - Ba Đ&igrave;nh - H&agrave; Nội</p>
', N'<h1>ĐỘ CẦU SPH:</h1>

<p>ĐỘ CẬN (-), VIỄN (+)</p>

<p>0.00 &rarr; &plusmn;4.00</p>

<p>&plusmn;4.25 &rarr; &plusmn;6.00</p>

<p>ĐỘ LOẠN CYL: ĐỘ LOẠN (&plusmn;)</p>

<p>0.00 &rarr; -2.00</p>

<h1>QUY C&Aacute;CH Đ&Oacute;NG G&Oacute;I</h1>

<p>Đựng trong vỏ bao</p>
', N'', 450000, 40, 440000, N'MẮT ĐƠN TRÒNG 1.59 BLUE CUT, HMC', N'MẮT ĐƠN TRÒNG 1.59 BLUE CUT, HMC', 1, CAST(N'2023-05-04T20:05:57.000' AS DateTime), 21, CAST(N'2023-05-11T22:45:06.923' AS DateTime), 1008, 0, N'mat2.jpg', N'mat3.jpg', N'mat4.jpg', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate], [img1], [img2], [img3], [img4]) VALUES (3, N'TRÒNG KÍNH ĐỔI MÀU - NANO/UV TRIẾT SUỐT 156', N'trong-kinh-doi-mau---nano/uv-triet-suat-156', 16, N'mat5.jpg', NULL, 2, 2, N'<p>- Thương hiệu:&nbsp;TOKAI</p>

<p>- M&atilde; sản phẩm:&nbsp;1.70 SERENO IS SPS UV400</p>

<p>- Vật Liệu: Plastic</p>

<p>-&nbsp;&nbsp;K&iacute;ch thước:&nbsp;65mm-75mm</p>

<p>- Xuất Xứ : Nhật Bản</p>

<p>-T&iacute;nh năng: Giảm trầy xước tối ưu, chống phản quang, hạn chế b&aacute;m dầu, b&aacute;m nước, b&aacute;m bụi, dễ lau ch&ugrave;i, ngăn rạn nứt, ngăn tia UV 400</p>

<p>- Cảnh b&aacute;o: Bảo quản trong hộp k&iacute;nh</p>

<p>- Chịu tr&aacute;ch nhiệm sản phẩm (Nhập khẩu v&agrave; ph&acirc;n phối):</p>

<p>C&Ocirc;NG TY TNHH K&Iacute;NH MẮT VIỆT NAM</p>

<p>Địa chỉ: 138B Giảng V&otilde; - Ba Đ&igrave;nh - H&agrave; Nội</p>
', N'<p><strong>ADD</strong></p>

<p>+1.00 &rarr; +3.00</p>

<p><strong>ĐỘ CẦU SPH: ĐỘ CẬN (-), VIỄN (+)</strong></p>

<p>0.00</p>

<p>+0.50 &rarr; +3.00</p>

<p><strong>ĐỘ LOẠN CYL: ĐỘ LOẠN (&plusmn;)</strong></p>

<p>0.00</p>

<p>&nbsp;</p>

<p><strong>QUY C&Aacute;CH Đ&Oacute;NG G&Oacute;I</strong></p>

<p>Đựng trong vỏ bao</p>
', N'', 580000, 30, 560000, N'MẮT ĐA TRÒNG TOKAI CHIẾT SUẤT 1.70 SERENO IS SPS UV400', N'MẮT ĐA TRÒNG TOKAI CHIẾT SUẤT 1.70 SERENO IS SPS UV400', 1, CAST(N'2023-05-04T20:05:57.000' AS DateTime), 21, CAST(N'2023-05-11T22:46:22.290' AS DateTime), 1008, 0, N'mat6.jpg', N'mat7.jpg', N'mat25.jpg', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate], [img1], [img2], [img3], [img4]) VALUES (4, N'Kính áp tròng AT 456CN500', N'kinh-ap-trong-at-456cn500', 3, N'trong1 - Copy (2).png', N'không có', 2, 2, N'<h1>Đang cập nhật th&ocirc;ng tin</h1>
', N'<p>SỐ LƯỢNG</p>

<p>1 Mắt K&iacute;nh&nbsp; | 1 Hộp (30 Mắt K&iacute;nh)</p>

<p>ĐỘ CẦU SPH: ĐỘ CẬN (-), VIỄN (+)</p>

<p>0.00</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', N'', 250000, 15, 210000, N'KÍNH ÁP TRÒNG 1 NGÀY CLALEN IRIS MÀU SUZY GRAY', N'KÍNH ÁP TRÒNG 1 NGÀY CLALEN IRIS MÀU SUZY GRAY', 1, CAST(N'2021-03-31T16:31:17.000' AS DateTime), 21, CAST(N'2023-05-13T20:47:06.407' AS DateTime), 1008, 0, N'trong1 - Copy (3).png', N'trong1 - Copy.png', N'trong1.png', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate], [img1], [img2], [img3], [img4]) VALUES (5, N'TRÒNG KÍNH ĐỔI MÀU - NANO/UV TRIẾT SUỐT 175', N'trong-kinh-doi-mau---nano/uv-triet-suot-175', 17, N'mat16.jpg', N'không có', 2, 2, N'<p>- Thương hiệu: Đang cập nhật</p>

<p>- M&atilde; sản phẩm:&nbsp;1.56 HMC</p>

<p>- Vật Liệu: Plastic</p>

<p>-&nbsp;&nbsp;K&iacute;ch thước:&nbsp;65mm-75mm</p>

<p>- Xuất Xứ : Đang cập nhật</p>

<p>-T&iacute;nh năng: Ngăn đến &aacute;nh s&aacute;ng xanh, chống phản quang, giảm ch&oacute;i l&oacute;a, ngăn b&aacute;m dầu, b&aacute;m bụi, UV400</p>

<p>- Cảnh b&aacute;o: Bảo quản trong hộp k&iacute;nh</p>

<p>- Chịu tr&aacute;ch nhiệm sản phẩm (Nhập khẩu v&agrave; ph&acirc;n phối):</p>

<p>C&Ocirc;NG TY TNHH K&Iacute;NH MẮT VIỆT NAM</p>

<p>Địa chỉ: 138B Giảng V&otilde; - Ba Đ&igrave;nh - H&agrave; Nội</p>
', N'<h1>ĐỘ CẦU SPH:</h1>

<p>ĐỘ CẬN (-), VIỄN (+)</p>

<p>0.00 &rarr; &plusmn;4.00</p>

<p>&plusmn;4.25 &rarr; &plusmn;6.00</p>

<p>-6.25 &rarr; -8.00</p>

<p>-8.25 &rarr; -10.00</p>

<p>ĐỘ LOẠN CYL: ĐỘ LOẠN (&plusmn;)</p>

<p>0.00 &rarr; -2.00</p>

<p>-2.25 &rarr; -4.00</p>

<h1>QUY C&Aacute;CH Đ&Oacute;NG G&Oacute;I</h1>

<p>Đựng trong vỏ bao</p>

<h1>CH&Iacute;NH S&Aacute;CH VẬN CHUYỂN</h1>

<p><strong>1. THỜI GIAN GIAO H&Agrave;NG</strong></p>

<p>K&iacute;nh Mắt Việt Nam - VINAOPTIC hiểu được mong muốn nhận h&agrave;ng sớm của qu&yacute; kh&aacute;ch, tuy nhi&ecirc;n, thời gian giao h&agrave;ng của K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC c&ograve;n phụ thuộc v&agrave;o đơn vị vận chuyển của ch&uacute;ng t&ocirc;i. Th&ocirc;ng thường, thời gian giao h&agrave;ng thường mất 1 &ndash; 7 ng&agrave;y l&agrave;m việc (kh&ocirc;ng bao gồm thứ Bảy, Chủ Nhật v&agrave; Ng&agrave;y nghỉ lễ). Qu&yacute; kh&aacute;ch c&oacute; thể tham khảo bảng thời gian vận chuyển dưới đ&acirc;y của ch&uacute;ng t&ocirc;i. Xin vui l&ograve;ng lưu &yacute; rằng K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC bảo lưu quyền thay đổi thời gian giao h&agrave;ng m&agrave; kh&ocirc;ng cần b&aacute;o trước trong trường hợp chịu ảnh hưởng của thi&ecirc;n tai hoặc c&aacute;c sự kiện đặc biệt kh&aacute;c.</p>

<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td><strong>Địa chỉ nhận h&agrave;ng</strong></td>
			<td><strong>Thời gian vận chuyển</strong></td>
		</tr>
		<tr>
			<td>Nội th&agrave;nh H&agrave; Nội</td>
			<td>1 - 2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>Ngoại th&agrave;nh H&agrave; Nội</td>
			<td>2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c th&agrave;nh phố lớn</td>
			<td>2 &ndash; 4 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c tỉnh kh&aacute;c, huyện, x&atilde;, v&ugrave;ng s&acirc;u v&ugrave;ng xa</td>
			<td>2 - 7 ng&agrave;y l&agrave;m việc</td>
		</tr>
	</tbody>
</table>

<p>Trong trường hợp qu&yacute; kh&aacute;ch chọn h&igrave;nh thức thanh to&aacute;n bằng thẻ t&iacute;n dụng (credit card) hoặc chuyển khoản ng&acirc;n h&agrave;ng, thời gian xử l&yacute; đơn h&agrave;ng sẽ được t&iacute;nh kể từ khi K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC nhận được khoản thanh to&aacute;n ho&agrave;n tất của qu&yacute; kh&aacute;ch.</p>

<p>Đơn h&agrave;ng của qu&yacute; kh&aacute;ch sẽ chỉ được giao tối đa 2 lần. Trong trường hợp lần giao thứ nhất kh&ocirc;ng th&agrave;nh c&ocirc;ng, khi đ&oacute; nh&acirc;n vi&ecirc;n giao h&agrave;ng sẽ li&ecirc;n hệ với qu&yacute; kh&aacute;ch để x&aacute;c nhận ng&agrave;y giao h&agrave;ng lần 2 sau 1- 2 ng&agrave;y l&agrave;m việc kế tiếp. Ch&uacute;ng t&ocirc;i sẽ cố gắng li&ecirc;n hệ giao h&agrave;ng cho qu&yacute; kh&aacute;ch trong v&ograve;ng 02 ng&agrave;y l&agrave;m việc (th&ocirc;ng qua tin nhắn hoặc gọi trực tiếp). Trong trường hợp vẫn kh&ocirc;ng thể li&ecirc;n lạc lại được hoặc kh&ocirc;ng nhận được bất k&igrave; phản hồi n&agrave;o từ ph&iacute;a qu&yacute; kh&aacute;ch, đơn h&agrave;ng sẽ bị hủy nếu qu&yacute; kh&aacute;ch lựa chọn h&igrave;nh thức thanh to&aacute;n COD (nhờ thu hộ) hoặc sẽ được lưu giữ tại kho h&agrave;ng của ch&uacute;ng t&ocirc;i hoặc b&ecirc;n vận chuyển nếu qu&yacute; kh&aacute;ch đ&atilde; thanh to&aacute;n đơn h&agrave;ng rồi trong v&ograve;ng 24 giờ.</p>

<p>Qu&yacute; kh&aacute;ch được xem h&agrave;ng trước khi nhận h&agrave;ng v&agrave; thanh to&aacute;n. Trong trường hợp bạn gặp vấn đề ph&aacute;t sinh, bạn li&ecirc;n hệ ngay đến Sale Online&nbsp;<strong>024.3736.5505</strong>&nbsp;của ch&uacute;ng t&ocirc;i để được hỗ trợ kịp thời.</p>

<p><strong>2.CƯỚC PH&Iacute; VẬN CHUYỂN TẠI NH&Agrave;</strong></p>

<p>Để đảm bảo đơn h&agrave;ng được chuyển đến tay bạn sớm nhất, ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch bạn đặt h&agrave;ng trước 15h00 mỗi ng&agrave;y.</p>

<p><strong>3. TRA CỨU ĐƠN H&Agrave;NG Đ&Atilde; ĐẶT</strong></p>

<p>Để tra cứu trạng th&aacute;i đơn h&agrave;ng đ&atilde; đặt, qu&yacute; kh&aacute;ch vui l&ograve;ng li&ecirc;n hệ Bộ phận B&aacute;n h&agrave;ng Online&nbsp;<strong>024.3736.5505</strong>&nbsp;(Thời gian l&agrave;m việc 8:30 - 17:30 từ Thứ 2 đến Thứ 6) để được hỗ trợ nhanh nhất.</p>
', N'', 1150000, 15, 999000, N'MẮT ĐƠN TRÒNG BLUE CUT 1.56 HMC', N'MẮT ĐƠN TRÒNG BLUE CUT 1.56 HMC', 1, CAST(N'2021-03-31T16:32:32.000' AS DateTime), 21, CAST(N'2023-05-11T22:59:39.113' AS DateTime), 1008, 0, N'mat17.jpg', N'mat18.jpg', N'mat19.jpg', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate], [img1], [img2], [img3], [img4]) VALUES (6, N'KR 890NG230', N'kr-890ng230', 13, N'ram13.jpeg', N'Không có', 2, 2, N'<p>- Thương hiệu:&nbsp;Chrome Hearts</p>

<p>- M&atilde; sản phẩm:&nbsp;PREYANK</p>

<p>- Vật Liệu: Nhựa/Kim Loại</p>

<p>-&nbsp;&nbsp;K&iacute;ch thước: 59-15-135</p>

<p>- Xuất Xứ : Đang cập nhật</p>

<p>- Cảnh b&aacute;o: Bảo quản trong hộp k&iacute;nh</p>

<p>- Chịu tr&aacute;ch nhiệm sản phẩm (Nhập khẩu v&agrave; ph&acirc;n phối):</p>

<p>C&Ocirc;NG TY TNHH K&Iacute;NH MẮT VIỆT NAM</p>

<p>Địa chỉ: 138B Giảng V&otilde; - Ba Đ&igrave;nh - H&agrave; Nội</p>
', N'<h1>QUY C&Aacute;CH Đ&Oacute;NG G&Oacute;I</h1>

<p>- Hộp đựng k&iacute;nh</p>

<p>- Khăn lau k&iacute;nh</p>

<p>- Thẻ bảo h&agrave;nh</p>

<p>- T&uacute;i đựng k&iacute;nh</p>

<h1>CH&Iacute;NH S&Aacute;CH VẬN CHUYỂN</h1>

<p><strong>1. THỜI GIAN GIAO H&Agrave;NG</strong></p>

<p>K&iacute;nh Mắt Việt Nam - VINAOPTIC hiểu được mong muốn nhận h&agrave;ng sớm của qu&yacute; kh&aacute;ch, tuy nhi&ecirc;n, thời gian giao h&agrave;ng của K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC c&ograve;n phụ thuộc v&agrave;o đơn vị vận chuyển của ch&uacute;ng t&ocirc;i. Th&ocirc;ng thường, thời gian giao h&agrave;ng thường mất 1 &ndash; 7 ng&agrave;y l&agrave;m việc (kh&ocirc;ng bao gồm thứ Bảy, Chủ Nhật v&agrave; Ng&agrave;y nghỉ lễ). Qu&yacute; kh&aacute;ch c&oacute; thể tham khảo bảng thời gian vận chuyển dưới đ&acirc;y của ch&uacute;ng t&ocirc;i. Xin vui l&ograve;ng lưu &yacute; rằng K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC bảo lưu quyền thay đổi thời gian giao h&agrave;ng m&agrave; kh&ocirc;ng cần b&aacute;o trước trong trường hợp chịu ảnh hưởng của thi&ecirc;n tai hoặc c&aacute;c sự kiện đặc biệt kh&aacute;c.</p>

<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td><strong>Địa chỉ nhận h&agrave;ng</strong></td>
			<td><strong>Thời gian vận chuyển</strong></td>
		</tr>
		<tr>
			<td>Nội th&agrave;nh H&agrave; Nội</td>
			<td>1 - 2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>Ngoại th&agrave;nh H&agrave; Nội</td>
			<td>2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c th&agrave;nh phố lớn</td>
			<td>2 &ndash; 4 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c tỉnh kh&aacute;c, huyện, x&atilde;, v&ugrave;ng s&acirc;u v&ugrave;ng xa</td>
			<td>2 - 7 ng&agrave;y l&agrave;m việc</td>
		</tr>
	</tbody>
</table>

<p>Trong trường hợp qu&yacute; kh&aacute;ch chọn h&igrave;nh thức thanh to&aacute;n bằng thẻ t&iacute;n dụng (credit card) hoặc chuyển khoản ng&acirc;n h&agrave;ng, thời gian xử l&yacute; đơn h&agrave;ng sẽ được t&iacute;nh kể từ khi K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC nhận được khoản thanh to&aacute;n ho&agrave;n tất của qu&yacute; kh&aacute;ch.</p>

<p>Đơn h&agrave;ng của qu&yacute; kh&aacute;ch sẽ chỉ được giao tối đa 2 lần. Trong trường hợp lần giao thứ nhất kh&ocirc;ng th&agrave;nh c&ocirc;ng, khi đ&oacute; nh&acirc;n vi&ecirc;n giao h&agrave;ng sẽ li&ecirc;n hệ với qu&yacute; kh&aacute;ch để x&aacute;c nhận ng&agrave;y giao h&agrave;ng lần 2 sau 1- 2 ng&agrave;y l&agrave;m việc kế tiếp. Ch&uacute;ng t&ocirc;i sẽ cố gắng li&ecirc;n hệ giao h&agrave;ng cho qu&yacute; kh&aacute;ch trong v&ograve;ng 02 ng&agrave;y l&agrave;m việc (th&ocirc;ng qua tin nhắn hoặc gọi trực tiếp). Trong trường hợp vẫn kh&ocirc;ng thể li&ecirc;n lạc lại được hoặc kh&ocirc;ng nhận được bất k&igrave; phản hồi n&agrave;o từ ph&iacute;a qu&yacute; kh&aacute;ch, đơn h&agrave;ng sẽ bị hủy nếu qu&yacute; kh&aacute;ch lựa chọn h&igrave;nh thức thanh to&aacute;n COD (nhờ thu hộ) hoặc sẽ được lưu giữ tại kho h&agrave;ng của ch&uacute;ng t&ocirc;i hoặc b&ecirc;n vận chuyển nếu qu&yacute; kh&aacute;ch đ&atilde; thanh to&aacute;n đơn h&agrave;ng rồi trong v&ograve;ng 24 giờ.</p>

<p>Qu&yacute; kh&aacute;ch được xem h&agrave;ng trước khi nhận h&agrave;ng v&agrave; thanh to&aacute;n. Trong trường hợp bạn gặp vấn đề ph&aacute;t sinh, bạn li&ecirc;n hệ ngay đến Sale Online&nbsp;<strong>024.3736.5505</strong>&nbsp;của ch&uacute;ng t&ocirc;i để được hỗ trợ kịp thời.</p>

<p><strong>2.CƯỚC PH&Iacute; VẬN CHUYỂN TẠI NH&Agrave;</strong></p>

<p>Để đảm bảo đơn h&agrave;ng được chuyển đến tay bạn sớm nhất, ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch bạn đặt h&agrave;ng trước 15h00 mỗi ng&agrave;y.</p>

<p><strong>3. TRA CỨU ĐƠN H&Agrave;NG Đ&Atilde; ĐẶT</strong></p>

<p>Để tra cứu trạng th&aacute;i đơn h&agrave;ng đ&atilde; đặt, qu&yacute; kh&aacute;ch vui l&ograve;ng li&ecirc;n hệ Bộ phận B&aacute;n h&agrave;ng Online&nbsp;<strong>024.3736.5505</strong>&nbsp;(Thời gian l&agrave;m việc 8:30 - 17:30 từ Thứ 2 đến Thứ 6) để được hỗ trợ nhanh nhất.</p>
', N'', 1450000, 10, 1399000, N'KÍNH CHROME HEARTS PREYANK', N'KÍNH CHROME HEARTS PREYANK', 1, CAST(N'2021-03-31T16:33:58.000' AS DateTime), 21, CAST(N'2023-05-11T22:57:40.743' AS DateTime), 1008, 0, N'ram37.jpeg', N'ram38.jpeg', N'ram42.jpeg', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate], [img1], [img2], [img3], [img4]) VALUES (7, N'KR 678CN908', N'kr-678cn908', 12, N'ram11.jpeg', N'Không có ', 1, 3, N'<p>- Thương hiệu:&nbsp;Horien</p>

<p>- M&atilde; sản phẩm:&nbsp;N6902</p>

<p>- Vật Liệu: Nhựa/Kim Loại</p>

<p>-&nbsp; K&iacute;ch thước:&nbsp;60-16-145</p>

<p>- Xuất Xứ : Trung Quốc</p>

<p>- Cảnh b&aacute;o: Bảo quản trong hộp k&iacute;nh</p>

<p>- Chịu tr&aacute;ch nhiệm sản phẩm (Nhập khẩu v&agrave; ph&acirc;n phối)</p>

<p>C&Ocirc;NG TY TNHH K&Iacute;NH MẮT VIỆT NAM</p>

<p>Địa chỉ: 138B Giảng V&otilde; - Ba Đ&igrave;nh - H&agrave; Nội</p>
', N'<h1>QUY C&Aacute;CH Đ&Oacute;NG G&Oacute;I</h1>

<p>- Hộp đựng k&iacute;nh</p>

<p>- Khăn lau k&iacute;nh</p>

<p>- Thẻ bảo h&agrave;nh</p>

<p>- T&uacute;i đựng k&iacute;nh</p>

<p>&nbsp;</p>

<h1>CH&Iacute;NH S&Aacute;CH VẬN CHUYỂN</h1>

<p><strong>1. THỜI GIAN GIAO H&Agrave;NG</strong></p>

<p>K&iacute;nh Mắt Việt Nam - VINAOPTIC hiểu được mong muốn nhận h&agrave;ng sớm của qu&yacute; kh&aacute;ch, tuy nhi&ecirc;n, thời gian giao h&agrave;ng của K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC c&ograve;n phụ thuộc v&agrave;o đơn vị vận chuyển của ch&uacute;ng t&ocirc;i. Th&ocirc;ng thường, thời gian giao h&agrave;ng thường mất 1 &ndash; 7 ng&agrave;y l&agrave;m việc (kh&ocirc;ng bao gồm thứ Bảy, Chủ Nhật v&agrave; Ng&agrave;y nghỉ lễ). Qu&yacute; kh&aacute;ch c&oacute; thể tham khảo bảng thời gian vận chuyển dưới đ&acirc;y của ch&uacute;ng t&ocirc;i. Xin vui l&ograve;ng lưu &yacute; rằng K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC bảo lưu quyền thay đổi thời gian giao h&agrave;ng m&agrave; kh&ocirc;ng cần b&aacute;o trước trong trường hợp chịu ảnh hưởng của thi&ecirc;n tai hoặc c&aacute;c sự kiện đặc biệt kh&aacute;c.</p>

<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td><strong>Địa chỉ nhận h&agrave;ng</strong></td>
			<td><strong>Thời gian vận chuyển</strong></td>
		</tr>
		<tr>
			<td>Nội th&agrave;nh H&agrave; Nội</td>
			<td>1 - 2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>Ngoại th&agrave;nh H&agrave; Nội</td>
			<td>2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c th&agrave;nh phố lớn</td>
			<td>2 &ndash; 4 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c tỉnh kh&aacute;c, huyện, x&atilde;, v&ugrave;ng s&acirc;u v&ugrave;ng xa</td>
			<td>2 - 7 ng&agrave;y l&agrave;m việc</td>
		</tr>
	</tbody>
</table>

<p>Trong trường hợp qu&yacute; kh&aacute;ch chọn h&igrave;nh thức thanh to&aacute;n bằng thẻ t&iacute;n dụng (credit card) hoặc chuyển khoản ng&acirc;n h&agrave;ng, thời gian xử l&yacute; đơn h&agrave;ng sẽ được t&iacute;nh kể từ khi K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC nhận được khoản thanh to&aacute;n ho&agrave;n tất của qu&yacute; kh&aacute;ch.</p>

<p>Đơn h&agrave;ng của qu&yacute; kh&aacute;ch sẽ chỉ được giao tối đa 2 lần. Trong trường hợp lần giao thứ nhất kh&ocirc;ng th&agrave;nh c&ocirc;ng, khi đ&oacute; nh&acirc;n vi&ecirc;n giao h&agrave;ng sẽ li&ecirc;n hệ với qu&yacute; kh&aacute;ch để x&aacute;c nhận ng&agrave;y giao h&agrave;ng lần 2 sau 1- 2 ng&agrave;y l&agrave;m việc kế tiếp. Ch&uacute;ng t&ocirc;i sẽ cố gắng li&ecirc;n hệ giao h&agrave;ng cho qu&yacute; kh&aacute;ch trong v&ograve;ng 02 ng&agrave;y l&agrave;m việc (th&ocirc;ng qua tin nhắn hoặc gọi trực tiếp). Trong trường hợp vẫn kh&ocirc;ng thể li&ecirc;n lạc lại được hoặc kh&ocirc;ng nhận được bất k&igrave; phản hồi n&agrave;o từ ph&iacute;a qu&yacute; kh&aacute;ch, đơn h&agrave;ng sẽ bị hủy nếu qu&yacute; kh&aacute;ch lựa chọn h&igrave;nh thức thanh to&aacute;n COD (nhờ thu hộ) hoặc sẽ được lưu giữ tại kho h&agrave;ng của ch&uacute;ng t&ocirc;i hoặc b&ecirc;n vận chuyển nếu qu&yacute; kh&aacute;ch đ&atilde; thanh to&aacute;n đơn h&agrave;ng rồi trong v&ograve;ng 24 giờ.</p>

<p>Qu&yacute; kh&aacute;ch được xem h&agrave;ng trước khi nhận h&agrave;ng v&agrave; thanh to&aacute;n. Trong trường hợp bạn gặp vấn đề ph&aacute;t sinh, bạn li&ecirc;n hệ ngay đến Sale Online&nbsp;<strong>024.3736.5505</strong>&nbsp;của ch&uacute;ng t&ocirc;i để được hỗ trợ kịp thời.</p>

<p><strong>2.CƯỚC PH&Iacute; VẬN CHUYỂN TẠI NH&Agrave;</strong></p>

<p>Để đảm bảo đơn h&agrave;ng được chuyển đến tay bạn sớm nhất, ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch bạn đặt h&agrave;ng trước 15h00 mỗi ng&agrave;y.</p>

<p><strong>3. TRA CỨU ĐƠN H&Agrave;NG Đ&Atilde; ĐẶT</strong></p>

<p>Để tra cứu trạng th&aacute;i đơn h&agrave;ng đ&atilde; đặt, qu&yacute; kh&aacute;ch vui l&ograve;ng li&ecirc;n hệ Bộ phận B&aacute;n h&agrave;ng Online&nbsp;<strong>024.3736.5505</strong>&nbsp;(Thời gian l&agrave;m việc 8:30 - 17:30 từ Thứ 2 đến Thứ 6) để được hỗ trợ nhanh nhất.</p>
', N'', 1300000, 17, 1299000, N'KÍNH HORIEN N6902', N'KÍNH HORIEN N6902', 1, CAST(N'2021-03-31T16:34:58.000' AS DateTime), 21, CAST(N'2023-05-11T22:56:08.930' AS DateTime), 1008, 0, N'ram43.jpeg', N'ram45.jpeg', N'ram47.jpeg', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate], [img1], [img2], [img3], [img4]) VALUES (8, N'GỌNG KI 567CN780', N'gong-ki-567cn780', 11, N'Pic8_sup1.jpg', N'Không có', 1, 3, N'<p>- Thương hiệu:&nbsp;Cartier</p>

<p>- M&atilde; sản phẩm:&nbsp;CT0042O</p>

<p>- Vật Liệu: Nhựa/Kim loại</p>

<p>-&nbsp;&nbsp;K&iacute;ch thước: 60-20-140</p>

<p>- Xuất Xứ : Đang cập nhật</p>

<p>- Cảnh b&aacute;o: Bảo quản trong hộp k&iacute;nh</p>

<p>- Chịu tr&aacute;ch nhiệm sản phẩm (Nhập khẩu v&agrave; ph&acirc;n phối):</p>

<p>C&Ocirc;NG TY TNHH K&Iacute;NH MẮT VIỆT NAM</p>

<p>Địa chỉ: 138B Giảng V&otilde; - Ba Đ&igrave;nh - H&agrave; Nội</p>
', N'<h1>QUY C&Aacute;CH Đ&Oacute;NG G&Oacute;I</h1>

<p>- Hộp đựng k&iacute;nh</p>

<p>- Khăn lau k&iacute;nh cao cấp</p>

<p>- Thẻ bảo h&agrave;nh</p>

<p>- T&uacute;i đựng k&iacute;nh</p>

<p>&nbsp;</p>

<h1>CH&Iacute;NH S&Aacute;CH VẬN CHUYỂN</h1>

<p><strong>1. THỜI GIAN GIAO H&Agrave;NG</strong></p>

<p>K&iacute;nh Mắt Việt Nam - VINAOPTIC hiểu được mong muốn nhận h&agrave;ng sớm của qu&yacute; kh&aacute;ch, tuy nhi&ecirc;n, thời gian giao h&agrave;ng của K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC c&ograve;n phụ thuộc v&agrave;o đơn vị vận chuyển của ch&uacute;ng t&ocirc;i. Th&ocirc;ng thường, thời gian giao h&agrave;ng thường mất 1 &ndash; 7 ng&agrave;y l&agrave;m việc (kh&ocirc;ng bao gồm thứ Bảy, Chủ Nhật v&agrave; Ng&agrave;y nghỉ lễ). Qu&yacute; kh&aacute;ch c&oacute; thể tham khảo bảng thời gian vận chuyển dưới đ&acirc;y của ch&uacute;ng t&ocirc;i. Xin vui l&ograve;ng lưu &yacute; rằng K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC bảo lưu quyền thay đổi thời gian giao h&agrave;ng m&agrave; kh&ocirc;ng cần b&aacute;o trước trong trường hợp chịu ảnh hưởng của thi&ecirc;n tai hoặc c&aacute;c sự kiện đặc biệt kh&aacute;c.</p>

<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td><strong>Địa chỉ nhận h&agrave;ng</strong></td>
			<td><strong>Thời gian vận chuyển</strong></td>
		</tr>
		<tr>
			<td>Nội th&agrave;nh H&agrave; Nội</td>
			<td>1 - 2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>Ngoại th&agrave;nh H&agrave; Nội</td>
			<td>2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c th&agrave;nh phố lớn</td>
			<td>2 &ndash; 4 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c tỉnh kh&aacute;c, huyện, x&atilde;, v&ugrave;ng s&acirc;u v&ugrave;ng xa</td>
			<td>2 - 7 ng&agrave;y l&agrave;m việc</td>
		</tr>
	</tbody>
</table>

<p>Trong trường hợp qu&yacute; kh&aacute;ch chọn h&igrave;nh thức thanh to&aacute;n bằng thẻ t&iacute;n dụng (credit card) hoặc chuyển khoản ng&acirc;n h&agrave;ng, thời gian xử l&yacute; đơn h&agrave;ng sẽ được t&iacute;nh kể từ khi K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC nhận được khoản thanh to&aacute;n ho&agrave;n tất của qu&yacute; kh&aacute;ch.</p>

<p>Đơn h&agrave;ng của qu&yacute; kh&aacute;ch sẽ chỉ được giao tối đa 2 lần. Trong trường hợp lần giao thứ nhất kh&ocirc;ng th&agrave;nh c&ocirc;ng, khi đ&oacute; nh&acirc;n vi&ecirc;n giao h&agrave;ng sẽ li&ecirc;n hệ với qu&yacute; kh&aacute;ch để x&aacute;c nhận ng&agrave;y giao h&agrave;ng lần 2 sau 1- 2 ng&agrave;y l&agrave;m việc kế tiếp. Ch&uacute;ng t&ocirc;i sẽ cố gắng li&ecirc;n hệ giao h&agrave;ng cho qu&yacute; kh&aacute;ch trong v&ograve;ng 02 ng&agrave;y l&agrave;m việc (th&ocirc;ng qua tin nhắn hoặc gọi trực tiếp). Trong trường hợp vẫn kh&ocirc;ng thể li&ecirc;n lạc lại được hoặc kh&ocirc;ng nhận được bất k&igrave; phản hồi n&agrave;o từ ph&iacute;a qu&yacute; kh&aacute;ch, đơn h&agrave;ng sẽ bị hủy nếu qu&yacute; kh&aacute;ch lựa chọn h&igrave;nh thức thanh to&aacute;n COD (nhờ thu hộ) hoặc sẽ được lưu giữ tại kho h&agrave;ng của ch&uacute;ng t&ocirc;i hoặc b&ecirc;n vận chuyển nếu qu&yacute; kh&aacute;ch đ&atilde; thanh to&aacute;n đơn h&agrave;ng rồi trong v&ograve;ng 24 giờ.</p>

<p>Qu&yacute; kh&aacute;ch được xem h&agrave;ng trước khi nhận h&agrave;ng v&agrave; thanh to&aacute;n. Trong trường hợp bạn gặp vấn đề ph&aacute;t sinh, bạn li&ecirc;n hệ ngay đến Sale Online&nbsp;<strong>024.3736.5505</strong>&nbsp;của ch&uacute;ng t&ocirc;i để được hỗ trợ kịp thời.</p>

<p><strong>2.CƯỚC PH&Iacute; VẬN CHUYỂN TẠI NH&Agrave;</strong></p>

<p>Để đảm bảo đơn h&agrave;ng được chuyển đến tay bạn sớm nhất, ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch bạn đặt h&agrave;ng trước 15h00 mỗi ng&agrave;y.</p>

<p><strong>3. TRA CỨU ĐƠN H&Agrave;NG Đ&Atilde; ĐẶT</strong></p>

<p>Để tra cứu trạng th&aacute;i đơn h&agrave;ng đ&atilde; đặt, qu&yacute; kh&aacute;ch vui l&ograve;ng li&ecirc;n hệ Bộ phận B&aacute;n h&agrave;ng Online&nbsp;<strong>024.3736.5505</strong>&nbsp;(Thời gian l&agrave;m việc 8:30 - 17:30 từ Thứ 2 đến Thứ 6) để được hỗ trợ nhanh nhất.</p>
', N'', 2050000, 45, 2000000, N'GỌNG CARTIER CT0042O', N'GỌNG CARTIER CT0042O', 1, CAST(N'2021-03-31T16:36:00.000' AS DateTime), 21, CAST(N'2023-05-11T22:53:35.973' AS DateTime), 1008, 0, N'Pic8_sup2.jpg', N'Pic8_sup3.jpg', N'Pic8_sup4.jpg', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate], [img1], [img2], [img3], [img4]) VALUES (9, N'GỌNG GK 560PN890', N'gong-gk-560pn890', 10, N'Pic7_sup1.jpg', N'Không có', 1, 2, N'<p>- Thương hiệu:&nbsp;Linda Farrow</p>

<p>- M&atilde; sản phẩm:&nbsp;LFL1243</p>

<p>- Vật Liệu: Kim Loại</p>

<p>-&nbsp; K&iacute;ch thước:&nbsp;50-20-140</p>

<p>- Xuất Xứ : Nhật Bản</p>

<p>- Vật Liệu: Nhựa / Kim loại</p>

<p>- Cảnh b&aacute;o: Bảo quản trong hộp k&iacute;nh</p>

<p>- Chịu tr&aacute;ch nhiệm sản phẩm (Nhập khẩu v&agrave; ph&acirc;n phối)</p>

<p>C&Ocirc;NG TY TNHH K&Iacute;NH MẮT VIỆT NAM</p>

<p>Địa chỉ: 138B Giảng V&otilde; - Ba Đ&igrave;nh - H&agrave; Nội</p>
', N'<h1>QUY C&Aacute;CH Đ&Oacute;NG G&Oacute;I</h1>

<p>- Hộp đựng k&iacute;nh</p>

<p>- Khăn lau k&iacute;nh</p>

<p>- Thẻ bảo h&agrave;nh</p>

<p>- T&uacute;i đựng k&iacute;nh</p>

<p>&nbsp;</p>

<h1>CH&Iacute;NH S&Aacute;CH VẬN CHUYỂN</h1>

<p><strong>1. THỜI GIAN GIAO H&Agrave;NG</strong></p>

<p>K&iacute;nh Mắt Việt Nam - VINAOPTIC hiểu được mong muốn nhận h&agrave;ng sớm của qu&yacute; kh&aacute;ch, tuy nhi&ecirc;n, thời gian giao h&agrave;ng của K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC c&ograve;n phụ thuộc v&agrave;o đơn vị vận chuyển của ch&uacute;ng t&ocirc;i. Th&ocirc;ng thường, thời gian giao h&agrave;ng thường mất 1 &ndash; 7 ng&agrave;y l&agrave;m việc (kh&ocirc;ng bao gồm thứ Bảy, Chủ Nhật v&agrave; Ng&agrave;y nghỉ lễ). Qu&yacute; kh&aacute;ch c&oacute; thể tham khảo bảng thời gian vận chuyển dưới đ&acirc;y của ch&uacute;ng t&ocirc;i. Xin vui l&ograve;ng lưu &yacute; rằng K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC bảo lưu quyền thay đổi thời gian giao h&agrave;ng m&agrave; kh&ocirc;ng cần b&aacute;o trước trong trường hợp chịu ảnh hưởng của thi&ecirc;n tai hoặc c&aacute;c sự kiện đặc biệt kh&aacute;c.</p>

<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td><strong>Địa chỉ nhận h&agrave;ng</strong></td>
			<td><strong>Thời gian vận chuyển</strong></td>
		</tr>
		<tr>
			<td>Nội th&agrave;nh H&agrave; Nội</td>
			<td>1 - 2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>Ngoại th&agrave;nh H&agrave; Nội</td>
			<td>2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c th&agrave;nh phố lớn</td>
			<td>2 &ndash; 4 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c tỉnh kh&aacute;c, huyện, x&atilde;, v&ugrave;ng s&acirc;u v&ugrave;ng xa</td>
			<td>2 - 7 ng&agrave;y l&agrave;m việc</td>
		</tr>
	</tbody>
</table>

<p>Trong trường hợp qu&yacute; kh&aacute;ch chọn h&igrave;nh thức thanh to&aacute;n bằng thẻ t&iacute;n dụng (credit card) hoặc chuyển khoản ng&acirc;n h&agrave;ng, thời gian xử l&yacute; đơn h&agrave;ng sẽ được t&iacute;nh kể từ khi K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC nhận được khoản thanh to&aacute;n ho&agrave;n tất của qu&yacute; kh&aacute;ch.</p>

<p>Đơn h&agrave;ng của qu&yacute; kh&aacute;ch sẽ chỉ được giao tối đa 2 lần. Trong trường hợp lần giao thứ nhất kh&ocirc;ng th&agrave;nh c&ocirc;ng, khi đ&oacute; nh&acirc;n vi&ecirc;n giao h&agrave;ng sẽ li&ecirc;n hệ với qu&yacute; kh&aacute;ch để x&aacute;c nhận ng&agrave;y giao h&agrave;ng lần 2 sau 1- 2 ng&agrave;y l&agrave;m việc kế tiếp. Ch&uacute;ng t&ocirc;i sẽ cố gắng li&ecirc;n hệ giao h&agrave;ng cho qu&yacute; kh&aacute;ch trong v&ograve;ng 02 ng&agrave;y l&agrave;m việc (th&ocirc;ng qua tin nhắn hoặc gọi trực tiếp). Trong trường hợp vẫn kh&ocirc;ng thể li&ecirc;n lạc lại được hoặc kh&ocirc;ng nhận được bất k&igrave; phản hồi n&agrave;o từ ph&iacute;a qu&yacute; kh&aacute;ch, đơn h&agrave;ng sẽ bị hủy nếu qu&yacute; kh&aacute;ch lựa chọn h&igrave;nh thức thanh to&aacute;n COD (nhờ thu hộ) hoặc sẽ được lưu giữ tại kho h&agrave;ng của ch&uacute;ng t&ocirc;i hoặc b&ecirc;n vận chuyển nếu qu&yacute; kh&aacute;ch đ&atilde; thanh to&aacute;n đơn h&agrave;ng rồi trong v&ograve;ng 24 giờ.</p>

<p>Qu&yacute; kh&aacute;ch được xem h&agrave;ng trước khi nhận h&agrave;ng v&agrave; thanh to&aacute;n. Trong trường hợp bạn gặp vấn đề ph&aacute;t sinh, bạn li&ecirc;n hệ ngay đến Sale Online&nbsp;<strong>024.3736.5505</strong>&nbsp;của ch&uacute;ng t&ocirc;i để được hỗ trợ kịp thời.</p>

<p><strong>2.CƯỚC PH&Iacute; VẬN CHUYỂN TẠI NH&Agrave;</strong></p>

<p>Để đảm bảo đơn h&agrave;ng được chuyển đến tay bạn sớm nhất, ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch bạn đặt h&agrave;ng trước 15h00 mỗi ng&agrave;y.</p>

<p><strong>3. TRA CỨU ĐƠN H&Agrave;NG Đ&Atilde; ĐẶT</strong></p>

<p>Để tra cứu trạng th&aacute;i đơn h&agrave;ng đ&atilde; đặt, qu&yacute; kh&aacute;ch vui l&ograve;ng li&ecirc;n hệ Bộ phận B&aacute;n h&agrave;ng Online&nbsp;<strong>024.3736.5505</strong>&nbsp;(Thời gian l&agrave;m việc 8:30 - 17:30 từ Thứ 2 đến Thứ 6) để được hỗ trợ nhanh nhất.</p>
', N'', 3450000, 35, 3440000, N'GỌNG LINDA FARROW LFL1243', N'GỌNG LINDA FARROW LFL1243', 1, CAST(N'2021-04-16T00:52:30.000' AS DateTime), 21, CAST(N'2023-05-11T22:52:43.847' AS DateTime), 1008, 0, N'Pic7_sup2.jpg', N'Pic7_sup3.jpg', N'Pic7_sup4.jpg', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate], [img1], [img2], [img3], [img4]) VALUES (10, N'GỌNG GK 908CN768', N'gong-gk-908cn768', 9, N'Pic6 _sup1.jpg', N'Không có', 2, 3, N'<p>- Thương hiệu:&nbsp;Alexander MCQueen</p>

<p>- M&atilde; sản phẩm:&nbsp;AM0119SA</p>

<p>- Vật Liệu: Kim Loại</p>

<p>-&nbsp;&nbsp;K&iacute;ch thước: 64-10-145</p>

<p>- Xuất Xứ : Italia</p>

<p>- Cảnh b&aacute;o: Bảo quản trong hộp k&iacute;nh</p>

<p>- Chịu tr&aacute;ch nhiệm sản phẩm (Nhập khẩu v&agrave; ph&acirc;n phối):</p>

<p>C&Ocirc;NG TY TNHH K&Iacute;NH MẮT VIỆT NAM</p>

<p>Địa chỉ: 138B Giảng V&otilde; - Ba Đ&igrave;nh - H&agrave; Nội</p>
', N'<h1>QUY C&Aacute;CH Đ&Oacute;NG G&Oacute;I</h1>

<p>- Hộp đựng k&iacute;nh</p>

<p>- Khăn lau k&iacute;nh</p>

<p>- Thẻ bảo h&agrave;nh</p>

<p>- T&uacute;i đựng k&iacute;nh</p>

<p>&nbsp;</p>

<h1>CH&Iacute;NH S&Aacute;CH VẬN CHUYỂN</h1>

<p><strong>1. THỜI GIAN GIAO H&Agrave;NG</strong></p>

<p>K&iacute;nh Mắt Việt Nam - VINAOPTIC hiểu được mong muốn nhận h&agrave;ng sớm của qu&yacute; kh&aacute;ch, tuy nhi&ecirc;n, thời gian giao h&agrave;ng của K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC c&ograve;n phụ thuộc v&agrave;o đơn vị vận chuyển của ch&uacute;ng t&ocirc;i. Th&ocirc;ng thường, thời gian giao h&agrave;ng thường mất 1 &ndash; 7 ng&agrave;y l&agrave;m việc (kh&ocirc;ng bao gồm thứ Bảy, Chủ Nhật v&agrave; Ng&agrave;y nghỉ lễ). Qu&yacute; kh&aacute;ch c&oacute; thể tham khảo bảng thời gian vận chuyển dưới đ&acirc;y của ch&uacute;ng t&ocirc;i. Xin vui l&ograve;ng lưu &yacute; rằng K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC bảo lưu quyền thay đổi thời gian giao h&agrave;ng m&agrave; kh&ocirc;ng cần b&aacute;o trước trong trường hợp chịu ảnh hưởng của thi&ecirc;n tai hoặc c&aacute;c sự kiện đặc biệt kh&aacute;c.</p>

<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td><strong>Địa chỉ nhận h&agrave;ng</strong></td>
			<td><strong>Thời gian vận chuyển</strong></td>
		</tr>
		<tr>
			<td>Nội th&agrave;nh H&agrave; Nội</td>
			<td>1 - 2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>Ngoại th&agrave;nh H&agrave; Nội</td>
			<td>2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c th&agrave;nh phố lớn</td>
			<td>2 &ndash; 4 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c tỉnh kh&aacute;c, huyện, x&atilde;, v&ugrave;ng s&acirc;u v&ugrave;ng xa</td>
			<td>2 - 7 ng&agrave;y l&agrave;m việc</td>
		</tr>
	</tbody>
</table>

<p>Trong trường hợp qu&yacute; kh&aacute;ch chọn h&igrave;nh thức thanh to&aacute;n bằng thẻ t&iacute;n dụng (credit card) hoặc chuyển khoản ng&acirc;n h&agrave;ng, thời gian xử l&yacute; đơn h&agrave;ng sẽ được t&iacute;nh kể từ khi K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC nhận được khoản thanh to&aacute;n ho&agrave;n tất của qu&yacute; kh&aacute;ch.</p>

<p>Đơn h&agrave;ng của qu&yacute; kh&aacute;ch sẽ chỉ được giao tối đa 2 lần. Trong trường hợp lần giao thứ nhất kh&ocirc;ng th&agrave;nh c&ocirc;ng, khi đ&oacute; nh&acirc;n vi&ecirc;n giao h&agrave;ng sẽ li&ecirc;n hệ với qu&yacute; kh&aacute;ch để x&aacute;c nhận ng&agrave;y giao h&agrave;ng lần 2 sau 1- 2 ng&agrave;y l&agrave;m việc kế tiếp. Ch&uacute;ng t&ocirc;i sẽ cố gắng li&ecirc;n hệ giao h&agrave;ng cho qu&yacute; kh&aacute;ch trong v&ograve;ng 02 ng&agrave;y l&agrave;m việc (th&ocirc;ng qua tin nhắn hoặc gọi trực tiếp). Trong trường hợp vẫn kh&ocirc;ng thể li&ecirc;n lạc lại được hoặc kh&ocirc;ng nhận được bất k&igrave; phản hồi n&agrave;o từ ph&iacute;a qu&yacute; kh&aacute;ch, đơn h&agrave;ng sẽ bị hủy nếu qu&yacute; kh&aacute;ch lựa chọn h&igrave;nh thức thanh to&aacute;n COD (nhờ thu hộ) hoặc sẽ được lưu giữ tại kho h&agrave;ng của ch&uacute;ng t&ocirc;i hoặc b&ecirc;n vận chuyển nếu qu&yacute; kh&aacute;ch đ&atilde; thanh to&aacute;n đơn h&agrave;ng rồi trong v&ograve;ng 24 giờ.</p>

<p>Qu&yacute; kh&aacute;ch được xem h&agrave;ng trước khi nhận h&agrave;ng v&agrave; thanh to&aacute;n. Trong trường hợp bạn gặp vấn đề ph&aacute;t sinh, bạn li&ecirc;n hệ ngay đến Sale Online&nbsp;<strong>024.3736.5505</strong>&nbsp;của ch&uacute;ng t&ocirc;i để được hỗ trợ kịp thời.</p>

<p><strong>2.CƯỚC PH&Iacute; VẬN CHUYỂN TẠI NH&Agrave;</strong></p>

<p>Để đảm bảo đơn h&agrave;ng được chuyển đến tay bạn sớm nhất, ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch bạn đặt h&agrave;ng trước 15h00 mỗi ng&agrave;y.</p>

<p><strong>3. TRA CỨU ĐƠN H&Agrave;NG Đ&Atilde; ĐẶT</strong></p>

<p>Để tra cứu trạng th&aacute;i đơn h&agrave;ng đ&atilde; đặt, qu&yacute; kh&aacute;ch vui l&ograve;ng li&ecirc;n hệ Bộ phận B&aacute;n h&agrave;ng Online&nbsp;<strong>024.3736.5505</strong>&nbsp;(Thời gian l&agrave;m việc 8:30 - 17:30 từ Thứ 2 đến Thứ 6) để được hỗ trợ nhanh nhất.</p>
', N'', 2000000, 25, 1999000, N'GỌNG ALEXANDER MCQUEEN AM0119SA', N'GỌNG ALEXANDER MCQUEEN AM0119SA', 1, CAST(N'2021-04-16T00:54:02.000' AS DateTime), 21, CAST(N'2023-05-11T22:52:09.910' AS DateTime), 1008, 0, N'Pic6 _sup2.jpg', N'Pic6 _sup3.jpg', N'Pic6.jpg', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate], [img1], [img2], [img3], [img4]) VALUES (11, N'GỌNG GK 790CN400', N'gong-gk-790cn400', 8, N'Pic5_sup1.jpg', N'Không có', 1, 2, N'<p>- Thương hiệu:&nbsp;Stepper</p>

<p>- M&atilde; sản phẩm:&nbsp;SI-50056</p>

<p>- Vật Liệu: Titanium</p>

<p>-&nbsp;&nbsp;K&iacute;ch thước: 52-16-130</p>

<p>- Xuất Xứ : Đang cập nhật</p>

<p>- Cảnh b&aacute;o: Bảo quản trong hộp k&iacute;nh</p>

<p>- Chịu tr&aacute;ch nhiệm sản phẩm (Nhập khẩu v&agrave; ph&acirc;n phối):</p>

<p>C&Ocirc;NG TY TNHH K&Iacute;NH MẮT VIỆT NAM</p>

<p>Địa chỉ: 138B Giảng V&otilde; - Ba Đ&igrave;nh - H&agrave; Nội</p>
', N'<h1>QUY C&Aacute;CH Đ&Oacute;NG G&Oacute;I</h1>

<p>- Hộp đựng k&iacute;nh</p>

<p>- Khăn lau k&iacute;nh cao cấp</p>

<p>- Thẻ bảo h&agrave;nh</p>

<p>- T&uacute;i đựng k&iacute;nh</p>

<h1>CH&Iacute;NH S&Aacute;CH VẬN CHUYỂN</h1>

<p><strong>1. THỜI GIAN GIAO H&Agrave;NG</strong></p>

<p>K&iacute;nh Mắt Việt Nam - VINAOPTIC hiểu được mong muốn nhận h&agrave;ng sớm của qu&yacute; kh&aacute;ch, tuy nhi&ecirc;n, thời gian giao h&agrave;ng của K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC c&ograve;n phụ thuộc v&agrave;o đơn vị vận chuyển của ch&uacute;ng t&ocirc;i. Th&ocirc;ng thường, thời gian giao h&agrave;ng thường mất 1 &ndash; 7 ng&agrave;y l&agrave;m việc (kh&ocirc;ng bao gồm thứ Bảy, Chủ Nhật v&agrave; Ng&agrave;y nghỉ lễ). Qu&yacute; kh&aacute;ch c&oacute; thể tham khảo bảng thời gian vận chuyển dưới đ&acirc;y của ch&uacute;ng t&ocirc;i. Xin vui l&ograve;ng lưu &yacute; rằng K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC bảo lưu quyền thay đổi thời gian giao h&agrave;ng m&agrave; kh&ocirc;ng cần b&aacute;o trước trong trường hợp chịu ảnh hưởng của thi&ecirc;n tai hoặc c&aacute;c sự kiện đặc biệt kh&aacute;c.</p>

<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td><strong>Địa chỉ nhận h&agrave;ng</strong></td>
			<td><strong>Thời gian vận chuyển</strong></td>
		</tr>
		<tr>
			<td>Nội th&agrave;nh H&agrave; Nội</td>
			<td>1 - 2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>Ngoại th&agrave;nh H&agrave; Nội</td>
			<td>2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c th&agrave;nh phố lớn</td>
			<td>2 &ndash; 4 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c tỉnh kh&aacute;c, huyện, x&atilde;, v&ugrave;ng s&acirc;u v&ugrave;ng xa</td>
			<td>2 - 7 ng&agrave;y l&agrave;m việc</td>
		</tr>
	</tbody>
</table>

<p>Trong trường hợp qu&yacute; kh&aacute;ch chọn h&igrave;nh thức thanh to&aacute;n bằng thẻ t&iacute;n dụng (credit card) hoặc chuyển khoản ng&acirc;n h&agrave;ng, thời gian xử l&yacute; đơn h&agrave;ng sẽ được t&iacute;nh kể từ khi K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC nhận được khoản thanh to&aacute;n ho&agrave;n tất của qu&yacute; kh&aacute;ch.</p>

<p>Đơn h&agrave;ng của qu&yacute; kh&aacute;ch sẽ chỉ được giao tối đa 2 lần. Trong trường hợp lần giao thứ nhất kh&ocirc;ng th&agrave;nh c&ocirc;ng, khi đ&oacute; nh&acirc;n vi&ecirc;n giao h&agrave;ng sẽ li&ecirc;n hệ với qu&yacute; kh&aacute;ch để x&aacute;c nhận ng&agrave;y giao h&agrave;ng lần 2 sau 1- 2 ng&agrave;y l&agrave;m việc kế tiếp. Ch&uacute;ng t&ocirc;i sẽ cố gắng li&ecirc;n hệ giao h&agrave;ng cho qu&yacute; kh&aacute;ch trong v&ograve;ng 02 ng&agrave;y l&agrave;m việc (th&ocirc;ng qua tin nhắn hoặc gọi trực tiếp). Trong trường hợp vẫn kh&ocirc;ng thể li&ecirc;n lạc lại được hoặc kh&ocirc;ng nhận được bất k&igrave; phản hồi n&agrave;o từ ph&iacute;a qu&yacute; kh&aacute;ch, đơn h&agrave;ng sẽ bị hủy nếu qu&yacute; kh&aacute;ch lựa chọn h&igrave;nh thức thanh to&aacute;n COD (nhờ thu hộ) hoặc sẽ được lưu giữ tại kho h&agrave;ng của ch&uacute;ng t&ocirc;i hoặc b&ecirc;n vận chuyển nếu qu&yacute; kh&aacute;ch đ&atilde; thanh to&aacute;n đơn h&agrave;ng rồi trong v&ograve;ng 24 giờ.</p>

<p>Qu&yacute; kh&aacute;ch được xem h&agrave;ng trước khi nhận h&agrave;ng v&agrave; thanh to&aacute;n. Trong trường hợp bạn gặp vấn đề ph&aacute;t sinh, bạn li&ecirc;n hệ ngay đến Sale Online&nbsp;<strong>024.3736.5505</strong>&nbsp;của ch&uacute;ng t&ocirc;i để được hỗ trợ kịp thời.</p>

<p><strong>2.CƯỚC PH&Iacute; VẬN CHUYỂN TẠI NH&Agrave;</strong></p>

<p>Để đảm bảo đơn h&agrave;ng được chuyển đến tay bạn sớm nhất, ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch bạn đặt h&agrave;ng trước 15h00 mỗi ng&agrave;y.</p>

<p><strong>3. TRA CỨU ĐƠN H&Agrave;NG Đ&Atilde; ĐẶT</strong></p>

<p>Để tra cứu trạng th&aacute;i đơn h&agrave;ng đ&atilde; đặt, qu&yacute; kh&aacute;ch vui l&ograve;ng li&ecirc;n hệ Bộ phận B&aacute;n h&agrave;ng Online&nbsp;<strong>024.3736.5505</strong>&nbsp;(Thời gian l&agrave;m việc 8:30 - 17:30 từ Thứ 2 đến Thứ 6) để được hỗ trợ nhanh nhất.</p>
', N'', 230000, 30, 220000, N'GỌNG STEPPER SI-50056', N'GỌNG STEPPER SI-50056', 1, CAST(N'2021-04-16T00:55:08.000' AS DateTime), 21, CAST(N'2023-05-11T22:51:34.347' AS DateTime), 1008, 0, N'Pic5_sup2.jpg', N'Pic5_sup3.jpg', N'Pic5_sup4.jpg', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate], [img1], [img2], [img3], [img4]) VALUES (12, N'GỌNG GK 480CN004', N'gong-gk-480cn004', 7, N'Pic4.jpg', N'Không có', 1, 2, N'<p>- Thương hiệu:&nbsp;MINIBOXX</p>

<p>- M&atilde; sản phẩm:&nbsp;MB-3-305</p>

<p>- Vật Liệu: Nhựa/Kim Loại</p>

<p>-&nbsp; K&iacute;ch thước:&nbsp;41-18-125</p>

<p>- Xuất Xứ : Trung Quốc</p>

<p>- Cảnh b&aacute;o: Bảo quản trong hộp k&iacute;nh</p>

<p>- Chịu tr&aacute;ch nhiệm sản phẩm (Nhập khẩu v&agrave; ph&acirc;n phối)</p>

<p>C&Ocirc;NG TY TNHH K&Iacute;NH MẮT VIỆT NAM</p>

<p>Địa chỉ: 138B Giảng V&otilde; - Ba Đ&igrave;nh - H&agrave; Nội</p>
', N'<h1>QUY C&Aacute;CH Đ&Oacute;NG G&Oacute;I</h1>

<p>- Hộp đựng k&iacute;nh</p>

<p>- Khăn lau k&iacute;nh</p>

<p>- Thẻ bảo h&agrave;nh</p>

<p>- T&uacute;i đựng k&iacute;nh</p>

<p>&nbsp;</p>

<h1>CH&Iacute;NH S&Aacute;CH VẬN CHUYỂN</h1>

<p><strong>1. THỜI GIAN GIAO H&Agrave;NG</strong></p>

<p>K&iacute;nh Mắt Việt Nam - VINAOPTIC hiểu được mong muốn nhận h&agrave;ng sớm của qu&yacute; kh&aacute;ch, tuy nhi&ecirc;n, thời gian giao h&agrave;ng của K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC c&ograve;n phụ thuộc v&agrave;o đơn vị vận chuyển của ch&uacute;ng t&ocirc;i. Th&ocirc;ng thường, thời gian giao h&agrave;ng thường mất 1 &ndash; 7 ng&agrave;y l&agrave;m việc (kh&ocirc;ng bao gồm thứ Bảy, Chủ Nhật v&agrave; Ng&agrave;y nghỉ lễ). Qu&yacute; kh&aacute;ch c&oacute; thể tham khảo bảng thời gian vận chuyển dưới đ&acirc;y của ch&uacute;ng t&ocirc;i. Xin vui l&ograve;ng lưu &yacute; rằng K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC bảo lưu quyền thay đổi thời gian giao h&agrave;ng m&agrave; kh&ocirc;ng cần b&aacute;o trước trong trường hợp chịu ảnh hưởng của thi&ecirc;n tai hoặc c&aacute;c sự kiện đặc biệt kh&aacute;c.</p>

<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td><strong>Địa chỉ nhận h&agrave;ng</strong></td>
			<td><strong>Thời gian vận chuyển</strong></td>
		</tr>
		<tr>
			<td>Nội th&agrave;nh H&agrave; Nội</td>
			<td>1 - 2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>Ngoại th&agrave;nh H&agrave; Nội</td>
			<td>2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c th&agrave;nh phố lớn</td>
			<td>2 &ndash; 4 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c tỉnh kh&aacute;c, huyện, x&atilde;, v&ugrave;ng s&acirc;u v&ugrave;ng xa</td>
			<td>2 - 7 ng&agrave;y l&agrave;m việc</td>
		</tr>
	</tbody>
</table>

<p>Trong trường hợp qu&yacute; kh&aacute;ch chọn h&igrave;nh thức thanh to&aacute;n bằng thẻ t&iacute;n dụng (credit card) hoặc chuyển khoản ng&acirc;n h&agrave;ng, thời gian xử l&yacute; đơn h&agrave;ng sẽ được t&iacute;nh kể từ khi K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC nhận được khoản thanh to&aacute;n ho&agrave;n tất của qu&yacute; kh&aacute;ch.</p>

<p>Đơn h&agrave;ng của qu&yacute; kh&aacute;ch sẽ chỉ được giao tối đa 2 lần. Trong trường hợp lần giao thứ nhất kh&ocirc;ng th&agrave;nh c&ocirc;ng, khi đ&oacute; nh&acirc;n vi&ecirc;n giao h&agrave;ng sẽ li&ecirc;n hệ với qu&yacute; kh&aacute;ch để x&aacute;c nhận ng&agrave;y giao h&agrave;ng lần 2 sau 1- 2 ng&agrave;y l&agrave;m việc kế tiếp. Ch&uacute;ng t&ocirc;i sẽ cố gắng li&ecirc;n hệ giao h&agrave;ng cho qu&yacute; kh&aacute;ch trong v&ograve;ng 02 ng&agrave;y l&agrave;m việc (th&ocirc;ng qua tin nhắn hoặc gọi trực tiếp). Trong trường hợp vẫn kh&ocirc;ng thể li&ecirc;n lạc lại được hoặc kh&ocirc;ng nhận được bất k&igrave; phản hồi n&agrave;o từ ph&iacute;a qu&yacute; kh&aacute;ch, đơn h&agrave;ng sẽ bị hủy nếu qu&yacute; kh&aacute;ch lựa chọn h&igrave;nh thức thanh to&aacute;n COD (nhờ thu hộ) hoặc sẽ được lưu giữ tại kho h&agrave;ng của ch&uacute;ng t&ocirc;i hoặc b&ecirc;n vận chuyển nếu qu&yacute; kh&aacute;ch đ&atilde; thanh to&aacute;n đơn h&agrave;ng rồi trong v&ograve;ng 24 giờ.</p>

<p>Qu&yacute; kh&aacute;ch được xem h&agrave;ng trước khi nhận h&agrave;ng v&agrave; thanh to&aacute;n. Trong trường hợp bạn gặp vấn đề ph&aacute;t sinh, bạn li&ecirc;n hệ ngay đến Sale Online&nbsp;<strong>024.3736.5505</strong>&nbsp;của ch&uacute;ng t&ocirc;i để được hỗ trợ kịp thời.</p>

<p><strong>2.CƯỚC PH&Iacute; VẬN CHUYỂN TẠI NH&Agrave;</strong></p>

<p>Để đảm bảo đơn h&agrave;ng được chuyển đến tay bạn sớm nhất, ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch bạn đặt h&agrave;ng trước 15h00 mỗi ng&agrave;y.</p>

<p><strong>3. TRA CỨU ĐƠN H&Agrave;NG Đ&Atilde; ĐẶT</strong></p>

<p>Để tra cứu trạng th&aacute;i đơn h&agrave;ng đ&atilde; đặt, qu&yacute; kh&aacute;ch vui l&ograve;ng li&ecirc;n hệ Bộ phận B&aacute;n h&agrave;ng Online&nbsp;<strong>024.3736.5505</strong>&nbsp;(Thời gian l&agrave;m việc 8:30 - 17:30 từ Thứ 2 đến Thứ 6) để được hỗ trợ nhanh nhất.</p>
', N'', 460000, 50, 450000, N'GỌNG MINIBOXX MB-3-305', N'GỌNG MINIBOXX MB-3-305', 1, CAST(N'2021-04-16T00:56:30.000' AS DateTime), 21, CAST(N'2023-05-11T22:50:02.607' AS DateTime), 1008, 0, N'Pic4_sup1.jpg', N'Pic4_sup2.jpg', N'Pic4_sup3.jpg', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate], [img1], [img2], [img3], [img4]) VALUES (13, N'GỌNG STEPPER EX-50101', N'gong-stepper-ex-50101', 6, N'Pic3.jpg', N'Không có', 1, 2, N'<p>- Thương hiệu:&nbsp;Stepper</p>

<p>- M&atilde; sản phẩm: EX-50101</p>

<p>- Vật Liệu: Titanium</p>

<p>-&nbsp;&nbsp;K&iacute;ch thước: 53-16-140</p>

<p>- Xuất Xứ : Đang cập nhật</p>

<p>- Cảnh b&aacute;o: Bảo quản trong hộp k&iacute;nh</p>

<p>- Chịu tr&aacute;ch nhiệm sản phẩm (Nhập khẩu v&agrave; ph&acirc;n phối):</p>

<p>C&Ocirc;NG TY TNHH K&Iacute;NH MẮT VIỆT NAM</p>

<p>Địa chỉ: 138B Giảng V&otilde; - Ba Đ&igrave;nh - H&agrave; Nội</p>
', N'<h1>QUY C&Aacute;CH Đ&Oacute;NG G&Oacute;I</h1>

<p>- Hộp đựng k&iacute;nh</p>

<p>- Khăn lau k&iacute;nh</p>

<p>- Thẻ bảo h&agrave;nh</p>

<p>- T&uacute;i đựng k&iacute;nh</p>

<p>&nbsp;</p>

<h1>CH&Iacute;NH S&Aacute;CH VẬN CHUYỂN</h1>

<p><strong>1. THỜI GIAN GIAO H&Agrave;NG</strong></p>

<p>K&iacute;nh Mắt Việt Nam - VINAOPTIC hiểu được mong muốn nhận h&agrave;ng sớm của qu&yacute; kh&aacute;ch, tuy nhi&ecirc;n, thời gian giao h&agrave;ng của K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC c&ograve;n phụ thuộc v&agrave;o đơn vị vận chuyển của ch&uacute;ng t&ocirc;i. Th&ocirc;ng thường, thời gian giao h&agrave;ng thường mất 1 &ndash; 7 ng&agrave;y l&agrave;m việc (kh&ocirc;ng bao gồm thứ Bảy, Chủ Nhật v&agrave; Ng&agrave;y nghỉ lễ). Qu&yacute; kh&aacute;ch c&oacute; thể tham khảo bảng thời gian vận chuyển dưới đ&acirc;y của ch&uacute;ng t&ocirc;i. Xin vui l&ograve;ng lưu &yacute; rằng K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC bảo lưu quyền thay đổi thời gian giao h&agrave;ng m&agrave; kh&ocirc;ng cần b&aacute;o trước trong trường hợp chịu ảnh hưởng của thi&ecirc;n tai hoặc c&aacute;c sự kiện đặc biệt kh&aacute;c.</p>

<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td><strong>Địa chỉ nhận h&agrave;ng</strong></td>
			<td><strong>Thời gian vận chuyển</strong></td>
		</tr>
		<tr>
			<td>Nội th&agrave;nh H&agrave; Nội</td>
			<td>1 - 2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>Ngoại th&agrave;nh H&agrave; Nội</td>
			<td>2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c th&agrave;nh phố lớn</td>
			<td>2 &ndash; 4 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c tỉnh kh&aacute;c, huyện, x&atilde;, v&ugrave;ng s&acirc;u v&ugrave;ng xa</td>
			<td>2 - 7 ng&agrave;y l&agrave;m việc</td>
		</tr>
	</tbody>
</table>

<p>Trong trường hợp qu&yacute; kh&aacute;ch chọn h&igrave;nh thức thanh to&aacute;n bằng thẻ t&iacute;n dụng (credit card) hoặc chuyển khoản ng&acirc;n h&agrave;ng, thời gian xử l&yacute; đơn h&agrave;ng sẽ được t&iacute;nh kể từ khi K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC nhận được khoản thanh to&aacute;n ho&agrave;n tất của qu&yacute; kh&aacute;ch.</p>

<p>Đơn h&agrave;ng của qu&yacute; kh&aacute;ch sẽ chỉ được giao tối đa 2 lần. Trong trường hợp lần giao thứ nhất kh&ocirc;ng th&agrave;nh c&ocirc;ng, khi đ&oacute; nh&acirc;n vi&ecirc;n giao h&agrave;ng sẽ li&ecirc;n hệ với qu&yacute; kh&aacute;ch để x&aacute;c nhận ng&agrave;y giao h&agrave;ng lần 2 sau 1- 2 ng&agrave;y l&agrave;m việc kế tiếp. Ch&uacute;ng t&ocirc;i sẽ cố gắng li&ecirc;n hệ giao h&agrave;ng cho qu&yacute; kh&aacute;ch trong v&ograve;ng 02 ng&agrave;y l&agrave;m việc (th&ocirc;ng qua tin nhắn hoặc gọi trực tiếp). Trong trường hợp vẫn kh&ocirc;ng thể li&ecirc;n lạc lại được hoặc kh&ocirc;ng nhận được bất k&igrave; phản hồi n&agrave;o từ ph&iacute;a qu&yacute; kh&aacute;ch, đơn h&agrave;ng sẽ bị hủy nếu qu&yacute; kh&aacute;ch lựa chọn h&igrave;nh thức thanh to&aacute;n COD (nhờ thu hộ) hoặc sẽ được lưu giữ tại kho h&agrave;ng của ch&uacute;ng t&ocirc;i hoặc b&ecirc;n vận chuyển nếu qu&yacute; kh&aacute;ch đ&atilde; thanh to&aacute;n đơn h&agrave;ng rồi trong v&ograve;ng 24 giờ.</p>

<p>Qu&yacute; kh&aacute;ch được xem h&agrave;ng trước khi nhận h&agrave;ng v&agrave; thanh to&aacute;n. Trong trường hợp bạn gặp vấn đề ph&aacute;t sinh, bạn li&ecirc;n hệ ngay đến Sale Online&nbsp;<strong>024.3736.5505</strong>&nbsp;của ch&uacute;ng t&ocirc;i để được hỗ trợ kịp thời.</p>

<p><strong>2.CƯỚC PH&Iacute; VẬN CHUYỂN TẠI NH&Agrave;</strong></p>

<p>Để đảm bảo đơn h&agrave;ng được chuyển đến tay bạn sớm nhất, ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch bạn đặt h&agrave;ng trước 15h00 mỗi ng&agrave;y.</p>

<p><strong>3. TRA CỨU ĐƠN H&Agrave;NG Đ&Atilde; ĐẶT</strong></p>

<p>Để tra cứu trạng th&aacute;i đơn h&agrave;ng đ&atilde; đặt, qu&yacute; kh&aacute;ch vui l&ograve;ng li&ecirc;n hệ Bộ phận B&aacute;n h&agrave;ng Online&nbsp;<strong>024.3736.5505</strong>&nbsp;(Thời gian l&agrave;m việc 8:30 - 17:30 từ Thứ 2 đến Thứ 6) để được hỗ trợ nhanh nhất</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', N'', 3210000, 5, 3100000, N'GỌNG STEPPER EX-50101', N'GỌNG STEPPER EX-50101', 1, CAST(N'2021-04-16T00:57:53.000' AS DateTime), 21, CAST(N'2023-05-11T22:47:54.163' AS DateTime), 1008, 0, N'Pic3_sup1.jpg', N'Pic3_sup2.jpg', N'Pic3_sup4.jpg', NULL)
INSERT [dbo].[Products] ([ID], [Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate], [img1], [img2], [img3], [img4]) VALUES (14, N'GỌNG STEPPER EX-50311', N'gong-stepper-ex-50311', 6, N'Pic2.jpg', N'Không có', 1, 2, N'<p>- Thương hiệu:&nbsp;Stepper</p>

<p>- M&atilde; sản phẩm: EX-50311</p>

<p>- Vật Liệu: Titanium</p>

<p>-&nbsp;&nbsp;K&iacute;ch thước: Đang cập nhật</p>

<p>- Xuất Xứ : Đang cập nhật</p>

<p>- Cảnh b&aacute;o: Bảo quản trong hộp k&iacute;nh</p>

<p>- Chịu tr&aacute;ch nhiệm sản phẩm (Nhập khẩu v&agrave; ph&acirc;n phối):</p>

<p>C&Ocirc;NG TY TNHH K&Iacute;NH MẮT VIỆT NAM</p>

<p>Địa chỉ: 138B Giảng V&otilde; - Ba Đ&igrave;nh - H&agrave; Nội</p>
', N'<h1>QUY C&Aacute;CH Đ&Oacute;NG G&Oacute;I</h1>

<p>- Hộp đựng k&iacute;nh</p>

<p>- Khăn lau k&iacute;nh</p>

<p>- Thẻ bảo h&agrave;nh</p>

<p>- T&uacute;i đựng k&iacute;nh</p>

<h1>CH&Iacute;NH S&Aacute;CH VẬN CHUYỂN</h1>

<p><strong>1. THỜI GIAN GIAO H&Agrave;NG</strong></p>

<p>K&iacute;nh Mắt Việt Nam - VINAOPTIC hiểu được mong muốn nhận h&agrave;ng sớm của qu&yacute; kh&aacute;ch, tuy nhi&ecirc;n, thời gian giao h&agrave;ng của K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC c&ograve;n phụ thuộc v&agrave;o đơn vị vận chuyển của ch&uacute;ng t&ocirc;i. Th&ocirc;ng thường, thời gian giao h&agrave;ng thường mất 1 &ndash; 7 ng&agrave;y l&agrave;m việc (kh&ocirc;ng bao gồm thứ Bảy, Chủ Nhật v&agrave; Ng&agrave;y nghỉ lễ). Qu&yacute; kh&aacute;ch c&oacute; thể tham khảo bảng thời gian vận chuyển dưới đ&acirc;y của ch&uacute;ng t&ocirc;i. Xin vui l&ograve;ng lưu &yacute; rằng K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC bảo lưu quyền thay đổi thời gian giao h&agrave;ng m&agrave; kh&ocirc;ng cần b&aacute;o trước trong trường hợp chịu ảnh hưởng của thi&ecirc;n tai hoặc c&aacute;c sự kiện đặc biệt kh&aacute;c.</p>

<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td><strong>Địa chỉ nhận h&agrave;ng</strong></td>
			<td><strong>Thời gian vận chuyển</strong></td>
		</tr>
		<tr>
			<td>Nội th&agrave;nh H&agrave; Nội</td>
			<td>1 - 2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>Ngoại th&agrave;nh H&agrave; Nội</td>
			<td>2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c th&agrave;nh phố lớn</td>
			<td>2 &ndash; 4 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c tỉnh kh&aacute;c, huyện, x&atilde;, v&ugrave;ng s&acirc;u v&ugrave;ng xa</td>
			<td>2 - 7 ng&agrave;y l&agrave;m việc</td>
		</tr>
	</tbody>
</table>

<p>Trong trường hợp qu&yacute; kh&aacute;ch chọn h&igrave;nh thức thanh to&aacute;n bằng thẻ t&iacute;n dụng (credit card) hoặc chuyển khoản ng&acirc;n h&agrave;ng, thời gian xử l&yacute; đơn h&agrave;ng sẽ được t&iacute;nh kể từ khi K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC nhận được khoản thanh to&aacute;n ho&agrave;n tất của qu&yacute; kh&aacute;ch.</p>

<p>Đơn h&agrave;ng của qu&yacute; kh&aacute;ch sẽ chỉ được giao tối đa 2 lần. Trong trường hợp lần giao thứ nhất kh&ocirc;ng th&agrave;nh c&ocirc;ng, khi đ&oacute; nh&acirc;n vi&ecirc;n giao h&agrave;ng sẽ li&ecirc;n hệ với qu&yacute; kh&aacute;ch để x&aacute;c nhận ng&agrave;y giao h&agrave;ng lần 2 sau 1- 2 ng&agrave;y l&agrave;m việc kế tiếp. Ch&uacute;ng t&ocirc;i sẽ cố gắng li&ecirc;n hệ giao h&agrave;ng cho qu&yacute; kh&aacute;ch trong v&ograve;ng 02 ng&agrave;y l&agrave;m việc (th&ocirc;ng qua tin nhắn hoặc gọi trực tiếp). Trong trường hợp vẫn kh&ocirc;ng thể li&ecirc;n lạc lại được hoặc kh&ocirc;ng nhận được bất k&igrave; phản hồi n&agrave;o từ ph&iacute;a qu&yacute; kh&aacute;ch, đơn h&agrave;ng sẽ bị hủy nếu qu&yacute; kh&aacute;ch lựa chọn h&igrave;nh thức thanh to&aacute;n COD (nhờ thu hộ) hoặc sẽ được lưu giữ tại kho h&agrave;ng của ch&uacute;ng t&ocirc;i hoặc b&ecirc;n vận chuyển nếu qu&yacute; kh&aacute;ch đ&atilde; thanh to&aacute;n đơn h&agrave;ng rồi trong v&ograve;ng 24 giờ.</p>

<p>Qu&yacute; kh&aacute;ch được xem h&agrave;ng trước khi nhận h&agrave;ng v&agrave; thanh to&aacute;n. Trong trường hợp bạn gặp vấn đề ph&aacute;t sinh, bạn li&ecirc;n hệ ngay đến Sale Online&nbsp;<strong>024.3736.5505</strong>&nbsp;của ch&uacute;ng t&ocirc;i để được hỗ trợ kịp thời.</p>

<p><strong>2.CƯỚC PH&Iacute; VẬN CHUYỂN TẠI NH&Agrave;</strong></p>

<p>Để đảm bảo đơn h&agrave;ng được chuyển đến tay bạn sớm nhất, ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch bạn đặt h&agrave;ng trước 15h00 mỗi ng&agrave;y.</p>

<p><strong>3. TRA CỨU ĐƠN H&Agrave;NG Đ&Atilde; ĐẶT</strong></p>

<p>Để tra cứu trạng th&aacute;i đơn h&agrave;ng đ&atilde; đặt, qu&yacute; kh&aacute;ch vui l&ograve;ng li&ecirc;n hệ Bộ phận B&aacute;n h&agrave;ng Online&nbsp;<strong>024.3736.5505</strong>&nbsp;(Thời gian l&agrave;m việc 8:30 - 17:30 từ Thứ 2 đến Thứ 6) để được hỗ trợ nhanh nhất.</p>

<p>&nbsp;</p>

<h1>HƯỚNG DẪN C&Aacute;CH SỬ DỤNG V&Agrave; BẢO QUẢN K&Iacute;NH</h1>

<p><strong>1. KHI ĐEO V&Agrave; GỠ K&Iacute;NH PHẢI D&Ugrave;NG 2 TAY</strong></p>

<p>Một số người vẫn c&oacute; th&oacute;i quen d&ugrave;ng một tay, điều n&agrave;y thường g&acirc;y c&aacute;c t&aacute;c hại kh&ocirc;ng nhỏ đến chiếc k&iacute;nh như g&acirc;y n&ecirc;n sai lệch gọng k&iacute;nh v&agrave; t&acirc;m của mắt k&iacute;nh, qua đ&oacute; sẽ c&oacute; những ảnh hưởng đến tuổi thọ k&iacute;nh, yếu tố thẩm mỹ, thị trường nh&igrave;n.. từ đ&oacute; c&oacute; thể g&acirc;y ảnh hưởng kh&ocirc;ng tốt cho đ&ocirc;i mắt, l&agrave;m giảm hiệu quả l&agrave;m việc.</p>

<p><strong>2. KH&Ocirc;NG N&Ecirc;N THAY ĐỔI HAY CẢI BIẾN H&Igrave;NH DẠNG CỦA GỌNG K&Iacute;NH THỜI TRANG</strong></p>

<p>- Kh&ocirc;ng được tự &yacute; thay đổi hay cải biến h&igrave;nh dạng ban đầu của k&iacute;nh, tr&aacute;nh để gọng k&iacute;nh bị trầy xước, v&igrave; đ&oacute; c&oacute; thể l&agrave; nguy&ecirc;n nh&acirc;n l&agrave;m yếu v&agrave; gẫy gọng.</p>

<p>- Đối với gọng dẻo, tuy l&agrave; loại gọng kh&oacute; g&acirc;y ra c&aacute;c biến dạng. Nhưng nếu cố &yacute; bẻ cong, vặn hoặc t&aacute;c động lực mạnh th&igrave; vẫn c&oacute; thể g&acirc;y hỏng, g&atilde;y hoặc biến dạng. Do vậy, kh&ocirc;ng được cố t&igrave;nh bẻ hay vặn gọng k&iacute;nh v&agrave; tr&aacute;nh c&aacute;c va đập mạnh.</p>

<p>- Đối với loại gọng k&iacute;nh xẻ cước (gọng v&agrave;nh): Loại gọng n&agrave;y c&oacute; cấu tr&uacute;c mắt k&iacute;nh được đỡ bằng nẹp dạng nguy&ecirc;n liệu sợi (chủ yếu l&agrave; sợi nylon - cước) n&ecirc;n c&oacute; thể xảy ra trường hợp khi d&ugrave;ng l&acirc;u sẽ bị hao m&ograve;n, yếu đi dẫn tới bị đứt, l&agrave;m cho mắt k&iacute;nh bị rơi ra. Ngo&agrave;i ra, c&aacute;c loại sợi n&agrave;y cũng c&oacute; thể bị yếu, đứt do nhiệt hoặc do bị k&eacute;o căng, n&ecirc;n kh&ocirc;ng được đặt ở những nơi c&oacute; nhiệt độ cao v&agrave; tr&aacute;nh c&aacute;c va đập mạnh.</p>

<p>- Với loại gọng khoan (kh&ocirc;ng c&oacute; phần bao đỡ mắt k&iacute;nh): Loại gọng n&agrave;y c&oacute; cấu tr&uacute;c mắt k&iacute;nh được khoan c&aacute;c lỗ v&iacute;t để bắt v&agrave;o gọng k&iacute;nh. Vậy n&ecirc;n, cần đặc biệt ch&uacute; &yacute; tới độ chặt của c&aacute;c lỗ v&iacute;t hay sự biến dạng của gọng. So với c&aacute;c loại gọng k&iacute;nh liền v&agrave;nh v&agrave; b&aacute;n v&agrave;nh th&igrave; loại n&agrave;y thường rất dễ vỡ mắt n&ecirc;n phải cẩn thận khi sử dụng. V&agrave; tốt hơn l&agrave; phải sử dụng loại mắt chuy&ecirc;n dụng cho loại gọng n&agrave;y.</p>

<p>- Với loại gọng d&ugrave;ng bản lề dạng l&ograve; xo (c&oacute; thể gọi l&agrave; nh&iacute;p): Cần tr&aacute;nh việc mở hai c&agrave;ng của gọng k&iacute;nh qu&aacute; mạnh hay qu&aacute; rộng cũng dễ g&acirc;y hỏng, tr&aacute;nh tiếp x&uacute;c với kh&iacute; ẩm, bụi c&oacute; thể g&acirc;y gỉ s&eacute;t hay kẹt l&ograve; xo. Khi v&agrave;o nh&agrave; tắm, tắm hơi, tắm biển.. n&ecirc;n th&aacute;o k&iacute;nh.</p>

<p>- Khi ốc v&iacute;t của gọng k&iacute;nh bị hỏng hoặc gọng k&iacute;nh bị biến dạng dễ l&agrave;m cho mắt k&iacute;nh bị rơi ra, trong trường hợp như vậy tuyệt đối kh&ocirc;ng dung keo để gắn lại sẽ l&agrave;m cho mắt k&iacute;nh bị ảnh hưởng như mất thị trường nh&igrave;n v&agrave; những mảnh mắt k&iacute;nh bị vỡ rơi ra l&agrave;m tổn thương đến mắt, n&ecirc;n ngưng sử dụng v&agrave; mang k&iacute;nh đến K&iacute;nh Mắt Việt Nam - VinaOptic để được sửa chữa, nắn chỉnh&nbsp;v&agrave; thay ve, v&iacute;t miễn ph&iacute;.</p>

<p><strong>3. KH&Ocirc;NG ĐƯỢC CẦN TAY V&Agrave;O MẮT K&Iacute;NH</strong></p>

<p>Cầm tay v&agrave;o mắt k&iacute;nh thường l&agrave;m cho mắt k&iacute;nh bị mờ đi v&igrave; mắt k&iacute;nh rất dễ bắt d&iacute;nh dầu v&agrave; mồ h&ocirc;i, tay bị bụi bẩn cũng c&oacute; thể l&agrave;m cho k&iacute;nh bị trầy xước, ố m&agrave;u l&agrave;m cho khả năng quan s&aacute;t bị hạn chế c&oacute; thể g&acirc;y n&ecirc;n nhức mỏi mắt, đau đầu.</p>

<p><strong>4. TR&Aacute;NH KH&Iacute; N&Oacute;NG, LỬA</strong></p>

<p>- C&aacute;c loại gọng k&iacute;nh l&agrave;m bằng chất liệu nhựa v&agrave; mắt k&iacute;nh l&agrave;m bằng nhựa thường bị biến dạng ở nhiệt độ khoảng 600C, bị n&oacute;ng chảy ở nhiệt độ tr&ecirc;n 1700C.&nbsp;</p>

<p>- Kh&ocirc;ng được đặt k&iacute;nh gần c&aacute;c vật c&oacute; nhiệt độ cao như bếp ga, l&ograve; nướng, l&ograve; sưởi, b&agrave;n l&agrave; n&oacute;ng.</p>

<p>- Kh&ocirc;ng được rửa k&iacute;nh bằng nước n&oacute;ng, kh&ocirc;ng sử dụng k&iacute;nh khi tắm hơi hoặc dung m&aacute;y sấy, l&ograve; sấy để l&agrave;m kh&ocirc; k&iacute;nh.&nbsp;</p>

<p>- Kh&ocirc;ng để k&iacute;nh tr&ecirc;n c&aacute;c vật hấp thụ nhiệt mạnh như mặt b&agrave;n, b&atilde;i c&aacute;t.. dưới &aacute;nh nắng mặt trời tr&ecirc;n 300C.&nbsp;</p>

<p>- Kh&ocirc;ng n&ecirc;n để k&iacute;nh trong xe &ocirc;t&ocirc; khi đỗ xe dưới trời nắng.&nbsp;</p>

<p>- Kh&ocirc;ng để k&iacute;nh trong cốp xe m&aacute;y v&igrave; nhiệt độ trong cốp xe sẽ l&agrave;m chảy những lớp phủ chống c&aacute;c tia UV, tia hồng ngoại... của tr&ograve;ng k&iacute;nh.</p>

<p><strong>5. C&Aacute;C THAO T&Aacute;C VỆ SINH K&Iacute;NH</strong></p>

<p>- Trong qu&aacute; tr&igrave;nh sử dụng, k&iacute;nh sẽ thường xuy&ecirc;n bị b&aacute;m bụi bẩn v&agrave; việc vệ sinh k&iacute;nh cần phải tiến h&agrave;nh thường xuy&ecirc;n.&nbsp;</p>

<p>- Khi vệ sinh k&iacute;nh&nbsp;bạn n&ecirc;n d&ugrave;ng một &iacute;t nước rửa b&aacute;t để l&agrave;m sạch k&iacute;nh, sau đ&oacute; lau kh&ocirc; bằng vải mềm hoặc giấy ăn (mềm, mịn, dai, c&oacute; độ thấm nước cao)&nbsp;.&nbsp;</p>

<p>- Ch&uacute; &yacute; lau nhẹ nh&agrave;ng để tr&aacute;nh l&agrave;m trầy xước mắt k&iacute;nh, gẫy gọng k&iacute;nh, đứt sợi nylon (cước), đặc biệt với c&aacute;c loại gọng k&iacute;nh khoan v&agrave; k&iacute;nh c&oacute; thể th&aacute;o rời mắt.&nbsp;</p>

<p>- Tuyệt đối kh&ocirc;ng lau k&iacute;nh bằng quần &aacute;o đang mặc, một số người đeo k&iacute;nh do sự tiện lợi thường lau k&iacute;nh bằng c&aacute;ch n&agrave;y. Quần &aacute;o đang mặc thường c&oacute; b&aacute;m bụi bẩn, v&agrave; ch&uacute;ng cũng sẽ l&agrave;m trầy xước k&iacute;nh rất nhanh.&nbsp;</p>

<p>- Ve k&iacute;nh (miếng đệm để tỳ l&ecirc;n sống mũi): l&agrave; vật dễ bị hao m&ograve;n, n&ecirc;n s&aacute;u th&aacute;ng hay một năm một lần h&atilde;y đến K&iacute;nh mắt Việt Nam để kiểm tra v&agrave;&nbsp;thay thế miễn ph&iacute; nếu cần thiết</p>

<p><strong>6. N&Ecirc;N CẤT K&Iacute;NH V&Agrave;O HỘP KHI KH&Ocirc;NG ĐEO</strong></p>

<p>Khi kh&ocirc;ng đeo k&iacute;nh bạn n&ecirc;n bảo quản k&iacute;nh ở trong hộp (hay vỏ bao), như vậy sẽ tr&aacute;nh được c&aacute;c trường hợp k&iacute;nh v&ocirc; t&igrave;nh bị va đập, rơi vỡ, trầy xước. Hay thậm ch&iacute; trẻ em nghịch ngợm g&acirc;y hỏng h&oacute;c v.v..&nbsp;</p>

<p><strong>7. CẨN THẬN KHI MẮT K&Iacute;NH TIẾP X&Uacute;C VỚI MỸ PHẨM</strong></p>

<p>- Khi d&ugrave;ng mỹ phẩm, đồ trang điểm n&ecirc;n th&aacute;o k&iacute;nh. Nếu những ho&aacute; mỹ phẩm n&agrave;y d&iacute;nh v&agrave;o gọng hoặc mắt k&iacute;nh, ta n&ecirc;n rửa v&agrave; lau sạch.&nbsp;</p>

<p>- Kh&ocirc;ng để k&iacute;nh tiếp x&uacute;c với c&aacute;c loại etxăng (benzine), thinner hay cồn v&igrave; đ&oacute; l&agrave; nguy&ecirc;n nh&acirc;n l&agrave;m cho k&iacute;nh bị hỏng như gọng bị ăn m&ograve;n, mắt bị rỗ, biến chất, đổi m&agrave;u.</p>

<p><strong>8. VỚI NHỮNG NGƯỜI DỄ BỊ DỊ ỨNG</strong></p>

<p>- Trong trường hợp gọng k&iacute;nh bị trầy xước, gỉ s&eacute;t hay vỡ lớp bọc ngo&agrave;i c&ugrave;ng, nếu cứ tiếp tục sử dụng c&oacute; thể g&acirc;y ảnh hưởng kh&ocirc;ng tốt cho da.&nbsp;</p>

<p>- Khi bị ngứa, tr&oacute;c da hay c&oacute; hiện tượng l&agrave; ở những phần da tiếp x&uacute;c với k&iacute;nh, h&atilde;y ngưng sử dụng v&agrave; đến ph&ograve;ng kh&aacute;m để kh&aacute;m. Khi đ&oacute; c&ugrave;ng với việc điều trị c&aacute;c dị ứng, sẽ phải dung những loại gọng k&iacute;nh c&oacute; chất liệu ph&ugrave; hợp với cơ địa của m&igrave;nh.</p>

<p><strong>9. KIỂM TRA MẮT ĐỊNH KỲ&nbsp;</strong></p>

<p>- Cơ thể con người lu&ocirc;n ph&aacute;t triển hay tho&aacute;i triển, g&acirc;y n&ecirc;n hiện tượng thay đổi số độ sau một thời gian, chiếc k&iacute;nh đeo mắt cũng sẽ bị hao m&ograve;n v&agrave; chỉ c&oacute; tuổi thọ nhất định, mắt k&iacute;nh c&oacute; thể bị ngả m&agrave;u, trầy xước.&nbsp;</p>

<p>- Sau 6 th&aacute;ng bạn n&ecirc;n đến K&iacute;nh Mắt Việt Nam để kiểm tra t&igrave;nh trạng chiếc k&iacute;nh đang sử dụng, để thay thế mắt k&iacute;nh bị l&atilde;o ho&aacute; v&agrave; kiểm tra lại thị lực của m&igrave;nh.</p>
', N'123', 350000, 35, 345000, N'GỌNG STEPPER EX-50311', N'GỌNG STEPPER EX-50311', 1, CAST(N'2021-04-16T00:59:20.000' AS DateTime), 21, CAST(N'2023-05-08T22:06:23.420' AS DateTime), 1008, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ID], [Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate], [img1], [img2], [img3], [img4]) VALUES (15, N'GỌNG FANSU BB67', N'gong-fansu-bb67', 6, N'Pic1.jpg', N'Không có', 1, 2, N'<p>- Thương hiệu:&nbsp;Fansu</p>

<p>- M&atilde; sản phẩm:&nbsp;BB67</p>

<p>- Vật Liệu: Kim Loại</p>

<p>-&nbsp;&nbsp;K&iacute;ch thước:&nbsp;51-21-145</p>

<p>- Xuất Xứ : Trung Quốc</p>

<p>- Cảnh b&aacute;o: Bảo quản trong hộp k&iacute;nh</p>

<p>- Chịu tr&aacute;ch nhiệm sản phẩm (Nhập khẩu v&agrave; ph&acirc;n phối):</p>

<p>C&Ocirc;NG TY TNHH K&Iacute;NH MẮT VIỆT NAM</p>

<p>Địa chỉ: 138B Giảng V&otilde; - Ba Đ&igrave;nh - H&agrave; Nội</p>
', N'<h1>QUY C&Aacute;CH Đ&Oacute;NG G&Oacute;I</h1>

<p>- Hộp đựng k&iacute;nh</p>

<p>- Khăn lau k&iacute;nh cao cấp</p>

<p>- Thẻ bảo h&agrave;nh</p>

<p>- T&uacute;i đựng k&iacute;nh</p>

<h1>CH&Iacute;NH S&Aacute;CH VẬN CHUYỂN</h1>

<p><strong>1. THỜI GIAN GIAO H&Agrave;NG</strong></p>

<p>K&iacute;nh Mắt Việt Nam - VINAOPTIC hiểu được mong muốn nhận h&agrave;ng sớm của qu&yacute; kh&aacute;ch, tuy nhi&ecirc;n, thời gian giao h&agrave;ng của K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC c&ograve;n phụ thuộc v&agrave;o đơn vị vận chuyển của ch&uacute;ng t&ocirc;i. Th&ocirc;ng thường, thời gian giao h&agrave;ng thường mất 1 &ndash; 7 ng&agrave;y l&agrave;m việc (kh&ocirc;ng bao gồm thứ Bảy, Chủ Nhật v&agrave; Ng&agrave;y nghỉ lễ). Qu&yacute; kh&aacute;ch c&oacute; thể tham khảo bảng thời gian vận chuyển dưới đ&acirc;y của ch&uacute;ng t&ocirc;i. Xin vui l&ograve;ng lưu &yacute; rằng K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC bảo lưu quyền thay đổi thời gian giao h&agrave;ng m&agrave; kh&ocirc;ng cần b&aacute;o trước trong trường hợp chịu ảnh hưởng của thi&ecirc;n tai hoặc c&aacute;c sự kiện đặc biệt kh&aacute;c.</p>

<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td><strong>Địa chỉ nhận h&agrave;ng</strong></td>
			<td><strong>Thời gian vận chuyển</strong></td>
		</tr>
		<tr>
			<td>Nội th&agrave;nh H&agrave; Nội</td>
			<td>1 - 2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>Ngoại th&agrave;nh H&agrave; Nội</td>
			<td>2 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c th&agrave;nh phố lớn</td>
			<td>2 &ndash; 4 ng&agrave;y l&agrave;m việc</td>
		</tr>
		<tr>
			<td>C&aacute;c tỉnh kh&aacute;c, huyện, x&atilde;, v&ugrave;ng s&acirc;u v&ugrave;ng xa</td>
			<td>2 - 7 ng&agrave;y l&agrave;m việc</td>
		</tr>
	</tbody>
</table>

<p>Trong trường hợp qu&yacute; kh&aacute;ch chọn h&igrave;nh thức thanh to&aacute;n bằng thẻ t&iacute;n dụng (credit card) hoặc chuyển khoản ng&acirc;n h&agrave;ng, thời gian xử l&yacute; đơn h&agrave;ng sẽ được t&iacute;nh kể từ khi K&iacute;nh Mắt Việt Nam -&nbsp;VINAOPTIC nhận được khoản thanh to&aacute;n ho&agrave;n tất của qu&yacute; kh&aacute;ch.</p>

<p>Đơn h&agrave;ng của qu&yacute; kh&aacute;ch sẽ chỉ được giao tối đa 2 lần. Trong trường hợp lần giao thứ nhất kh&ocirc;ng th&agrave;nh c&ocirc;ng, khi đ&oacute; nh&acirc;n vi&ecirc;n giao h&agrave;ng sẽ li&ecirc;n hệ với qu&yacute; kh&aacute;ch để x&aacute;c nhận ng&agrave;y giao h&agrave;ng lần 2 sau 1- 2 ng&agrave;y l&agrave;m việc kế tiếp. Ch&uacute;ng t&ocirc;i sẽ cố gắng li&ecirc;n hệ giao h&agrave;ng cho qu&yacute; kh&aacute;ch trong v&ograve;ng 02 ng&agrave;y l&agrave;m việc (th&ocirc;ng qua tin nhắn hoặc gọi trực tiếp). Trong trường hợp vẫn kh&ocirc;ng thể li&ecirc;n lạc lại được hoặc kh&ocirc;ng nhận được bất k&igrave; phản hồi n&agrave;o từ ph&iacute;a qu&yacute; kh&aacute;ch, đơn h&agrave;ng sẽ bị hủy nếu qu&yacute; kh&aacute;ch lựa chọn h&igrave;nh thức thanh to&aacute;n COD (nhờ thu hộ) hoặc sẽ được lưu giữ tại kho h&agrave;ng của ch&uacute;ng t&ocirc;i hoặc b&ecirc;n vận chuyển nếu qu&yacute; kh&aacute;ch đ&atilde; thanh to&aacute;n đơn h&agrave;ng rồi trong v&ograve;ng 24 giờ.</p>

<p>Qu&yacute; kh&aacute;ch được xem h&agrave;ng trước khi nhận h&agrave;ng v&agrave; thanh to&aacute;n. Trong trường hợp bạn gặp vấn đề ph&aacute;t sinh, bạn li&ecirc;n hệ ngay đến Sale Online&nbsp;<strong>024.3736.5505</strong>&nbsp;của ch&uacute;ng t&ocirc;i để được hỗ trợ kịp thời.</p>

<p><strong>2.CƯỚC PH&Iacute; VẬN CHUYỂN TẠI NH&Agrave;</strong></p>

<p>Để đảm bảo đơn h&agrave;ng được chuyển đến tay bạn sớm nhất, ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch bạn đặt h&agrave;ng trước 15h00 mỗi ng&agrave;y.</p>

<p><strong>3. TRA CỨU ĐƠN H&Agrave;NG Đ&Atilde; ĐẶT</strong></p>

<p>Để tra cứu trạng th&aacute;i đơn h&agrave;ng đ&atilde; đặt, qu&yacute; kh&aacute;ch vui l&ograve;ng li&ecirc;n hệ Bộ phận B&aacute;n h&agrave;ng Online&nbsp;<strong>024.3736.5505</strong>&nbsp;(Thời gian l&agrave;m việc 8:30 - 17:30 từ Thứ 2 đến Thứ 6) để được hỗ trợ nhanh nhất.</p>

<p><img src="chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png" /></p>
', N'', 2450000, 16, 2400000, N'GỌNG FANSU BB67', N'GỌNG FANSU BB67', 1, CAST(N'2021-04-16T01:00:39.000' AS DateTime), 21, CAST(N'2023-05-11T22:47:10.937' AS DateTime), 1008, 0, N'Pic1_sup2.jpg', N'Pic1_sup3.jpg', N'Pic1_sup4.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Position], [Img], [Orders], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (1, N'Cay canh slider', N'cay-canh-slider', N'slideshow', N'imgdemo.JPG', 1, CAST(N'2021-03-02T13:39:32.093' AS DateTime), 20, CAST(N'2021-03-31T16:38:27.623' AS DateTime), 21, 0)
INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Position], [Img], [Orders], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (2, N'slider cay canh 2', N'slider-cay-canh-2', N'slideshow', N'imgdemo.JPG', 1, CAST(N'2021-03-02T13:43:37.430' AS DateTime), 20, CAST(N'2021-03-31T16:38:28.820' AS DateTime), 21, 0)
INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Position], [Img], [Orders], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (3, N'slider cay canh 3', N'slider-cay-canh-3', N'slideshow', N'imgdemo.JPG', 1, CAST(N'2021-03-02T13:43:53.777' AS DateTime), 20, CAST(N'2021-03-31T16:38:30.197' AS DateTime), 21, 0)
INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Position], [Img], [Orders], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (4, N'slider watch site', N'slider-watch-site', N'slideshow', N'slide1.JPG', 2, CAST(N'2021-03-31T15:46:15.663' AS DateTime), 21, CAST(N'2021-03-31T15:46:15.663' AS DateTime), 21, 1)
INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Position], [Img], [Orders], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (5, N'banner 2', N'banner-2', N'slideshow', N'slide2.JPG', 5, CAST(N'2021-03-31T16:38:46.437' AS DateTime), 21, CAST(N'2021-03-31T16:38:46.437' AS DateTime), 21, 1)
INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Position], [Img], [Orders], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (6, N'banner 3', N'banner-3', N'slideshow', N'slide3.JPG', 5, CAST(N'2021-03-31T16:38:57.000' AS DateTime), 21, CAST(N'2021-03-31T16:39:51.747' AS DateTime), 21, 1)
SET IDENTITY_INSERT [dbo].[Sliders] OFF
SET IDENTITY_INSERT [dbo].[Topics] ON 

INSERT [dbo].[Topics] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (1, N'Thông tin web', N'thong-tin-web', 0, NULL, N'Về chúng tôi', N'Thông tin web', CAST(N'2021-04-14T17:50:17.140' AS DateTime), 27, CAST(N'2021-04-14T17:50:17.140' AS DateTime), 27, 1)
INSERT [dbo].[Topics] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (2, N'Cách chọn kính mắt hợp với khuôn mặt', N'cach-chon-kinh-mat-hop-voi-khuon-mat', 1, NULL, N'Cách chọn kính mắt hợp với khuôn mặt', N'Cách chọn kính mắt hợp với khuôn mặt', CAST(N'2023-05-08T23:48:28.507' AS DateTime), 1008, CAST(N'2023-05-08T23:48:28.507' AS DateTime), 1008, 1)
SET IDENTITY_INSERT [dbo].[Topics] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [FullName], [Name], [Password], [Email], [Gender], [Phone], [Address], [Image], [Access], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by]) VALUES (1, N'Trần Thị Duyên', N'admin', N'625d45c587033e8970af8b4e3fdb575c', N'colennhe102@gmail.com', 1, 983487921, N'Lập Thạch_ Vĩnh Phúc', N'imgdemo.JPG', 0, 1, CAST(N'2021-03-01T21:23:14.520' AS DateTime), 1, CAST(N'2021-03-01T21:23:14.520' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [FullName], [Name], [Password], [Email], [Gender], [Phone], [Address], [Image], [Access], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by]) VALUES (2, N'Tạ Văn Toàn', N'toantv', N'xMpCOKC5I4INzFCab3WEmw==', N'toan@gmail.com', 1, 55626289, N'Hà Nội', N'ign.jpg', 0, 1, CAST(N'2023-03-01T00:00:00.000' AS DateTime), 1, CAST(N'2023-03-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [FullName], [Name], [Password], [Email], [Gender], [Phone], [Address], [Image], [Access], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by]) VALUES (10, N'Phạm Văn Dung', N'dung1', N'L7xBNTd396+0C6e8RKiCAA==', N'hvhust1998@gmail.com', 1, 1231412314, N'Ha Noi', NULL, 0, 1, CAST(N'2023-03-01T00:00:00.000' AS DateTime), 1, CAST(N'2023-03-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [FullName], [Name], [Password], [Email], [Gender], [Phone], [Address], [Image], [Access], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by]) VALUES (12, N'Phạm Thị Hoà', N'dung2', N'xMpCOKC5I4INzFCab3WEmw==', N'dugn3@gmail.com', 1, 123124123, N'Ha noi', NULL, 2, 1, CAST(N'2023-01-01T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [FullName], [Name], [Password], [Email], [Gender], [Phone], [Address], [Image], [Access], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by]) VALUES (1004, N'dungthieu', N'admin1@gmail.com', N'xbLOvxWyBVA1YMTo5tHqeA==', N'admin@gmail.com', 1, 0, N'16 do xuan hop', N'', 1, 1, CAST(N'2023-04-21T20:45:02.547' AS DateTime), 1, CAST(N'2023-04-21T20:45:02.547' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [FullName], [Name], [Password], [Email], [Gender], [Phone], [Address], [Image], [Access], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by]) VALUES (1007, N'Trần Thị Duyên', N'Duyên', N'L7xBNTd396+0C6e8RKiCAA==', N'Tranduyen051201@gmail.com', 1, 853859629, N'Thanh Hoá', N'', 1, 1, CAST(N'2023-04-23T19:42:25.917' AS DateTime), 1, CAST(N'2023-04-23T19:42:25.917' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [FullName], [Name], [Password], [Email], [Gender], [Phone], [Address], [Image], [Access], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by]) VALUES (1008, N'Trần Thị Duyên', N'Sin', N'MDDHUsr3rytW+63fwYpOdw==', N'Colennhe@gmail.com', 1, 123450864, N'Hà Tĩnh', N'', 2, 1, CAST(N'2023-04-23T20:17:58.713' AS DateTime), 1, CAST(N'2023-04-23T20:17:58.713' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [FullName], [Name], [Password], [Email], [Gender], [Phone], [Address], [Image], [Access], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by]) VALUES (1009, N'linh', N'ưeee', N'f+I0ofiTbbWHKRvSgC9i6g==', N'Tr051201@gmail.com', 1, 961187193, N'Hà Tĩnh', N'', 1, 1, CAST(N'2023-04-23T22:01:26.397' AS DateTime), 1, CAST(N'2023-04-23T22:01:26.397' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [FullName], [Name], [Password], [Email], [Gender], [Phone], [Address], [Image], [Access], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by]) VALUES (1010, N'Nguyen Văn A', N'Anh', N'L7xBNTd396+0C6e8RKiCAA==', N'Tranduyen010378@gmail.com', 1, 961187765, N'Thanh Hoá', N'', 1, 1, CAST(N'2023-04-26T22:47:45.673' AS DateTime), 1, CAST(N'2023-04-26T22:47:45.673' AS DateTime), 1)
INSERT [dbo].[Users] ([ID], [FullName], [Name], [Password], [Email], [Gender], [Phone], [Address], [Image], [Access], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by]) VALUES (1011, N'Phạm Hoà', N'Hoa', N'IhDOXG1jfNb3Vq5v7yJT+Q==', N'hoa@gmail.com', 2, 566787898, N'Bắc Giang', NULL, 0, 1, CAST(N'2023-05-05T14:08:42.567' AS DateTime), 1008, CAST(N'2023-05-05T14:08:42.567' AS DateTime), 1008)
INSERT [dbo].[Users] ([ID], [FullName], [Name], [Password], [Email], [Gender], [Phone], [Address], [Image], [Access], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by]) VALUES (1012, N'Linh', N'Linh', N'a5JKFxpoFnXwVjfPmhT5RQ==', N'linh@gmail.com', 2, 34567890, N'Bắc Giang', NULL, 0, 1, CAST(N'2023-05-05T15:22:31.197' AS DateTime), 1008, CAST(N'2023-05-05T15:22:31.197' AS DateTime), 1008)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[ProductRate] ADD  CONSTRAINT [DF_ProductRate_Rate]  DEFAULT ((0)) FOR [Rate]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [ProRate]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [fk_orderDetails_order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [fk_orderDetails_order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [fk_orderDetails_product2] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [fk_orderDetails_product2]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_orders_users_ID] FOREIGN KEY([CustemerId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_orders_users_ID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_product_category] FOREIGN KEY([CateID])
REFERENCES [dbo].[Categorys] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_product_category]
GO
USE [master]
GO
ALTER DATABASE [QLAnnastore] SET  READ_WRITE 
GO
