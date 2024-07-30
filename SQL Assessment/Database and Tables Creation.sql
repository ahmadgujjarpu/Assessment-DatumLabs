USE [master]
GO
/****** Object:  Database [Assessment]    Script Date: 30/07/2024 2:03:54 pm ******/
CREATE DATABASE [Assessment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assessment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Assessment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assessment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Assessment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Assessment] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assessment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assessment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assessment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assessment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assessment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assessment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assessment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assessment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assessment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assessment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assessment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assessment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assessment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assessment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assessment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assessment] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Assessment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assessment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assessment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assessment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assessment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assessment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assessment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assessment] SET RECOVERY FULL 
GO
ALTER DATABASE [Assessment] SET  MULTI_USER 
GO
ALTER DATABASE [Assessment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assessment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assessment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assessment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assessment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assessment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Assessment', N'ON'
GO
ALTER DATABASE [Assessment] SET QUERY_STORE = ON
GO
ALTER DATABASE [Assessment] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Assessment]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 30/07/2024 2:03:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [varchar](10) NOT NULL,
	[category_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPurchases]    Script Date: 30/07/2024 2:03:55 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPurchases](
	[customer_id] [varchar](50) NOT NULL,
	[product_id] [varchar](50) NOT NULL,
	[purchase_date] [date] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[payment_status] [varchar](20) NOT NULL,
 CONSTRAINT [PK_CustomerPurchases] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 30/07/2024 2:03:55 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [varchar](50) NOT NULL,
	[product_name] [varchar](100) NOT NULL,
	[category_id] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products2]    Script Date: 30/07/2024 2:03:55 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products2](
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 30/07/2024 2:03:55 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[promotion_id] [varchar](50) NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[discount_rate] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[promotion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 30/07/2024 2:03:55 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[sale_id] [varchar](50) NOT NULL,
	[product_id] [varchar](50) NOT NULL,
	[sale_date] [date] NOT NULL,
	[amount] [decimal](18, 2) NOT NULL,
	[promotion_id] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sale_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales2]    Script Date: 30/07/2024 2:03:55 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales2](
	[sale_id] [int] NOT NULL,
	[product_id] [varchar](50) NOT NULL,
	[sale_date] [date] NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[category_id] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sale_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 30/07/2024 2:03:55 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[CustomerID] [int] NULL,
	[TransactionDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserActivity]    Script Date: 30/07/2024 2:03:55 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserActivity](
	[activity_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[activity_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[activity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 30/07/2024 2:03:55 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] NOT NULL,
	[user_name] [varchar](50) NOT NULL,
	[join_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (N'C1', N'Electronics')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (N'C2', N'Clothing')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (N'C3', N'Home Appliances')
GO
INSERT [dbo].[CustomerPurchases] ([customer_id], [product_id], [purchase_date], [price], [payment_status]) VALUES (N'C001', N'A', CAST(N'2024-01-01' AS Date), CAST(50.00 AS Decimal(10, 2)), N'Paid')
INSERT [dbo].[CustomerPurchases] ([customer_id], [product_id], [purchase_date], [price], [payment_status]) VALUES (N'C001', N'B', CAST(N'2024-01-05' AS Date), CAST(30.00 AS Decimal(10, 2)), N'Paid')
INSERT [dbo].[CustomerPurchases] ([customer_id], [product_id], [purchase_date], [price], [payment_status]) VALUES (N'C002', N'A', CAST(N'2024-01-10' AS Date), CAST(50.00 AS Decimal(10, 2)), N'Paid')
INSERT [dbo].[CustomerPurchases] ([customer_id], [product_id], [purchase_date], [price], [payment_status]) VALUES (N'C002', N'B', CAST(N'2024-01-20' AS Date), CAST(30.00 AS Decimal(10, 2)), N'Unpaid')
INSERT [dbo].[CustomerPurchases] ([customer_id], [product_id], [purchase_date], [price], [payment_status]) VALUES (N'C003', N'C', CAST(N'2024-01-15' AS Date), CAST(20.00 AS Decimal(10, 2)), N'Paid')
INSERT [dbo].[CustomerPurchases] ([customer_id], [product_id], [purchase_date], [price], [payment_status]) VALUES (N'C004', N'A', CAST(N'2024-01-25' AS Date), CAST(50.00 AS Decimal(10, 2)), N'Paid')
INSERT [dbo].[CustomerPurchases] ([customer_id], [product_id], [purchase_date], [price], [payment_status]) VALUES (N'C004', N'B', CAST(N'2024-01-30' AS Date), CAST(30.00 AS Decimal(10, 2)), N'Paid')
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id]) VALUES (N'P001', N'Product A', N'C1')
INSERT [dbo].[Products] ([product_id], [product_name], [category_id]) VALUES (N'P002', N'Product B', N'C2')
INSERT [dbo].[Products] ([product_id], [product_name], [category_id]) VALUES (N'P003', N'Product C', N'C3')
GO
INSERT [dbo].[Products2] ([ProductID], [ProductName]) VALUES (1, N'Product A')
INSERT [dbo].[Products2] ([ProductID], [ProductName]) VALUES (2, N'Product B')
INSERT [dbo].[Products2] ([ProductID], [ProductName]) VALUES (3, N'Product C')
INSERT [dbo].[Products2] ([ProductID], [ProductName]) VALUES (4, N'Product D')
INSERT [dbo].[Products2] ([ProductID], [ProductName]) VALUES (5, N'Product E')
INSERT [dbo].[Products2] ([ProductID], [ProductName]) VALUES (6, N'Product F')
INSERT [dbo].[Products2] ([ProductID], [ProductName]) VALUES (7, N'Product G')
INSERT [dbo].[Products2] ([ProductID], [ProductName]) VALUES (8, N'Product H')
INSERT [dbo].[Products2] ([ProductID], [ProductName]) VALUES (9, N'Product I')
INSERT [dbo].[Products2] ([ProductID], [ProductName]) VALUES (10, N'Product J')
GO
INSERT [dbo].[Promotions] ([promotion_id], [start_date], [end_date], [discount_rate]) VALUES (N'P001', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-07' AS Date), 10)
INSERT [dbo].[Promotions] ([promotion_id], [start_date], [end_date], [discount_rate]) VALUES (N'P002', CAST(N'2024-01-02' AS Date), CAST(N'2024-01-08' AS Date), 15)
GO
INSERT [dbo].[Sales] ([sale_id], [product_id], [sale_date], [amount], [promotion_id]) VALUES (N'S001', N'A', CAST(N'2024-01-01' AS Date), CAST(45.00 AS Decimal(18, 2)), N'P001')
INSERT [dbo].[Sales] ([sale_id], [product_id], [sale_date], [amount], [promotion_id]) VALUES (N'S002', N'B', CAST(N'2024-01-02' AS Date), CAST(25.00 AS Decimal(18, 2)), N'P002')
INSERT [dbo].[Sales] ([sale_id], [product_id], [sale_date], [amount], [promotion_id]) VALUES (N'S003', N'A', CAST(N'2024-01-03' AS Date), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Sales] ([sale_id], [product_id], [sale_date], [amount], [promotion_id]) VALUES (N'S004', N'C', CAST(N'2024-01-04' AS Date), CAST(18.00 AS Decimal(18, 2)), N'P001')
INSERT [dbo].[Sales] ([sale_id], [product_id], [sale_date], [amount], [promotion_id]) VALUES (N'S005', N'B', CAST(N'2024-01-05' AS Date), CAST(30.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[Sales2] ([sale_id], [product_id], [sale_date], [amount], [category_id]) VALUES (1, N'P001', CAST(N'2024-01-01' AS Date), CAST(100.00 AS Decimal(10, 2)), N'C1')
INSERT [dbo].[Sales2] ([sale_id], [product_id], [sale_date], [amount], [category_id]) VALUES (2, N'P002', CAST(N'2024-01-05' AS Date), CAST(150.00 AS Decimal(10, 2)), N'C2')
INSERT [dbo].[Sales2] ([sale_id], [product_id], [sale_date], [amount], [category_id]) VALUES (3, N'P001', CAST(N'2024-01-10' AS Date), CAST(100.00 AS Decimal(10, 2)), N'C1')
INSERT [dbo].[Sales2] ([sale_id], [product_id], [sale_date], [amount], [category_id]) VALUES (4, N'P003', CAST(N'2024-01-15' AS Date), CAST(200.00 AS Decimal(10, 2)), N'C3')
INSERT [dbo].[Sales2] ([sale_id], [product_id], [sale_date], [amount], [category_id]) VALUES (5, N'P002', CAST(N'2024-01-20' AS Date), CAST(150.00 AS Decimal(10, 2)), N'C2')
GO
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1001, 1, 2, 101, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1001, 2, 1, 101, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1001, 3, 1, 101, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1002, 1, 1, 102, CAST(N'2024-07-02' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1002, 4, 2, 102, CAST(N'2024-07-02' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1003, 1, 1, 103, CAST(N'2024-07-03' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1003, 2, 1, 103, CAST(N'2024-07-03' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1003, 5, 1, 103, CAST(N'2024-07-03' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1004, 1, 1, 104, CAST(N'2024-07-04' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1004, 2, 1, 104, CAST(N'2024-07-04' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1004, 4, 1, 104, CAST(N'2024-07-04' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1004, 6, 1, 104, CAST(N'2024-07-04' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1005, 3, 1, 105, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1005, 4, 2, 105, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1006, 1, 3, 106, CAST(N'2024-07-06' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1006, 7, 1, 106, CAST(N'2024-07-06' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1007, 1, 1, 107, CAST(N'2024-07-07' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1007, 5, 1, 107, CAST(N'2024-07-07' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1007, 8, 1, 107, CAST(N'2024-07-07' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1008, 9, 1, 108, CAST(N'2024-07-08' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1008, 10, 1, 108, CAST(N'2024-07-08' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1009, 1, 1, 109, CAST(N'2024-07-09' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1009, 3, 1, 109, CAST(N'2024-07-09' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1009, 4, 1, 109, CAST(N'2024-07-09' AS Date))
INSERT [dbo].[Transactions] ([TransactionID], [ProductID], [Quantity], [CustomerID], [TransactionDate]) VALUES (1009, 5, 1, 109, CAST(N'2024-07-09' AS Date))
GO
INSERT [dbo].[UserActivity] ([activity_id], [user_id], [activity_date]) VALUES (1, 101, CAST(N'2024-01-05' AS Date))
INSERT [dbo].[UserActivity] ([activity_id], [user_id], [activity_date]) VALUES (2, 102, CAST(N'2024-01-06' AS Date))
INSERT [dbo].[UserActivity] ([activity_id], [user_id], [activity_date]) VALUES (3, 103, CAST(N'2024-01-07' AS Date))
INSERT [dbo].[UserActivity] ([activity_id], [user_id], [activity_date]) VALUES (4, 101, CAST(N'2024-01-15' AS Date))
INSERT [dbo].[UserActivity] ([activity_id], [user_id], [activity_date]) VALUES (5, 104, CAST(N'2024-01-20' AS Date))
INSERT [dbo].[UserActivity] ([activity_id], [user_id], [activity_date]) VALUES (6, 102, CAST(N'2024-01-25' AS Date))
INSERT [dbo].[UserActivity] ([activity_id], [user_id], [activity_date]) VALUES (7, 105, CAST(N'2024-01-30' AS Date))
GO
INSERT [dbo].[Users] ([user_id], [user_name], [join_date]) VALUES (101, N'Alice', CAST(N'2023-05-10' AS Date))
INSERT [dbo].[Users] ([user_id], [user_name], [join_date]) VALUES (102, N'Bob', CAST(N'2023-06-15' AS Date))
INSERT [dbo].[Users] ([user_id], [user_name], [join_date]) VALUES (103, N'Charlie', CAST(N'2023-07-20' AS Date))
INSERT [dbo].[Users] ([user_id], [user_name], [join_date]) VALUES (104, N'Dana', CAST(N'2023-08-25' AS Date))
INSERT [dbo].[Users] ([user_id], [user_name], [join_date]) VALUES (105, N'Emily', CAST(N'2023-09-30' AS Date))
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products2] ([ProductID])
GO
USE [master]
GO
ALTER DATABASE [Assessment] SET  READ_WRITE 
GO

