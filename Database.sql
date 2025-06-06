USE [master]
GO
/****** Object:  Database [CafeShop]    Script Date: 5/31/2025 4:51:29 PM ******/
CREATE DATABASE [CafeShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CafeShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CafeShop.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CafeShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CafeShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CafeShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CafeShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CafeShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CafeShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CafeShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CafeShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CafeShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [CafeShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CafeShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CafeShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CafeShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CafeShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CafeShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CafeShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CafeShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CafeShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CafeShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CafeShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CafeShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CafeShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CafeShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CafeShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CafeShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CafeShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CafeShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CafeShop] SET  MULTI_USER 
GO
ALTER DATABASE [CafeShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CafeShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CafeShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CafeShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CafeShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CafeShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CafeShop', N'ON'
GO
ALTER DATABASE [CafeShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [CafeShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CafeShop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[Role] [int] NOT NULL,
	[FullName] [nvarchar](250) NULL,
	[Gender] [int] NULL,
	[PhoneNumber] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[AvatarUrl] [nvarchar](max) NULL,
	[IsActive] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NULL,
	[ProductDetailId] [int] NULL,
	[Quantity] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartTopping]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartTopping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CartID] [int] NULL,
	[ToppingID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
 CONSTRAINT [PK_CartTopping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoodsIssue]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsIssue](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[GoodIssueCode] [nvarchar](150) NULL,
	[Decription] [nvarchar](550) NULL,
	[IssueDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_GoodsIssue] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoodsIssueDetails]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsIssueDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GoodIssueID] [int] NULL,
	[MaterialID] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[Decription] [nvarchar](550) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_GoodsIssueDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoodsIssueFile]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsIssueFile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsIssueID] [int] NOT NULL,
	[FileUrl] [nvarchar](max) NULL,
	[FileName] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_GoodsIssueFile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoodsReceipt]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsReceipt](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccoutID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[ReceiptedDate] [datetime] NOT NULL,
	[GoodsReceiptCode] [nvarchar](250) NOT NULL,
	[Decription] [nvarchar](550) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_GoodsReceipt] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoodsReceiptDetails]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsReceiptDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsReceiptID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_GoodsReceiptDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoodsReceiptFile]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsReceiptFile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsReceiptID] [int] NOT NULL,
	[FileUrl] [nvarchar](max) NULL,
	[FileName] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_GoodsReceiptFile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LinkUrl]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinkUrl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeUrl] [nvarchar](250) NULL,
	[LinkUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_LinkUrl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UnitID] [int] NOT NULL,
	[MaterialCode] [nvarchar](250) NOT NULL,
	[MaterialName] [nvarchar](250) NULL,
	[MinQuantity] [decimal](18, 2) NOT NULL,
	[Decription] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[OrderCode] [nvarchar](250) NULL,
	[CustomerName] [nvarchar](250) NULL,
	[PhoneNumber] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Status] [int] NULL,
	[ReasonCancel] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductDetailID] [int] NULL,
	[Quantity] [int] NULL,
	[TotalMoney] [decimal](18, 2) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetailsTopping]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetailsTopping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDetailsID] [int] NOT NULL,
	[ToppingID] [int] NOT NULL,
	[ToppingPrice] [decimal](18, 2) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
 CONSTRAINT [PK_OrderDetailsTopping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductCode] [nvarchar](250) NULL,
	[ProductName] [nvarchar](250) NULL,
	[IsActive] [bit] NULL,
	[Description] [nvarchar](250) NULL,
	[ProductTypeID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[ProductSizeID] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_ProductDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[ImageName] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSize]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSize](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SizeCode] [nvarchar](250) NULL,
	[SizeName] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_ProductSize] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTopping]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTopping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ToppingID] [int] NULL,
	[ProductID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
 CONSTRAINT [PK_ProductTopping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeCode] [nvarchar](250) NULL,
	[TypeName] [nvarchar](250) NULL,
	[GroupTypeID] [int] NULL,
	[Description] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierCode] [nvarchar](150) NOT NULL,
	[SupplierName] [nvarchar](250) NULL,
	[PhoneNumber] [nvarchar](250) NULL,
	[Decription] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topping]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ToppingCode] [nvarchar](150) NULL,
	[ToppingName] [nvarchar](250) NULL,
	[ToppingPrice] [decimal](18, 2) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_Topping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UnitCode] [nvarchar](150) NULL,
	[UnitName] [nvarchar](250) NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](150) NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1, N'admin', N'MQA=', 2, N'admin', 0, N'', N'', N'', 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (3, N'lekhoi200503@gmail.com', N'MQA=', 1, N'Lê Minh Khôi', 0, N'0328104515', N'Quảng Ninh', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (4, N'huyen@gmail.com', N'MQA=', 1, N'Thanh Huyền', 1, N'0335149758', N'Hà Nội', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (5, N'giang@gmail.com', N'MQA=', 1, N'Hương Giang', 1, N'0376149756', N'Hưng Yên', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (8, N'hung@gmail.com', N'MQA=', 1, N'Đình Hùng', 0, N'03761496842', N'Hưng Yên', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (10, N'lam@gmail.com', N'MQA=', 1, N'Hoàng Lâm', 0, N'0251497581', N'Bắc Giang', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (11, N'quy@gmail.com', N'MQA=', 1, N'Văn Quý', 0, N'0376179255', N'Vĩnh Phúc', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (12, N'khanh@gmail.com', N'MQA=', 1, N'Phan Khánh', 0, N'0376149734', N'Vĩnh Phúc', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (13, N'NV001', N'MQA=', 3, N'Phan Văn Khánh', 0, N'0328104515', N'Vĩnh Phúc', NULL, 1, CAST(N'2025-04-12T11:09:30.903' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (14, N'NV002', N'MQA=', 3, N'Chu Văn Quý', 1, N'0335149758', N'Hà Nội', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (15, N'NV003', N'MQA=', 3, N'Hương Giang', 1, N'0376149756', N'Hưng Yên', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (16, N'NV004', N'MQA=', 3, N'Đình Hùng', 0, N'03761496842', N'Hưng Yên', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (17, N'QL001', N'MQA=', 4, N'Phan Văn Khánh', 0, N'0328104515', N'Hải Lựu', NULL, 1, CAST(N'2025-04-12T11:10:00.037' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (18, N'QL002', N'MQA=', 4, N'Nguyễn Đình Hùng', 1, N'0335149758', N'Hà Nội', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (19, N'johndoe1234@example.com', N'MQA=', 1, N'John Doe', 0, N'0923 456 789', N'123 Phố Nguyễn Du, Quận Hai Bà Trưng, Hà Nội, Việt Nam', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (20, N'mary.smith9876@fakeemail.com', N'MQA=', 1, N'Mary Smith', 0, N'0934 567 890', N'456 Phố Trần Hưng Đạo, Quận Hoàn Kiếm, Hà Nội, Việt Nam', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (21, N'alexander.peters@fakemail.org', N'MQA=', 1, N'Alexander Peters', 0, N'0945 678 901', N'789 Phố Láng Hạ, Quận Đống Đa, Hà Nội, Việt Nam', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (22, N'sarah.jameson987@tempmail.net', N'MQA=', 1, N'Sarah Jameson', 0, N'0956 789 012', N'101 Phố Ngọc Hà, Quận Ba Đình, Hà Nội, Việt Nam', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (23, N'robert.brown2023@discardmail.com', N'MQA=', 1, N'Robert Brown', 0, N'0967 890 123', N'202 Phố Thái Hà, Quận Đống Đa, Hà Nội, Việt Nam', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (24, N'jennifer.wilson99@randommail.com', N'MQA=', 1, N'Jennifer Wilson', 0, N'0978 901 234', N'303 Phố Bà Triệu, Quận Hai Bà Trưng, Hà Nội, Việt Nam', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (25, N'michael.doe56@fakemail.io', N'MQA=', 1, N'Michael Doe', 0, N'0989 012 345', N'404 Phố Kim Mã, Quận Ba Đình, Hà Nội, Việt Nam', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (26, N'emily.johnson73@tempmail.org', N'MQA=', 1, N'Emily Johnson', 0, N'0990 123 456', N'505 Phố Cầu Giấy, Quận Cầu Giấy, Hà Nội, Việt Nam', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (27, N'david.miller99@quickmail.xyz', N'MQA=', 1, N'David Miller', 0, N'0902 345 678', N'606 Phố Xã Đàn, Quận Đống Đa, Hà Nội, Việt Nam', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (28, N'sophia.white123@inboxfake.com', N'MQA=', 1, N'Sophia White', 0, N'0935 678 901', N'707 Phố Nguyễn Chí Thanh, Quận Đống Đa, Hà Nội, Việt Nam', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (30, N'lekhoi3383@gmail.com', N'MQA=', 1, N'Lê Minh Khôi', 0, N'0328104515', N'134/38 Nguyên Xá', NULL, 1, CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-18T00:00:00.000' AS DateTime), N'Lê Minh Khôi', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (31, N'khanh123@gmail.com', N'MQA=', 1, N'Khánh Sky', 0, N'', N'', NULL, 1, CAST(N'2025-04-04T22:17:04.587' AS DateTime), N'Khánh Sky', CAST(N'2025-04-04T22:17:04.587' AS DateTime), N'Khánh Sky', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (32, N'Khanh11@gmail.com', N'MQA=', 1, N'Phan Văn Khánh', 0, N'0928432545', N'', N'/Images/Avatar/Account32/457727510_122147896118273984_3063034411177433818_n.jpg', 1, CAST(N'2025-04-04T23:08:39.790' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-04-24T16:15:19.037' AS DateTime), N'Phan Văn Khánh', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (33, N'Khanh69@gmail.com', N'MQAyADMANAA1ADYA', 2, N'Phan Văn Khánh', 0, N'0977866286', N'', NULL, 1, NULL, NULL, CAST(N'2025-04-12T11:08:12.947' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1033, N'NV005', N'MQAyADMANAA1ADYA', 3, N'Phan Khánh 2', 0, N'097786328', N'', NULL, 1, NULL, NULL, CAST(N'2025-04-14T21:18:02.810' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1034, N'quanly003@gmail.com', N'MQAyADMANAA1ADYA', 4, N'QL003', 0, N'013456789', N'', NULL, 1, NULL, NULL, CAST(N'2025-04-27T22:10:48.627' AS DateTime), N'admin', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1035, N'duy123@gmail.com', N'MQA=', 1, N'duy', 0, N'', N'', NULL, 1, CAST(N'2025-05-10T18:21:31.320' AS DateTime), N'duy', CAST(N'2025-05-10T18:21:31.320' AS DateTime), N'duy', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1036, N'khanh1@gmail.com', N'MQAyADMANAA1ADYA', 1, N'Phan Văn Khánh', 0, N'', N'', NULL, 1, CAST(N'2025-05-20T09:36:28.533' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-05-20T09:36:28.533' AS DateTime), N'Phan Văn Khánh', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1037, N'phankhanh1@gmail.com', N'MQAyADMA', 1, N'Phan Văn Khánh', 0, N'', N'', NULL, 1, CAST(N'2025-05-30T15:26:48.103' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-05-30T15:26:48.107' AS DateTime), N'Phan Văn Khánh', 0)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [FullName], [Gender], [PhoneNumber], [Address], [AvatarUrl], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1038, N'Pkhanh1@gmail.com', N'MQAyADMA', 1, N'Phan Văn Khánh', 0, N'', N'', NULL, 1, CAST(N'2025-05-30T15:29:10.683' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-05-30T15:29:10.683' AS DateTime), N'Phan Văn Khánh', 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([ID], [AccountId], [ProductDetailId], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1075, 1035, 40, 1, CAST(N'2025-05-21T14:44:37.933' AS DateTime), N'duy', NULL, NULL)
INSERT [dbo].[Cart] ([ID], [AccountId], [ProductDetailId], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1079, 1038, 1058, 1, CAST(N'2025-05-30T21:33:03.470' AS DateTime), N'Phan Văn Khánh', NULL, NULL)
INSERT [dbo].[Cart] ([ID], [AccountId], [ProductDetailId], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1080, 1038, 41, 1, CAST(N'2025-05-30T21:33:14.213' AS DateTime), N'Phan Văn Khánh', NULL, NULL)
INSERT [dbo].[Cart] ([ID], [AccountId], [ProductDetailId], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1081, 1038, 1090, 1, CAST(N'2025-05-30T21:33:29.763' AS DateTime), N'Phan Văn Khánh', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[CartTopping] ON 

INSERT [dbo].[CartTopping] ([ID], [CartID], [ToppingID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1062, 1079, 1, CAST(N'2025-05-30T21:33:03.983' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-05-30T21:33:03.983' AS DateTime), N'Phan Văn Khánh')
SET IDENTITY_INSERT [dbo].[CartTopping] OFF
GO
SET IDENTITY_INSERT [dbo].[GoodsIssue] ON 

INSERT [dbo].[GoodsIssue] ([ID], [AccountID], [GoodIssueCode], [Decription], [IssueDate], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1, 17, N'PXH20241225T000001', N'', CAST(N'2024-12-25T00:00:00.000' AS DateTime), CAST(N'2024-12-25T22:17:03.470' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[GoodsIssue] ([ID], [AccountID], [GoodIssueCode], [Decription], [IssueDate], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2, 1, N'PXH20250404T000001', N'', CAST(N'2025-04-04T00:00:00.000' AS DateTime), CAST(N'2025-04-04T22:44:56.957' AS DateTime), N'admin', CAST(N'2025-04-27T21:54:08.213' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsIssue] ([ID], [AccountID], [GoodIssueCode], [Decription], [IssueDate], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (3, 1, N'PXH20250516T000002', N'', CAST(N'2025-05-16T00:00:00.000' AS DateTime), CAST(N'2025-05-16T10:04:12.737' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[GoodsIssue] ([ID], [AccountID], [GoodIssueCode], [Decription], [IssueDate], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (4, 1, N'PXH20250516T000003', N'', CAST(N'2025-05-16T00:00:00.000' AS DateTime), CAST(N'2025-05-16T15:12:39.630' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[GoodsIssue] ([ID], [AccountID], [GoodIssueCode], [Decription], [IssueDate], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (5, 1, N'PXH20250518T000004', N'', CAST(N'2025-05-18T00:00:00.000' AS DateTime), CAST(N'2025-05-18T10:08:22.263' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[GoodsIssue] ([ID], [AccountID], [GoodIssueCode], [Decription], [IssueDate], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (6, 1, N'PXH20250518T000005', N'', CAST(N'2025-05-18T00:00:00.000' AS DateTime), CAST(N'2025-05-18T10:37:56.913' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[GoodsIssue] ([ID], [AccountID], [GoodIssueCode], [Decription], [IssueDate], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (7, 1, N'PXH20250521T000006', N'', CAST(N'2025-05-21T00:00:00.000' AS DateTime), CAST(N'2025-05-21T08:20:21.550' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[GoodsIssue] ([ID], [AccountID], [GoodIssueCode], [Decription], [IssueDate], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (8, 1, N'PXH20250530T000007', N'', CAST(N'2025-05-30T00:00:00.000' AS DateTime), CAST(N'2025-05-30T15:48:40.700' AS DateTime), N'admin', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[GoodsIssue] OFF
GO
SET IDENTITY_INSERT [dbo].[GoodsIssueDetails] ON 

INSERT [dbo].[GoodsIssueDetails] ([ID], [GoodIssueID], [MaterialID], [Quantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1, 1, 7, CAST(10.00 AS Decimal(18, 2)), NULL, CAST(N'2024-12-25T22:17:03.497' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-25T22:17:03.497' AS DateTime), N'Lê Minh Khôi', 0)
INSERT [dbo].[GoodsIssueDetails] ([ID], [GoodIssueID], [MaterialID], [Quantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (4, 2, 16, CAST(5.00 AS Decimal(18, 2)), NULL, CAST(N'2025-04-27T21:54:08.323' AS DateTime), N'admin', CAST(N'2025-04-27T21:54:08.323' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsIssueDetails] ([ID], [GoodIssueID], [MaterialID], [Quantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (5, 3, 7, CAST(3.00 AS Decimal(18, 2)), NULL, CAST(N'2025-05-16T10:04:12.763' AS DateTime), N'admin', CAST(N'2025-05-16T10:04:12.767' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsIssueDetails] ([ID], [GoodIssueID], [MaterialID], [Quantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (6, 4, 7, CAST(3.00 AS Decimal(18, 2)), NULL, CAST(N'2025-05-16T15:12:39.673' AS DateTime), N'admin', CAST(N'2025-05-16T15:12:39.673' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsIssueDetails] ([ID], [GoodIssueID], [MaterialID], [Quantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (7, 5, 13, CAST(6.00 AS Decimal(18, 2)), NULL, CAST(N'2025-05-18T10:08:22.290' AS DateTime), N'admin', CAST(N'2025-05-18T10:08:22.290' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsIssueDetails] ([ID], [GoodIssueID], [MaterialID], [Quantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (8, 6, 15, CAST(5.00 AS Decimal(18, 2)), NULL, CAST(N'2025-05-18T10:37:56.920' AS DateTime), N'admin', CAST(N'2025-05-18T10:37:56.920' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsIssueDetails] ([ID], [GoodIssueID], [MaterialID], [Quantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (9, 7, 12, CAST(6.00 AS Decimal(18, 2)), NULL, CAST(N'2025-05-21T08:20:21.597' AS DateTime), N'admin', CAST(N'2025-05-21T08:20:21.597' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsIssueDetails] ([ID], [GoodIssueID], [MaterialID], [Quantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (10, 8, 11, CAST(6.00 AS Decimal(18, 2)), NULL, CAST(N'2025-05-30T15:48:40.740' AS DateTime), N'admin', CAST(N'2025-05-30T15:48:40.740' AS DateTime), N'admin', 0)
SET IDENTITY_INSERT [dbo].[GoodsIssueDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[GoodsReceipt] ON 

INSERT [dbo].[GoodsReceipt] ([ID], [AccoutID], [SupplierID], [ReceiptedDate], [GoodsReceiptCode], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1, 1, 1, CAST(N'2024-12-19T00:00:00.000' AS DateTime), N'PNH20241219T000001', N'', CAST(N'2024-12-19T01:45:31.450' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[GoodsReceipt] ([ID], [AccoutID], [SupplierID], [ReceiptedDate], [GoodsReceiptCode], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2, 1, 2, CAST(N'2024-12-13T00:00:00.000' AS DateTime), N'PNH20241219T000002', N'', CAST(N'2024-12-19T01:50:34.170' AS DateTime), N'admin', CAST(N'2024-12-19T01:56:14.767' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceipt] ([ID], [AccoutID], [SupplierID], [ReceiptedDate], [GoodsReceiptCode], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (3, 1, 13, CAST(N'2025-04-04T00:00:00.000' AS DateTime), N'PNH20250404T000001', N'', CAST(N'2025-04-04T22:41:30.233' AS DateTime), N'admin', CAST(N'2025-04-04T22:43:53.547' AS DateTime), N'admin', 1)
INSERT [dbo].[GoodsReceipt] ([ID], [AccoutID], [SupplierID], [ReceiptedDate], [GoodsReceiptCode], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (4, 1034, 1, CAST(N'2025-04-04T00:00:00.000' AS DateTime), N'PNH20250404T000001', N'', CAST(N'2025-04-04T22:46:14.067' AS DateTime), N'admin', CAST(N'2025-04-27T22:14:40.160' AS DateTime), N'QL003', 0)
INSERT [dbo].[GoodsReceipt] ([ID], [AccoutID], [SupplierID], [ReceiptedDate], [GoodsReceiptCode], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (5, 1, 12, CAST(N'2025-04-07T00:00:00.000' AS DateTime), N'PNH20250407T000002', N'', CAST(N'2025-04-07T22:09:00.223' AS DateTime), N'admin', NULL, NULL, 1)
INSERT [dbo].[GoodsReceipt] ([ID], [AccoutID], [SupplierID], [ReceiptedDate], [GoodsReceiptCode], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (6, 1, 13, CAST(N'2025-04-27T00:00:00.000' AS DateTime), N'PNH20250427T000002', N'', CAST(N'2025-04-27T21:51:37.353' AS DateTime), N'admin', CAST(N'2025-04-27T22:09:15.017' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceipt] ([ID], [AccoutID], [SupplierID], [ReceiptedDate], [GoodsReceiptCode], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (7, 1, 4, CAST(N'2025-05-16T00:00:00.000' AS DateTime), N'PNH20250516T000003', N'', CAST(N'2025-05-16T08:34:59.453' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[GoodsReceipt] ([ID], [AccoutID], [SupplierID], [ReceiptedDate], [GoodsReceiptCode], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (8, 1, 13, CAST(N'2025-05-16T00:00:00.000' AS DateTime), N'PNH20250516T000004', N'', CAST(N'2025-05-16T08:36:04.857' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[GoodsReceipt] ([ID], [AccoutID], [SupplierID], [ReceiptedDate], [GoodsReceiptCode], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (9, 1, 0, CAST(N'2025-05-16T00:00:00.000' AS DateTime), N'PNH20250516T000005', N'', CAST(N'2025-05-16T08:37:03.390' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[GoodsReceipt] ([ID], [AccoutID], [SupplierID], [ReceiptedDate], [GoodsReceiptCode], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (10, 1, 13, CAST(N'2025-05-16T00:00:00.000' AS DateTime), N'PNH20250516T000006', N'', CAST(N'2025-05-16T10:01:56.750' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[GoodsReceipt] ([ID], [AccoutID], [SupplierID], [ReceiptedDate], [GoodsReceiptCode], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (11, 1, 4, CAST(N'2025-05-16T00:00:00.000' AS DateTime), N'PNH20250516T000007', N'', CAST(N'2025-05-16T10:03:32.803' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[GoodsReceipt] ([ID], [AccoutID], [SupplierID], [ReceiptedDate], [GoodsReceiptCode], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (12, 1, 4, CAST(N'2025-05-16T00:00:00.000' AS DateTime), N'PNH20250516T000008', N'', CAST(N'2025-05-16T15:11:45.867' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[GoodsReceipt] ([ID], [AccoutID], [SupplierID], [ReceiptedDate], [GoodsReceiptCode], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (13, 1, 11, CAST(N'2025-05-18T00:00:00.000' AS DateTime), N'PNH20250518T000009', N'', CAST(N'2025-05-18T10:07:30.350' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[GoodsReceipt] ([ID], [AccoutID], [SupplierID], [ReceiptedDate], [GoodsReceiptCode], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (14, 1, 14, CAST(N'2025-05-18T00:00:00.000' AS DateTime), N'PNH20250518T000010', N'', CAST(N'2025-05-18T10:36:50.950' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[GoodsReceipt] ([ID], [AccoutID], [SupplierID], [ReceiptedDate], [GoodsReceiptCode], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (15, 1, 1, CAST(N'2025-05-21T00:00:00.000' AS DateTime), N'PNH20250521T000011', N'', CAST(N'2025-05-21T08:19:14.577' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[GoodsReceipt] ([ID], [AccoutID], [SupplierID], [ReceiptedDate], [GoodsReceiptCode], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (16, 1, 8, CAST(N'2025-05-30T00:00:00.000' AS DateTime), N'PNH20250530T000012', N'', CAST(N'2025-05-30T15:45:20.150' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[GoodsReceipt] ([ID], [AccoutID], [SupplierID], [ReceiptedDate], [GoodsReceiptCode], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (17, 1, 4, CAST(N'2025-05-30T00:00:00.000' AS DateTime), N'PNH20250530T000013', N'', CAST(N'2025-05-30T15:47:28.030' AS DateTime), N'admin', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[GoodsReceipt] OFF
GO
SET IDENTITY_INSERT [dbo].[GoodsReceiptDetails] ON 

INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1, 1, 1, CAST(100.00 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:45:31.773' AS DateTime), N'admin', CAST(N'2024-12-19T01:45:31.773' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2, 1, 2, CAST(40.00 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:45:31.773' AS DateTime), N'admin', CAST(N'2024-12-19T01:45:31.773' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (3, 1, 3, CAST(40.00 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:45:31.773' AS DateTime), N'admin', CAST(N'2024-12-19T01:45:31.773' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (4, 1, 4, CAST(40.00 AS Decimal(18, 2)), CAST(60000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:45:31.773' AS DateTime), N'admin', CAST(N'2024-12-19T01:45:31.773' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (5, 1, 5, CAST(25.00 AS Decimal(18, 2)), CAST(75000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:45:31.773' AS DateTime), N'admin', CAST(N'2024-12-19T01:45:31.773' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (11, 2, 6, CAST(15.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:56:14.920' AS DateTime), N'admin', CAST(N'2024-12-19T01:56:14.920' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (12, 2, 7, CAST(20.00 AS Decimal(18, 2)), CAST(35000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:56:14.920' AS DateTime), N'admin', CAST(N'2024-12-19T01:56:14.920' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (13, 2, 8, CAST(25.00 AS Decimal(18, 2)), CAST(45000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:56:14.920' AS DateTime), N'admin', CAST(N'2024-12-19T01:56:14.920' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (14, 2, 9, CAST(30.00 AS Decimal(18, 2)), CAST(55000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:56:14.920' AS DateTime), N'admin', CAST(N'2024-12-19T01:56:14.920' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (15, 2, 10, CAST(35.00 AS Decimal(18, 2)), CAST(65000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:56:14.920' AS DateTime), N'admin', CAST(N'2024-12-19T01:56:14.920' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (16, 6, 16, CAST(20.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(N'2025-04-27T22:09:15.023' AS DateTime), N'admin', CAST(N'2025-04-27T22:09:15.023' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (17, 4, 12, CAST(15.00 AS Decimal(18, 2)), CAST(40000.00 AS Decimal(18, 2)), CAST(N'2025-04-27T22:14:40.163' AS DateTime), N'QL003', CAST(N'2025-04-27T22:14:40.163' AS DateTime), N'QL003', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (18, 4, 14, CAST(20.00 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)), CAST(N'2025-04-27T22:14:40.163' AS DateTime), N'QL003', CAST(N'2025-04-27T22:14:40.163' AS DateTime), N'QL003', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (19, 7, 15, CAST(2.00 AS Decimal(18, 2)), CAST(70000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T08:34:59.697' AS DateTime), N'admin', CAST(N'2025-05-16T08:34:59.697' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (20, 8, 13, CAST(3.00 AS Decimal(18, 2)), CAST(90000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T08:36:04.867' AS DateTime), N'admin', CAST(N'2025-05-16T08:36:04.867' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (21, 9, 11, CAST(5.00 AS Decimal(18, 2)), CAST(30000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T08:37:03.397' AS DateTime), N'admin', CAST(N'2025-05-16T08:37:03.397' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (22, 10, 15, CAST(6.00 AS Decimal(18, 2)), CAST(60000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T10:01:57.057' AS DateTime), N'admin', CAST(N'2025-05-16T10:01:57.057' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (23, 11, 17, CAST(6.00 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T10:03:32.817' AS DateTime), N'admin', CAST(N'2025-05-16T10:03:32.817' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (24, 12, 13, CAST(7.00 AS Decimal(18, 2)), CAST(90000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T15:11:45.900' AS DateTime), N'admin', CAST(N'2025-05-16T15:11:45.900' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (25, 13, 7, CAST(5.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(N'2025-05-18T10:07:30.390' AS DateTime), N'admin', CAST(N'2025-05-18T10:07:30.390' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (26, 14, 13, CAST(5.00 AS Decimal(18, 2)), CAST(100000.00 AS Decimal(18, 2)), CAST(N'2025-05-18T10:36:50.960' AS DateTime), N'admin', CAST(N'2025-05-18T10:36:50.960' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (27, 15, 11, CAST(4.00 AS Decimal(18, 2)), CAST(90000.00 AS Decimal(18, 2)), CAST(N'2025-05-21T08:19:14.610' AS DateTime), N'admin', CAST(N'2025-05-21T08:19:14.610' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (28, 16, 18, CAST(10.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)), CAST(N'2025-05-30T15:45:20.200' AS DateTime), N'admin', CAST(N'2025-05-30T15:45:20.200' AS DateTime), N'admin', 0)
INSERT [dbo].[GoodsReceiptDetails] ([ID], [GoodsReceiptID], [MaterialID], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (29, 17, 15, CAST(4.00 AS Decimal(18, 2)), CAST(90000.00 AS Decimal(18, 2)), CAST(N'2025-05-30T15:47:28.050' AS DateTime), N'admin', CAST(N'2025-05-30T15:47:28.050' AS DateTime), N'admin', 0)
SET IDENTITY_INSERT [dbo].[GoodsReceiptDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[GoodsReceiptFile] ON 

INSERT [dbo].[GoodsReceiptFile] ([ID], [GoodsReceiptID], [FileUrl], [FileName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1, 2, N'2024/12/PNH20241219T000002_13122024', N'logo.jpg', CAST(N'2024-12-19T01:56:15.087' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[GoodsReceiptFile] ([ID], [GoodsReceiptID], [FileUrl], [FileName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2, 2, N'2024/12/PNH20241219T000002_13122024', N'Material.xlsx', CAST(N'2024-12-19T01:56:15.100' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[GoodsReceiptFile] ([ID], [GoodsReceiptID], [FileUrl], [FileName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (3, 3, N'2025/4/PNH20250404T000001_04042025', N'sắt.jpg', CAST(N'2025-04-04T22:43:53.683' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[GoodsReceiptFile] ([ID], [GoodsReceiptID], [FileUrl], [FileName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (4, 4, N'2025/4/PNH20250404T000001_04042025', N'sắt.jpg', CAST(N'2025-04-04T22:46:14.103' AS DateTime), N'admin', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[GoodsReceiptFile] OFF
GO
SET IDENTITY_INSERT [dbo].[LinkUrl] ON 

INSERT [dbo].[LinkUrl] ([ID], [TypeUrl], [LinkUrl]) VALUES (1, N'ProductImage', N'https://localhost:7116/Images/Product/')
SET IDENTITY_INSERT [dbo].[LinkUrl] OFF
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([ID], [UnitID], [MaterialCode], [MaterialName], [MinQuantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1, 10, N'HORESI001', N'Siro Monin (Caramel)', CAST(20.00 AS Decimal(18, 2)), N'', CAST(N'2024-12-02T23:21:29.197' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[Material] ([ID], [UnitID], [MaterialCode], [MaterialName], [MinQuantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2, 10, N'HORESI002', N'Siro Torani (Vanilla)', CAST(15.00 AS Decimal(18, 2)), N'', CAST(N'2024-12-02T23:22:04.757' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[Material] ([ID], [UnitID], [MaterialCode], [MaterialName], [MinQuantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (3, 1, N'HYSU001', N'Đường trắng tinh luyện', CAST(15.00 AS Decimal(18, 2)), N'', CAST(N'2024-12-02T23:22:41.007' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-18T21:48:15.333' AS DateTime), N'Lê Minh Khôi', 0)
INSERT [dbo].[Material] ([ID], [UnitID], [MaterialCode], [MaterialName], [MinQuantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (4, 1, N'HYSU002', N'Đường nâu hạt mịn', CAST(15.00 AS Decimal(18, 2)), N'', CAST(N'2024-12-02T23:23:26.057' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-18T21:48:17.813' AS DateTime), N'Lê Minh Khôi', 0)
INSERT [dbo].[Material] ([ID], [UnitID], [MaterialCode], [MaterialName], [MinQuantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (5, 2, N'VMML001', N'Sữa tươi nguyên kem', CAST(20.00 AS Decimal(18, 2)), N'', CAST(N'2024-12-02T23:23:46.217' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[Material] ([ID], [UnitID], [MaterialCode], [MaterialName], [MinQuantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (6, 2, N'VMML002', N'Kem béo thực vật', CAST(15.00 AS Decimal(18, 2)), N'', CAST(N'2024-12-02T23:24:05.100' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-18T21:48:19.977' AS DateTime), N'Lê Minh Khôi', 0)
INSERT [dbo].[Material] ([ID], [UnitID], [MaterialCode], [MaterialName], [MinQuantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (7, 1, N'ORAFR001', N'Xoài đông lạnh', CAST(5.00 AS Decimal(18, 2)), N'', CAST(N'2024-12-02T23:24:31.330' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-07T16:05:51.977' AS DateTime), N'Lê Minh Khôi', 0)
INSERT [dbo].[Material] ([ID], [UnitID], [MaterialCode], [MaterialName], [MinQuantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (8, 1, N'ORAFR002', N'Dâu tây tươi', CAST(3.00 AS Decimal(18, 2)), N'', CAST(N'2024-12-02T23:24:58.670' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[Material] ([ID], [UnitID], [MaterialCode], [MaterialName], [MinQuantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (9, 1, N'PGPPT001', N'Bột cacao nguyên chất', CAST(10.00 AS Decimal(18, 2)), N'', CAST(N'2024-12-02T23:25:56.240' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[Material] ([ID], [UnitID], [MaterialCode], [MaterialName], [MinQuantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (10, 1, N'PGPPT002', N'Bột matcha Nhật Bản', CAST(5.00 AS Decimal(18, 2)), N'', CAST(N'2024-12-02T23:26:17.307' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[Material] ([ID], [UnitID], [MaterialCode], [MaterialName], [MinQuantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (11, 1, N'PGPPT003', N'Bột trà xanh Thái Nguyên', CAST(5.00 AS Decimal(18, 2)), N'', CAST(N'2024-12-02T23:26:50.547' AS DateTime), N'Lê Minh Khôi', CAST(N'2025-05-16T08:38:13.813' AS DateTime), N'admin', 0)
INSERT [dbo].[Material] ([ID], [UnitID], [MaterialCode], [MaterialName], [MinQuantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (12, 1, N'PGPBK001', N'Bột mì đa dụng', CAST(5.00 AS Decimal(18, 2)), N'', CAST(N'2024-12-02T23:27:11.963' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[Material] ([ID], [UnitID], [MaterialCode], [MaterialName], [MinQuantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (13, 2, N'RPVWP001', N'Kem topping sữa', CAST(7.00 AS Decimal(18, 2)), N'', CAST(N'2024-12-02T23:27:39.010' AS DateTime), N'Lê Minh Khôi', CAST(N'2025-05-16T08:53:40.060' AS DateTime), N'admin', 0)
INSERT [dbo].[Material] ([ID], [UnitID], [MaterialCode], [MaterialName], [MinQuantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (14, 1, N'RPVBS001', N'Bột pha trà sữa truyền thống', CAST(5.00 AS Decimal(18, 2)), N'', CAST(N'2024-12-02T23:27:59.797' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[Material] ([ID], [UnitID], [MaterialCode], [MaterialName], [MinQuantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (15, 1, N'RPVBS002', N'Bột sữa béo đặc biệt', CAST(5.00 AS Decimal(18, 2)), N'', CAST(N'2024-12-02T23:28:16.193' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[Material] ([ID], [UnitID], [MaterialCode], [MaterialName], [MinQuantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (16, 9, N'TP123', N'Dừa khô', CAST(10.00 AS Decimal(18, 2)), N'', CAST(N'2025-04-04T22:40:30.457' AS DateTime), N'admin', CAST(N'2025-04-12T11:05:54.947' AS DateTime), N'admin', 0)
INSERT [dbo].[Material] ([ID], [UnitID], [MaterialCode], [MaterialName], [MinQuantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (17, 4, N'DuaTP2', N'Dừa Tươi', CAST(5.00 AS Decimal(18, 2)), N'', CAST(N'2025-05-16T10:02:46.827' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Material] ([ID], [UnitID], [MaterialCode], [MaterialName], [MinQuantity], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (18, 4, N'DuaTP01', N'Dừa Non', CAST(5.00 AS Decimal(18, 2)), N'', CAST(N'2025-05-21T08:21:21.680' AS DateTime), N'admin', CAST(N'2025-05-30T15:45:53.643' AS DateTime), N'admin', 0)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1, 3, N'CFS20240000001', N'Nguyễn Minh Tuấn', N'0901 234 567', N'123 Phố Huế, Quận Hai Bà Trưng', 2, NULL, CAST(N'2024-12-19T00:23:04.507' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-19T00:23:04.507' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2, 3, N'CFS20240000002', N'Trần Thị Lan', N'0912 345 678', N'45 Láng Hạ, Quận Đống Đa', 2, NULL, CAST(N'2024-12-19T00:24:22.933' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-19T00:24:22.933' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (3, 3, N'CFS20240000003', N'Phạm Hoàng Nam', N'0923 456 789', N'78 Nguyễn Khuyến, Quận Hà Đông', 2, NULL, CAST(N'2024-12-19T00:25:23.473' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-19T00:25:23.473' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (4, 3, N'CFS20240000004', N'Lê Thị Mai', N'0934 567 890', N'102 Giảng Võ, Quận Ba Đình', 2, NULL, CAST(N'2024-12-18T00:27:40.787' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-19T00:27:40.787' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (5, 3, N'CFS20240000005', N'Vũ Quốc Duy', N'0945 678 901', N'56 Nguyễn Thái Học, Quận Ba Đình', 2, NULL, CAST(N'2024-12-18T00:27:40.787' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-19T00:28:39.523' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (6, 4, N'CFS20240000006', N'Đặng Thị Kim Chi', N'0956 789 012', N'15 Trần Duy Hưng, Quận Cầu Giấy', 2, NULL, CAST(N'2024-12-18T00:27:40.787' AS DateTime), N'Thanh Huyền', CAST(N'2024-12-19T00:30:30.127' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (7, 4, N'CFS20240000007', N'Bùi Minh Tuấn', N'0967 890 123', N'29 Phan Đình Phùng, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-12-18T00:27:40.787' AS DateTime), N'Thanh Huyền', CAST(N'2024-12-19T00:31:40.463' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (8, 4, N'CFS20240000008', N'Hoàng Thị Lan Anh', N'0978 901 234', N'77 Bà Triệu, Quận Hai Bà Trưng', 2, NULL, CAST(N'2024-12-18T00:27:40.787' AS DateTime), N'Thanh Huyền', CAST(N'2024-12-19T00:32:26.627' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (9, 4, N'CFS20240000009', N'Phan Thiên Hương', N'0989 012 345', N'23 Tràng Tiền, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-12-18T00:27:40.787' AS DateTime), N'Thanh Huyền', CAST(N'2024-12-19T00:33:24.587' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (10, 4, N'CFS20240000010', N'Cao Quang Huy', N'0990 123 456', N'23 Tràng Tiền, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-12-17T00:34:00.167' AS DateTime), N'Thanh Huyền', CAST(N'2024-12-19T00:34:00.167' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (11, 4, N'CFS20240000011', N'Lý Thị Thanh Huyền', N'0902 345 678', N'101 Nguyễn Thái Học, Quận Ba Đình', 2, NULL, CAST(N'2024-12-17T00:34:00.167' AS DateTime), N'Thanh Huyền', CAST(N'2024-12-19T00:34:56.163' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (12, 5, N'CFS20240000012', N'Nguyễn Anh Tuấn', N'0913 456 789', N'32 Lê Văn Lương, Quận Thanh Xuân', 2, NULL, CAST(N'2024-12-17T00:34:00.167' AS DateTime), N'Hương Giang', CAST(N'2024-12-19T00:39:05.420' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (13, 5, N'CFS20240000013', N'Trần Minh Tuấn', N'0924 567 890', N'150 Minh Khai, Quận Hai Bà Trưng', 2, NULL, CAST(N'2024-12-16T00:41:34.840' AS DateTime), N'Hương Giang', CAST(N'2024-12-19T00:41:34.840' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (14, 5, N'CFS20240000014', N'Lê Thị Mai', N'0935 678 901', N'65 Tây Sơn, Quận Đống Đa', 2, NULL, CAST(N'2024-12-15T00:42:07.867' AS DateTime), N'Hương Giang', CAST(N'2024-12-19T00:42:07.867' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (15, 5, N'CFS20240000015', N'Phạm Thị Lan', N'0946 789 012', N'39 Bạch Mai, Quận Hai Bà Trưng', 2, NULL, CAST(N'2024-12-14T00:43:50.193' AS DateTime), N'Hương Giang', CAST(N'2024-12-19T00:43:50.193' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (16, 5, N'CFS20240000016', N'Hoàng Thanh Bình', N'0957 890 123', N'12 Trần Quang Khải, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-12-13T00:44:45.820' AS DateTime), N'Hương Giang', CAST(N'2024-12-19T00:44:45.820' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (17, 5, N'CFS20240000017', N'Đỗ Quang Huy', N'0968 901 234', N'27 Kim Mã, Quận Ba Đình', 2, NULL, CAST(N'2024-12-12T00:47:18.767' AS DateTime), N'Hương Giang', CAST(N'2024-12-19T00:47:18.767' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (18, 5, N'CFS20240000018', N'Vũ Minh Châu', N'0979 012 345', N'50 Nguyễn Chí Thanh, Quận Đống Đa', 2, NULL, CAST(N'2024-12-11T00:47:49.040' AS DateTime), N'Hương Giang', CAST(N'2024-12-19T00:47:49.040' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (19, 5, N'CFS20240000019', N'Nguyễn Thị Lan Anh', N'0980 123 456', N'9 Quang Trung, Quận Hà Đông', 2, NULL, CAST(N'2024-12-10T00:48:22.040' AS DateTime), N'Hương Giang', CAST(N'2024-12-19T00:48:22.040' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (20, 5, N'CFS20240000020', N'Lý Hồng Sơn', N'0991 234 567', N'120 Thái Hà, Quận Đống Đa', 2, NULL, CAST(N'2024-12-09T00:49:08.690' AS DateTime), N'Hương Giang', CAST(N'2024-12-19T00:49:08.690' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (21, 5, N'CFS20240000021', N'Phan Minh Tâm', N'0903 456 789', N'36/32 Mai Dịch', 2, NULL, CAST(N'2024-12-08T00:49:41.803' AS DateTime), N'Hương Giang', CAST(N'2024-12-19T00:49:41.803' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (22, 8, N'CFS20240000022', N'Nguyễn Thị Bích Hạnh', N'0914 567 890', N'48 Hàng Bạc, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-12-07T00:51:00.230' AS DateTime), N'Đình Hùng', CAST(N'2024-12-19T00:51:00.230' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (23, 8, N'CFS20240000023', N'Trần Hoàng Anh', N'0925 678 901', N'22 Lê Thánh Tông, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-12-06T00:51:54.093' AS DateTime), N'Đình Hùng', CAST(N'2024-12-19T00:51:54.093' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (24, 8, N'CFS20240000024', N'Lê Thị Thu Hà', N'0936 789 012', N'56 Chùa Bộc, Quận Đống Đa', 2, NULL, CAST(N'2024-12-05T00:52:23.680' AS DateTime), N'Đình Hùng', CAST(N'2024-12-19T00:52:23.680' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (25, 8, N'CFS20240000025', N'Phạm Minh Quân', N'0947 890 123', N'85 Nguyễn Trãi, Quận Thanh Xuân', 2, NULL, CAST(N'2024-12-04T00:52:38.133' AS DateTime), N'Đình Hùng', CAST(N'2024-12-19T00:52:38.133' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (26, 8, N'CFS20240000026', N'Hoàng Đức Toàn', N'0958 901 234', N'72 Phan Đình Phùng, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-12-03T00:53:10.893' AS DateTime), N'Đình Hùng', CAST(N'2024-12-19T00:53:10.893' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (27, 8, N'CFS20240000027', N'Vũ Thị Lan Anh', N'0969 012 345', N'37 Lý Thường Kiệt, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-12-02T00:55:27.553' AS DateTime), N'Đình Hùng', CAST(N'2024-12-19T00:55:27.553' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (28, 10, N'CFS20240000028', N'Đoàn Ngọc Duy', N'0970 123 456', N'99 Cầu Giấy, Quận Cầu Giấy', 2, NULL, CAST(N'2024-12-01T00:57:25.790' AS DateTime), N'Hoàng Lâm', CAST(N'2024-12-19T00:57:25.790' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (29, 10, N'CFS20240000029', N'Bùi Thị Kim Anh', N'0981 234 567', N'16 Tôn Đức Thắng, Quận Đống Đa', 2, NULL, CAST(N'2024-12-01T00:57:25.790' AS DateTime), N'Hoàng Lâm', CAST(N'2024-12-19T00:57:55.883' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (30, 10, N'CFS20240000030', N'Mai Văn Sơn', N'0992 345 678', N'43 Phố Cổ, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-12-02T00:55:27.553' AS DateTime), N'Hoàng Lâm', CAST(N'2024-12-19T00:58:16.317' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (31, 10, N'CFS20240000031', N'Nguyễn Thị Kim Oanh', N'03761496842', N'60 Nguyễn Công Trứ, Quận Hai Bà Trưng', 2, NULL, CAST(N'2024-12-03T00:53:10.893' AS DateTime), N'Hoàng Lâm', CAST(N'2024-12-19T00:58:59.317' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (32, 10, N'CFS20240000032', N'Trần Văn Hào', N'03761496842', N'123 Phố Huế, Quận Hai Bà Trưng', 2, NULL, CAST(N'2024-12-04T00:52:38.133' AS DateTime), N'Hoàng Lâm', CAST(N'2024-12-19T00:59:15.600' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (33, 10, N'CFS20240000033', N'Lê Minh Tân', N'0328104515', N'48 Hàng Bạc, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-12-05T00:52:23.680' AS DateTime), N'Hoàng Lâm', CAST(N'2024-12-19T00:59:40.493' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (34, 10, N'CFS20240000034', N'Phạm Thị Lan', N'03761496842', N'123 Phố Huế, Quận Hai Bà Trưng', 2, NULL, CAST(N'2024-12-06T00:51:54.093' AS DateTime), N'Hoàng Lâm', CAST(N'2024-12-19T01:00:23.363' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (35, 10, N'CFS20240000035', N'Hoàng Quang Hưng', N'0989 012 345', N'22 Lê Thánh Tông, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-12-07T00:51:00.230' AS DateTime), N'Hoàng Lâm', CAST(N'2024-12-19T01:00:39.773' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (36, 10, N'CFS20240000036', N'Vũ Thị Lan', N'03761496842', N'123 Phố Huế, Quận Hai Bà Trưng', 2, NULL, CAST(N'2024-12-08T00:49:41.803' AS DateTime), N'Hoàng Lâm', CAST(N'2024-12-19T01:01:19.767' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (37, 10, N'CFS20240000037', N'Đỗ Thị Thanh Hương', N'0967 890 123', N'43 Phố Cổ, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-12-09T00:49:08.690' AS DateTime), N'Hoàng Lâm', CAST(N'2024-12-19T01:02:07.287' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (38, 10, N'CFS20240000038', N'Bùi Minh Nhật', N'0989 012 345', N'22 Lê Thánh Tông, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-12-10T00:48:22.040' AS DateTime), N'Hoàng Lâm', CAST(N'2024-12-19T01:02:25.297' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (39, 10, N'CFS20240000039', N'Mai Thị Bích', N'03761496842', N'123 Phố Huế, Quận Hai Bà Trưng', 2, NULL, CAST(N'2024-11-01T01:02:43.913' AS DateTime), N'Hoàng Lâm', CAST(N'2024-12-19T01:02:43.913' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (40, 11, N'CFS20240000040', N'Phan Văn Đức', N'0989 012 345', N'22 Lê Thánh Tông, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-11-02T01:02:43.913' AS DateTime), N'Văn Quý', CAST(N'2024-12-19T01:04:03.197' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (41, 11, N'CFS20240000041', N'Phan Thị Thanh Tâm', N'0376179255', N'45 Láng Hạ, Quận Đống Đa', 2, NULL, CAST(N'2024-11-03T01:02:43.913' AS DateTime), N'Văn Quý', CAST(N'2024-12-19T01:04:18.530' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (42, 11, N'CFS20240000042', N'Mai Văn Sơn', N'0989 012 345', N'22 Lê Thánh Tông, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-11-04T01:02:43.913' AS DateTime), N'Văn Quý', CAST(N'2024-12-19T01:04:36.303' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (43, 11, N'CFS20240000043', N'Nguyễn Thị Bích Hạnh', N'0967 890 123', N'16 Tôn Đức Thắng, Quận Đống Đa', 2, NULL, CAST(N'2024-11-05T01:02:43.913' AS DateTime), N'Văn Quý', CAST(N'2024-12-19T01:05:18.107' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (44, 11, N'CFS20240000044', N'Trần Hoàng Anh', N'0376179255', N'45 Láng Hạ, Quận Đống Đa', 2, NULL, CAST(N'2024-11-06T01:02:43.913' AS DateTime), N'Văn Quý', CAST(N'2024-12-19T01:05:33.683' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (45, 11, N'CFS20240000045', N'Lê Thị Thu Hà', N'0967 890 123', N'48 Hàng Bạc, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-11-07T01:02:43.913' AS DateTime), N'Văn Quý', CAST(N'2024-12-19T01:06:21.720' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (46, 11, N'CFS20240000046', N'Phạm Minh Quân', N'0376179255', N'45 Láng Hạ, Quận Đống Đa', 2, NULL, CAST(N'2024-11-08T01:02:43.913' AS DateTime), N'Văn Quý', CAST(N'2024-12-19T01:07:00.300' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (47, 11, N'CFS20240000047', N'Hoàng Đức Toàn', N'0989 012 345', N'16 Tôn Đức Thắng, Quận Đống Đa', 2, NULL, CAST(N'2024-11-09T01:02:43.913' AS DateTime), N'Văn Quý', CAST(N'2024-12-19T01:07:17.350' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (48, 11, N'CFS20240000048', N'Chu Văn Quý', N'0376179255', N'45 Láng Hạ, Quận Đống Đa', 2, NULL, CAST(N'2024-11-10T01:02:43.913' AS DateTime), N'Văn Quý', CAST(N'2024-12-19T01:07:37.317' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (49, 11, N'CFS20240000049', N'Vũ Thị Lan Anh', N'0967 890 123', N'123 Phố Huế, Quận Hai Bà Trưng', 2, NULL, CAST(N'2024-11-11T01:02:43.913' AS DateTime), N'Văn Quý', CAST(N'2024-12-19T01:08:34.483' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (50, 12, N'CFS20240000050', N'Phan Văn Khánh', N'0989 012 345', N'43 Phố Cổ, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-11-12T01:02:43.913' AS DateTime), N'Phan Khánh', CAST(N'2024-12-19T01:10:47.227' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (51, 12, N'CFS20240000051', N'Đoàn Ngọc Duy', N'0902 345 678', N'102 Giảng Võ, Quận Ba Đình', 2, NULL, CAST(N'2024-11-13T01:02:43.913' AS DateTime), N'Phan Khánh', CAST(N'2024-12-19T01:11:02.317' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (52, 12, N'CFS20240000052', N'Nguyễn Anh Tuấn', N'0989 012 345', N'22 Lê Thánh Tông, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-11-14T01:02:43.913' AS DateTime), N'Phan Khánh', CAST(N'2024-12-19T01:11:22.477' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (53, 12, N'CFS20240000053', N'Trần Minh Tuấn', N'0967 890 123', N'102 Giảng Võ, Quận Ba Đình', 2, NULL, CAST(N'2024-11-15T01:02:43.913' AS DateTime), N'Phan Khánh', CAST(N'2024-12-19T01:12:13.297' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (54, 12, N'CFS20240000054', N'Lê Thị Mai', N'0376149734', N'16 Tôn Đức Thắng, Quận Đống Đa', 2, NULL, CAST(N'2024-11-16T01:02:43.913' AS DateTime), N'Phan Khánh', CAST(N'2024-12-19T01:12:29.737' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (55, 12, N'CFS20240000055', N'Phạm Thị Lan', N'0967 890 123', N'102 Giảng Võ, Quận Ba Đình', 2, NULL, CAST(N'2024-11-17T01:02:43.913' AS DateTime), N'Phan Khánh', CAST(N'2024-12-19T01:13:03.827' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (56, 12, N'CFS20240000056', N'Hoàng Thanh Bình', N'0376149734', N'48 Hàng Bạc, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-11-18T01:14:05.813' AS DateTime), N'Phan Khánh', CAST(N'2024-12-19T01:14:05.813' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (57, 12, N'CFS20240000057', N'Đỗ Quang Huy', N'0967 890 123', N'43 Phố Cổ, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-11-19T01:02:43.913' AS DateTime), N'Phan Khánh', CAST(N'2024-12-19T01:14:21.940' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (58, 12, N'CFS20240000058', N'Phan Văn Khánh', N'0989 012 345', N'16 Tôn Đức Thắng, Quận Đống Đa', 2, NULL, CAST(N'2024-11-20T01:02:43.913' AS DateTime), N'Phan Khánh', CAST(N'2024-12-19T01:14:36.753' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (59, 12, N'CFS20240000059', N'Phan Văn Khánh', N'0967 890 123', N'102 Giảng Võ, Quận Ba Đình', 2, NULL, CAST(N'2024-11-21T01:02:43.913' AS DateTime), N'Phan Khánh', CAST(N'2024-12-19T01:14:53.227' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (60, 12, N'CFS20240000060', N'Vũ Minh Châu', N'0376149734', N'48 Hàng Bạc, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-11-21T01:15:08.350' AS DateTime), N'Phan Khánh', CAST(N'2024-12-19T01:15:08.350' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (61, 3, N'CFS20240000061', N'Lê Minh Khôi', N'0967 890 123', N'134/38 Cầu Diễn', 2, NULL, CAST(N'2024-11-23T01:02:43.913' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-19T01:16:33.037' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (62, 3, N'CFS20240000062', N'Nguyễn Thị Lan Anh', N'0328104515', N'22 Lê Thánh Tông, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-11-24T01:02:43.913' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-19T01:16:48.377' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (63, 3, N'CFS20240000063', N'Lê Minh Khôi', N'0967 890 123', N'134/38 Cầu Diễn', 3, NULL, CAST(N'2024-12-19T00:25:23.473' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-19T01:17:04.377' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (64, 3, N'CFS20240000064', N'Lê Minh Khôi', N'0967 890 123', N'48 Hàng Bạc, Quận Hoàn Kiếm', 3, NULL, CAST(N'2024-12-19T00:25:23.473' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-19T01:17:46.097' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (65, 3, N'CFS20240000065', N'Lý Hồng Sơn', N'0989 012 345', N'43 Phố Cổ, Quận Hoàn Kiếm', 3, NULL, CAST(N'2024-12-19T00:25:23.473' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-19T01:18:15.643' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (66, 3, N'CFS20240000066', N'Lê Minh Khôi', N'0328104515', N'16 Tôn Đức Thắng, Quận Đống Đa', 3, NULL, CAST(N'2024-12-18T00:27:40.787' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-19T01:18:32.473' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (67, 3, N'CFS20240000067', N'Nguyễn Anh Tuấn', N'0967 890 123', N'48 Hàng Bạc, Quận Hoàn Kiếm', 3, NULL, CAST(N'2024-12-18T00:27:40.787' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-19T01:19:24.727' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (68, 3, N'CFS20240000068', N'Hoàng Thị Lan Anh', N'0902 345 678', N'43 Phố Cổ, Quận Hoàn Kiếm', 3, NULL, CAST(N'2024-12-18T00:27:40.787' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-19T01:19:38.850' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (69, 3, N'CFS20240000069', N'Phan Thiên Hương
', N'0902 345 678', N'48 Hàng Bạc, Quận Hoàn Kiếm', 3, NULL, CAST(N'2024-12-17T00:34:00.167' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-19T01:19:56.507' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (70, 3, N'CFS20240000070', N'Cao Quang Huy', N'0328104515', N'16 Tôn Đức Thắng, Quận Đống Đa', 3, NULL, CAST(N'2024-12-17T00:34:00.167' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-19T01:20:24.550' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (71, 22, N'CFS20240000071', N'Sarah Jameson', N'0956 789 012', N'101 Phố Ngọc Hà, Quận Ba Đình, Hà Nội, Việt Nam', 2, NULL, CAST(N'2024-12-20T22:01:22.770' AS DateTime), N'Sarah Jameson', CAST(N'2024-12-25T22:01:22.770' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (72, 22, N'CFS20240000072', N'Lý Hồng Sơn', N'0989 012 345', N'43 Phố Cổ, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-12-21T22:02:46.647' AS DateTime), N'Sarah Jameson', CAST(N'2024-12-25T22:02:46.647' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (73, 22, N'CFS20240000073', N'Nguyễn Thị Lan Anh', N'0328104515', N'22 Lê Thánh Tông, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-12-22T22:03:39.557' AS DateTime), N'Sarah Jameson', CAST(N'2024-12-25T22:03:39.557' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (74, 22, N'CFS20240000074', N'Nguyễn Thị Bích Hạnh', N'0967 890 123', N'45 Láng Hạ, Quận Đống Đa', 2, NULL, CAST(N'2024-12-23T22:05:11.610' AS DateTime), N'Sarah Jameson', CAST(N'2024-12-25T22:05:11.610' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (75, 22, N'CFS20240000075', N'Đỗ Thị Thanh Hương', N'0989 012 345', N'123 Phố Huế, Quận Hai Bà Trưng', 2, NULL, CAST(N'2024-12-24T22:05:51.007' AS DateTime), N'Sarah Jameson', CAST(N'2024-12-25T22:05:51.007' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (76, 22, N'CFS20240000076', N'Nguyễn Thị Bích Hạnh', N'0914 567 890', N'48 Hàng Bạc, Quận Hoàn Kiếm', 2, NULL, CAST(N'2024-12-25T22:06:44.837' AS DateTime), N'Sarah Jameson', CAST(N'2024-12-25T22:06:44.837' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (77, 22, N'CFS20240000077', N'Hoàng Thanh Bình', N'0376149734', N'102 Giảng Võ, Quận Ba Đình', 2, NULL, CAST(N'2024-12-26T22:08:16.357' AS DateTime), N'Sarah Jameson', CAST(N'2024-12-25T22:08:16.357' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (78, 30, N'CFS20240000078', N'Lê Minh Khôi', N'0328104515', N'134/38 Nguyên Xá', 2, N'', CAST(N'2024-12-26T14:34:11.930' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-26T14:34:11.930' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (79, 12, N'CFS20250000001', N'Khanh Phan', N'0124354645', N'Hà Nội', 2, N'', CAST(N'2025-04-04T21:57:35.460' AS DateTime), N'Phan Khánh', CAST(N'2025-04-04T21:57:35.460' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (80, 12, N'CFS20250000002', N'Khánh', N'01243546546', N'Hà Nội', 2, N'', CAST(N'2025-04-04T22:01:20.183' AS DateTime), N'Phan Khánh', CAST(N'2025-04-04T22:01:20.183' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (81, 4, N'CFS20250000003', N'Khánh', N'0232424', N'HN', 2, N'', CAST(N'2025-04-04T22:12:33.503' AS DateTime), N'Thanh Huyền', CAST(N'2025-04-04T22:12:33.503' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (82, 31, N'CFS20250000004', N'Nam', N'0989797977', N'HN', 2, N'', CAST(N'2025-04-04T22:18:03.117' AS DateTime), N'Khánh Sky', CAST(N'2025-04-04T22:18:03.117' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (83, 4, N'CFS20250000005', N'Quý', N'099679678', N'Cầu Giấy', 2, N'', CAST(N'2025-04-04T22:21:43.910' AS DateTime), N'Thanh Huyền', CAST(N'2025-04-04T22:21:43.910' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (84, 32, N'CFS20250000006', N'Khánh_Cntt6', N'098765443', N'Nguyên Xá', 3, N'', CAST(N'2025-04-04T23:10:10.287' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-04-04T23:10:10.287' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (85, 12, N'CFS20250000007', N'Khanh2', N'094365846', N'Văn Trì', 2, N'', CAST(N'2025-04-10T21:09:58.173' AS DateTime), N'Phan Khánh', CAST(N'2025-04-10T21:09:58.173' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (86, 31, N'CFS20250000008', N'KhanhHN', N'0987545532', N'Cầu Giấy', 3, N'
                khách không uống', CAST(N'2025-04-12T10:42:57.967' AS DateTime), N'Khánh Sky', CAST(N'2025-04-12T10:42:57.967' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (87, 31, N'CFS20250000009', N'Em Khánh', N'Sơn', N'Nguyên Xá', 2, N'', CAST(N'2025-04-12T11:14:54.833' AS DateTime), N'Khánh Sky', CAST(N'2025-04-12T11:14:54.833' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1086, 32, N'CFS20250000010', N'Khánh VT', N'09872642424', N'Văn trì 2', 2, N'', CAST(N'2025-04-14T21:12:20.657' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-04-14T21:12:20.657' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1087, 31, N'CFS20250000011', N'Khánh3', N'0984753463', N'Nguyên Xá 2', 2, N'', CAST(N'2025-04-24T16:05:31.290' AS DateTime), N'Khánh Sky', CAST(N'2025-04-24T16:05:31.290' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1088, 12, N'CFS20250000012', N'TÉT', N'09872642424', N'Văn trì 2', 2, N'', CAST(N'2025-04-27T22:23:06.927' AS DateTime), N'Phan Khánh', CAST(N'2025-04-27T22:23:06.927' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1089, 1035, N'CFS20250000013', N'Khánh3', N'0984753463', N'Nguyên Xá 2', 2, N'', CAST(N'2025-05-10T18:22:11.110' AS DateTime), N'duy', CAST(N'2025-05-10T18:22:11.110' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1090, 12, N'CFS20250000014', N'Khánh3', N'0984753463', N'Nguyên Xá 2', 2, N'', CAST(N'2025-05-15T00:24:01.497' AS DateTime), N'Phan Khánh', CAST(N'2025-05-15T00:24:01.497' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1091, 31, N'CFS20250000015', N'Khánh Văn Phan', N'0934543624', N'Đống Đa', 2, N'', CAST(N'2025-05-15T21:24:24.273' AS DateTime), N'Khánh Sky', CAST(N'2025-05-15T21:24:24.273' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1092, 31, N'CFS20250000016', N'Phan Khánh', N'0346286643', N'132/44 Cầu Diễn', 2, N'', CAST(N'2025-05-16T08:40:00.883' AS DateTime), N'Khánh Sky', CAST(N'2025-05-16T08:40:00.883' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1093, 31, N'CFS20250000017', N'Nguyễn Văn An', N'0987422476', N'99 Cầu Diễn', 2, N'', CAST(N'2025-05-16T08:57:19.400' AS DateTime), N'Khánh Sky', CAST(N'2025-05-16T08:57:19.400' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1094, 31, N'CFS20250000018', N'Nguyễn Văn Bình', N'0987422476', N'164/99 Cầu Diễn', 3, N'', CAST(N'2025-05-16T08:59:24.047' AS DateTime), N'Khánh Sky', CAST(N'2025-05-16T08:59:24.047' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1095, 31, N'CFS20250000019', N'Phan Khánh', N'0943624354', N'Ngõ 99 Cầu Diễn', 2, N'', CAST(N'2025-05-16T09:12:10.843' AS DateTime), N'Khánh Sky', CAST(N'2025-05-16T09:12:10.843' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1096, 31, N'CFS20250000020', N'Phan Khánh', N'0343398984', N'Số 34 Ngõ 167 cầu diễn', 2, N'', CAST(N'2025-05-16T09:19:45.077' AS DateTime), N'Khánh Sky', CAST(N'2025-05-16T09:19:45.077' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1097, 31, N'CFS20250000021', N'Khánh Phan', N'0986353433', N'134 Cầu Diễn', 2, N'', CAST(N'2025-05-16T09:26:54.007' AS DateTime), N'Khánh Sky', CAST(N'2025-05-16T09:26:54.007' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1098, 31, N'CFS20250000022', N'Khánh', N'0987534134', N'Số 97 Ngõ 90 Cầu Diễn', 2, N'', CAST(N'2025-05-16T09:37:42.470' AS DateTime), N'Khánh Sky', CAST(N'2025-05-16T09:37:42.470' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1099, 32, N'CFS20250000023', N'Khánh', N'0342876482', N'Số 98 ngõ 70 Văn Trì', 2, N'', CAST(N'2025-05-16T09:42:52.010' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-05-16T09:42:52.010' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1100, 32, N'CFS20250000024', N'Phan Khánh', N'0986232143', N'số 98 ngõ 80 văn trì', 2, N'', CAST(N'2025-05-16T09:48:16.970' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-05-16T09:48:16.970' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1101, 32, N'CFS20250000025', N'Phan Khánh', N'0986232143', N'số 98 ngõ 80 văn trì', 3, N'', CAST(N'2025-05-16T10:07:20.030' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-05-16T10:07:20.030' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1102, 32, N'CFS20250000026', N'Phan Khánh', N'0943624354', N'Ngõ 99 Cầu Diễn', 3, N'', CAST(N'2025-05-16T10:10:30.383' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-05-16T10:10:30.383' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1103, 32, N'CFS20250000027', N'Phan Khánh', N'0983543636', N'Số 87 ngõ 70 Văn Trì', 2, N'', CAST(N'2025-05-16T15:04:53.777' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-05-16T15:04:53.777' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1104, 32, N'CFS20250000028', N'Phan Khánh', N'0983543636', N'Số 87 ngõ 70 Văn Trì', 3, N'
                Khách không nhận
', CAST(N'2025-05-16T15:15:13.563' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-05-16T15:15:13.563' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1105, 32, N'CFS20250000029', N'Phan Khánh 2', N'0983543636', N'Số 87 ngõ 70 Văn Trì', 2, N'', CAST(N'2025-05-16T15:16:25.833' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-05-16T15:16:25.833' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1106, 31, N'CFS20250000030', N'khanh', N'0945435345', N'Hà Nội', 2, N'', CAST(N'2025-05-16T21:58:00.167' AS DateTime), N'Khánh Sky', CAST(N'2025-05-16T21:58:00.167' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1107, 12, N'CFS20250000031', N'Khanh Phan', N'0343397906', N'Hà Nội', 2, N'', CAST(N'2025-05-16T22:21:51.240' AS DateTime), N'Phan Khánh', CAST(N'2025-05-16T22:21:51.240' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1108, 12, N'CFS20250000032', N'khanh', N'0945435345', N'Hà Nội', 2, N'', CAST(N'2025-05-17T20:28:13.560' AS DateTime), N'Phan Khánh', CAST(N'2025-05-17T20:28:13.560' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1109, 12, N'CFS20250000033', N'Khanh Phan', N'0343397907', N'99 Cầu Diễn', 2, N'', CAST(N'2025-05-17T20:58:57.677' AS DateTime), N'Phan Khánh', CAST(N'2025-05-17T20:58:57.677' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1110, 12, N'CFS20250000034', N'Khánh Phan', N'0983543634', N'34/99 Cầu Diễn', 2, N'', CAST(N'2025-05-18T09:16:27.350' AS DateTime), N'Phan Khánh', CAST(N'2025-05-18T09:16:27.350' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1111, 12, N'CFS20250000035', N'Khánh Phan', N'0342545466', N'33/99 Cầu Diễn', 2, N'', CAST(N'2025-05-18T10:00:57.010' AS DateTime), N'Phan Khánh', CAST(N'2025-05-18T10:00:57.010' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1112, 12, N'CFS20250000036', N'Khanh Phan', N'0343397907', N'Hà Nội', 3, N'', CAST(N'2025-05-18T10:11:04.587' AS DateTime), N'Phan Khánh', CAST(N'2025-05-18T10:11:04.587' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1113, 12, N'CFS20250000037', N'Khánh Phan', N'0984354334', N'87 ngõ 99 Cầu Diễn', 2, N'', CAST(N'2025-05-18T10:21:07.877' AS DateTime), N'Phan Khánh', CAST(N'2025-05-18T10:21:07.877' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1114, 12, N'CFS20250000038', N'Khánh', N'0934646654', N'85 ngõ 70 Cầu Diễn', 2, N'', CAST(N'2025-05-18T10:29:28.250' AS DateTime), N'Phan Khánh', CAST(N'2025-05-18T10:29:28.250' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1115, 12, N'CFS20250000039', N'Khanh Phan', N'0343397907', N'Hà Nội', 3, N'', CAST(N'2025-05-18T10:40:18.297' AS DateTime), N'Phan Khánh', CAST(N'2025-05-18T10:40:18.297' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1116, 31, N'CFS20250000040', N'Khánh', N'0329543656', N'hà nội', 2, N'', CAST(N'2025-05-19T15:14:27.343' AS DateTime), N'Khánh Sky', CAST(N'2025-05-19T15:14:27.343' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1117, 12, N'CFS20250000041', N'phan khánh', N'0932545345', N'12 Xuân Thuỷ - Cầu Giấy', 2, N'', CAST(N'2025-05-20T08:44:10.423' AS DateTime), N'Phan Khánh', CAST(N'2025-05-20T08:44:10.423' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1118, 1035, N'CFS20250000042', N'Phan Duy', N'0234254244', N'112 Phạm Văn Đồng', 2, N'', CAST(N'2025-05-20T08:56:43.267' AS DateTime), N'duy', CAST(N'2025-05-20T08:56:43.267' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1119, 1036, N'CFS20250000043', N'Phan Khánh', N'0987543544', N'99 Cầu Diễn', 2, N'', CAST(N'2025-05-20T09:37:39.177' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-05-20T09:37:39.177' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1120, 31, N'CFS20250000044', N'Khánh Phan', N'0983453455', N'87 ngõ 95 Cầu Diễn', 3, N'', CAST(N'2025-05-20T16:30:29.803' AS DateTime), N'Khánh Sky', CAST(N'2025-05-20T16:30:29.803' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1121, 31, N'CFS20250000045', N'Khánh VP', N'0945346546', N'99 Cầu Diễn', 2, N'', CAST(N'2025-05-20T23:35:26.047' AS DateTime), N'Khánh Sky', CAST(N'2025-05-20T23:35:26.047' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1122, 31, N'CFS20250000046', N'Khánh phan', N'0935435445', N'87 Cầu Diễn', 2, N'', CAST(N'2025-05-21T07:58:22.453' AS DateTime), N'Khánh Sky', CAST(N'2025-05-21T07:58:22.453' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1123, 31, N'CFS20250000047', N'Khánh Phan', N'0934956465', N'99 Cầu Diễn', 2, N'', CAST(N'2025-05-21T08:04:49.033' AS DateTime), N'Khánh Sky', CAST(N'2025-05-21T08:04:49.033' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1124, 31, N'CFS20250000048', N'Khánh Phan 2', N'0934564655', N'134 Cầu Diễn', 3, N'
                Khách hàng không nhận', CAST(N'2025-05-21T08:24:46.413' AS DateTime), N'Khánh Sky', CAST(N'2025-05-21T08:24:46.413' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1125, 1038, N'CFS20250000049', N'Khánh', N'0983453444', N'134/64 Cầu Diễn', 2, N'', CAST(N'2025-05-30T15:32:02.407' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-05-30T15:32:02.407' AS DateTime), NULL, 0)
INSERT [dbo].[Order] ([ID], [AccountID], [OrderCode], [CustomerName], [PhoneNumber], [Address], [Status], [ReasonCancel], [CreateDate], [CreateBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1126, 1038, N'CFS20250000050', N'Phan Khánh', N'0978345345', N'12/134 Cầu Diễn', 3, N'
                Khách không nhận', CAST(N'2025-05-30T15:52:28.797' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-05-30T15:52:28.797' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1, 1, 31, 2, CAST(60000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:23:04.537' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2, 1, 5, 2, CAST(90000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:23:04.560' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (3, 1, 7, 3, CAST(90000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:23:04.560' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (4, 1, 41, 3, CAST(135000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:23:04.573' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (5, 2, 10, 2, CAST(60000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:24:22.933' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (6, 2, 13, 3, CAST(90000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:24:22.937' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (7, 2, 37, 2, CAST(90000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:24:22.940' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (8, 3, 46, 10, CAST(360000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:25:23.487' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (9, 3, 49, 2, CAST(80000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:25:23.490' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (10, 3, 52, 3, CAST(105000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:25:23.493' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (11, 3, 1043, 3, CAST(182000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:25:23.493' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (12, 3, 1092, 3, CAST(57000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:25:23.497' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (13, 3, 1093, 4, CAST(76000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:25:23.497' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (14, 4, 46, 3, CAST(125000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.790' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (15, 4, 49, 3, CAST(115000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.793' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (16, 4, 1060, 5, CAST(295000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.793' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (17, 4, 1058, 5, CAST(315000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.797' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (18, 4, 1064, 10, CAST(410000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.797' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (19, 4, 1067, 2, CAST(150000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.800' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (20, 4, 1071, 3, CAST(197000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.803' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (21, 5, 1070, 6, CAST(350000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:28:39.527' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (22, 5, 1078, 3, CAST(135000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:28:39.530' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (23, 5, 1085, 5, CAST(345000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:28:39.530' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (24, 5, 1091, 4, CAST(140000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:28:39.533' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (25, 5, 1095, 3, CAST(117000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:28:39.533' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (26, 6, 13, 2, CAST(60000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:30:30.130' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (27, 6, 37, 5, CAST(195000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:30:30.130' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (28, 6, 49, 2, CAST(80000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:30:30.133' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (29, 6, 52, 2, CAST(70000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:30:30.133' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (30, 6, 1043, 2, CAST(118000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:30:30.137' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (31, 7, 4, 2, CAST(60000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:31:40.473' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (32, 7, 7, 2, CAST(60000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:31:40.477' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (33, 7, 1031, 2, CAST(118000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:31:40.480' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (34, 7, 1049, 2, CAST(118000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:31:40.480' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (35, 7, 1066, 3, CAST(207000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:31:40.483' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (36, 8, 1046, 3, CAST(167000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:32:26.640' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (37, 8, 1066, 3, CAST(197000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:32:26.650' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (38, 8, 1072, 2, CAST(120000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:32:26.660' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (39, 8, 1088, 3, CAST(165000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:32:26.663' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (40, 8, 1090, 2, CAST(78000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:32:26.663' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (41, 9, 1058, 2, CAST(148000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:33:24.597' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (42, 9, 1056, 4, CAST(266000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:33:24.600' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (43, 9, 1080, 3, CAST(165000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:33:24.610' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (44, 9, 1083, 4, CAST(220000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:33:24.613' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (45, 10, 40, 4, CAST(140000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:00.177' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (46, 10, 49, 2, CAST(90000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:00.180' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (47, 10, 1031, 3, CAST(167000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:00.180' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (48, 10, 1060, 3, CAST(185000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:00.183' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (49, 11, 1046, 4, CAST(226000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:56.173' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (50, 11, 1066, 2, CAST(148000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:56.180' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (51, 11, 1070, 2, CAST(130000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:56.180' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (52, 11, 1088, 4, CAST(220000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:56.183' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (53, 11, 1092, 3, CAST(57000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:56.183' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (54, 12, 7, 3, CAST(90000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:39:05.453' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (55, 12, 40, 3, CAST(105000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:39:05.490' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (56, 12, 52, 3, CAST(105000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:39:05.493' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (57, 12, 1072, 6, CAST(340000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:39:05.493' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (58, 13, 1060, 4, CAST(240000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:41:34.880' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (59, 13, 1058, 6, CAST(384000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:41:34.930' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (60, 13, 1056, 5, CAST(315000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:41:34.940' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (61, 13, 1091, 4, CAST(140000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:41:34.947' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (62, 13, 1095, 4, CAST(156000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:41:34.950' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (63, 14, 1074, 3, CAST(185000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:42:07.867' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (64, 14, 1078, 5, CAST(225000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:42:07.870' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (65, 14, 1080, 2, CAST(110000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:42:07.873' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (66, 14, 1083, 3, CAST(165000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:42:07.873' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (67, 15, 37, 3, CAST(115000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:43:50.233' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (68, 15, 43, 3, CAST(105000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:43:50.283' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (69, 15, 49, 3, CAST(125000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:43:50.287' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (70, 15, 1043, 3, CAST(167000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:43:50.287' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (71, 16, 1042, 3, CAST(215000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:44:45.823' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (72, 16, 1046, 3, CAST(167000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:44:45.827' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (73, 16, 1070, 3, CAST(185000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:44:45.827' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (74, 16, 1072, 3, CAST(175000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:44:45.830' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (75, 16, 1095, 3, CAST(117000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:44:45.830' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (76, 17, 33, 4, CAST(250000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:47:18.780' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (77, 17, 6, 4, CAST(240000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:47:18.783' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (78, 17, 7, 4, CAST(120000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:47:18.783' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (79, 17, 42, 4, CAST(220000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:47:18.783' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (80, 17, 54, 4, CAST(220000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:47:18.787' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (81, 18, 33, 4, CAST(260000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:47:49.050' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (82, 18, 15, 4, CAST(240000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:47:49.053' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (83, 18, 39, 4, CAST(220000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:47:49.053' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (84, 18, 45, 3, CAST(195000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:47:49.057' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (85, 19, 12, 5, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:48:22.053' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (86, 19, 49, 3, CAST(115000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:48:22.053' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (87, 19, 52, 4, CAST(140000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:48:22.057' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (88, 19, 1043, 4, CAST(226000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:48:22.057' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (89, 20, 1031, 3, CAST(167000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:08.693' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (90, 20, 1033, 3, CAST(215000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:08.693' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (91, 20, 1039, 5, CAST(345000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:08.697' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (92, 20, 1042, 1, CAST(90000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:08.697' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (93, 20, 1048, 4, CAST(280000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:08.700' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (94, 21, 1060, 3, CAST(175000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:41.807' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (95, 21, 1058, 3, CAST(197000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:41.810' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (96, 21, 1057, 4, CAST(280000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:41.813' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (97, 21, 1071, 4, CAST(256000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:41.817' AS DateTime), N'Hương Giang', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (98, 22, 1075, 3, CAST(215000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:51:00.243' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (99, 22, 1079, 3, CAST(165000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:51:00.247' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
GO
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (100, 22, 1082, 4, CAST(276000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:51:00.247' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (101, 22, 1081, 3, CAST(195000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:51:00.247' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (102, 22, 1084, 3, CAST(195000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:51:00.250' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (103, 23, 1078, 3, CAST(135000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:51:54.103' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (104, 23, 1079, 3, CAST(165000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:51:54.103' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (105, 23, 1090, 3, CAST(117000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:51:54.107' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (106, 23, 1091, 5, CAST(175000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:51:54.107' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (107, 24, 1092, 5, CAST(95000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:52:23.693' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (108, 24, 1093, 5, CAST(95000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:52:23.693' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (109, 24, 1094, 5, CAST(95000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:52:23.693' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (110, 24, 1095, 5, CAST(195000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:52:23.697' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (111, 25, 1092, 5, CAST(95000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:52:38.137' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (112, 25, 1093, 5, CAST(95000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:52:38.140' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (113, 25, 1094, 5, CAST(95000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:52:38.140' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (114, 25, 1095, 5, CAST(195000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:52:38.140' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (115, 26, 1075, 4, CAST(280000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:53:10.907' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (116, 26, 1082, 4, CAST(276000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:53:10.910' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (117, 26, 1089, 3, CAST(195000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:53:10.910' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (118, 26, 1094, 5, CAST(95000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:53:10.913' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (119, 26, 1095, 5, CAST(195000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:53:10.913' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (120, 27, 1074, 4, CAST(240000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:55:27.567' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (121, 27, 1082, 4, CAST(276000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:55:27.570' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (122, 27, 1089, 4, CAST(260000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:55:27.570' AS DateTime), N'Đình Hùng', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (123, 28, 1057, 6, CAST(410000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:25.793' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (124, 28, 1064, 5, CAST(205000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:25.797' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (125, 28, 1064, 5, CAST(215000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:25.797' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (126, 28, 1067, 5, CAST(345000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:25.800' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (127, 28, 1071, 3, CAST(197000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:25.800' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (128, 28, 1073, 5, CAST(335000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:25.803' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (129, 29, 1057, 6, CAST(410000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:55.883' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (130, 29, 1065, 5, CAST(275000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:55.887' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (131, 29, 1067, 5, CAST(355000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:55.890' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (132, 29, 1071, 3, CAST(197000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:55.893' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (133, 29, 1073, 5, CAST(335000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:55.893' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (134, 30, 1057, 6, CAST(410000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:16.317' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (135, 30, 1065, 5, CAST(275000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:16.320' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (136, 30, 1067, 5, CAST(355000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:16.323' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (137, 30, 1071, 3, CAST(197000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:16.327' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (138, 30, 1073, 5, CAST(335000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:16.327' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (139, 31, 1033, 4, CAST(290000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:59.327' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (140, 31, 1039, 4, CAST(280000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:59.327' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (141, 31, 1042, 3, CAST(215000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:59.330' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (142, 31, 1048, 4, CAST(290000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:59.330' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (143, 31, 1059, 3, CAST(225000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:59.333' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (144, 32, 1033, 4, CAST(290000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:15.610' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (145, 32, 1039, 4, CAST(280000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:15.613' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (146, 32, 1042, 3, CAST(215000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:15.617' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (147, 32, 1048, 4, CAST(290000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:15.617' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (148, 32, 1059, 3, CAST(225000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:15.620' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (149, 33, 1032, 4, CAST(266000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.507' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (150, 33, 1032, 4, CAST(271000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.510' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (151, 33, 1038, 4, CAST(256000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.513' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (152, 33, 1041, 3, CAST(197000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.513' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (153, 33, 1046, 4, CAST(226000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.517' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (154, 33, 1058, 3, CAST(207000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.520' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (155, 34, 1089, 5, CAST(325000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:00:23.373' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (156, 34, 1092, 4, CAST(76000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:00:23.377' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (157, 34, 1093, 4, CAST(76000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:00:23.380' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (158, 34, 1094, 5, CAST(95000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:00:23.380' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (159, 34, 1095, 5, CAST(195000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:00:23.380' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (160, 35, 1089, 5, CAST(325000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:00:39.787' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (161, 35, 1092, 4, CAST(76000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:00:39.790' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (162, 35, 1093, 4, CAST(76000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:00:39.790' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (163, 35, 1094, 5, CAST(95000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:00:39.790' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (164, 35, 1095, 5, CAST(195000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:00:39.790' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (165, 36, 1089, 5, CAST(325000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:01:19.780' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (166, 36, 1092, 4, CAST(76000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:01:19.780' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (167, 36, 1093, 4, CAST(76000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:01:19.783' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (168, 36, 1094, 5, CAST(95000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:01:19.783' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (169, 36, 1095, 5, CAST(195000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:01:19.783' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (170, 37, 33, 4, CAST(250000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:07.287' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (171, 37, 6, 4, CAST(240000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:07.290' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (172, 37, 14, 5, CAST(225000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:07.290' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (173, 37, 38, 4, CAST(200000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:07.293' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (174, 38, 33, 4, CAST(250000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:25.310' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (175, 38, 5, 4, CAST(180000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:25.310' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (176, 38, 13, 5, CAST(150000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:25.310' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (177, 38, 39, 4, CAST(220000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:25.313' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (178, 39, 31, 4, CAST(130000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:43.917' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (179, 39, 4, 4, CAST(120000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:43.920' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (180, 39, 14, 5, CAST(225000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:43.920' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (181, 39, 37, 4, CAST(170000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:43.923' AS DateTime), N'Hoàng Lâm', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (182, 40, 32, 5, CAST(245000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:03.200' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (183, 40, 6, 3, CAST(180000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:03.203' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (184, 40, 8, 4, CAST(180000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:03.203' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (185, 40, 41, 4, CAST(180000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:03.203' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (186, 40, 39, 11, CAST(570000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:03.207' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (187, 41, 32, 5, CAST(245000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:18.540' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (188, 41, 6, 3, CAST(180000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:18.543' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (189, 41, 8, 4, CAST(180000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:18.543' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (190, 41, 41, 3, CAST(135000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:18.547' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (191, 41, 39, 6, CAST(320000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:18.547' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (192, 42, 33, 5, CAST(320000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:36.313' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (193, 42, 4, 3, CAST(90000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:36.317' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (194, 42, 9, 4, CAST(240000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:36.317' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (195, 42, 42, 3, CAST(165000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:36.320' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (196, 42, 38, 6, CAST(290000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:36.320' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (197, 43, 12, 5, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:05:18.110' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (198, 43, 15, 5, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:05:18.113' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (199, 43, 38, 5, CAST(245000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:05:18.113' AS DateTime), N'Văn Quý', NULL, NULL, 0)
GO
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (200, 43, 45, 2, CAST(130000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:05:18.117' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (201, 43, 48, 5, CAST(285000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:05:18.117' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (202, 44, 12, 5, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:05:33.693' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (203, 44, 15, 5, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:05:33.693' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (204, 44, 38, 5, CAST(245000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:05:33.693' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (205, 44, 45, 2, CAST(130000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:05:33.697' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (206, 44, 48, 5, CAST(285000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:05:33.697' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (207, 45, 11, 5, CAST(225000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:06:21.730' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (208, 45, 13, 5, CAST(150000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:06:21.733' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (209, 45, 37, 5, CAST(195000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:06:21.733' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (210, 45, 43, 2, CAST(70000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:06:21.737' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (211, 45, 47, 5, CAST(235000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:06:21.737' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (212, 46, 1051, 5, CAST(345000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:00.303' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (213, 46, 1061, 4, CAST(280000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:00.310' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (214, 46, 1058, 4, CAST(256000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:00.310' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (215, 46, 1056, 4, CAST(256000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:00.310' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (216, 46, 1070, 4, CAST(240000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:00.313' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (217, 47, 1051, 5, CAST(345000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:17.350' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (218, 47, 1061, 4, CAST(280000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:17.357' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (219, 47, 1058, 4, CAST(256000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:17.357' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (220, 47, 1056, 4, CAST(256000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:17.360' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (221, 47, 1070, 4, CAST(240000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:17.360' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (222, 48, 1050, 5, CAST(315000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:37.327' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (223, 48, 1060, 4, CAST(240000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:37.330' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (224, 48, 1059, 4, CAST(280000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:37.333' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (225, 48, 1057, 4, CAST(280000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:37.333' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (226, 48, 1070, 4, CAST(250000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:37.337' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (227, 49, 1050, 6, CAST(374000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:08:34.483' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (228, 49, 1079, 4, CAST(220000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:08:34.490' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (229, 49, 1090, 4, CAST(156000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:08:34.493' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (230, 49, 1091, 5, CAST(175000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:08:34.493' AS DateTime), N'Văn Quý', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (231, 50, 33, 5, CAST(310000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:10:47.227' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (232, 50, 6, 4, CAST(240000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:10:47.230' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (233, 50, 9, 5, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:10:47.233' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (234, 50, 41, 5, CAST(225000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:10:47.240' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (235, 50, 12, 5, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:10:47.240' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (236, 51, 33, 5, CAST(310000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:11:02.327' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (237, 51, 6, 4, CAST(240000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:11:02.327' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (238, 51, 9, 5, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:11:02.330' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (239, 51, 41, 5, CAST(225000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:11:02.330' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (240, 51, 12, 5, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:11:02.330' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (241, 52, 33, 5, CAST(310000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:11:22.487' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (242, 52, 6, 4, CAST(240000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:11:22.490' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (243, 52, 9, 5, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:11:22.490' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (244, 52, 41, 5, CAST(225000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:11:22.493' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (245, 52, 12, 5, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:11:22.493' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (246, 53, 15, 5, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:12:13.310' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (247, 53, 39, 5, CAST(270000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:12:13.310' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (248, 53, 45, 4, CAST(260000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:12:13.313' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (249, 53, 48, 4, CAST(230000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:12:13.317' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (250, 53, 51, 5, CAST(285000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:12:13.317' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (251, 54, 15, 5, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:12:29.750' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (252, 54, 39, 5, CAST(270000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:12:29.750' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (253, 54, 45, 4, CAST(260000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:12:29.753' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (254, 54, 48, 4, CAST(230000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:12:29.753' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (255, 54, 51, 5, CAST(285000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:12:29.753' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (256, 55, 15, 5, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:13:03.840' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (257, 55, 39, 5, CAST(270000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:13:03.843' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (258, 55, 45, 4, CAST(260000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:13:03.847' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (259, 55, 48, 4, CAST(230000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:13:03.847' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (260, 55, 51, 5, CAST(285000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:13:03.850' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (261, 56, 52, 4, CAST(140000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:05.823' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (262, 56, 1045, 5, CAST(345000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:05.827' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (263, 56, 1039, 4, CAST(285000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:05.830' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (264, 56, 1042, 4, CAST(270000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:05.830' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (265, 56, 1046, 4, CAST(216000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:05.833' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (266, 57, 52, 4, CAST(140000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:21.940' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (267, 57, 1045, 5, CAST(345000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:21.943' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (268, 57, 1039, 4, CAST(285000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:21.943' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (269, 57, 1042, 4, CAST(270000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:21.947' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (270, 57, 1046, 4, CAST(216000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:21.947' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (271, 58, 52, 4, CAST(140000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:36.753' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (272, 58, 1045, 5, CAST(345000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:36.753' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (273, 58, 1039, 4, CAST(285000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:36.757' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (274, 58, 1042, 4, CAST(270000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:36.757' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (275, 58, 1046, 4, CAST(216000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:36.760' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (276, 59, 52, 4, CAST(140000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:53.230' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (277, 59, 1045, 5, CAST(345000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:53.233' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (278, 59, 1039, 4, CAST(285000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:53.233' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (279, 59, 1042, 4, CAST(270000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:53.237' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (280, 59, 1046, 4, CAST(216000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:53.237' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (281, 60, 52, 4, CAST(140000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:15:08.353' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (282, 60, 1045, 5, CAST(345000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:15:08.353' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (283, 60, 1039, 4, CAST(285000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:15:08.357' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (284, 60, 1042, 4, CAST(270000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:15:08.357' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (285, 60, 1046, 4, CAST(216000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:15:08.360' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (286, 61, 33, 5, CAST(310000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:16:33.050' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (287, 61, 5, 4, CAST(180000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:16:33.053' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (288, 61, 9, 5, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:16:33.053' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (289, 61, 42, 5, CAST(275000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:16:33.057' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (290, 61, 11, 5, CAST(225000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:16:33.057' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (291, 62, 33, 5, CAST(310000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:16:48.377' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (292, 62, 5, 4, CAST(180000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:16:48.377' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (293, 62, 9, 5, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:16:48.380' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (294, 62, 42, 4, CAST(220000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:16:48.380' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (295, 62, 11, 5, CAST(225000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:16:48.380' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (296, 63, 33, 5, CAST(310000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:17:04.390' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (297, 63, 5, 4, CAST(180000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:17:04.393' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (298, 63, 9, 5, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:17:04.393' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (299, 63, 42, 4, CAST(220000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:17:04.393' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
GO
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (300, 63, 11, 5, CAST(225000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:17:04.393' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (301, 64, 39, 5, CAST(270000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:17:46.110' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (302, 64, 45, 4, CAST(260000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:17:46.110' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (303, 64, 51, 5, CAST(285000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:17:46.113' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (304, 64, 54, 5, CAST(275000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:17:46.113' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (305, 64, 1045, 5, CAST(345000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:17:46.113' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (306, 65, 39, 5, CAST(270000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:15.657' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (307, 65, 45, 4, CAST(260000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:15.660' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (308, 65, 51, 5, CAST(285000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:15.663' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (309, 65, 54, 5, CAST(275000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:15.663' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (310, 65, 1045, 5, CAST(345000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:15.663' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (311, 66, 39, 5, CAST(270000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:32.483' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (312, 66, 45, 4, CAST(260000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:32.487' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (313, 66, 51, 5, CAST(285000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:32.487' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (314, 66, 54, 5, CAST(275000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:32.490' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (315, 66, 1045, 5, CAST(345000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:32.490' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (316, 67, 1049, 5, CAST(265000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:24.727' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (317, 67, 1064, 5, CAST(225000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:24.733' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (318, 67, 1066, 5, CAST(315000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:24.733' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (319, 67, 1070, 5, CAST(295000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:24.737' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (320, 67, 1072, 5, CAST(285000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:24.737' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (321, 68, 1049, 5, CAST(265000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:38.863' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (322, 68, 1064, 5, CAST(225000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:38.863' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (323, 68, 1066, 5, CAST(315000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:38.867' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (324, 68, 1070, 5, CAST(295000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:38.870' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (325, 68, 1072, 5, CAST(285000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:38.870' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (326, 69, 1049, 5, CAST(265000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:56.510' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (327, 69, 1064, 5, CAST(225000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:56.510' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (328, 69, 1066, 5, CAST(315000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:56.513' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (329, 69, 1070, 5, CAST(295000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:56.517' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (330, 69, 1072, 5, CAST(285000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:56.517' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (331, 70, 1051, 5, CAST(355000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:20:24.553' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (332, 70, 1065, 5, CAST(285000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:20:24.557' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (333, 70, 1067, 5, CAST(355000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:20:24.560' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (334, 70, 1071, 5, CAST(315000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:20:24.563' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (335, 70, 1072, 5, CAST(295000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:20:24.563' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (336, 71, 8, 4, CAST(180000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.800' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (337, 71, 12, 2, CAST(120000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.847' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (338, 71, 13, 4, CAST(120000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.850' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (339, 71, 51, 3, CAST(185000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.850' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (340, 71, 52, 8, CAST(280000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.873' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (341, 71, 1033, 10, CAST(680000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.877' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (342, 71, 1101, 3, CAST(205000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.880' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (343, 71, 1066, 3, CAST(207000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.883' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (344, 71, 1073, 3, CAST(215000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.883' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (345, 72, 8, 3, CAST(135000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:02:46.650' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (346, 72, 12, 3, CAST(180000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:02:46.653' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (347, 72, 13, 3, CAST(90000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:02:46.653' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (348, 72, 51, 2, CAST(130000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:02:46.653' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (349, 72, 52, 4, CAST(140000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:02:46.657' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (350, 72, 1033, 3, CAST(225000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:02:46.660' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (351, 72, 1066, 2, CAST(148000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:02:46.660' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (352, 72, 1073, 1, CAST(85000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:02:46.670' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (353, 73, 8, 4, CAST(180000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:03:39.570' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (354, 73, 12, 7, CAST(420000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:03:39.573' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (355, 73, 13, 5, CAST(150000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:03:39.577' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (356, 73, 51, 4, CAST(230000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:03:39.577' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (357, 73, 52, 3, CAST(105000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:03:39.580' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (358, 73, 1033, 3, CAST(210000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:03:39.580' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (359, 73, 1066, 2, CAST(158000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:03:39.583' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (360, 73, 1073, 4, CAST(280000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:03:39.587' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (361, 74, 9, 5, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:11.623' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (362, 74, 1058, 6, CAST(384000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:11.630' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (363, 74, 1056, 6, CAST(384000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:11.640' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (364, 74, 1065, 6, CAST(314000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:11.643' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (365, 74, 1082, 6, CAST(414000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:11.647' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (366, 74, 1087, 5, CAST(325000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:11.647' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (367, 74, 1089, 6, CAST(390000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:11.650' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (368, 75, 9, 3, CAST(180000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:51.017' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (369, 75, 1058, 4, CAST(266000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:51.020' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (370, 75, 1056, 3, CAST(207000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:51.023' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (371, 75, 1065, 4, CAST(216000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:51.027' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (372, 75, 1082, 4, CAST(276000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:51.030' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (373, 75, 1087, 3, CAST(195000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:51.030' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (374, 75, 1089, 3, CAST(195000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:51.033' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (375, 76, 9, 2, CAST(120000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:06:44.850' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (376, 76, 1058, 4, CAST(266000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:06:44.853' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (377, 76, 1056, 3, CAST(207000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:06:44.863' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (378, 76, 1065, 2, CAST(118000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:06:44.870' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (379, 76, 1082, 4, CAST(276000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:06:44.877' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (380, 76, 1087, 3, CAST(195000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:06:44.880' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (381, 76, 1089, 3, CAST(195000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:06:44.883' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (382, 76, 1092, 3, CAST(57000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:06:44.887' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (383, 77, 9, 2, CAST(120000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:08:16.360' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (384, 77, 1058, 4, CAST(266000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:08:16.363' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (385, 77, 1056, 3, CAST(207000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:08:16.367' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (386, 77, 1065, 2, CAST(118000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:08:16.367' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (387, 77, 1082, 4, CAST(276000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:08:16.370' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (388, 77, 1087, 3, CAST(195000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:08:16.370' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (389, 77, 1089, 3, CAST(195000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:08:16.370' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (390, 77, 1091, 3, CAST(105000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:08:16.370' AS DateTime), N'Sarah Jameson', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (391, 78, 33, 3, CAST(190000.00 AS Decimal(18, 2)), CAST(N'2024-12-26T14:34:11.943' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (392, 79, 8, 2, CAST(90000.00 AS Decimal(18, 2)), CAST(N'2025-04-04T21:57:35.513' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (393, 80, 1094, 2, CAST(38000.00 AS Decimal(18, 2)), CAST(N'2025-04-04T22:01:20.233' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (394, 81, 1091, 2, CAST(70000.00 AS Decimal(18, 2)), CAST(N'2025-04-04T22:12:33.557' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (395, 82, 1058, 2, CAST(138000.00 AS Decimal(18, 2)), CAST(N'2025-04-04T22:18:03.167' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (396, 83, 1088, 10, CAST(550000.00 AS Decimal(18, 2)), CAST(N'2025-04-04T22:21:43.917' AS DateTime), N'Thanh Huyền', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (397, 84, 46, 2, CAST(80000.00 AS Decimal(18, 2)), CAST(N'2025-04-04T23:10:10.333' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (398, 85, 37, 1, CAST(55000.00 AS Decimal(18, 2)), CAST(N'2025-04-10T21:09:58.223' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (399, 86, 1091, 1, CAST(35000.00 AS Decimal(18, 2)), CAST(N'2025-04-12T10:42:58.040' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
GO
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (400, 86, 1095, 2, CAST(78000.00 AS Decimal(18, 2)), CAST(N'2025-04-12T10:42:58.113' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (401, 87, 1100, 2, CAST(128000.00 AS Decimal(18, 2)), CAST(N'2025-04-12T11:14:54.890' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1399, 1086, 1088, 1, CAST(55000.00 AS Decimal(18, 2)), CAST(N'2025-04-14T21:12:20.720' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1400, 1086, 6, 1, CAST(60000.00 AS Decimal(18, 2)), CAST(N'2025-04-14T21:12:20.767' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1401, 1087, 1100, 2, CAST(138000.00 AS Decimal(18, 2)), CAST(N'2025-04-24T16:05:31.363' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1402, 1088, 4, 5, CAST(150000.00 AS Decimal(18, 2)), CAST(N'2025-04-27T22:23:06.940' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1403, 1088, 1031, 5, CAST(280000.00 AS Decimal(18, 2)), CAST(N'2025-04-27T22:23:06.980' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1404, 1089, 1058, 1, CAST(79000.00 AS Decimal(18, 2)), CAST(N'2025-05-10T18:22:11.143' AS DateTime), N'duy', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1405, 1090, 8, 2, CAST(90000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T00:24:01.527' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1406, 1091, 1091, 5, CAST(175000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T21:24:24.357' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1407, 1092, 1082, 4, CAST(276000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T08:40:00.890' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1408, 1093, 1058, 7, CAST(433000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T08:57:19.403' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1409, 1094, 1094, 1, CAST(19000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T08:59:24.053' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1410, 1095, 14, 2, CAST(90000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:12:10.850' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1411, 1095, 1057, 3, CAST(215000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:12:10.853' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1412, 1096, 1059, 2, CAST(150000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:19:45.087' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1413, 1097, 1047, 4, CAST(256000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:26:54.013' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1414, 1098, 1039, 4, CAST(280000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:37:42.543' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1415, 1099, 1047, 3, CAST(197000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:42:52.067' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1416, 1100, 1065, 3, CAST(167000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:48:16.977' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1417, 1101, 1058, 3, CAST(187000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T10:07:20.047' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1418, 1102, 31, 2, CAST(70000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T10:10:30.460' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1419, 1102, 31, 2, CAST(70000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T10:10:30.577' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1420, 1103, 1101, 4, CAST(280000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T15:04:53.787' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1421, 1104, 40, 1, CAST(35000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T15:15:13.570' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1422, 1105, 1099, 1, CAST(59000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T15:16:25.923' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1423, 1106, 40, 1, CAST(35000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T21:58:00.207' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1424, 1107, 1100, 1, CAST(69000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T22:21:51.587' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1425, 1108, 1099, 1, CAST(59000.00 AS Decimal(18, 2)), CAST(N'2025-05-17T20:28:13.623' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1426, 1109, 31, 1, CAST(30000.00 AS Decimal(18, 2)), CAST(N'2025-05-17T20:58:57.770' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1427, 1110, 5, 1, CAST(45000.00 AS Decimal(18, 2)), CAST(N'2025-05-18T09:16:27.360' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1428, 1110, 1047, 1, CAST(69000.00 AS Decimal(18, 2)), CAST(N'2025-05-18T09:16:27.437' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1429, 1111, 32, 1, CAST(55000.00 AS Decimal(18, 2)), CAST(N'2025-05-18T10:00:57.027' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1430, 1112, 43, 1, CAST(35000.00 AS Decimal(18, 2)), CAST(N'2025-05-18T10:11:04.597' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1431, 1113, 40, 1, CAST(35000.00 AS Decimal(18, 2)), CAST(N'2025-05-18T10:21:07.880' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1432, 1114, 41, 1, CAST(45000.00 AS Decimal(18, 2)), CAST(N'2025-05-18T10:29:28.253' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1433, 1115, 1095, 1, CAST(39000.00 AS Decimal(18, 2)), CAST(N'2025-05-18T10:40:18.303' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1434, 1116, 1032, 1, CAST(79000.00 AS Decimal(18, 2)), CAST(N'2025-05-19T15:14:27.420' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1435, 1117, 1039, 1, CAST(85000.00 AS Decimal(18, 2)), CAST(N'2025-05-20T08:44:10.483' AS DateTime), N'Phan Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1436, 1118, 54, 1, CAST(55000.00 AS Decimal(18, 2)), CAST(N'2025-05-20T08:56:43.347' AS DateTime), N'duy', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1437, 1119, 11, 1, CAST(45000.00 AS Decimal(18, 2)), CAST(N'2025-05-20T09:37:39.207' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1438, 1120, 1065, 1, CAST(69000.00 AS Decimal(18, 2)), CAST(N'2025-05-20T16:30:29.863' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1439, 1120, 41, 1, CAST(45000.00 AS Decimal(18, 2)), CAST(N'2025-05-20T16:30:30.003' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1440, 1121, 1056, 1, CAST(79000.00 AS Decimal(18, 2)), CAST(N'2025-05-20T23:35:26.260' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1441, 1122, 1065, 1, CAST(69000.00 AS Decimal(18, 2)), CAST(N'2025-05-21T07:58:22.470' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1442, 1123, 1056, 1, CAST(69000.00 AS Decimal(18, 2)), CAST(N'2025-05-21T08:04:49.043' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1443, 1124, 1095, 1, CAST(39000.00 AS Decimal(18, 2)), CAST(N'2025-05-21T08:24:46.427' AS DateTime), N'Khánh Sky', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1444, 1125, 1056, 1, CAST(69000.00 AS Decimal(18, 2)), CAST(N'2025-05-30T15:32:02.477' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductDetailID], [Quantity], [TotalMoney], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1445, 1126, 1095, 5, CAST(195000.00 AS Decimal(18, 2)), CAST(N'2025-05-30T15:52:28.803' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetailsTopping] ON 

INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 7, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:24:22.940' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:24:22.940' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 7, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:24:22.960' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:24:22.960' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 8, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:25:23.487' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:25:23.487' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 9, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:25:23.490' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:25:23.490' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 11, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:25:23.493' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:25:23.493' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 11, 8, CAST(15000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:25:23.493' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:25:23.493' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, 11, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:25:23.493' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:25:23.493' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, 14, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.790' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:27:40.790' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, 14, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.793' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:27:40.793' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, 15, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.793' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:27:40.793' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, 16, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.793' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:27:40.793' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, 16, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.797' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:27:40.797' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, 17, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.797' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:27:40.797' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, 17, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.797' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:27:40.797' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, 18, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.800' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:27:40.800' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, 18, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.800' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:27:40.800' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, 19, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.800' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:27:40.800' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, 19, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.803' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:27:40.803' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, 20, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.803' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:27:40.803' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (20, 20, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:27:40.803' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:27:40.803' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (21, 21, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:28:39.527' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:28:39.527' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (22, 21, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:28:39.530' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T00:28:39.530' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (23, 27, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:30:30.130' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:30:30.130' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (24, 27, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:30:30.133' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:30:30.133' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (25, 28, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:30:30.133' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:30:30.133' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (26, 30, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:30:30.137' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:30:30.137' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (27, 30, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:30:30.137' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:30:30.137' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (28, 33, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:31:40.480' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:31:40.480' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (29, 33, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:31:40.480' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:31:40.480' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (30, 34, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:31:40.483' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:31:40.483' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (31, 34, 6, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:31:40.483' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:31:40.483' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (32, 35, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:31:40.483' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:31:40.483' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (33, 35, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:31:40.487' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:31:40.487' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (34, 35, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:31:40.487' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:31:40.487' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (35, 36, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:32:26.647' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:32:26.647' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (36, 36, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:32:26.650' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:32:26.650' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (37, 37, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:32:26.650' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:32:26.650' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (38, 37, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:32:26.660' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:32:26.660' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (39, 38, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:32:26.663' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:32:26.663' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (40, 41, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:33:24.597' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:33:24.597' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (41, 41, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:33:24.600' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:33:24.600' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (42, 41, 6, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:33:24.600' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:33:24.600' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (43, 42, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:33:24.600' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:33:24.600' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (44, 42, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:33:24.610' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:33:24.610' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (45, 42, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:33:24.610' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:33:24.610' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (46, 46, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:00.180' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:34:00.180' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (47, 46, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:00.180' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:34:00.180' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (48, 47, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:00.180' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:34:00.180' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (49, 47, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:00.183' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:34:00.183' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (50, 48, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:00.183' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:34:00.183' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (51, 48, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:00.183' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:34:00.183' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (52, 49, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:56.177' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:34:56.177' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (53, 49, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:56.177' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:34:56.177' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (54, 49, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:56.177' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:34:56.177' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (55, 50, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:56.180' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:34:56.180' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (56, 50, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:56.180' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:34:56.180' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (57, 50, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:56.180' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:34:56.180' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (58, 51, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:56.180' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:34:56.180' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (59, 51, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:34:56.183' AS DateTime), N'Thanh Huyền_4', CAST(N'2024-12-19T00:34:56.183' AS DateTime), N'Thanh Huyền_4')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (60, 57, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:39:05.497' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:39:05.497' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (61, 58, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:41:34.913' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:41:34.913' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (62, 58, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:41:34.930' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:41:34.930' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (63, 59, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:41:34.933' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:41:34.933' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (64, 59, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:41:34.937' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:41:34.937' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (65, 59, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:41:34.940' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:41:34.940' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (66, 60, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:41:34.940' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:41:34.940' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (67, 60, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:41:34.947' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:41:34.947' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (68, 63, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:42:07.870' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:42:07.870' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (69, 63, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:42:07.870' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:42:07.870' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (70, 67, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:43:50.267' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:43:50.267' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (71, 69, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:43:50.287' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:43:50.287' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (72, 69, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:43:50.287' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:43:50.287' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (73, 70, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:43:50.287' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:43:50.287' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (74, 70, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:43:50.290' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:43:50.290' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (75, 71, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:44:45.823' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:44:45.823' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (76, 71, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:44:45.827' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:44:45.827' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (77, 72, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:44:45.827' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:44:45.827' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (78, 72, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:44:45.827' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:44:45.827' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (79, 73, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:44:45.830' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:44:45.830' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (80, 73, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:44:45.830' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:44:45.830' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (81, 74, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:44:45.830' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:44:45.830' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (82, 76, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:47:18.780' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:47:18.780' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (83, 81, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:47:49.053' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:47:49.053' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (84, 81, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:47:49.053' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:47:49.053' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (85, 83, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:47:49.057' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:47:49.057' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (86, 83, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:47:49.057' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:47:49.057' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (87, 86, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:48:22.057' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:48:22.057' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (88, 88, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:48:22.060' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:48:22.060' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (89, 88, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:48:22.060' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:48:22.060' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (90, 88, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:48:22.060' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:48:22.060' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (91, 89, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:08.693' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:49:08.693' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (92, 89, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:08.693' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:49:08.693' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (93, 90, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:08.697' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:49:08.697' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (94, 90, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:08.697' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:49:08.697' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (95, 91, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:08.697' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:49:08.697' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (96, 91, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:08.697' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:49:08.697' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (97, 92, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:08.700' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:49:08.700' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (98, 92, 8, CAST(15000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:08.700' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:49:08.700' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (99, 93, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:08.700' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:49:08.700' AS DateTime), N'Hương Giang_5')
GO
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (100, 93, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:08.700' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:49:08.700' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (101, 94, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:41.810' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:49:41.810' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (102, 95, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:41.813' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:49:41.813' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (103, 95, 6, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:41.813' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:49:41.813' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (104, 96, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:41.813' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:49:41.813' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (105, 96, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:41.817' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:49:41.817' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (106, 97, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:41.817' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:49:41.817' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (107, 97, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:49:41.817' AS DateTime), N'Hương Giang_5', CAST(N'2024-12-19T00:49:41.817' AS DateTime), N'Hương Giang_5')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (108, 98, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:51:00.243' AS DateTime), N'Đình Hùng_8', CAST(N'2024-12-19T00:51:00.243' AS DateTime), N'Đình Hùng_8')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (109, 98, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:51:00.247' AS DateTime), N'Đình Hùng_8', CAST(N'2024-12-19T00:51:00.247' AS DateTime), N'Đình Hùng_8')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (110, 115, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:53:10.907' AS DateTime), N'Đình Hùng_8', CAST(N'2024-12-19T00:53:10.907' AS DateTime), N'Đình Hùng_8')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (111, 115, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:53:10.910' AS DateTime), N'Đình Hùng_8', CAST(N'2024-12-19T00:53:10.910' AS DateTime), N'Đình Hùng_8')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (112, 120, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:55:27.567' AS DateTime), N'Đình Hùng_8', CAST(N'2024-12-19T00:55:27.567' AS DateTime), N'Đình Hùng_8')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (113, 120, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:55:27.570' AS DateTime), N'Đình Hùng_8', CAST(N'2024-12-19T00:55:27.570' AS DateTime), N'Đình Hùng_8')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (114, 123, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:25.793' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:25.793' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (115, 123, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:25.797' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:25.797' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (116, 124, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:25.797' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:25.797' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (117, 125, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:25.797' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:25.797' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (118, 125, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:25.800' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:25.800' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (119, 126, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:25.800' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:25.800' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (120, 126, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:25.800' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:25.800' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (121, 127, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:25.800' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:25.800' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (122, 127, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:25.803' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:25.803' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (123, 128, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:25.803' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:25.803' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (124, 129, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:55.887' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:55.887' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (125, 129, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:55.887' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:55.887' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (126, 130, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:55.887' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:55.887' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (127, 130, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:55.887' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:55.887' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (128, 130, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:55.890' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:55.890' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (129, 131, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:55.890' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:55.890' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (130, 131, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:55.890' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:55.890' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (131, 131, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:55.893' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:55.893' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (132, 132, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:55.893' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:55.893' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (133, 132, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:55.893' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:55.893' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (134, 133, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:57:55.897' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:57:55.897' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (135, 134, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:16.320' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:16.320' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (136, 134, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:16.320' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:16.320' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (137, 135, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:16.323' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:16.323' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (138, 135, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:16.323' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:16.323' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (139, 135, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:16.323' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:16.323' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (140, 136, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:16.323' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:16.323' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (141, 136, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:16.327' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:16.327' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (142, 136, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:16.327' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:16.327' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (143, 137, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:16.327' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:16.327' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (144, 137, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:16.327' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:16.327' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (145, 138, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:16.330' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:16.330' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (146, 139, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:59.327' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:59.327' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (147, 139, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:59.327' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:59.327' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (148, 139, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:59.327' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:59.327' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (149, 140, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:59.330' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:59.330' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (150, 140, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:59.330' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:59.330' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (151, 141, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:59.330' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:59.330' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (152, 141, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:59.330' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:59.330' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (153, 142, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:59.330' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:59.330' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (154, 142, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:59.333' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:59.333' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (155, 142, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:59.333' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:59.333' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (156, 143, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:59.333' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:59.333' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (157, 143, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:59.333' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:59.333' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (158, 143, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:58:59.333' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:58:59.333' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (159, 144, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:15.613' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:15.613' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (160, 144, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:15.613' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:15.613' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (161, 144, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:15.613' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:15.613' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (162, 145, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:15.613' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:15.613' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (163, 145, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:15.617' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:15.617' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (164, 146, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:15.617' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:15.617' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (165, 146, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:15.617' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:15.617' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (166, 147, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:15.620' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:15.620' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (167, 147, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:15.620' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:15.620' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (168, 147, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:15.620' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:15.620' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (169, 148, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:15.620' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:15.620' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (170, 148, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:15.620' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:15.620' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (171, 148, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:15.623' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:15.623' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (172, 149, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.507' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:40.507' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (173, 149, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.510' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:40.510' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (174, 149, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.510' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:40.510' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (175, 150, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.513' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:40.513' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (176, 150, 8, CAST(15000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.513' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:40.513' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (177, 150, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.513' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:40.513' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (178, 151, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.513' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:40.513' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (179, 151, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.513' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:40.513' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (180, 152, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.517' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:40.517' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (181, 152, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.517' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:40.517' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (182, 153, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.517' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:40.517' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (183, 153, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.517' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:40.517' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (184, 153, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.517' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:40.517' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (185, 154, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.520' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:40.520' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (186, 154, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.520' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:40.520' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (187, 154, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:59:40.520' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T00:59:40.520' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (188, 170, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:07.290' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T01:02:07.290' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (189, 173, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:07.293' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T01:02:07.293' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (190, 173, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:07.293' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T01:02:07.293' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (191, 174, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:25.310' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T01:02:25.310' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (192, 177, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:25.313' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T01:02:25.313' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (193, 177, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:25.313' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T01:02:25.313' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (194, 178, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:43.920' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T01:02:43.920' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (195, 181, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:43.923' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T01:02:43.923' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (196, 181, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:43.923' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T01:02:43.923' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (197, 181, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:02:43.923' AS DateTime), N'Hoàng Lâm_10', CAST(N'2024-12-19T01:02:43.923' AS DateTime), N'Hoàng Lâm_10')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (198, 182, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:03.200' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:04:03.200' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (199, 182, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:03.203' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:04:03.203' AS DateTime), N'Văn Quý_11')
GO
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (200, 186, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:03.207' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:04:03.207' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (201, 186, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:03.207' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:04:03.207' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (202, 187, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:18.543' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:04:18.543' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (203, 187, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:18.543' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:04:18.543' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (204, 191, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:18.550' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:04:18.550' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (205, 191, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:18.550' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:04:18.550' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (206, 192, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:36.317' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:04:36.317' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (207, 192, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:36.317' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:04:36.317' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (208, 196, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:36.320' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:04:36.320' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (209, 196, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:04:36.320' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:04:36.320' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (210, 199, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:05:18.113' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:05:18.113' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (211, 199, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:05:18.117' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:05:18.117' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (212, 201, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:05:18.120' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:05:18.120' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (213, 204, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:05:33.697' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:05:33.697' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (214, 204, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:05:33.697' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:05:33.697' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (215, 206, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:05:33.700' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:05:33.700' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (216, 209, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:06:21.737' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:06:21.737' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (217, 209, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:06:21.737' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:06:21.737' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (218, 211, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:06:21.740' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:06:21.740' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (219, 212, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:00.307' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:00.307' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (220, 212, 6, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:00.307' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:00.307' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (221, 213, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:00.310' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:00.310' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (222, 213, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:00.310' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:00.310' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (223, 214, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:00.310' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:00.310' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (224, 214, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:00.310' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:00.310' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (225, 215, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:00.313' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:00.313' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (226, 215, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:00.313' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:00.313' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (227, 216, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:00.313' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:00.313' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (228, 216, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:00.313' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:00.313' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (229, 217, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:17.353' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:17.353' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (230, 217, 6, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:17.357' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:17.357' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (231, 218, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:17.357' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:17.357' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (232, 218, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:17.357' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:17.357' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (233, 219, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:17.360' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:17.360' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (234, 219, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:17.360' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:17.360' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (235, 220, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:17.360' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:17.360' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (236, 220, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:17.360' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:17.360' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (237, 221, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:17.363' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:17.363' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (238, 221, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:17.363' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:17.363' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (239, 222, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:37.330' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:37.330' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (240, 222, 6, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:37.330' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:37.330' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (241, 223, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:37.330' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:37.330' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (242, 223, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:37.330' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:37.330' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (243, 224, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:37.333' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:37.333' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (244, 224, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:37.333' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:37.333' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (245, 225, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:37.333' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:37.333' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (246, 225, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:37.337' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:37.337' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (247, 226, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:37.337' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:37.337' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (248, 226, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:37.337' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:37.337' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (249, 226, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:07:37.337' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:07:37.337' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (250, 227, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:08:34.487' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:08:34.487' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (251, 227, 6, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:08:34.490' AS DateTime), N'Văn Quý_11', CAST(N'2024-12-19T01:08:34.490' AS DateTime), N'Văn Quý_11')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (252, 231, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:10:47.230' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:10:47.230' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (253, 236, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:11:02.327' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:11:02.327' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (254, 241, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:11:22.490' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:11:22.490' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (255, 247, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:12:13.313' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:12:13.313' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (256, 247, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:12:13.313' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:12:13.313' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (257, 249, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:12:13.317' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:12:13.317' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (258, 250, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:12:13.317' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:12:13.317' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (259, 252, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:12:29.750' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:12:29.750' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (260, 252, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:12:29.753' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:12:29.753' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (261, 254, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:12:29.753' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:12:29.753' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (262, 255, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:12:29.757' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:12:29.757' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (263, 257, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:13:03.843' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:13:03.843' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (264, 257, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:13:03.847' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:13:03.847' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (265, 259, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:13:03.850' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:13:03.850' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (266, 260, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:13:03.850' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:13:03.850' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (267, 262, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:05.827' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:05.827' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (268, 262, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:05.830' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:05.830' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (269, 263, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:05.830' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:05.830' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (270, 263, 8, CAST(15000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:05.830' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:05.830' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (271, 264, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:05.833' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:05.833' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (272, 265, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:05.833' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:05.833' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (273, 265, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:05.833' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:05.833' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (274, 267, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:21.943' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:21.943' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (275, 267, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:21.943' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:21.943' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (276, 268, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:21.943' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:21.943' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (277, 268, 8, CAST(15000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:21.947' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:21.947' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (278, 269, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:21.947' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:21.947' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (279, 270, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:21.947' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:21.947' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (280, 270, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:21.947' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:21.947' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (281, 272, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:36.757' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:36.757' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (282, 272, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:36.757' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:36.757' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (283, 273, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:36.757' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:36.757' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (284, 273, 8, CAST(15000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:36.757' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:36.757' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (285, 274, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:36.760' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:36.760' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (286, 275, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:36.760' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:36.760' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (287, 275, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:36.760' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:36.760' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (288, 277, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:53.233' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:53.233' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (289, 277, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:53.233' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:53.233' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (290, 278, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:53.237' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:53.237' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (291, 278, 8, CAST(15000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:53.237' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:53.237' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (292, 279, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:53.237' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:53.237' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (293, 280, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:53.237' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:53.237' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (294, 280, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:14:53.240' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:14:53.240' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (295, 282, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:15:08.353' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:15:08.353' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (296, 282, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:15:08.357' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:15:08.357' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (297, 283, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:15:08.357' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:15:08.357' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (298, 283, 8, CAST(15000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:15:08.357' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:15:08.357' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (299, 284, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:15:08.360' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:15:08.360' AS DateTime), N'Phan Khánh_12')
GO
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (300, 285, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:15:08.360' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:15:08.360' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (301, 285, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:15:08.360' AS DateTime), N'Phan Khánh_12', CAST(N'2024-12-19T01:15:08.360' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (302, 286, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:16:33.053' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:16:33.053' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (303, 291, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:16:48.377' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:16:48.377' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (304, 296, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:17:04.390' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:17:04.390' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (305, 301, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:17:46.110' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:17:46.110' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (306, 301, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:17:46.110' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:17:46.110' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (307, 303, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:17:46.113' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:17:46.113' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (308, 305, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:17:46.117' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:17:46.117' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (309, 305, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:17:46.117' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:17:46.117' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (310, 306, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:15.660' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:18:15.660' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (311, 306, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:15.660' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:18:15.660' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (312, 308, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:15.663' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:18:15.663' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (313, 310, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:15.663' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:18:15.663' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (314, 310, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:15.667' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:18:15.667' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (315, 311, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:32.483' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:18:32.483' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (316, 311, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:32.487' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:18:32.487' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (317, 313, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:32.487' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:18:32.487' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (318, 315, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:32.490' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:18:32.490' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (319, 315, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:18:32.490' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:18:32.490' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (320, 316, 6, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:24.730' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:24.730' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (321, 316, 9, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:24.730' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:24.730' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (322, 317, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:24.733' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:24.733' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (323, 317, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:24.733' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:24.733' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (324, 317, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:24.733' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:24.733' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (325, 318, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:24.733' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:24.733' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (326, 318, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:24.737' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:24.737' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (327, 319, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:24.737' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:24.737' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (328, 319, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:24.737' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:24.737' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (329, 320, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:24.737' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:24.737' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (330, 321, 6, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:38.863' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:38.863' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (331, 321, 9, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:38.863' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:38.863' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (332, 322, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:38.867' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:38.867' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (333, 322, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:38.867' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:38.867' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (334, 322, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:38.867' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:38.867' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (335, 323, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:38.867' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:38.867' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (336, 323, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:38.867' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:38.867' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (337, 324, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:38.870' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:38.870' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (338, 324, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:38.870' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:38.870' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (339, 325, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:38.870' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:38.870' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (340, 326, 6, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:56.510' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:56.510' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (341, 326, 9, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:56.510' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:56.510' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (342, 327, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:56.510' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:56.510' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (343, 327, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:56.513' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:56.513' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (344, 327, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:56.513' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:56.513' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (345, 328, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:56.513' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:56.513' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (346, 328, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:56.517' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:56.517' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (347, 329, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:56.517' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:56.517' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (348, 329, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:56.517' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:56.517' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (349, 330, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:19:56.520' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:19:56.520' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (350, 331, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:20:24.553' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:20:24.553' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (351, 331, 6, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:20:24.557' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:20:24.557' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (352, 331, 9, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:20:24.557' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:20:24.557' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (353, 332, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:20:24.557' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:20:24.557' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (354, 332, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:20:24.560' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:20:24.560' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (355, 332, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:20:24.560' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:20:24.560' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (356, 332, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:20:24.560' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:20:24.560' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (357, 333, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:20:24.560' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:20:24.560' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (358, 333, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:20:24.560' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:20:24.560' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (359, 333, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:20:24.560' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:20:24.560' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (360, 334, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:20:24.563' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:20:24.563' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (361, 334, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:20:24.563' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:20:24.563' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (362, 335, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:20:24.567' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:20:24.567' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (363, 335, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T01:20:24.567' AS DateTime), N'Lê Minh Khôi_3', CAST(N'2024-12-19T01:20:24.567' AS DateTime), N'Lê Minh Khôi_3')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (364, 339, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.850' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:01:22.850' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (365, 339, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.873' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:01:22.873' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (366, 341, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.877' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:01:22.877' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (367, 341, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.880' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:01:22.880' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (368, 341, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.880' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:01:22.880' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (369, 342, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.880' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:01:22.880' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (370, 343, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.883' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:01:22.883' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (371, 343, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.883' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:01:22.883' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (372, 343, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.883' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:01:22.883' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (373, 344, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.887' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:01:22.887' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (374, 344, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:01:22.887' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:01:22.887' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (375, 348, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:02:46.657' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:02:46.657' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (376, 348, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:02:46.657' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:02:46.657' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (377, 350, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:02:46.660' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:02:46.660' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (378, 350, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:02:46.660' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:02:46.660' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (379, 350, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:02:46.660' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:02:46.660' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (380, 351, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:02:46.663' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:02:46.663' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (381, 351, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:02:46.667' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:02:46.667' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (382, 351, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:02:46.670' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:02:46.670' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (383, 352, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:02:46.670' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:02:46.670' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (384, 352, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:02:46.670' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:02:46.670' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (385, 356, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:03:39.577' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:03:39.577' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (386, 358, 8, CAST(15000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:03:39.580' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:03:39.580' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (387, 359, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:03:39.583' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:03:39.583' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (388, 359, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:03:39.583' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:03:39.583' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (389, 359, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:03:39.583' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:03:39.583' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (390, 359, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:03:39.583' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:03:39.583' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (391, 360, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:03:39.587' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:03:39.587' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (392, 360, 4, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:03:39.587' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:03:39.587' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (393, 362, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:11.630' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:05:11.630' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (394, 362, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:11.640' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:05:11.640' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (395, 362, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:11.640' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:05:11.640' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (396, 363, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:11.643' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:05:11.643' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (397, 363, 9, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:11.643' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:05:11.643' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (398, 363, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:11.643' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:05:11.643' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (399, 364, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:11.647' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:05:11.647' AS DateTime), N'Sarah Jameson_22')
GO
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (400, 364, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:11.647' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:05:11.647' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (401, 369, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:51.020' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:05:51.020' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (402, 369, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:51.023' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:05:51.023' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (403, 369, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:51.023' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:05:51.023' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (404, 370, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:51.027' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:05:51.027' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (405, 370, 9, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:51.027' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:05:51.027' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (406, 370, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:51.027' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:05:51.027' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (407, 371, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:51.027' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:05:51.027' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (408, 371, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:05:51.030' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:05:51.030' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (409, 376, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:06:44.857' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:06:44.857' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (410, 376, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:06:44.860' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:06:44.860' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (411, 376, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:06:44.860' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:06:44.860' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (412, 377, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:06:44.867' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:06:44.867' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (413, 377, 9, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:06:44.867' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:06:44.867' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (414, 377, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:06:44.870' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:06:44.870' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (415, 378, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:06:44.873' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:06:44.873' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (416, 378, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:06:44.877' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:06:44.877' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (417, 384, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:08:16.363' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:08:16.363' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (418, 384, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:08:16.363' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:08:16.363' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (419, 384, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:08:16.363' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:08:16.363' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (420, 385, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:08:16.367' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:08:16.367' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (421, 385, 9, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:08:16.367' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:08:16.367' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (422, 385, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:08:16.367' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:08:16.367' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (423, 386, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:08:16.367' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:08:16.367' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (424, 386, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-25T22:08:16.367' AS DateTime), N'Sarah Jameson_22', CAST(N'2024-12-25T22:08:16.367' AS DateTime), N'Sarah Jameson_22')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (425, 391, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-26T14:34:11.980' AS DateTime), N'Lê Minh Khôi_30', CAST(N'2024-12-26T14:34:11.980' AS DateTime), N'Lê Minh Khôi_30')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (426, 395, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-04-04T22:18:03.220' AS DateTime), N'Khánh Sky_31', CAST(N'2025-04-04T22:18:03.220' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (427, 395, 6, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-04-04T22:18:03.247' AS DateTime), N'Khánh Sky_31', CAST(N'2025-04-04T22:18:03.247' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (428, 397, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-04-04T23:10:10.397' AS DateTime), N'Phan Văn Khánh_32', CAST(N'2025-04-04T23:10:10.397' AS DateTime), N'Phan Văn Khánh_32')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (429, 398, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-04-10T21:09:58.277' AS DateTime), N'Phan Khánh_12', CAST(N'2025-04-10T21:09:58.277' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (430, 398, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-04-10T21:09:58.313' AS DateTime), N'Phan Khánh_12', CAST(N'2025-04-10T21:09:58.313' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (431, 401, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-04-12T11:14:54.960' AS DateTime), N'Khánh Sky_31', CAST(N'2025-04-12T11:14:54.960' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1431, 1401, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-04-24T16:05:31.437' AS DateTime), N'Khánh Sky_31', CAST(N'2025-04-24T16:05:31.437' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1432, 1401, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-04-24T16:05:31.463' AS DateTime), N'Khánh Sky_31', CAST(N'2025-04-24T16:05:31.463' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1433, 1403, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-04-27T22:23:06.983' AS DateTime), N'Phan Khánh_12', CAST(N'2025-04-27T22:23:06.983' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1434, 1403, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-04-27T22:23:07.030' AS DateTime), N'Phan Khánh_12', CAST(N'2025-04-27T22:23:07.030' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1435, 1403, 8, CAST(15000.00 AS Decimal(18, 2)), CAST(N'2025-04-27T22:23:07.033' AS DateTime), N'Phan Khánh_12', CAST(N'2025-04-27T22:23:07.033' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1436, 1404, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-10T18:22:11.187' AS DateTime), N'duy_1035', CAST(N'2025-05-10T18:22:11.187' AS DateTime), N'duy_1035')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1437, 1404, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-10T18:22:11.210' AS DateTime), N'duy_1035', CAST(N'2025-05-10T18:22:11.210' AS DateTime), N'duy_1035')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1438, 1408, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T08:57:19.413' AS DateTime), N'Khánh Sky_31', CAST(N'2025-05-16T08:57:19.413' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1439, 1408, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T08:57:19.437' AS DateTime), N'Khánh Sky_31', CAST(N'2025-05-16T08:57:19.437' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1440, 1411, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:12:10.860' AS DateTime), N'Khánh Sky_31', CAST(N'2025-05-16T09:12:10.860' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1441, 1411, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:12:10.867' AS DateTime), N'Khánh Sky_31', CAST(N'2025-05-16T09:12:10.867' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1442, 1412, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:19:45.093' AS DateTime), N'Khánh Sky_31', CAST(N'2025-05-16T09:19:45.093' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1443, 1412, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:19:45.103' AS DateTime), N'Khánh Sky_31', CAST(N'2025-05-16T09:19:45.103' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1444, 1413, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:26:54.023' AS DateTime), N'Khánh Sky_31', CAST(N'2025-05-16T09:26:54.023' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1445, 1413, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:26:54.030' AS DateTime), N'Khánh Sky_31', CAST(N'2025-05-16T09:26:54.030' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1446, 1414, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:37:42.597' AS DateTime), N'Khánh Sky_31', CAST(N'2025-05-16T09:37:42.597' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1447, 1414, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:37:42.633' AS DateTime), N'Khánh Sky_31', CAST(N'2025-05-16T09:37:42.633' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1448, 1415, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:42:52.150' AS DateTime), N'Phan Văn Khánh_32', CAST(N'2025-05-16T09:42:52.150' AS DateTime), N'Phan Văn Khánh_32')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1449, 1415, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:42:52.180' AS DateTime), N'Phan Văn Khánh_32', CAST(N'2025-05-16T09:42:52.180' AS DateTime), N'Phan Văn Khánh_32')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1450, 1416, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:48:17.040' AS DateTime), N'Phan Văn Khánh_32', CAST(N'2025-05-16T09:48:17.040' AS DateTime), N'Phan Văn Khánh_32')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1451, 1416, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:48:17.080' AS DateTime), N'Phan Văn Khánh_32', CAST(N'2025-05-16T09:48:17.080' AS DateTime), N'Phan Văn Khánh_32')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1452, 1417, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T10:07:20.110' AS DateTime), N'Phan Văn Khánh_32', CAST(N'2025-05-16T10:07:20.110' AS DateTime), N'Phan Văn Khánh_32')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1453, 1418, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T10:10:30.540' AS DateTime), N'Phan Văn Khánh_32', CAST(N'2025-05-16T10:10:30.540' AS DateTime), N'Phan Văn Khánh_32')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1454, 1419, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T10:10:30.583' AS DateTime), N'Phan Văn Khánh_32', CAST(N'2025-05-16T10:10:30.583' AS DateTime), N'Phan Văn Khánh_32')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1455, 1420, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T15:04:53.790' AS DateTime), N'Phan Văn Khánh_32', CAST(N'2025-05-16T15:04:53.790' AS DateTime), N'Phan Văn Khánh_32')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1456, 1420, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T15:04:53.793' AS DateTime), N'Phan Văn Khánh_32', CAST(N'2025-05-16T15:04:53.793' AS DateTime), N'Phan Văn Khánh_32')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1457, 1422, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T15:16:25.997' AS DateTime), N'Phan Văn Khánh_32', CAST(N'2025-05-16T15:16:25.997' AS DateTime), N'Phan Văn Khánh_32')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1458, 1424, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T22:21:51.650' AS DateTime), N'Phan Khánh_12', CAST(N'2025-05-16T22:21:51.650' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1459, 1425, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-17T20:28:13.703' AS DateTime), N'Phan Khánh_12', CAST(N'2025-05-17T20:28:13.703' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1460, 1428, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-18T09:16:27.447' AS DateTime), N'Phan Khánh_12', CAST(N'2025-05-18T09:16:27.447' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1461, 1429, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-18T10:00:57.073' AS DateTime), N'Phan Khánh_12', CAST(N'2025-05-18T10:00:57.073' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1462, 1434, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-19T15:14:27.497' AS DateTime), N'Khánh Sky_31', CAST(N'2025-05-19T15:14:27.497' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1463, 1434, 5, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-19T15:14:27.543' AS DateTime), N'Khánh Sky_31', CAST(N'2025-05-19T15:14:27.543' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1464, 1435, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-20T08:44:10.530' AS DateTime), N'Phan Khánh_12', CAST(N'2025-05-20T08:44:10.530' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1465, 1435, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-20T08:44:10.560' AS DateTime), N'Phan Khánh_12', CAST(N'2025-05-20T08:44:10.560' AS DateTime), N'Phan Khánh_12')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1466, 1438, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-20T16:30:29.953' AS DateTime), N'Khánh Sky_31', CAST(N'2025-05-20T16:30:29.953' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1467, 1438, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-20T16:30:30.000' AS DateTime), N'Khánh Sky_31', CAST(N'2025-05-20T16:30:30.000' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1468, 1440, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-20T23:35:26.333' AS DateTime), N'Khánh Sky_31', CAST(N'2025-05-20T23:35:26.333' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1469, 1440, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-20T23:35:26.370' AS DateTime), N'Khánh Sky_31', CAST(N'2025-05-20T23:35:26.370' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1470, 1441, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-21T07:58:22.540' AS DateTime), N'Khánh Sky_31', CAST(N'2025-05-21T07:58:22.540' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1471, 1441, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-21T07:58:22.583' AS DateTime), N'Khánh Sky_31', CAST(N'2025-05-21T07:58:22.583' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1472, 1442, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-21T08:04:49.103' AS DateTime), N'Khánh Sky_31', CAST(N'2025-05-21T08:04:49.103' AS DateTime), N'Khánh Sky_31')
INSERT [dbo].[OrderDetailsTopping] ([ID], [OrderDetailsID], [ToppingID], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1473, 1444, 3, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-05-30T15:32:02.547' AS DateTime), N'Phan Văn Khánh_1038', CAST(N'2025-05-30T15:32:02.547' AS DateTime), N'Phan Văn Khánh_1038')
SET IDENTITY_INSERT [dbo].[OrderDetailsTopping] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1, N'SP1', N'Americano Đá', 1, N'', 5, CAST(N'2024-11-28T21:09:00.023' AS DateTime), N'Lê Minh Khôi', CAST(N'2025-05-21T08:13:26.327' AS DateTime), N'admin', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2, N'SP2', N'Americano nóng', 1, N'', 5, CAST(N'2024-11-28T21:10:41.123' AS DateTime), N'Lê Minh Khôi', CAST(N'2025-05-18T10:33:02.120' AS DateTime), N'admin', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (3, N'SP3', N'Bạc sỉu', 1, N'', 4, CAST(N'2024-11-28T21:10:57.647' AS DateTime), N'Lê Minh Khôi', CAST(N'2025-05-30T15:37:59.583' AS DateTime), N'admin', 1)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (4, N'SP4', N'Cà phê đen đá', 1, N'', 4, CAST(N'2024-11-28T21:15:54.707' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-01T18:43:05.783' AS DateTime), N'Lê Minh Khôi', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (5, N'SP5', N'Cà Phê Sữa Hạnh Nhân Kem Cheese', 1, N'', 4, CAST(N'2024-11-28T21:16:16.390' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-11-28T21:16:55.533' AS DateTime), N'Lê Minh Khôi', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (6, N'SP6', N'Cappuccino Đá', 1, N'', 5, CAST(N'2024-11-28T21:16:36.143' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-11-28T21:17:10.890' AS DateTime), N'Lê Minh Khôi', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (7, N'SP7', N'Cappuccino Nóng', 1, N'', 5, CAST(N'2024-12-01T18:39:02.480' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-01T18:39:06.930' AS DateTime), N'Lê Minh Khôi', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (8, N'SP8', N'Caramel Macchiato Đá', 1, N'', 5, CAST(N'2024-12-01T18:40:46.720' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-01T18:43:39.210' AS DateTime), N'Lê Minh Khôi', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (9, N'SP9', N'Đường Đen Marble Latte', 1, N'', 5, CAST(N'2024-12-01T18:41:25.893' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-01T18:44:07.533' AS DateTime), N'Lê Minh Khôi', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (10, N'SP10', N'Đường Đen Sữa Đá', 1, N'', 4, CAST(N'2024-12-01T18:42:20.163' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-01T18:44:39.987' AS DateTime), N'Lê Minh Khôi', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (11, N'SP11', N'Espresso Đá', 1, N'', 5, CAST(N'2024-12-01T18:45:45.050' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1007, N'TeaTraiCay01', N'Oolong Tứ Quý Dâu Trân Châu', 0, N'', 1, CAST(N'2024-12-18T23:53:05.670' AS DateTime), N'admin', CAST(N'2024-12-19T02:07:35.160' AS DateTime), N'admin', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1008, N'TeaTraiCay02', N'Oolong Tứ Quý Vải', 1, N'', 1, CAST(N'2024-12-18T23:54:14.757' AS DateTime), N'admin', CAST(N'2024-12-18T23:54:40.167' AS DateTime), N'admin', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1009, N'TeaTraiCay03', N'Oolong Tứ Quý Kim Quất Trân Châu', 1, N'', 1, CAST(N'2024-12-18T23:55:21.680' AS DateTime), N'admin', CAST(N'2024-12-18T23:55:34.777' AS DateTime), N'admin', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1010, N'TeaTraiCay04', N'Trà Đào Cam Sả Đá', 1, N'', 1, CAST(N'2024-12-18T23:58:17.613' AS DateTime), N'admin', CAST(N'2024-12-19T02:00:05.110' AS DateTime), N'admin', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1011, N'TeaTraiCay05', N'Oolong Tứ Quý Sen', 1, N'', 1, CAST(N'2024-12-18T23:59:16.553' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1012, N'TeaTraiCay06', N'Oolong Tứ Quý Sen (Nóng)', 1, N'', 1, CAST(N'2024-12-19T00:00:11.980' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1013, N'TeaMilk01', N'Oolong Sữa Hạnh Nhân (Nóng)', 1, N'', 2, CAST(N'2024-12-19T00:01:10.040' AS DateTime), N'admin', CAST(N'2024-12-19T00:03:02.427' AS DateTime), N'admin', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1014, N'TeaMilk02', N'Oolong Sữa Hạnh Nhân Trân Châu Hoàng Kim', 1, N'', 2, CAST(N'2024-12-19T00:01:50.520' AS DateTime), N'admin', CAST(N'2024-12-19T00:02:57.587' AS DateTime), N'admin', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1015, N'TeaMilk03', N'Trà Sữa Oolong Tứ Quý Sương Sáo', 1, N'', 2, CAST(N'2024-12-19T00:02:52.233' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1016, N'TeaMilk04', N'Trà Sữa Oolong BLao', 1, N'', 2, CAST(N'2024-12-19T00:03:38.220' AS DateTime), N'admin', CAST(N'2024-12-19T00:03:52.123' AS DateTime), N'admin', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1017, N'TeaMilk05', N'Trà Sữa Oolong Tứ Quý Bơ', 1, N'', 2, CAST(N'2024-12-19T00:04:37.403' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1018, N'TeaMilk06', N'Trà Sữa Oolong Nướng Sương Sáo', 1, N'', 2, CAST(N'2024-12-19T00:05:24.543' AS DateTime), N'admin', CAST(N'2024-12-19T00:05:45.177' AS DateTime), N'admin', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1019, N'TeaGreen01', N'Trà Xanh Latte Sữa Hạnh Nhân (Nóng)', 1, N'', 3, CAST(N'2024-12-19T00:07:02.853' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1020, N'TeaGreen02', N'Trà Xanh Latte Sữa Yến Mạch', 1, N'', 3, CAST(N'2024-12-19T00:09:17.667' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1021, N'TeaGreen03', N'Trà Xanh Latte', 1, N'', 3, CAST(N'2024-12-19T00:09:44.967' AS DateTime), N'admin', CAST(N'2024-12-19T00:10:05.963' AS DateTime), N'admin', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1022, N'TeaGreen04', N'Trà Xanh Đường Đen', 1, N'', 3, CAST(N'2024-12-19T00:10:45.010' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1023, N'Frosty01', N'Frosty Phin Gato', 1, N'', 6, CAST(N'2024-12-19T00:13:31.877' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1024, N'Frosty02', N'Frosty Cà Phê Đường Đen', 1, N'', 6, CAST(N'2024-12-19T00:14:05.427' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1025, N'Frosty03', N'Frosty Choco Chip', 1, N'', 6, CAST(N'2024-12-19T00:14:42.340' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1026, N'Cake', N'Croissant trứng muối', 1, N'', 8, CAST(N'2024-12-19T00:16:48.477' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1027, N'Cake1', N'Butter Croissant Sữa Đặc', 1, N'', 8, CAST(N'2024-12-19T00:17:15.513' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1028, N'Cake2', N'Mochi Kem Phúc Bồn Tử', 1, N'', 8, CAST(N'2024-12-19T00:17:42.193' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1029, N'Cake3', N'Mochi Kem Việt Quất', 1, N'', 8, CAST(N'2024-12-19T00:18:28.280' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1030, N'Cake4', N'Mochi Kem Matcha', 1, N'', 8, CAST(N'2024-12-19T00:19:27.620' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1031, N'Cake5', N'Mousse Gấu Chocolate', 1, N'', 8, CAST(N'2024-12-19T00:20:10.087' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1032, N'Cake6', N'Bánh muffin', 0, N'Rất ngon, được làm từ các nguyên liệu tốt cho sức khoẻ', 8, CAST(N'2025-04-12T11:00:11.803' AS DateTime), N'admin', CAST(N'2025-04-12T11:03:05.070' AS DateTime), N'admin', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2032, N'TeaTraiCay07', N'Trà hoa quả', 0, N'', 1, CAST(N'2025-05-16T08:48:31.013' AS DateTime), N'admin', CAST(N'2025-05-16T08:49:25.073' AS DateTime), N'admin', 0)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2033, N'Cake7', N'Bánh Flan', 0, N'', 8, CAST(N'2025-05-16T08:50:20.500' AS DateTime), N'admin', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2034, N'Cake07', N'Bánh bông lan', 1, N'', 8, CAST(N'2025-05-16T08:51:41.497' AS DateTime), N'admin', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2035, N'Banh01', N'Bánh bông lan dâu', 1, N'', 8, CAST(N'2025-05-16T09:55:59.483' AS DateTime), N'admin', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2036, N'Banh002', N'Bánh Bông Lan Dâu', 1, N'', 8, CAST(N'2025-05-16T09:59:37.097' AS DateTime), N'admin', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2037, N'Banh001', N'Bánh Bông Lan Dâu', 1, N'', 6, CAST(N'2025-05-16T15:09:27.837' AS DateTime), N'admin', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2038, N'Banh03', N'Bánh Dâu', 1, N'ngonn lắm', 8, CAST(N'2025-05-17T20:46:22.930' AS DateTime), N'admin', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2039, N'Banh003', N'Bánh Bông Lan Dâu', 1, N'', 8, CAST(N'2025-05-18T09:25:15.487' AS DateTime), N'admin', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2040, N'Cake08', N'Bánh Dâu', 1, N'', 8, CAST(N'2025-05-18T09:57:00.113' AS DateTime), N'admin', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2041, N'Cake008', N'Bánh Dâu', 1, N'', 8, CAST(N'2025-05-18T10:05:17.147' AS DateTime), N'admin', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2042, N'Cake007', N'Bánh Dâu', 1, N'', 8, CAST(N'2025-05-18T10:34:29.267' AS DateTime), N'admin', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2043, N'Cakee007', N'Bánh Dâu', 1, N'', 8, CAST(N'2025-05-21T08:16:45.267' AS DateTime), N'admin', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [ProductCode], [ProductName], [IsActive], [Description], [ProductTypeID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2044, N'Cakee008', N'Bánh Dâu', 1, N'', 8, CAST(N'2025-05-30T15:40:54.990' AS DateTime), N'admin', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetails] ON 

INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (10, 5, 1, CAST(30000.00 AS Decimal(18, 2)), CAST(N'2024-11-28T21:16:55.543' AS DateTime), N'Lê Minh Khôi', NULL, NULL, NULL)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (11, 5, 2, CAST(45000.00 AS Decimal(18, 2)), CAST(N'2024-11-28T21:16:55.547' AS DateTime), N'Lê Minh Khôi', NULL, NULL, NULL)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (12, 5, 3, CAST(60000.00 AS Decimal(18, 2)), CAST(N'2024-11-28T21:16:55.550' AS DateTime), N'Lê Minh Khôi', NULL, NULL, NULL)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (13, 6, 1, CAST(30000.00 AS Decimal(18, 2)), CAST(N'2024-11-28T21:17:10.913' AS DateTime), N'Lê Minh Khôi', NULL, NULL, NULL)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (14, 6, 2, CAST(45000.00 AS Decimal(18, 2)), CAST(N'2024-11-28T21:17:10.917' AS DateTime), N'Lê Minh Khôi', NULL, NULL, NULL)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (15, 6, 3, CAST(60000.00 AS Decimal(18, 2)), CAST(N'2024-11-28T21:17:10.920' AS DateTime), N'Lê Minh Khôi', NULL, NULL, NULL)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (37, 7, 1, CAST(35000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T18:39:06.950' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (38, 7, 2, CAST(45000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T18:39:06.953' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (39, 7, 3, CAST(50000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T18:39:06.953' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (40, 4, 1, CAST(35000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T18:43:05.787' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (41, 4, 2, CAST(45000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T18:43:05.790' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (42, 4, 3, CAST(55000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T18:43:05.797' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (43, 8, 1, CAST(35000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T18:43:39.220' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (44, 8, 2, CAST(55000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T18:43:39.223' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (45, 8, 3, CAST(65000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T18:43:39.227' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (46, 9, 1, CAST(35000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T18:44:07.537' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (47, 9, 2, CAST(45000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T18:44:07.540' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (48, 9, 3, CAST(55000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T18:44:07.540' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (49, 10, 1, CAST(35000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T18:44:39.990' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (50, 10, 2, CAST(45000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T18:44:39.993' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (51, 10, 3, CAST(55000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T18:44:39.993' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (52, 11, 1, CAST(35000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T18:45:45.063' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (53, 11, 2, CAST(45000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T18:45:45.067' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (54, 11, 3, CAST(55000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T18:45:45.070' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1031, 1008, 1, CAST(49000.00 AS Decimal(18, 2)), CAST(N'2024-12-18T23:54:40.167' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1032, 1008, 2, CAST(59000.00 AS Decimal(18, 2)), CAST(N'2024-12-18T23:54:40.170' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1033, 1008, 3, CAST(65000.00 AS Decimal(18, 2)), CAST(N'2024-12-18T23:54:40.170' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1037, 1009, 1, CAST(49000.00 AS Decimal(18, 2)), CAST(N'2024-12-18T23:55:34.780' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1038, 1009, 2, CAST(59000.00 AS Decimal(18, 2)), CAST(N'2024-12-18T23:55:34.780' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1039, 1009, 3, CAST(65000.00 AS Decimal(18, 2)), CAST(N'2024-12-18T23:55:34.780' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1046, 1011, 1, CAST(49000.00 AS Decimal(18, 2)), CAST(N'2024-12-18T23:59:16.557' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1047, 1011, 2, CAST(59000.00 AS Decimal(18, 2)), CAST(N'2024-12-18T23:59:16.557' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1048, 1011, 3, CAST(65000.00 AS Decimal(18, 2)), CAST(N'2024-12-18T23:59:16.557' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1049, 1012, 1, CAST(49000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:00:11.997' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1050, 1012, 2, CAST(59000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:00:12.010' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1051, 1012, 3, CAST(65000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:00:12.027' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1056, 1015, 1, CAST(59000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:02:52.237' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1057, 1015, 2, CAST(65000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:02:52.240' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1058, 1014, 1, CAST(59000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:02:57.600' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1059, 1014, 2, CAST(65000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:02:57.600' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1060, 1013, 1, CAST(55000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:03:02.440' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1061, 1013, 2, CAST(65000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:03:02.440' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1064, 1016, 1, CAST(39000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:03:52.127' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1065, 1016, 2, CAST(49000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:03:52.127' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1066, 1017, 1, CAST(59000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:04:37.433' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1067, 1017, 2, CAST(65000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:04:37.437' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1070, 1018, 1, CAST(55000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:05:45.180' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1071, 1018, 2, CAST(59000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:05:45.183' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1072, 1019, 1, CAST(55000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:07:02.863' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1073, 1019, 2, CAST(65000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:07:02.863' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1074, 1020, 1, CAST(55000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:09:17.680' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1075, 1020, 2, CAST(65000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:09:17.683' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1078, 1021, 1, CAST(45000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:10:05.970' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1079, 1021, 2, CAST(55000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:10:05.970' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1080, 1022, 1, CAST(55000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:10:45.023' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1081, 1022, 2, CAST(65000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:10:45.023' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1082, 1022, 3, CAST(69000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:10:45.023' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1083, 1023, 1, CAST(55000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:13:31.890' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1084, 1023, 2, CAST(65000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:13:31.893' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1085, 1023, 3, CAST(69000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:13:31.893' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1086, 1024, 1, CAST(55000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:14:05.430' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1087, 1024, 2, CAST(65000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:14:05.430' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1088, 1025, 1, CAST(55000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:14:42.343' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1089, 1025, 2, CAST(65000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:14:42.347' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1090, 1026, 4, CAST(39000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:16:48.480' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1091, 1027, 4, CAST(35000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:17:15.523' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1092, 1028, 4, CAST(19000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:17:42.200' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1093, 1029, 4, CAST(19000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:18:28.283' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1094, 1030, 4, CAST(19000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:19:27.623' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1095, 1031, 4, CAST(39000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T00:20:10.090' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1099, 1010, 1, CAST(49000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T02:00:05.113' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1100, 1010, 2, CAST(59000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T02:00:05.113' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1101, 1010, 3, CAST(65000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T02:00:05.113' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1120, 1007, 1, CAST(49000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T02:07:35.173' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1121, 1007, 2, CAST(59000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T02:07:35.177' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1122, 1007, 3, CAST(65000.00 AS Decimal(18, 2)), CAST(N'2024-12-19T02:07:35.177' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1124, 1032, 4, CAST(25000.00 AS Decimal(18, 2)), CAST(N'2025-04-12T11:03:05.073' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2124, 2032, 2, CAST(30000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T08:49:25.083' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2125, 2033, 4, CAST(20000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T08:50:20.510' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2126, 2034, 4, CAST(20000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T08:51:41.507' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2127, 2035, 4, CAST(25000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:55:59.607' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2128, 2036, 4, CAST(15000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T09:59:37.113' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2129, 2037, 4, CAST(40000.00 AS Decimal(18, 2)), CAST(N'2025-05-16T15:09:27.863' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2130, 2038, 4, CAST(50000.00 AS Decimal(18, 2)), CAST(N'2025-05-17T20:46:23.097' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2131, 2040, 4, CAST(35000.00 AS Decimal(18, 2)), CAST(N'2025-05-18T09:57:00.243' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2135, 2041, 4, CAST(45000.00 AS Decimal(18, 2)), CAST(N'2025-05-18T10:05:17.160' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2139, 2, 1, CAST(30000.00 AS Decimal(18, 2)), CAST(N'2025-05-18T10:33:02.133' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2140, 2, 2, CAST(45000.00 AS Decimal(18, 2)), CAST(N'2025-05-18T10:33:02.137' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2141, 2, 3, CAST(60000.00 AS Decimal(18, 2)), CAST(N'2025-05-18T10:33:02.140' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2142, 2042, 4, CAST(45000.00 AS Decimal(18, 2)), CAST(N'2025-05-18T10:34:29.277' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2143, 1, 1, CAST(30000.00 AS Decimal(18, 2)), CAST(N'2025-05-21T08:13:26.357' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2144, 1, 2, CAST(45000.00 AS Decimal(18, 2)), CAST(N'2025-05-21T08:13:26.407' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2145, 1, 3, CAST(60000.00 AS Decimal(18, 2)), CAST(N'2025-05-21T08:13:26.407' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2149, 2043, 4, CAST(45000.00 AS Decimal(18, 2)), CAST(N'2025-05-21T08:16:45.287' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2156, 3, 1, CAST(30000.00 AS Decimal(18, 2)), CAST(N'2025-05-30T15:37:59.600' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2157, 3, 2, CAST(45000.00 AS Decimal(18, 2)), CAST(N'2025-05-30T15:37:59.610' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2158, 3, 3, CAST(60000.00 AS Decimal(18, 2)), CAST(N'2025-05-30T15:37:59.613' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductDetails] ([ID], [ProductID], [ProductSizeID], [Price], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2159, 2044, 4, CAST(25000.00 AS Decimal(18, 2)), CAST(N'2025-05-30T15:40:55.013' AS DateTime), N'admin', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[ProductDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (6, 2, N'CaPheMay/SP2/1636647328_arme-nong_3c118e3822444aadb7f0e1a162d5264a.webp', N'1636647328_arme-nong_3c118e3822444aadb7f0e1a162d5264a.webp', CAST(N'2024-11-28T21:10:41.327' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (7, 2, N'CaPheMay/SP2/1645968775_americano-copy_bb5a408f247646f0935eb17932a6d0d0.webp', N'1645968775_americano-copy_bb5a408f247646f0935eb17932a6d0d0.webp', CAST(N'2024-11-28T21:10:41.330' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (8, 3, N'CaPheViet/SP3/1639377904_bac-siu_525b9fa5055b41f183088c8e479a9472.jpg', N'1639377904_bac-siu_525b9fa5055b41f183088c8e479a9472.jpg', CAST(N'2024-11-28T21:10:57.743' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (9, 3, N'CaPheViet/SP3/1645962337_bac-siu-da-2_e2c96c8ab5f44365bfbc32b0849c0f62.webp', N'1645962337_bac-siu-da-2_e2c96c8ab5f44365bfbc32b0849c0f62.webp', CAST(N'2024-11-28T21:10:57.747' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (10, 4, N'CaPheViet/SP4/1639377797_ca-phe-den-da_6f4766ec0f8b4e929a8d916ae3c13254.jpg', N'1639377797_ca-phe-den-da_6f4766ec0f8b4e929a8d916ae3c13254.jpg', CAST(N'2024-11-28T21:15:54.757' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (11, 5, N'CaPheViet/SP5/1732197236_caphe_2de6b75bab2f456883e0f741c8c40120.jpg', N'1732197236_caphe_2de6b75bab2f456883e0f741c8c40120.jpg', CAST(N'2024-11-28T21:16:16.413' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (12, 6, N'CaPheMay/SP6/capu-da_487470_e06d3835cbc84e51bd635b04d541494e.webp', N'capu-da_487470_e06d3835cbc84e51bd635b04d541494e.webp', CAST(N'2024-11-28T21:16:36.163' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (13, 1, N'CaPheMay/SP1/1633143905_ameriacano-tet_8893d4894f8c4693879f37b7f82639aa.webp', N'1633143905_ameriacano-tet_8893d4894f8c4693879f37b7f82639aa.webp', CAST(N'2024-12-01T17:33:19.653' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (14, 1, N'CaPheMay/SP1/classic-cold-brew_791256_d4d8388a3d724f879845680c0239ff68.webp', N'classic-cold-brew_791256_d4d8388a3d724f879845680c0239ff68.webp', CAST(N'2024-12-01T17:33:19.673' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (16, 7, N'CaPheMay/SP7/cappuccino_621532_f42ec557eda145b5958374ca67e65ff2.webp', N'cappuccino_621532_f42ec557eda145b5958374ca67e65ff2.webp', CAST(N'2024-12-01T18:39:02.913' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (17, 8, N'CaPheMay/SP8/1645971206_53476442-2294790520794961-6801279449942720512-n_b1176e22e0854cb98756db41bfbee1da.webp', N'1645971206_53476442-2294790520794961-6801279449942720512-n_b1176e22e0854cb98756db41bfbee1da.webp', CAST(N'2024-12-01T18:40:46.773' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (18, 8, N'CaPheMay/SP8/caramel-macchiato_143623_0e070a39d0e54e808db4d91049430b51.jpg', N'caramel-macchiato_143623_0e070a39d0e54e808db4d91049430b51.jpg', CAST(N'2024-12-01T18:40:46.780' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (19, 9, N'CaPheMay/SP9/1686716537_dd-latte_785591205184481597a2a79b9331e03b.jpg', N'1686716537_dd-latte_785591205184481597a2a79b9331e03b.jpg', CAST(N'2024-12-01T18:41:25.957' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (20, 10, N'CaPheViet/SP10/1686716532_dd-suada_c180c6187e644babbac7019a2070231e.webp', N'1686716532_dd-suada_c180c6187e644babbac7019a2070231e.webp', CAST(N'2024-12-01T18:42:20.200' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (21, 11, N'CaPheMay/SP11/cfdenda-espressoda_185438_1515261ef60b482eb58e1c545e7410a3.webp', N'cfdenda-espressoda_185438_1515261ef60b482eb58e1c545e7410a3.webp', CAST(N'2024-12-01T18:45:45.190' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1016, 1008, N'TraTraiCay/TeaTraiCay02/1719200008_vai_deabb7c6587644748810f954cc344a10.webp', N'1719200008_vai_deabb7c6587644748810f954cc344a10.webp', CAST(N'2024-12-18T23:54:40.247' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1017, 1009, N'TraTraiCay/TeaTraiCay03/1719200101_kimquat_892a8e85be0e4ab9951626bd2e2e04c6.webp', N'1719200101_kimquat_892a8e85be0e4ab9951626bd2e2e04c6.webp', CAST(N'2024-12-18T23:55:34.893' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1020, 1011, N'TraTraiCay/TeaTraiCay05/tra-sen_905594_6f6088347912437a9a0d851bdaa510a6.webp', N'tra-sen_905594_6f6088347912437a9a0d851bdaa510a6.webp', CAST(N'2024-12-18T23:59:16.597' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1021, 1012, N'TraTraiCay/TeaTraiCay06/tra-sen-nong_025153_e616dbace8e24d2f9ad2728cd214072f.webp', N'tra-sen-nong_025153_e616dbace8e24d2f9ad2728cd214072f.webp', CAST(N'2024-12-19T00:00:12.150' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1022, 1015, N'TraSua/TeaMilk03/1719911220_oolongtuquy-suongsao_9f8c7d796cbd490fb40b1096a15df1bb.webp', N'1719911220_oolongtuquy-suongsao_9f8c7d796cbd490fb40b1096a15df1bb.webp', CAST(N'2024-12-19T00:02:52.273' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1023, 1014, N'TraSua/TeaMilk02/1732197202_trasua_fb272fa48a5b462ea485b4af7e32066a.jpg', N'1732197202_trasua_fb272fa48a5b462ea485b4af7e32066a.jpg', CAST(N'2024-12-19T00:02:57.640' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1024, 1013, N'TraSua/TeaMilk01/1732197208_trasuanong_90f6ffa8c7f242738131bc89f653d969.webp', N'1732197208_trasuanong_90f6ffa8c7f242738131bc89f653d969.webp', CAST(N'2024-12-19T00:03:02.467' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1025, 1016, N'TraSua/TeaMilk04/1697442154_ts-oolong-blao_ab3e823f96524ca3ba704907cfa8d5e1.webp', N'1697442154_ts-oolong-blao_ab3e823f96524ca3ba704907cfa8d5e1.webp', CAST(N'2024-12-19T00:03:52.180' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1026, 1017, N'TraSua/TeaMilk05/1723623432_tra-sua-bo_ae33a90b72e440c0a26332475df1be3c.webp', N'1723623432_tra-sua-bo_ae33a90b72e440c0a26332475df1be3c.webp', CAST(N'2024-12-19T00:04:37.517' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1028, 1018, N'TraSua/TeaMilk06/1716811640_oolong-suong-sao_2ade534615234d3a9a25add757e5ec27.webp', N'1716811640_oolong-suong-sao_2ade534615234d3a9a25add757e5ec27.webp', CAST(N'2024-12-19T00:05:45.247' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1029, 1019, N'TraXanh/TeaGreen01/1732197222_traxanhnong_bc472fd2a2be425299a4e14349773f0d.webp', N'1732197222_traxanhnong_bc472fd2a2be425299a4e14349773f0d.webp', CAST(N'2024-12-19T00:07:02.907' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1030, 1020, N'TraXanh/TeaGreen02/1726647782_tra-xanh-sua-yen-mach_c070935ed194409e8b6b59e2fc364945.webp', N'1726647782_tra-xanh-sua-yen-mach_c070935ed194409e8b6b59e2fc364945.webp', CAST(N'2024-12-19T00:09:17.783' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1031, 1021, N'TraXanh/TeaGreen03/1726647801_tra-xanh-latte-1_09fce3e75ca641b5b9b842b36905732a.webp', N'1726647801_tra-xanh-latte-1_09fce3e75ca641b5b9b842b36905732a.webp', CAST(N'2024-12-19T00:10:06.063' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1032, 1022, N'TraXanh/TeaGreen04/1697450399_tx-duong-den_3342d63e65df4bd7a264ca681b9e30f1.webp', N'1697450399_tx-duong-den_3342d63e65df4bd7a264ca681b9e30f1.webp', CAST(N'2024-12-19T00:10:45.063' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1033, 1023, N'Prosty/Frosty01/1697441914_phin-gato_304446dce9ec4fe0a5527536b93f6eda.webp', N'1697441914_phin-gato_304446dce9ec4fe0a5527536b93f6eda.webp', CAST(N'2024-12-19T00:13:31.990' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1034, 1024, N'Prosty/Frosty02/1697441939_ca-phe-duong-den_684615fd8fce40c2a1f6a03e0555fe62.webp', N'1697441939_ca-phe-duong-den_684615fd8fce40c2a1f6a03e0555fe62.webp', CAST(N'2024-12-19T00:14:05.523' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1035, 1025, N'Prosty/Frosty03/1697441952_choco-chip_06433e0e342b40d7bc59391be6df4c84.webp', N'1697441952_choco-chip_06433e0e342b40d7bc59391be6df4c84.webp', CAST(N'2024-12-19T00:14:42.393' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1036, 1026, N'Snack/Cake/croissant-trung-muoi_880850_8eee147c56d7406990b23fadcf898896.webp', N'croissant-trung-muoi_880850_8eee147c56d7406990b23fadcf898896.webp', CAST(N'2024-12-19T00:16:48.530' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1037, 1027, N'Snack/Cake1/1701780462_butter-sua-dac_93635b1d47e04637b50f5bc48ee973e5.webp', N'1701780462_butter-sua-dac_93635b1d47e04637b50f5bc48ee973e5.webp', CAST(N'2024-12-19T00:17:15.607' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1038, 1028, N'Snack/Cake2/1643102019_mochi-phucbontu_3bf870f843174dbdbf32497dcb4e92e9.webp', N'1643102019_mochi-phucbontu_3bf870f843174dbdbf32497dcb4e92e9.webp', CAST(N'2024-12-19T00:17:42.250' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1039, 1029, N'Snack/Cake3/1643102034_mochi-vietquat_74abbb43b438400091aa6f6d5611be78.webp', N'1643102034_mochi-vietquat_74abbb43b438400091aa6f6d5611be78.webp', CAST(N'2024-12-19T00:18:28.323' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1040, 1030, N'Snack/Cake4/1655348113_mochi-traxanh_d686ebf72f054fbb8cfa004fad7d88de.webp', N'1655348113_mochi-traxanh_d686ebf72f054fbb8cfa004fad7d88de.webp', CAST(N'2024-12-19T00:19:27.660' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1041, 1031, N'Snack/Cake5/1638170066_gau_b7b0360f6b9a4e6484b0db6329c813d0.webp', N'1638170066_gau_b7b0360f6b9a4e6484b0db6329c813d0.webp', CAST(N'2024-12-19T00:20:10.153' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1043, 1010, N'TraTraiCay/TeaTraiCay04/1669736819_tra-dao-cam-sa-da_63defc32ce214da487850604a63ff281.webp', N'1669736819_tra-dao-cam-sa-da_63defc32ce214da487850604a63ff281.webp', CAST(N'2024-12-19T02:00:05.180' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1047, 1007, N'TraTraiCay/TeaTraiCay01/1731662581_oolongdau_e4768906df29436ba2ecbe84179dfdd4.jpg', N'1731662581_oolongdau_e4768906df29436ba2ecbe84179dfdd4.jpg', CAST(N'2024-12-19T02:07:23.477' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1048, 1032, N'Snack/Cake6/banhngot1.jpg', N'banhngot1.jpg', CAST(N'2025-04-12T11:00:12.053' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2048, 2032, N'TraTraiCay/TeaTraiCay07/trà hoa quả.jfif', N'trà hoa quả.jfif', CAST(N'2025-05-16T08:48:31.123' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2049, 2033, N'Snack/Cake7/Bánh Flan.png', N'Bánh Flan.png', CAST(N'2025-05-16T08:50:20.603' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2050, 2034, N'Snack/Cake07/bánh bông lan.jfif', N'bánh bông lan.jfif', CAST(N'2025-05-16T08:51:41.533' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2051, 2035, N'Snack/Banh01/Bánh bông lan dâu.jpg', N'Bánh bông lan dâu.jpg', CAST(N'2025-05-16T09:55:59.717' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2052, 2036, N'Snack/Banh002/Bánh bông lan dâu.jpg', N'Bánh bông lan dâu.jpg', CAST(N'2025-05-16T09:59:37.150' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2053, 2037, N'Prosty/Banh001/Bánh bông lan dâu.jpg', N'Bánh bông lan dâu.jpg', CAST(N'2025-05-16T15:09:28.093' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2054, 2038, N'Snack/Banh03/Bánh bông lan dâu.jpg', N'Bánh bông lan dâu.jpg', CAST(N'2025-05-17T20:46:23.243' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2055, 2039, N'Snack/Banh003/Bánh bông lan dâu.jpg', N'Bánh bông lan dâu.jpg', CAST(N'2025-05-18T09:25:15.790' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2056, 2040, N'Snack/Cake08/Bánh bông lan dâu.jpg', N'Bánh bông lan dâu.jpg', CAST(N'2025-05-18T09:57:00.327' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2057, 2041, N'Snack/Cake008/Bánh bông lan dâu.jpg', N'Bánh bông lan dâu.jpg', CAST(N'2025-05-18T10:05:17.190' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2058, 2042, N'Snack/Cake007/Bánh bông lan dâu.jpg', N'Bánh bông lan dâu.jpg', CAST(N'2025-05-18T10:34:29.310' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2059, 2043, N'Snack/Cakee007/Bánh bông lan dâu.jpg', N'Bánh bông lan dâu.jpg', CAST(N'2025-05-21T08:16:45.340' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductImage] ([ID], [ProductID], [ImageUrl], [ImageName], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2060, 2044, N'Snack/Cakee008/Bánh bông lan dâu.jpg', N'Bánh bông lan dâu.jpg', CAST(N'2025-05-30T15:40:55.110' AS DateTime), N'admin', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSize] ON 

INSERT [dbo].[ProductSize] ([ID], [SizeCode], [SizeName], [Description], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1, N'Size1', N'M', N'', CAST(N'2024-11-27T21:03:46.627' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductSize] ([ID], [SizeCode], [SizeName], [Description], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2, N'Size2', N'L', N'', CAST(N'2024-11-27T21:03:58.240' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductSize] ([ID], [SizeCode], [SizeName], [Description], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (3, N'Size3', N'XL', N'', CAST(N'2024-11-27T21:04:03.673' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[ProductSize] ([ID], [SizeCode], [SizeName], [Description], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (4, N'Cai', N'Cái', N'', CAST(N'2024-12-19T00:15:53.537' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[ProductSize] ([ID], [SizeCode], [SizeName], [Description], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (8, N'Size4', N'XXL', N'', CAST(N'2025-05-30T15:42:24.803' AS DateTime), N'admin', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[ProductSize] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTopping] ON 

INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, 1, 7, CAST(N'2024-12-01T18:39:06.957' AS DateTime), N'Lê Minh Khôi', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, 3, 7, CAST(N'2024-12-01T18:39:06.960' AS DateTime), N'Lê Minh Khôi', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, 4, 7, CAST(N'2024-12-01T18:39:06.960' AS DateTime), N'Lê Minh Khôi', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, 1, 9, CAST(N'2024-12-01T18:44:07.543' AS DateTime), N'Lê Minh Khôi', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, 4, 9, CAST(N'2024-12-01T18:44:07.547' AS DateTime), N'Lê Minh Khôi', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, 3, 10, CAST(N'2024-12-01T18:44:39.997' AS DateTime), N'Lê Minh Khôi', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (20, 4, 10, CAST(N'2024-12-01T18:44:40.000' AS DateTime), N'Lê Minh Khôi', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1014, 2, 1008, CAST(N'2024-12-18T23:54:40.170' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1015, 5, 1008, CAST(N'2024-12-18T23:54:40.173' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1016, 8, 1008, CAST(N'2024-12-18T23:54:40.173' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1017, 11, 1008, CAST(N'2024-12-18T23:54:40.173' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1021, 2, 1009, CAST(N'2024-12-18T23:55:34.780' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1022, 3, 1009, CAST(N'2024-12-18T23:55:34.780' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1023, 8, 1009, CAST(N'2024-12-18T23:55:34.783' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1031, 2, 1011, CAST(N'2024-12-18T23:59:16.557' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1032, 3, 1011, CAST(N'2024-12-18T23:59:16.560' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1033, 8, 1011, CAST(N'2024-12-18T23:59:16.560' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1034, 11, 1011, CAST(N'2024-12-18T23:59:16.560' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1035, 4, 1012, CAST(N'2024-12-19T00:00:12.057' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1036, 6, 1012, CAST(N'2024-12-19T00:00:12.073' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1037, 9, 1012, CAST(N'2024-12-19T00:00:12.090' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1045, 3, 1015, CAST(N'2024-12-19T00:02:52.240' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1046, 5, 1015, CAST(N'2024-12-19T00:02:52.240' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1047, 9, 1015, CAST(N'2024-12-19T00:02:52.240' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1048, 11, 1015, CAST(N'2024-12-19T00:02:52.243' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1049, 1, 1014, CAST(N'2024-12-19T00:02:57.603' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1050, 3, 1014, CAST(N'2024-12-19T00:02:57.603' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1051, 6, 1014, CAST(N'2024-12-19T00:02:57.603' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1052, 11, 1014, CAST(N'2024-12-19T00:02:57.603' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1053, 2, 1013, CAST(N'2024-12-19T00:03:02.440' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1054, 3, 1013, CAST(N'2024-12-19T00:03:02.440' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1055, 4, 1013, CAST(N'2024-12-19T00:03:02.440' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1060, 1, 1016, CAST(N'2024-12-19T00:03:52.130' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1061, 2, 1016, CAST(N'2024-12-19T00:03:52.130' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1062, 3, 1016, CAST(N'2024-12-19T00:03:52.130' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1063, 5, 1016, CAST(N'2024-12-19T00:03:52.133' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1064, 1, 1017, CAST(N'2024-12-19T00:04:37.437' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1065, 2, 1017, CAST(N'2024-12-19T00:04:37.443' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1066, 3, 1017, CAST(N'2024-12-19T00:04:37.443' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1067, 4, 1017, CAST(N'2024-12-19T00:04:37.447' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1068, 5, 1017, CAST(N'2024-12-19T00:04:37.453' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1072, 1, 1018, CAST(N'2024-12-19T00:05:45.183' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1073, 2, 1018, CAST(N'2024-12-19T00:05:45.183' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1074, 5, 1018, CAST(N'2024-12-19T00:05:45.183' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1075, 3, 1019, CAST(N'2024-12-19T00:07:02.867' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1076, 4, 1019, CAST(N'2024-12-19T00:07:02.867' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1077, 3, 1020, CAST(N'2024-12-19T00:09:17.683' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1078, 11, 1020, CAST(N'2024-12-19T00:09:17.683' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1083, 2, 1010, CAST(N'2024-12-19T02:00:05.113' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1084, 5, 1010, CAST(N'2024-12-19T02:00:05.113' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1085, 8, 1010, CAST(N'2024-12-19T02:00:05.113' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1110, 2, 1007, CAST(N'2024-12-19T02:07:35.177' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1111, 3, 1007, CAST(N'2024-12-19T02:07:35.180' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1112, 8, 1007, CAST(N'2024-12-19T02:07:35.180' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1113, 11, 1007, CAST(N'2024-12-19T02:07:35.180' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1116, 1, 1, CAST(N'2025-05-21T08:13:26.413' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[ProductTopping] ([ID], [ToppingID], [ProductID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1117, 3, 1, CAST(N'2025-05-21T08:13:26.457' AS DateTime), N'admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[ProductTopping] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ID], [TypeCode], [TypeName], [GroupTypeID], [Description], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1, N'TraTraiCay', N'Trà trái cây', 2, N'', CAST(N'2024-11-27T00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[ProductType] ([ID], [TypeCode], [TypeName], [GroupTypeID], [Description], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2, N'TraSua', N'Trà sữa', 2, N'', CAST(N'2024-11-27T00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[ProductType] ([ID], [TypeCode], [TypeName], [GroupTypeID], [Description], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (3, N'TraXanh', N'Trà xanh', 2, N'', CAST(N'2024-11-27T00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[ProductType] ([ID], [TypeCode], [TypeName], [GroupTypeID], [Description], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (4, N'CaPheViet', N'Cà phê Việt Nam', 1, N'', CAST(N'2024-11-27T00:00:00.000' AS DateTime), NULL, CAST(N'2024-11-27T23:00:40.510' AS DateTime), N'Lê Minh Khôi', 0)
INSERT [dbo].[ProductType] ([ID], [TypeCode], [TypeName], [GroupTypeID], [Description], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (5, N'CaPheMay', N'Cà phê máy', 1, N'', CAST(N'2024-11-27T00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[ProductType] ([ID], [TypeCode], [TypeName], [GroupTypeID], [Description], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (6, N'Prosty', N'Đá xay', 3, N'', CAST(N'2024-11-27T00:00:00.000' AS DateTime), NULL, CAST(N'2024-12-19T00:11:56.723' AS DateTime), N'admin', 0)
INSERT [dbo].[ProductType] ([ID], [TypeCode], [TypeName], [GroupTypeID], [Description], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (8, N'Snack', N'Bánh - Snack', 3, N'', CAST(N'2024-12-19T00:12:17.797' AS DateTime), N'admin', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([ID], [SupplierCode], [SupplierName], [PhoneNumber], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1, N'PL003', N'Công ty TNHH SX TM Phúc Long', N'028 7106 7779', N'Phúc Long - Cung cấp cà phê hạt và bột, trà xanh, trà đen, trà ô long, trà trái cây.', CAST(N'2025-04-25T22:18:06.343' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-04-28T16:10:59.537' AS DateTime), N'admin', 0)
INSERT [dbo].[Supplier] ([ID], [SupplierCode], [SupplierName], [PhoneNumber], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2, N'TNL001', N'Công ty CP Tập đoàn Trung Nguyên', N'1800 6011', N'Trung Nguyên Legend - cung cấp cà phê hạt và bột', CAST(N'2025-04-25T22:18:06.343' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-04-26T22:24:17.107' AS DateTime), N'Phan Văn Khánh', 0)
INSERT [dbo].[Supplier] ([ID], [SupplierCode], [SupplierName], [PhoneNumber], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (3, N'KC002', N'Công ty TNHH TNI King Coffee', N'1800 2088', N'King Coffee - cung cấp cà phê hạt và bột', CAST(N'2025-04-25T22:18:06.343' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[Supplier] ([ID], [SupplierCode], [SupplierName], [PhoneNumber], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (4, N'VM001', N'Công ty CP Sữa Việt Nam', N'1800 1060', N'Vinamilk - cung cấp sữa và nguyên liệu pha chế', CAST(N'2025-04-25T22:18:06.343' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[Supplier] ([ID], [SupplierCode], [SupplierName], [PhoneNumber], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (5, N'DP002', N'Công ty TNHH Đức Phát', N'0988 333 779', N'Đức Phát - cung cấp sữa và nguyên liệu pha chế', CAST(N'2025-04-25T22:18:06.343' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[Supplier] ([ID], [SupplierCode], [SupplierName], [PhoneNumber], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (6, N'BH001', N'Công ty CP Đường Biên Hòa (SBT)', N'1900 5588', N'Biên Hòa Sugar - cung cấp đường, hương liệu, và trái cây', CAST(N'2025-04-25T22:18:06.343' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[Supplier] ([ID], [SupplierCode], [SupplierName], [PhoneNumber], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (7, N'ORA002', N'Công ty TNHH Orana Việt Nam', N' 0274 370 3630', N'Orana Vietnam - cung cấp đường, hương liệu, và trái cây', CAST(N'2025-04-25T22:18:06.343' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[Supplier] ([ID], [SupplierCode], [SupplierName], [PhoneNumber], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (8, N'TCX001', N'Công ty TNHH Tân Cương Xanh', N'0912 640 888', N'Trà Tân Cương Xanh - Trà Thái Nguyên, trà ướp hoa sen, trà xanh.', CAST(N'2025-04-25T22:18:06.343' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[Supplier] ([ID], [SupplierCode], [SupplierName], [PhoneNumber], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (9, N'DT002', N'Công ty CP Dotea Việt Nam', N' 0938 388 388', N'Trà Dotea - Trà ô long, trà nhài, trà thảo mộc.', CAST(N'2025-04-25T22:18:06.343' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[Supplier] ([ID], [SupplierCode], [SupplierName], [PhoneNumber], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (10, N'DL001', N'Dilmah Tea Vietnam', N'028 3822 3234', N'Dilmah Tea  -  Trà đen Ceylon, trà Earl Grey, trà trái cây  - cung cấp trà quốc tế (nhập khẩu)', CAST(N'2025-04-25T22:18:06.343' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-04-30T22:29:32.550' AS DateTime), N'admin', 0)
INSERT [dbo].[Supplier] ([ID], [SupplierCode], [SupplierName], [PhoneNumber], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (11, N'TW002', N'Twinings Vietnam Distributor', N'0934 888 999', N'Twinings Tea -  Trà đen, trà xanh, trà trái cây nhập khẩu từ Anh.', CAST(N'2025-04-25T22:18:06.343' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[Supplier] ([ID], [SupplierCode], [SupplierName], [PhoneNumber], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (12, N'HORE001', N'Công ty TNHH Horeca Việt Nam', N'028 6292 1188', N'Nhà cung cấp Siro và hương liệu Monin - Siro Monin, Torani (vani, caramel, trái cây).', CAST(N'2025-04-25T22:18:06.343' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[Supplier] ([ID], [SupplierCode], [SupplierName], [PhoneNumber], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (13, N'ORA003', N'Công ty TNHH Orana Việt Nam', N'0274 370 3630', N'Orana Vietnam - Trái cây đông lạnh, puree trái cây.', CAST(N'2025-04-25T22:18:06.343' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[Supplier] ([ID], [SupplierCode], [SupplierName], [PhoneNumber], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (14, N'PGP005', N'Công ty TNHH Puratos Grand-Place Việt Nam', N'0274 392 8485', N'Puratos Grand-Place Vietnam - Bột cacao, bột làm bánh, nguyên liệu làm socola.', CAST(N'2025-04-25T22:18:06.343' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[Supplier] ([ID], [SupplierCode], [SupplierName], [PhoneNumber], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (15, N'TNH006', N'Công ty TNHH Tân Nhất Hương', N'028 6266 2879', N'Nhà cung cấp bột trà và matcha Nhật Bản Tân Nhất Hương -  Bột trà xanh, bột matcha, bột bánh ngọt.', CAST(N'2025-04-25T22:18:06.343' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 1)
INSERT [dbo].[Supplier] ([ID], [SupplierCode], [SupplierName], [PhoneNumber], [Decription], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (16, N'RPV007', N'Rich Products Vietnam', N'028 6285 9280', N'Kem topping, bột whipping, bột sữa, bột pha trà sữa.', CAST(N'2025-04-25T22:18:06.343' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[Topping] ON 

INSERT [dbo].[Topping] ([ID], [ToppingCode], [ToppingName], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1, N'TP1', N'Sốt Caramel', CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T16:32:14.307' AS DateTime), N'Lê Minh Khôi', CAST(N'2024-12-18T21:49:11.083' AS DateTime), N'Lê Minh Khôi', 0)
INSERT [dbo].[Topping] ([ID], [ToppingCode], [ToppingName], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2, N'TP2', N'Đào miếng', CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T16:32:30.257' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[Topping] ([ID], [ToppingCode], [ToppingName], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (3, N'TP3', N'Trân châu trắng', CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T16:32:51.277' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[Topping] ([ID], [ToppingCode], [ToppingName], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (4, N'TP4', N'Shot Expresso', CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T16:33:13.473' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[Topping] ([ID], [ToppingCode], [ToppingName], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (5, N'TP5', N'Trái vải', CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T16:33:48.477' AS DateTime), N'Lê Minh Khôi', NULL, NULL, 0)
INSERT [dbo].[Topping] ([ID], [ToppingCode], [ToppingName], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (6, N'TP6', N'Kem tươi (Whipped Cream)', CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-18T23:44:49.160' AS DateTime), N'admin', CAST(N'2024-12-18T23:45:37.267' AS DateTime), N'admin', 0)
INSERT [dbo].[Topping] ([ID], [ToppingCode], [ToppingName], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (7, N'TP7', N'Marshmallow', CAST(15000.00 AS Decimal(18, 2)), CAST(N'2024-12-18T23:45:09.707' AS DateTime), N'admin', CAST(N'2024-12-18T23:45:42.023' AS DateTime), N'admin', 0)
INSERT [dbo].[Topping] ([ID], [ToppingCode], [ToppingName], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (8, N'TP8', N'Thạch (Jelly)', CAST(15000.00 AS Decimal(18, 2)), CAST(N'2024-12-18T23:45:29.407' AS DateTime), N'admin', CAST(N'2024-12-18T23:45:56.140' AS DateTime), N'admin', 0)
INSERT [dbo].[Topping] ([ID], [ToppingCode], [ToppingName], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (9, N'TP9', N'Kem Cheese', CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-18T23:46:09.107' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Topping] ([ID], [ToppingCode], [ToppingName], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (10, N'TP10', N'Pudding', CAST(15000.00 AS Decimal(18, 2)), CAST(N'2024-12-18T23:46:24.657' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Topping] ([ID], [ToppingCode], [ToppingName], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (11, N'TP11', N'Thạch nha đam', CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-12-18T23:47:08.700' AS DateTime), N'admin', NULL, NULL, 0)
INSERT [dbo].[Topping] ([ID], [ToppingCode], [ToppingName], [ToppingPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (12, N'TP12', N'Rau câu phô mai', CAST(12000.00 AS Decimal(18, 2)), CAST(N'2024-12-18T23:47:33.600' AS DateTime), N'admin', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Topping] OFF
GO
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([ID], [UnitCode], [UnitName], [Note], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (1, N'KG001', N'Kilogram', N'', CAST(N'2025-04-25T23:01:31.507' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-04-26T22:41:39.050' AS DateTime), N'Phan Văn Khánh', 0)
INSERT [dbo].[Unit] ([ID], [UnitCode], [UnitName], [Note], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (2, N'LT001', N'Lít', N'', CAST(N'2025-04-25T23:01:31.507' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-04-26T22:41:39.050' AS DateTime), N'Phan Văn Khánh', 0)
INSERT [dbo].[Unit] ([ID], [UnitCode], [UnitName], [Note], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (3, N'Pack', N'Gói', N'', CAST(N'2025-04-25T23:01:31.507' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-04-26T22:41:39.050' AS DateTime), N'admin', 1)
INSERT [dbo].[Unit] ([ID], [UnitCode], [UnitName], [Note], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (4, N'Bag', N'Túi', N'', CAST(N'2025-04-25T23:01:31.507' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[Unit] ([ID], [UnitCode], [UnitName], [Note], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (5, N'GR001', N'Gram', N'', CAST(N'2025-04-25T23:01:31.507' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[Unit] ([ID], [UnitCode], [UnitName], [Note], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (6, N'PC001', N'Cái', N'', CAST(N'2025-04-25T23:01:31.507' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[Unit] ([ID], [UnitCode], [UnitName], [Note], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (7, N'BTL001', N'Bình', N'', CAST(N'2025-04-25T23:01:31.507' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[Unit] ([ID], [UnitCode], [UnitName], [Note], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (8, N'BOX001', N'Hộp', N'', CAST(N'2025-04-25T23:01:31.507' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[Unit] ([ID], [UnitCode], [UnitName], [Note], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (9, N'TIN001', N'Túi', N'', CAST(N'2025-04-25T23:01:31.507' AS DateTime), N'Phan Văn Khánh', NULL, NULL, 0)
INSERT [dbo].[Unit] ([ID], [UnitCode], [UnitName], [Note], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (10, N'CHA001', N'Chai', N'', CAST(N'2025-04-25T23:01:31.507' AS DateTime), N'Phan Văn Khánh', CAST(N'2025-05-16T09:00:43.977' AS DateTime), N'admin', 0)
INSERT [dbo].[Unit] ([ID], [UnitCode], [UnitName], [Note], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDelete]) VALUES (11, N'Pack', N'Gói', N'', CAST(N'2025-04-30T23:01:31.507' AS DateTime), N'admin', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Unit] OFF
GO
/****** Object:  StoredProcedure [dbo].[spGetAllAccount]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Phan Khanh>
-- Create date: <Create Date: 01/04/2025>
-- Description:	<Description: Store lấy dữ liệu >
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllAccount]
    @PageNumber INT,
    @Request NVARCHAR(250),
	@RoleID INT = 0,
	@PageSize INT = 10
AS
BEGIN
    DECLARE @count INT;
    IF @PageNumber = 1
        SET @count = 0;
    ELSE
        SET @count = 10;


	SELECT COUNT(*) AS TotalOrderSuccess,
			AccountID
	INTO #tempTotalOrderSuccess
	FROM dbo.[Order]
	WHERE ISNULL(IsDeleted,0) <> 1
	AND Status = 2
	GROUP BY AccountID

	SELECT COUNT(*) AS TotalOrderCancel,
			AccountID
	INTO #tempTotalOrderCancel
	FROM dbo.[Order]
	WHERE ISNULL(IsDeleted,0) <> 1
	AND Status = 3
	GROUP BY AccountID





    SELECT a.*,
           CASE
                WHEN Role = 1 THEN N'Khách hàng'
				WHEN Role = 2 THEN  N'Admin'
				WHEN Role = 3 THEN  N'Nhân viên'
				WHEN Role = 4 THEN  N'Quản lý'
				ELSE ''
           END AS RoleText,
           CASE
               WHEN Gender = 0 THEN N'Nam'
               WHEN Gender = 1 THEN N'Nữ'
               ELSE '' 
           END AS GenderText,
		   ISNULL(os.TotalOrderSuccess, 0) AS TotalOrderSuccess,
		   ISNULL(oc.TotalOrderCancel, 0) AS TotalOrderCancel
	INTO #tempData
    FROM Account AS a
	LEFT JOIN #tempTotalOrderSuccess AS os ON os.AccountID = a.ID
	LEFT JOIN #tempTotalOrderCancel AS oc ON oc.AccountID = a.ID
    WHERE (
              a.FullName LIKE '%' + @Request + '%'
              OR a.Email LIKE '%' + @Request + '%'
			  OR a.PhoneNumber LIKE '%' + @Request + '%'
          )
		  AND (@RoleID = 0 OR a.Role = @RoleID);
  

	SELECT * FROM #tempData 
	ORDER BY ID OFFSET (@count * (@PageNumber - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY

	SELECT COUNT(*) AS TotalCount
    FROM #tempData;
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllGoodsIssue]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllGoodsIssue]
    @PageNumber INT = 1,
    @Request NVARCHAR(250),
	@DateStart DATETIME,
	@DateEnd DATETIME,
	@AccountID INT = 0
AS
BEGIN
    DECLARE @count INT;
    IF @PageNumber = 1
        SET @count = 0;
    ELSE
        SET @count = 10;

    SELECT gr.*,
		ISNULL(a.FullName,'') AS FullName
	INTO #tempData
    FROM dbo.GoodsIssue AS gr
	LEFT JOIN dbo.Account AS a ON gr.AccountID = a.ID
    WHERE (
              gr.GoodIssueCode LIKE N'%' + @Request + '%'
              OR a.FullName LIKE N'%' + @Request + '%'
              OR gr.Decription LIKE N'%' + @Request + '%'
          )
		  AND (gr.IssueDate BETWEEN @DateStart AND @DateEnd)
		  AND (@AccountID = 0 OR gr.AccountID = @AccountID)
          AND gr.IsDelete <> 1


	SELECT * FROM #tempData
    ORDER BY IssueDate DESC
	OFFSET (@count * (@PageNumber - 1)) ROWS FETCH NEXT 10 ROWS ONLY;


    SELECT COUNT(*) AS TotalCount
	 FROM #tempData

	 SELECT * FROM #tempData
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllGoodsReceipt]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllGoodsReceipt]
    @PageNumber INT = 1,
    @Request NVARCHAR(250),
	@DateStart DATETIME,
	@DateEnd DATETIME,
	@AccountID INT = 0
AS
BEGIN
    DECLARE @count INT;
    IF @PageNumber = 1
        SET @count = 0;
    ELSE
        SET @count = 10;

	SELECT CAST(SUM(UnitPrice * Quantity) AS DECIMAL) AS TotalMoney,
			GoodsReceiptID
	INTO #tempTotalMoney
	FROM dbo.GoodsReceiptDetails
	WHERE IsDelete <> 1
	GROUP BY GoodsReceiptID

    SELECT gr.*,
		ISNULL(a.FullName,'') AS FullName,
		ISNULL(t.TotalMoney,0) AS TotalMoney,
		ISNULL(s.SupplierName,0) AS SupplierName
	INTO #tempData
    FROM dbo.GoodsReceipt AS gr
	LEFT JOIN dbo.Account AS a ON gr.AccoutID = a.ID
	LEFT JOIN #tempTotalMoney AS t ON t.GoodsReceiptID = gr.ID
	LEFT JOIN dbo.Supplier AS s ON gr.SupplierID = s.ID
    WHERE (
              GoodsReceiptCode LIKE N'%' + @Request + '%'
              OR a.FullName LIKE N'%' + @Request + '%'
              OR gr.Decription LIKE N'%' + @Request + '%'
          )
		  AND (gr.ReceiptedDate BETWEEN @DateStart AND @DateEnd)
		  AND (@AccountID = 0 OR gr.AccoutID = @AccountID)
          AND gr.IsDelete <> 1

	SELECT * FROM #tempData
    ORDER BY  ReceiptedDate DESC
	OFFSET (@count * (@PageNumber - 1)) ROWS FETCH NEXT 10 ROWS ONLY;


    SELECT COUNT(*) AS TotalCount
    FROM #tempData;

	SELECT * FROM #tempData
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllMaterial]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllMaterial]
    @PageNumber INT = 1,
    @Request NVARCHAR(250)
AS
BEGIN
    DECLARE @count INT;
    IF @PageNumber = 1
        SET @count = 0;
    ELSE
        SET @count = 10;

    --------------------Tính tồn kho ------------------------------------
    --Số lượng nhập:
    SELECT grd.MaterialID,
           CAST(SUM(grd.Quantity) AS DECIMAL(18,2)) AS QuantityReceipt
    INTO #tempGoodReceipt
    FROM dbo.GoodsReceipt AS gr
        LEFT JOIN dbo.GoodsReceiptDetails AS grd
            ON gr.ID = grd.GoodsReceiptID
    WHERE ISNULL(gr.IsDelete, 0) <> 1
          AND ISNULL(grd.IsDelete, 0) <> 1
    GROUP BY grd.MaterialID;

    --Số lượng xuất:
    SELECT grd.MaterialID,
           CAST(SUM(grd.Quantity)AS DECIMAL(18,2)) AS QuantityIssue
    INTO #tempGoodIssue
    FROM dbo.GoodsIssue AS gr
        LEFT JOIN dbo.GoodsIssueDetails AS grd
            ON gr.ID = grd.GoodIssueID
    WHERE ISNULL(gr.IsDelete, 0) <> 1
          AND ISNULL(grd.IsDelete, 0) <> 1
    GROUP BY grd.MaterialID;
    -----------------------------End-------------------------------------

    --------------- Group các Supplier của NVL --------------------

    SELECT grd.MaterialID,
			s.SupplierName
    INTO #tempSupplierData
    FROM dbo.GoodsReceipt AS gr
        LEFT JOIN dbo.GoodsReceiptDetails AS grd
            ON gr.ID = grd.GoodsReceiptID
        LEFT JOIN dbo.Supplier AS s
            ON gr.SupplierID = s.ID
    WHERE ISNULL(gr.IsDelete, 0) <> 1
          AND ISNULL(grd.IsDelete, 0) <> 1
          AND s.SupplierName IS NOT NULL
    GROUP BY grd.MaterialID, s.SupplierName;


	SELECT MaterialID,
	STRING_AGG(SupplierName, CHAR(13) + CHAR(10)) AS SupplierName
	INTO #tempSupplier
	FROM #tempSupplierData
	GROUP BY MaterialID
    ----------------------------------------------------------------
	---------------- Get đơn giá gần nhất -----------------------------
	SELECT grd.MaterialID,
	grd.UnitPrice,
	ROW_NUMBER() OVER (PARTITION BY grd.MaterialID ORDER BY gr.ID DESC) AS rn
	INTO #tempUnitPriceData
	FROM dbo.GoodsReceipt AS gr 
	LEFT JOIN dbo.GoodsReceiptDetails  AS grd ON grd.GoodsReceiptID = gr.ID

	SELECT * 
	INTO #tempUnitPrice
	FROM #tempUnitPriceData WHERE rn = 1
	-------------------------------------------------------------------

    SELECT m.*,
           ISNULL(ts.SupplierName, '') AS SupplierName,
           CAST(ISNULL(tr.QuantityReceipt, 0) - ISNULL(ti.QuantityIssue, 0) AS DECIMAL(18,2)) AS ToltalQuantity,
		   U.UnitName,
		   u.UnitCode,
		   CAST(ISNULL(tu.UnitPrice,0) AS DECIMAL(18,2)) AS UnitPrice
    INTO #tempData
    FROM dbo.Material AS m
        LEFT JOIN #tempGoodIssue AS ti
            ON m.ID = ti.MaterialID
        LEFT JOIN #tempGoodReceipt AS tr
            ON m.ID = tr.MaterialID
        LEFT JOIN #tempSupplier AS ts
            ON ts.MaterialID = m.ID
		LEFT JOIN dbo.Unit AS u ON m.UnitID = u.ID
		LEFT JOIN #tempUnitPrice AS tu ON tu.MaterialID = m.ID
    WHERE (
              m.MaterialCode LIKE N'%' + @Request + '%'
              OR m.MaterialName LIKE N'%' + @Request + '%'
              OR ISNULL(ts.SupplierName, N'') LIKE N'%' + @Request + '%'
          )
    


    SELECT *
    FROM #tempData
	ORDER BY ToltalQuantity
	OFFSET (@count * (@PageNumber - 1)) ROWS FETCH NEXT 10 ROWS ONLY;;

    SELECT COUNT(*) AS TotalCount
    FROM #tempData;

	SELECT * FROM #tempData
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllOrder]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Lee Min Khooi>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllOrder]
    @Request NVARCHAR(250) = N'',
    @PageNumber INT = 1,
    @Status INT = -1,
    @DateStart DATETIME = '2024-01-01',
    @DateEnd DATETIME = '2099-01-01'
AS
BEGIN
    DECLARE @count INT;
    IF @PageNumber = 1
        SET @count = 0;
    ELSE
        SET @count = 10;
	
	SELECT CAST( SUM(odt.ToppingPrice) AS DECIMAL(18,2)) AS ToppingPrice,
		od.ID AS OrderDetailID
	INTO #tempToppingPrice
	FROM dbo.OrderDetailsTopping AS odt
	LEFT JOIN dbo.OrderDetails AS od ON odt.OrderDetailsID = od.ID
	GROUP BY od.ID

	SELECT CAST(SUM(od.TotalMoney + ISNULL(t.ToppingPrice,0))AS DECIMAL(18,2)) AS TotalMoney,
			od.OrderID
			INTO #tempTotalMoney
	FROM dbo.OrderDetails AS od
	LEFT JOIN #tempToppingPrice AS t ON t.OrderDetailID = od.ID
	GROUP BY od.OrderID


    SELECT o.*,
			CAST(ISNULL(t.TotalMoney,0)AS DECIMAL(18,2)) AS TotalMoney,
			CASE 
				WHEN o.Status = 0 THEN N'Chờ xác nhận'
				WHEN o.Status = 1 THEN N'Đang giao'
				WHEN o.Status = 2 THEN N'Hoàn thành'
				WHEN o.Status = 3 THEN N'Đã hủy'
			ELSE '' END AS StatusText
			INTO #tempData
    FROM [Order] AS o
	LEFT JOIN #tempTotalMoney AS t ON o.ID = t.OrderID
    WHERE (
              @Request IS NULL
              OR TRIM(@Request) = N''
              OR OrderCode LIKE CONCAT(N'%', @Request, '%')
              OR CustomerName LIKE CONCAT(N'%', @Request, '%')
              OR [Address] LIKE CONCAT(N'%', @Request, '%')
              OR PhoneNumber LIKE CONCAT(N'%', @Request, '%')
          )
          AND
          (
              @Status = -1
              OR [Status] = @Status
          )
          AND CreateDate
          BETWEEN @DateStart AND @DateEnd

	SELECT * FROM #tempData
    ORDER BY Status,ID DESC OFFSET (@count * (@PageNumber - 1)) ROWS FETCH NEXT 10 ROWS ONLY;

	SELECT * FROM #tempData
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllProduct]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Lee Min Khooiiii>
-- Create date: <Create Date:>
-- Description:	<Description: Store lấy dữ liệu >
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllProduct]
    @PageNumber INT,
    @Request NVARCHAR(250),
	@ProductTypeID INT = 0
AS
BEGIN
    DECLARE @count INT;
    IF @PageNumber = 1
        SET @count = 0;
    ELSE
        SET @count = 10;

    SELECT p.*,
           t.TypeName AS ProductTypeName
	INTO #tempData
    FROM Product AS p
        LEFT JOIN ProductType AS t
            ON p.ProductTypeID = t.ID
    WHERE (
              p.ProductName LIKE N'%' + @Request + '%'
              OR p.ProductCode LIKE N'%' + @Request + '%'
          )
          AND p.IsDeleted <> 1
          AND (@ProductTypeID = 0 OR p.ProductTypeID = @ProductTypeID)


	SELECT * FROM #tempData
    ORDER BY ID OFFSET (@count * (@PageNumber - 1)) ROWS FETCH NEXT 10 ROWS ONLY;


    SELECT COUNT(*) AS TotalCount
    FROM #tempData
END;


GO
/****** Object:  StoredProcedure [dbo].[spGetAllProductClient]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Lee Min Khooi>
-- Create date: <Create Date:>
-- Description:	<Description: Get dữ liệu sản phẩm>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllProductClient]
    @PageNumber INT = 1,
    @Request NVARCHAR(250) = N'',
    @typeId INT = 0
AS
BEGIN
    DECLARE @count INT;
    IF @PageNumber = 1
        SET @count = 0;
    ELSE
        SET @count = 12;

    SELECT p.*,
           CONCAT(
           (
               SELECT TOP 1 LinkUrl FROM LinkUrl WHERE TypeUrl = N'ProductImage'
           ),
           i.ImageUrl
                 ) AS ImageUrl,
           ISNULL(pr.Price, 0) AS Price
    FROM Product AS p
        LEFT JOIN
        (
            SELECT *,
                   ROW_NUMBER() OVER (PARTITION BY ProductID ORDER BY ID DESC) AS rn
            FROM ProductImage
        ) AS i
            ON p.ID = i.ProductID
        LEFT JOIN
        (
            SELECT *,
                   ROW_NUMBER() OVER (PARTITION BY ProductID ORDER BY Price) AS rn
            FROM ProductDetails
        ) AS pr
            ON p.ID = pr.ProductID
    WHERE (
              @typeId = 0
              OR p.ProductTypeID = @typeId
          )
          AND
          (
              @Request = N''
              OR p.ProductCode LIKE N'%' + @Request + '%'
              OR p.ProductName LIKE N'%' + @Request + '%'
              OR pr.Price LIKE N'%' + @Request + '%'
          )
          AND p.IsActive = 1
          AND i.rn = 1
          AND pr.rn = 1
		  AND ISNULL(p.IsDeleted,0) = 0
    ORDER BY p.ID OFFSET (@count * (@PageNumber - 1)) ROWS FETCH NEXT 12 ROWS ONLY;
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllProductSize]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Lee Min Khooiiii>
-- Create date: <Create Date:>
-- Description:	<Description: Store lấy dữ liệu >
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllProductSize]
    @PageNumber INT,
    @Request NVARCHAR(250)
AS
BEGIN
    DECLARE @count INT;
    IF @PageNumber = 1
        SET @count = 0;
    ELSE
        SET @count = 10;

    SELECT *
    FROM ProductSize
    WHERE SizeName LIKE '%' + @Request + '%'
    ORDER BY ID OFFSET (@count * (@PageNumber - 1)) ROWS FETCH NEXT 10 ROWS ONLY;

END;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllProductType]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Lee Min Khooiiii>
-- Create date: <Create Date:>
-- Description:	<Description: Store lấy dữ liệu >
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllProductType]
    @PageNumber INT,
    @Request NVARCHAR(250)
AS
BEGIN
    DECLARE @count INT;
    IF @PageNumber = 1
        SET @count = 0;
    ELSE
        SET @count = 10;

    SELECT *
    FROM ProductType
    WHERE TypeName LIKE '%' + @Request + '%'
    ORDER BY ID OFFSET (@count * (@PageNumber - 1)) ROWS FETCH NEXT 10 ROWS ONLY;

END;


exec spGetAllProductType @PageNumber = 1, @Request= N''
GO
/****** Object:  StoredProcedure [dbo].[spGetAllSupplier]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: lee min khooi>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllSupplier]
    @PageNumber INT,
    @Request NVARCHAR(250)
AS
BEGIN
    DECLARE @count INT;
    IF @PageNumber = 1
        SET @count = 0;
    ELSE
        SET @count = 10;

    SELECT *
    FROM dbo.Supplier
    WHERE (
              SupplierCode LIKE N'%' + @Request + '%'
              OR SupplierName LIKE N'%' + @Request + '%'
              OR PhoneNumber LIKE N'%' + @Request + '%'
              OR Decription LIKE N'%' + @Request + '%'
          )
          AND IsDelete <> 1
    ORDER BY ID OFFSET (@count * (@PageNumber - 1)) ROWS FETCH NEXT 10 ROWS ONLY;

    SELECT COUNT(*) AS TotalCount
    FROM dbo.Supplier
    WHERE (
             SupplierCode LIKE N'%' + @Request + '%'
              OR SupplierName LIKE N'%' + @Request + '%'
              OR PhoneNumber LIKE N'%' + @Request + '%'
              OR Decription LIKE N'%' + @Request + '%'
          )
          AND IsDelete <> 1;
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllTopping]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllTopping]
    @PageNumber INT,
    @Request NVARCHAR(250)
AS
BEGIN
    DECLARE @count INT;
    IF @PageNumber = 1
        SET @count = 0;
    ELSE
        SET @count = 10;

    SELECT *
    FROM dbo.Topping
    WHERE (
              ToppingCode LIKE N'%' + @Request + '%'
              OR ToppingName LIKE N'%' + @Request + '%'
          )
          AND IsDelete <> 1
    ORDER BY ID OFFSET (@count * (@PageNumber - 1)) ROWS FETCH NEXT 10 ROWS ONLY;

    SELECT COUNT(*) AS TotalCount
    FROM dbo.Topping
    WHERE (
              ToppingCode LIKE N'%' + @Request + '%'
              OR ToppingName LIKE N'%' + @Request + '%'
          )
          AND IsDelete <> 1;
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllTotalAccount]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Lee Min Khooiiii>
-- Create date: <Create Date:>
-- Description:	<Description: Store lấy dữ liệu >
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllTotalAccount] @Request NVARCHAR(250)
AS
BEGIN
    SELECT COUNT(*) AS TotalCount
    FROM Account
    WHERE FullName LIKE '%' + @Request + '%'
          OR Email LIKE '%' + @Request + '%';
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllTotalOrder]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Lee Min Khooiiii>
-- Create date: <Create Date:>
-- Description:	<Description: Store lấy dữ liệu >
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllTotalOrder]
    @Request NVARCHAR(250) = N'',
    @Status INT = -1,
    @DateStart DATETIME = '2024-01-01',
    @DateEnd DATETIME = '2099-01-01'
AS
BEGIN
    SELECT COUNT(*) AS TotalCount
    FROM [Order]
    WHERE (
              @Request IS NULL
              OR TRIM(@Request) = N''
              OR OrderCode LIKE CONCAT(N'%', @Request, '%')
              OR CustomerName LIKE CONCAT(N'%', @Request, '%')
              OR [Address] LIKE CONCAT(N'%', @Request, '%')
              OR PhoneNumber LIKE CONCAT(N'%', @Request, '%')
          )
          AND
          (
              @Status = -1
              OR [Status] = @Status
          )
          AND CreateDate
          BETWEEN @DateStart AND @DateEnd;
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllTotalProduct]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Lee Min Khooiiii>
-- Create date: <Create Date:>
-- Description:	<Description: Store lấy dữ liệu >
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllTotalProduct] @Request NVARCHAR(250)
AS
BEGIN
    SELECT COUNT(*) AS TotalCount
    FROM Product
    WHERE (
              ProductName LIKE '%' + @Request + '%'
              OR ProductCode LIKE '%' + @Request + '%'
          );
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllTotalProductClient]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Lee Min Khooi>
-- Create date: <Create Date:>
-- Description:	<Description: Get số sản phẩm theo bộ lọc>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllTotalProductClient]
    @Request NVARCHAR(250) = N'',
    @typeId INT = 0
AS
BEGIN
    SELECT COUNT(*) AS TotalCount
    FROM Product AS p
    WHERE (
              @typeId = 0
              OR p.ProductTypeID = @typeId
          )
          AND
          (
              @Request = N''
              OR p.ProductCode LIKE N'%' + @Request + '%'
              OR p.ProductName LIKE N'%' + @Request + '%'
          )
          AND p.IsActive = 1;

END;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllTotalProductSize]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Lee Min Khooiiii>
-- Create date: <Create Date:>
-- Description:	<Description: Store lấy dữ liệu >
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllTotalProductSize] @Request NVARCHAR(250)
AS
BEGIN
    SELECT COUNT(*) AS TotalCount
    FROM ProductSize
    WHERE SizeName LIKE '%' + @Request + '%';
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllUnit]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllUnit]
    @PageNumber INT,
    @Request NVARCHAR(250)
AS
BEGIN
    DECLARE @count INT;
    IF @PageNumber = 1
        SET @count = 0;
    ELSE
        SET @count = 10;

    SELECT *
    FROM dbo.Unit
    WHERE (
              UnitCode LIKE N'%' + @Request + '%'
              OR UnitName LIKE N'%' + @Request + '%'
              OR Note LIKE N'%' + @Request + '%'
          )
          AND IsDelete <> 1
    ORDER BY ID OFFSET (@count * (@PageNumber - 1)) ROWS FETCH NEXT 10 ROWS ONLY;

    SELECT COUNT(*) AS TotalCount
    FROM dbo.Unit
    WHERE (
              UnitCode LIKE N'%' + @Request + '%'
              OR UnitName LIKE N'%' + @Request + '%'
              OR Note LIKE N'%' + @Request + '%'
          )
          AND IsDelete <> 1;
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetBestSaleTopping]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: lee min khooi>
-- Create date: <Create Date>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetBestSaleTopping]
	@DateStart DATETIME,
	@DateEnd DATETIME
AS
BEGIN
	
	SELECT odt.ToppingID,
			COUNT(*) AS TotalSale
	INTO #tempTotalTopping
	FROM dbo.[Order] AS o
	LEFT JOIN dbo.OrderDetails AS od ON o.ID = od.OrderID
	LEFT JOIN dbo.OrderDetailsTopping AS odt ON od.ID = odt.OrderDetailsID
	WHERE o.Status = 2 AND ISNULL(odt.ToppingID,0) <> 0
	GROUP BY odt.ToppingID

	SELECT TOP 5 t.*,
		ISNULL(temp.TotalSale, 0) AS TotalSale
	FROM dbo.Topping AS t
	LEFT JOIN #tempTotalTopping AS temp ON t.ID = temp.ToppingID
	WHERE ISNULL(t.IsDelete, 0)  = 0
	ORDER BY ISNULL(temp.TotalSale, 0) DESC


END
GO
/****** Object:  StoredProcedure [dbo].[spGetCartByAccountId]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Khanh>
-- Create date: <Create Date:>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetCartByAccountId] @AccountId INT
AS
BEGIN
    SELECT c.ID AS CartId,
           c.Quantity,
           p.ProductName,
           ps.SizeName,
           CONCAT(
           (
               SELECT TOP 1 LinkUrl FROM LinkUrl WHERE TypeUrl = N'ProductImage'
           ),
           i.ImageUrl
                 ) AS ImageUrl,
           pd.Price,
           pd.ID AS ProductDetailsId
    FROM Cart AS c
        LEFT JOIN ProductDetails AS pd
            ON c.ProductDetailId = pd.ID
        LEFT JOIN Product AS p
            ON pd.ProductID = p.ID
        LEFT JOIN ProductSize AS ps
            ON pd.ProductSizeID = ps.ID
        LEFT JOIN
        (
            SELECT *,
                   ROW_NUMBER() OVER (PARTITION BY ProductID ORDER BY ID DESC) AS rn
            FROM ProductImage
        ) AS i
            ON p.ID = i.ProductID
    WHERE p.IsActive = 1
          AND c.AccountId = @AccountId
		  AND i.rn = 1;
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetGoodsIssuesByID]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Khanh>
-- Create date: <Create Date: 12/04/2024>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetGoodsIssuesByID] 
	@GoodsIssueID INT = 0
AS
BEGIN

	SELECT gr.*,	
			ISNULL(a.FullName,'') AS FullName 
	FROM dbo.GoodsIssue AS gr
	LEFT JOIN dbo.Account AS a ON gr.AccountID = a.ID
	WHERE gr.ID = @GoodsIssueID
	AND gr.IsDelete <> 1


	SELECT grd.*,
	ISNULL(m.MaterialCode,'') AS MaterialCode,
	ISNULL(m.MaterialName, '') AS MaterialName,
	ISNULL(u.UnitCode,'') AS UnitCode,
	ISNULL(u.UnitName,'') AS UnitName,
	CAST(( ISNULL(grd.Quantity,0)) AS DECIMAL) AS TotalQuantity
	FROM dbo.GoodsIssueDetails AS grd
	LEFT JOIN dbo.Material AS m ON grd.MaterialID = m.ID
	LEFT JOIN dbo.Unit AS u ON m.UnitID = u.ID
	WHERE grd.GoodIssueID = @GoodsIssueID
	AND grd.IsDelete <> 1

	SELECT * FROM dbo.GoodsIssueFile
	WHERE IsDelete <> 1
	AND GoodsIssueID = @GoodsIssueID

END
GO
/****** Object:  StoredProcedure [dbo].[spGetGoodsReceiptByID]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: lee min khooi>
-- Create date: <Create Date: 12/04/2024>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetGoodsReceiptByID] 
	@GoodsReceiptID INT = 0
AS
BEGIN

	SELECT gr.*,	
			ISNULL(a.FullName,'') AS FullName 
	FROM dbo.GoodsReceipt AS gr
	LEFT JOIN dbo.Account AS a ON gr.AccoutID = a.ID
	WHERE gr.ID = @GoodsReceiptID
	AND gr.IsDelete <> 1


	SELECT grd.*,
	ISNULL(m.MaterialCode,'') AS MaterialCode,
	ISNULL(m.MaterialName, '') AS MaterialName,
	ISNULL(u.UnitCode,'') AS UnitCode,
	ISNULL(u.UnitName,'') AS UnitName,
	CAST(( ISNULL(grd.Quantity,0) * ISNULL(grd.UnitPrice,0)) AS DECIMAL) AS TotalMoney
	FROM dbo.GoodsReceiptDetails AS grd
	LEFT JOIN dbo.Material AS m ON grd.MaterialID = m.ID
	LEFT JOIN dbo.Unit AS u ON m.UnitID = u.ID
	WHERE grd.GoodsReceiptID = @GoodsReceiptID
	AND grd.IsDelete <> 1

	SELECT * FROM dbo.GoodsReceiptFile
	WHERE IsDelete <> 1
	AND GoodsReceiptID = @GoodsReceiptID

END
GO
/****** Object:  StoredProcedure [dbo].[spGetHardestToSell]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Lee Min Khooi>
-- Create date: <Create Date:>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetHardestToSell] 
	@topSale INT,
	@DateStart DATETIME,
	@DateEnd DATETIME
AS
BEGIN
    CREATE TABLE #temp
    (
        ProductID INT,
        TotalSales INT
    );
    DECLARE @sql NVARCHAR(MAX);

    SET @sql
        = N'
		INSERT INTO #temp (ProductID, TotalSales)
		SELECT TOP ' + CAST(@topSale AS NVARCHAR(10))
          + N' 
			pd.ProductID 
			,SUM(ISNULL(tbl.TotalSales,0)) AS TotalSales
		FROM  ProductDetails AS pd 
		LEFT JOIN (SELECT od.ProductDetailID,
		SUM(od.Quantity) AS TotalSales
		FROM dbo.[Order] AS o 
		LEFT JOIN dbo.OrderDetails AS od ON o.ID = od.OrderID
		WHERE o.Status = 2
		AND  o.CreateDate BETWEEN ''' + CAST(@DateStart AS NVARCHAR(250)) + N''' AND ''' + CAST(@DateEnd AS NVARCHAR(250)) + N'''
		GROUP BY od.ProductDetailID) AS tbl ON tbl.ProductDetailID = pd.ID
		GROUP BY pd.ProductID 
		ORDER BY TotalSales';

    EXEC sp_executesql @sql;


    --SELECT Top @topSale as int  pd.ProductID, SUM(od.Quantity) as TotalSales 
    --INTO #temp
    --FROM [Order] as o
    --left join OrderDetails as od on o.ID = od.OrderID
    --left join ProductDetails as pd on od.ProductDetailID = pd.ID
    --WHERE o.Status = 2
    --Group by pd.ProductID
    --ORDER BY TotalSales Desc

    SELECT p.*,
           CONCAT('https://localhost:44368/images/', i.ImageUrl) AS ImageUrl,
           pr.Price,
           t.TotalSales
    FROM Product AS p
        INNER JOIN #temp AS t
            ON p.ID = t.ProductID
        LEFT JOIN
        (
            SELECT *,
                   ROW_NUMBER() OVER (PARTITION BY ProductID ORDER BY ID DESC) AS rn
            FROM ProductImage
        ) AS i
            ON p.ID = i.ProductID
        LEFT JOIN
        (
            SELECT *,
                   ROW_NUMBER() OVER (PARTITION BY ProductID ORDER BY Price) AS rn
            FROM ProductDetails
        ) AS pr
            ON p.ID = pr.ProductID
    WHERE p.IsActive = 1
          AND i.rn = 1
          AND pr.rn = 1
		  AND ISNULL(p.IsDeleted,0) <> 1
    ORDER BY t.TotalSales;

END;



GO
/****** Object:  StoredProcedure [dbo].[spGetHistoryCheckOut]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Lee Min Khooi>
-- Create date: <Create Date>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetHistoryCheckOut]
    @AccountId INT = 0,
    @Request NVARCHAR(250) = N'',
    @DateStart DATETIME,
    @DateEnd DATETIME
AS
BEGIN
    SELECT p.ProductName,
           ps.SizeName,
           od.OrderID,
           od.Quantity,
           od.TotalMoney AS UnitPrice,
           ROW_NUMBER() OVER (PARTITION BY od.OrderID ORDER BY od.ID DESC) AS rn,
           CONCAT(
           (
               SELECT TOP 1 LinkUrl FROM LinkUrl WHERE TypeUrl = N'ProductImage'
           ),
           i.ImageUrl
                 ) AS ImageUrl
    INTO #tempProductFirst
    FROM dbo.OrderDetails AS od
        LEFT JOIN dbo.ProductDetails AS pd
            ON od.ProductDetailID = pd.ID
        LEFT JOIN dbo.Product AS p
            ON p.ID = pd.ProductID
        LEFT JOIN dbo.ProductSize AS ps
            ON ps.ID = pd.ProductSizeID
        LEFT JOIN
        (
            SELECT *,
                   ROW_NUMBER() OVER (PARTITION BY ProductID ORDER BY ID DESC) AS rn
            FROM ProductImage
        ) AS i
            ON p.ID = i.ProductID
    WHERE i.rn = 1;




    SELECT o.*,
           CASE
               WHEN o.Status = 0 THEN
                   N'Chờ xác nhận đơn hàng'
               WHEN o.Status = 1 THEN
                   N'Đơn hàng đang giao'
               WHEN o.Status = 2 THEN
                   N'Đơn hàng giao thành công'
               WHEN o.Status = 3 THEN
                   N'Đơn hàng đã hủy'
               ELSE
                   N''
           END AS StatusText,
           CAST(od.TotalMoney AS DECIMAL(18,2)) AS TotalMoney,
           t.*
    FROM [Order] AS o
        LEFT JOIN
        (
            SELECT OrderID,
                   SUM(TotalMoney) AS TotalMoney
            FROM OrderDetails
            GROUP BY OrderID
        ) AS od
            ON o.ID = od.OrderID
        LEFT JOIN #tempProductFirst AS t
            ON t.OrderID = o.ID
    WHERE (
              @AccountId = 0
              OR o.AccountID = @AccountId
          )
          AND
          (
              @Request = N''
              OR o.CustomerName LIKE '%' + @Request + '%'
              OR o.Address LIKE '%' + @Request + '%'
              OR o.PhoneNumber LIKE '%' + @Request + '%'
          )
		  AND (o.CreateDate BETWEEN @DateStart AND @DateEnd)
          AND t.rn = 1
    ORDER BY o.ID DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetOrderDetails]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Lee Min Khooi>
-- Create date: <Create Date>
-- Description:	<Description:>
-- =============================================
CREATE PROCEDURE [dbo].[spGetOrderDetails] @OrderId INT = 0
AS
BEGIN
    SELECT p.ProductName AS ProductName,
           ps.SizeName,
           CAST(od.TotalMoney AS DECIMAL(18,2)) AS TotalMoney,
           od.Quantity,
           CAST((od.TotalMoney / od.Quantity) AS DECIMAL(18,2)) AS Price,
           CONCAT((Select Top 1 LinkUrl from LinkUrl where TypeUrl = N'ProductImage'), i.ImageUrl) AS ImageUrl,
		   od.ID AS OrderDetailID
    FROM OrderDetails AS od
        LEFT JOIN ProductDetails AS pd
            ON od.ProductDetailID = pd.ID
        LEFT JOIN Product AS p
            ON p.ID = pd.ProductID
        LEFT JOIN ProductSize AS ps
            ON ps.ID = pd.ProductSizeID
        LEFT JOIN
        (
            SELECT *,
                   ROW_NUMBER() OVER (PARTITION BY ProductID ORDER BY ID DESC) AS rn
            FROM ProductImage
        ) AS i
            ON p.ID = i.ProductID
    WHERE (
              @OrderId = 0
              OR od.OrderID = @OrderId
          );
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetPercentOrderSuccess]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: lee min khooi>
-- Create date: <Create Date: 12/13/2024>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetPercentOrderSuccess] 
	@DateStart DATETIME,
	@DateEnd DATETIME
AS
BEGIN

	SELECT COUNT(*) AS TotalSuccess,
			1 AS IDJoin
	INTO #tempOrderSuccess
	FROM dbo.[Order]
	WHERE ISNULL(IsDeleted,0) = 0
	AND CreateDate BETWEEN @DateStart AND @DateEnd
	AND Status = 2

	SELECT COUNT(*) AS TotalFalse,
			1 AS IDJoin
	INTO #tempOrderFalse
	FROM dbo.[Order]
	WHERE ISNULL(IsDeleted,0) = 0
	AND CreateDate BETWEEN @DateStart AND @DateEnd
	AND Status = 3

	SELECT s.TotalFalse,
			f.TotalSuccess
	FROM #tempOrderFalse AS s
	LEFT JOIN #tempOrderSuccess AS f ON s.IDJoin = f.IDJoin

END
GO
/****** Object:  StoredProcedure [dbo].[spGetProductSizeById]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetProductSizeById] @ProductId INT = 0
AS
BEGIN
    SELECT ps.*,
           CAST(pd.Price AS INT) AS Price,
           pd.ID AS ProductDetailsId
    FROM ProductDetails AS pd
        LEFT JOIN ProductSize AS ps
            ON pd.ProductSizeID = ps.ID
    WHERE pd.ProductID = @ProductId;
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetSumarizeRevenue]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: lee min khooi>
-- Create date: <Create Date:>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetSumarizeRevenue]
	@DateStart DATETIME,
	@DateEnd DATETIME
AS
BEGIN
	DECLARE @TotalMoneyOrder DECIMAL(18,2) = 0;
	DECLARE @TotalMoneyReceipt DECIMAL(18,2) = 0;


	SELECT od.ID AS OrderDetailID,
			SUM(ISNULL(odt.ToppingPrice,0)) AS ToppingPrice
	INTO #tempToppingPrice
	FROM dbo.OrderDetails AS od 
	LEFT JOIN dbo.OrderDetailsTopping AS odt ON od.ID = odt.OrderDetailsID
	GROUP BY od.ID


	SELECT   @TotalMoneyOrder =	SUM(ISNULL(od.TotalMoney,0) + ISNULL(t.ToppingPrice,0))
	FROM dbo.[Order] AS o
	LEFT JOIN dbo.OrderDetails AS od ON o.ID = od.OrderID
	LEFT JOIN #tempToppingPrice AS t ON t.OrderDetailID = od.ID
	WHERE o.Status = 2
	AND o.CreateDate BETWEEN @DateStart AND @DateEnd


	SELECT @TotalMoneyReceipt = SUM(ISNULL(gd.Quantity,0) * ISNULL(gd.UnitPrice,0)) 
	FROM dbo.GoodsReceipt AS g
	LEFT JOIN dbo.GoodsReceiptDetails AS gd ON g.ID = gd.GoodsReceiptID
	WHERE ISNULL(g.IsDelete,0) = 0 AND  ISNULL(gd.IsDelete,0) = 0
	AND g.ReceiptedDate BETWEEN @DateStart AND @DateEnd

	SELECT ISNULL(@TotalMoneyOrder,0) as TotalMoneyOrder, ISNULL(@TotalMoneyReceipt,0) as TotalMoneyReceipt

END
GO
/****** Object:  StoredProcedure [dbo].[spGetTop4BestSale]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Lee Min Khooi>
-- Create date: <Create Date: 09/12/2024>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetTop4BestSale] 
		@topSale INT,
		@DateStart Datetime,
		@DateEnd DateTime
AS
BEGIN
    CREATE TABLE #temp
    (
        ProductID INT,
        TotalSales INT
    );
    DECLARE @sql NVARCHAR(MAX);

   SET @sql = N'
    INSERT INTO #temp (ProductID, TotalSales)
    SELECT TOP ' + CAST(@topSale AS NVARCHAR(10)) + N'
        pd.ProductID, 
        SUM(od.Quantity) AS TotalSales
    FROM [Order] AS o
    LEFT JOIN OrderDetails AS od ON o.ID = od.OrderID
    LEFT JOIN ProductDetails AS pd ON od.ProductDetailID = pd.ID
	LEFT JOIN Product AS p on pd.ProductID = p.ID
    WHERE o.Status = 2 AND p.IsActive = 1 AND ISNULL(p.IsDeleted,0) <> 1
    AND o.CreateDate BETWEEN ''' + CAST(@DateStart AS NVARCHAR(250)) + N''' AND ''' + CAST(@DateEnd AS NVARCHAR(250)) + N'''
    GROUP BY pd.ProductID
    ORDER BY TotalSales DESC'

    EXEC sp_executesql @sql;

	SELECT 
		pd.ProductID,
		CAST(SUM(od.TotalMoney) AS DECIMAL(18,2) )AS ProductRevenue
	INTO #tempProductRevenue
	FROM dbo.[Order] AS o
	LEFT JOIN dbo.OrderDetails AS od ON o.ID = od.OrderID
	LEFT JOIN dbo.ProductDetails AS pd ON od.ProductDetailID = pd.ID
	WHERE o.Status = 2
	GROUP BY pd.ProductID 



    SELECT p.*,
           CONCAT((Select Top 1 LinkUrl from LinkUrl where TypeUrl = N'ProductImage'), i.ImageUrl) AS ImageUrl,
           pr.Price,
           t.TotalSales,
		   CAST(ISNULL(tr.ProductRevenue,0) AS DECIMAL(18,2)) AS  ProductRevenue
    FROM Product AS p
        INNER JOIN #temp AS t
            ON p.ID = t.ProductID
        LEFT JOIN
        (
            SELECT *,
                   ROW_NUMBER() OVER (PARTITION BY ProductID ORDER BY ID DESC) AS rn
            FROM ProductImage
        ) AS i
            ON p.ID = i.ProductID
        LEFT JOIN
        (
            SELECT *,
                   ROW_NUMBER() OVER (PARTITION BY ProductID ORDER BY Price) AS rn
            FROM ProductDetails
        ) AS pr
            ON p.ID = pr.ProductID
		LEFT JOIN #tempProductRevenue AS tr ON tr.ProductID = p.ID
    WHERE p.IsActive = 1
          AND i.rn = 1
          AND pr.rn = 1
		  AND ISNULL(p.IsDeleted,0) <> 1
    ORDER BY t.TotalSales DESC;

    DROP TABLE #temp;
END;

GO
/****** Object:  StoredProcedure [dbo].[spGetTop4ProductNew]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Lee Min Khooi>
-- Create date: <Create Date:>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetTop4ProductNew]
AS
BEGIN
    SELECT TOP 4
           p.*,
           CONCAT((Select Top 1 LinkUrl from LinkUrl where TypeUrl = N'ProductImage'), i.ImageUrl) AS ImageUrl,
           pr.Price
    FROM Product AS p
        LEFT JOIN
        (
            SELECT *,
                   ROW_NUMBER() OVER (PARTITION BY ProductID ORDER BY ID DESC) AS rn
            FROM ProductImage
        ) AS i
            ON p.ID = i.ProductID
        LEFT JOIN
        (
            SELECT *,
                   ROW_NUMBER() OVER (PARTITION BY ProductID ORDER BY Price) AS rn
            FROM ProductDetails
        ) AS pr
            ON p.ID = pr.ProductID
    WHERE p.IsActive = 1
          AND i.rn = 1
          AND pr.rn = 1
		  AND ISNULL(p.IsDeleted,0) <> 1
    ORDER BY p.ID DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetTotalCountProductType]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Lee Min Khooiiii>
-- Create date: <Create Date:>
-- Description:	<Description: Store lấy dữ liệu >
-- =============================================
CREATE PROCEDURE [dbo].[spGetTotalCountProductType] @Request NVARCHAR(250)
AS
BEGIN

    SELECT COUNT(*) AS TotalCount
    FROM ProductType
    WHERE TypeName LIKE '%' + @Request + '%';

END;
GO
/****** Object:  StoredProcedure [dbo].[spGetTotalOrderForMessage]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: lee min khooi>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[spGetTotalOrderForMessage]
AS
BEGIN
	DECLARE @DateNow DATE = GETDATE(); -- Hoặc gán giá trị bất kỳ cho @DateNow
	DECLARE @Date7DaysBefore DATE = DATEADD(DAY, -7, @DateNow);
	DECLARE @Date14DaysBefore DATE = DATEADD(DAY, -14, @DateNow);
	

	----------- Biến kết quả ------------------
	DECLARE @TotalMoneyLastWeek DECIMAL(18,2);
	DECLARE @TotalMoneyCurrentWeek DECIMAL(18,2);

	DECLARE @TotalOrderLastWeek DECIMAL(18,2);
	DECLARE @TotalOrderCurrentWeek DECIMAL(18,2);
	DECLARE @TotalOrderUnProcess DECIMAL(18,2);



	SELECT OrderDetailsID,
			SUM(ToppingPrice) AS ToppingPrice
			INTO #tempToppingPrice
	FROM dbo.OrderDetailsTopping
	GROUP BY OrderDetailsID

    SELECT SUM(od.TotalMoney + ISNULL(t.ToppingPrice,0)) AS TotalMoney,
           od.OrderID
    INTO #tempTotalMoney
    FROM OrderDetails AS od
	LEFT JOIN dbo.[Order] AS o ON od.OrderID = o.ID
	LEFT JOIN #tempToppingPrice AS t ON od.ID = t.OrderDetailsID
    GROUP BY OrderID;

	

	SELECT o.ID,
			t.TotalMoney
	INTO #tempLastWeek
	FROM dbo.[Order] AS o
	LEFT JOIN #tempTotalMoney  AS t ON o.ID = t.OrderID
	WHERE o.CreateDate BETWEEN FORMAT(@Date14DaysBefore, 'yyyy-MM-dd 00:00:00') AND FORMAT(@Date7DaysBefore, 'yyyy-MM-dd 23:59:59')
	AND o.Status = 2

	SELECT o.ID,
			t.TotalMoney
	INTO #tempCurrentWeek
	FROM dbo.[Order] AS o
	LEFT JOIN #tempTotalMoney  AS t ON o.ID = t.OrderID
	WHERE o.CreateDate BETWEEN FORMAT(DATEADD(DAY, 1, @Date7DaysBefore), 'yyyy-MM-dd 00:00:00') AND FORMAT(@DateNow, 'yyyy-MM-dd 23:59:59')
	AND o.Status = 2

	---------------------------------Tính tổng doanh thu trong 2 tuần gần nhất ----------------------------------
	SELECT @TotalMoneyLastWeek = SUM(ISNULL(TotalMoney,0)) 
	FROM #tempLastWeek

	SELECT @TotalMoneyCurrentWeek = SUM(ISNULL(TotalMoney,0)) 
	FROM #tempCurrentWeek

	------------------------------Tính tổng đơn 2 tuần gần nhất--------------------------------------------
	SELECT @TotalOrderLastWeek = COUNT(*) 
	FROM #tempLastWeek

	SELECT @TotalOrderCurrentWeek = COUNT(*) 
	FROM #tempCurrentWeek

	------------------------ Tính tổng hóa đơn chưa xử lý -------------------------------------------------
	SELECT @TotalOrderUnProcess = COUNT(*) 
	FROM dbo.[Order]
	WHERE ISNULL(IsDeleted,0) = 0
	AND Status = 0
	GROUP BY Status

	SELECT	
	CASE WHEN ISNULL(@TotalMoneyLastWeek,0) = 0 THEN 1
	ELSE @TotalMoneyLastWeek END AS MoneyLastWeek,
	ISNULL(@TotalMoneyCurrentWeek,0)AS MoneyCurrentWeek,
	CASE WHEN ISNULL(@TotalOrderLastWeek,0) = 0 THEN 1
	ELSE @TotalOrderLastWeek END AS TotalLastWeek,
	ISNULL(@TotalOrderCurrentWeek,0) AS TotalCurrentWeek,
	ISNULL(@TotalOrderUnProcess,0)  AS TotalUnProcess
END
GO
/****** Object:  StoredProcedure [dbo].[spGetTotalPuchase]    Script Date: 5/31/2025 4:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author: Lê Minh Khôi>
-- Create date: <Create Date:>
-- Description:	<Description: Doanh thu theo tháng>
-- =============================================
CREATE PROCEDURE [dbo].[spGetTotalPuchase]
    @Month INT,
    @Year INT
AS
BEGIN
	SELECT OrderDetailsID,
			SUM(ToppingPrice) AS ToppingPrice
			INTO #tempToppingPrice
	FROM dbo.OrderDetailsTopping
	GROUP BY OrderDetailsID


    SELECT SUM(od.TotalMoney + ISNULL(t.ToppingPrice,0)) AS TotalMoney,
           od.OrderID
    INTO #temp
    FROM OrderDetails AS od
	LEFT JOIN #tempToppingPrice AS t ON od.ID = t.OrderDetailsID
    GROUP BY OrderID;

    SELECT CAST(SUM(t.TotalMoney) AS INT) AS TotalMoney,
           FORMAT(o.CreateDate, 'dd-MM-yyyy') AS DayInMonth
    FROM [Order] AS o
        INNER JOIN #temp AS t
            ON o.ID = t.OrderID
    WHERE MONTH(o.CreateDate) = @Month
          AND YEAR(o.CreateDate) = @Year
		  AND o.Status = 2 -- Đơn hàng thành công
    GROUP BY FORMAT(o.CreateDate, 'dd-MM-yyyy');
END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Khách hàng, 2: admin, 3: nhân viên, 4: chủ cửa hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: Nam, 1: Nữ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: Chờ xác nhận; 1: Đang giao; 2: Thành công; 3: Hủy hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'Status'
GO
USE [master]
GO
ALTER DATABASE [CafeShop] SET  READ_WRITE 
GO
