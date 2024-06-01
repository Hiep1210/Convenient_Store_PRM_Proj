USE [master]
GO
/****** Object:  Database [ConvenientStore]    Script Date: 01-Jun-24 11:46:25 PM ******/
CREATE DATABASE [ConvenientStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ConvnientStore', FILENAME = N'D:\SQL_Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ConvnientStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ConvnientStore_log', FILENAME = N'D:\SQL_Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ConvnientStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ConvenientStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConvenientStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConvenientStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ConvenientStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ConvenientStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ConvenientStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ConvenientStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ConvenientStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ConvenientStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ConvenientStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ConvenientStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ConvenientStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ConvenientStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ConvenientStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ConvenientStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ConvenientStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ConvenientStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ConvenientStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ConvenientStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ConvenientStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ConvenientStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ConvenientStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ConvenientStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ConvenientStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ConvenientStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ConvenientStore] SET  MULTI_USER 
GO
ALTER DATABASE [ConvenientStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ConvenientStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ConvenientStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ConvenientStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ConvenientStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ConvenientStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ConvenientStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [ConvenientStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ConvenientStore]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 01-Jun-24 11:46:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 01-Jun-24 11:46:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[userId] [int] NOT NULL,
	[address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 01-Jun-24 11:46:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderId] [int] NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [nvarchar](50) NOT NULL,
	[productId] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 01-Jun-24 11:46:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[supplierId] [int] NOT NULL,
	[image] [nvarchar](50) NULL,
	[price] [float] NULL,
	[catId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 01-Jun-24 11:46:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[contact] [nvarchar](50) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 01-Jun-24 11:46:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [ConvenientStore] SET  READ_WRITE 
GO
