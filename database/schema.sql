USE [master]
GO
/****** Object:  Database [DATJ]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE DATABASE [DATJ]
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DATJ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DATJ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DATJ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DATJ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DATJ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DATJ] SET ARITHABORT OFF 
GO
ALTER DATABASE [DATJ] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DATJ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DATJ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DATJ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DATJ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DATJ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DATJ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DATJ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DATJ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DATJ] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DATJ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DATJ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DATJ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DATJ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DATJ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DATJ] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DATJ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DATJ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DATJ] SET  MULTI_USER 
GO
ALTER DATABASE [DATJ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DATJ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DATJ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DATJ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [DATJ]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[accessory]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accessory](
	[accessory_id] [bigint] IDENTITY(1,1) NOT NULL,
	[karat] [int] NOT NULL,
	[material_weight] [real] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
	[accessory_type_id] [bigint] NOT NULL,
	[shape_id] [bigint] NOT NULL,
 CONSTRAINT [PK_accessory] PRIMARY KEY CLUSTERED 
(
	[accessory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[accessory_image]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accessory_image](
	[image_id] [bigint] IDENTITY(1,1) NOT NULL,
	[image_url] [nvarchar](max) NOT NULL,
	[accessory_id] [bigint] NOT NULL,
 CONSTRAINT [PK_accessory_image] PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[accessory_type]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accessory_type](
	[accessory_type_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[processing_price] [float] NOT NULL,
 CONSTRAINT [PK_accessory_type] PRIMARY KEY CLUSTERED 
(
	[accessory_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[account]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[account_id] [bigint] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](max) NOT NULL,
	[rank_id] [bigint] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[phone_number] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[birthday] [datetime2](7) NOT NULL,
	[gender] [nvarchar](max) NOT NULL,
	[reward_point] [int] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blog]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog](
	[blog_id] [bigint] IDENTITY(1,1) NOT NULL,
	[author_id] [bigint] NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_blog] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diamond]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diamond](
	[diamond_id] [bigint] IDENTITY(1,1) NOT NULL,
	[lab] [nvarchar](max) NOT NULL,
	[certificate_number] [bigint] NOT NULL,
	[certificate_url] [nvarchar](max) NOT NULL,
	[image_url] [nvarchar](max) NOT NULL,
	[carat] [real] NOT NULL,
	[cut] [nvarchar](max) NOT NULL,
	[color] [int] NOT NULL,
	[clarity] [int] NOT NULL,
	[polish] [nvarchar](max) NOT NULL,
	[symmetry] [nvarchar](max) NOT NULL,
	[fluorescence] [nvarchar](max) NOT NULL,
	[availability] [bit] NOT NULL,
	[shape_id] [bigint] NOT NULL,
 CONSTRAINT [PK_diamond] PRIMARY KEY CLUSTERED 
(
	[diamond_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diamond_price]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diamond_price](
	[diamond_price_id] [bigint] IDENTITY(1,1) NOT NULL,
	[eff_time] [datetime2](7) NOT NULL,
	[min_carat_eff] [real] NOT NULL,
	[max_carat_eff] [real] NOT NULL,
	[color] [nvarchar](max) NOT NULL,
	[clarity] [nvarchar](max) NOT NULL,
	[unit_price] [float] NOT NULL,
 CONSTRAINT [PK_diamond_price] PRIMARY KEY CLUSTERED 
(
	[diamond_price_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[feedback_id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [nvarchar](450) NOT NULL,
	[accessory_id] [bigint] NOT NULL,
	[score] [int] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_feedback] PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material_price]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material_price](
	[material_price_id] [bigint] IDENTITY(1,1) NOT NULL,
	[karat] [int] NOT NULL,
	[eff_time] [datetime2](7) NOT NULL,
	[unit_price] [float] NOT NULL,
 CONSTRAINT [PK_material_price] PRIMARY KEY CLUSTERED 
(
	[material_price_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[merchant]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merchant](
	[Id] [nvarchar](250) NOT NULL,
	[MerchantName] [nvarchar](250) NULL,
	[MerchantWebLink] [nvarchar](250) NULL,
	[MerchentIpnUrl] [nvarchar](250) NULL,
	[MerchantReturnUrl] [nvarchar](250) NULL,
	[SecretKey] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime2](7) NULL,
	[LastUpdatedBy] [nvarchar](50) NULL,
	[LastUpdateAt] [datetime2](7) NULL,
 CONSTRAINT [PK_merchant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[order_id] [nvarchar](450) NOT NULL,
	[total_price] [float] NOT NULL,
	[total_discount_percent] [real] NOT NULL,
	[rank_id] [bigint] NOT NULL,
	[price_rate_id] [bigint] NOT NULL,
	[order_status] [nvarchar](max) NOT NULL,
	[shipping_address] [nvarchar](max) NOT NULL,
	[phone_number] [nvarchar](max) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[customer_id] [bigint] NOT NULL,
	[sale_staff_id] [bigint] NULL,
	[delivery_staff_id] [bigint] NULL,
	[promotion_id] [bigint] NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[order_detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[size] [real] NULL,
	[item_price] [float] NULL,
	[order_id] [nvarchar](450) NOT NULL,
	[diamond_id] [bigint] NOT NULL,
	[accessory_id] [bigint] NULL,
	[diamond_price_id] [bigint] NOT NULL,
	[material_price_id] [bigint] NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[Id] [nvarchar](50) NOT NULL,
	[PaymentContent] [nvarchar](250) NOT NULL,
	[PaymentCurrency] [nvarchar](250) NOT NULL,
	[PaymentRefId] [nvarchar](250) NOT NULL,
	[RequiredAmount] [decimal](19, 2) NULL,
	[PaymentDate] [datetime2](7) NOT NULL,
	[ExpireDate] [datetime2](7) NULL,
	[PaymentLanguage] [nvarchar](250) NULL,
	[MerchantId] [nvarchar](250) NULL,
	[PaymentDestinationId] [nvarchar](250) NULL,
	[PaidAmount] [nvarchar](250) NULL,
	[PaymentStatus] [nvarchar](250) NULL,
	[PaymentLastMessage] [nvarchar](250) NULL,
 CONSTRAINT [PK_payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentDestination]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentDestination](
	[Id] [nvarchar](250) NOT NULL,
	[DesLogo] [nvarchar](250) NULL,
	[DesShortName] [nvarchar](250) NULL,
	[DesName] [nvarchar](50) NULL,
	[DesSortIndex] [int] NULL,
	[DesParentId] [nvarchar](250) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime2](7) NULL,
	[LastUpdatedBy] [nvarchar](50) NULL,
	[LastUpdateAt] [datetime2](7) NULL,
 CONSTRAINT [PK_PaymentDestination] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paymentNotification]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paymentNotification](
	[Id] [nvarchar](50) NOT NULL,
	[PaymentRefId] [nvarchar](50) NULL,
	[NotiDate] [datetime2](7) NULL,
	[NotiContent] [nvarchar](50) NULL,
	[NotiAmount] [decimal](19, 2) NOT NULL,
	[NotiMessage] [nvarchar](50) NULL,
	[NotiSignature] [nvarchar](50) NULL,
	[NotiPaymentId] [nvarchar](50) NULL,
	[NotiMerchantId] [nvarchar](250) NULL,
	[NotiStatus] [nvarchar](50) NULL,
	[NotiResDate] [datetime2](7) NULL,
	[NotiResMessage] [nvarchar](50) NULL,
	[NotiResHttpCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_paymentNotification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paymentSignature]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paymentSignature](
	[Id] [nvarchar](50) NOT NULL,
	[SignValue] [nvarchar](500) NULL,
	[SignAlgo] [nvarchar](50) NULL,
	[SignDate] [datetime2](7) NULL,
	[SignOwn] [nvarchar](50) NULL,
	[PaymentId] [nvarchar](50) NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_paymentSignature] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paymentTransaction]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paymentTransaction](
	[Id] [nvarchar](50) NOT NULL,
	[TransMessage] [nvarchar](250) NULL,
	[TranPayload] [nvarchar](500) NULL,
	[TranStatus] [nvarchar](10) NULL,
	[TranAmount] [decimal](19, 2) NULL,
	[TranDate] [datetime2](7) NULL,
	[PaymentId] [nvarchar](50) NULL,
	[TranRefId] [nvarchar](250) NULL,
	[AccountId] [bigint] NULL,
 CONSTRAINT [PK_paymentTransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[price_rate]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[price_rate](
	[price_rate_id] [bigint] IDENTITY(1,1) NOT NULL,
	[account_id] [bigint] NOT NULL,
	[percent] [real] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_price_rate] PRIMARY KEY CLUSTERED 
(
	[price_rate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotion]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotion](
	[promotion_id] [bigint] IDENTITY(1,1) NOT NULL,
	[discount_percent] [real] NOT NULL,
	[start_time] [datetime2](7) NOT NULL,
	[end_time] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_promotion] PRIMARY KEY CLUSTERED 
(
	[promotion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rank]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rank](
	[rank_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rank_name] [nvarchar](max) NOT NULL,
	[discount] [real] NOT NULL,
	[reward_point] [int] NOT NULL,
 CONSTRAINT [PK_rank] PRIMARY KEY CLUSTERED 
(
	[rank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shape]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shape](
	[shape_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_shape] PRIMARY KEY CLUSTERED 
(
	[shape_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transaction]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction](
	[transaction_id] [nvarchar](450) NOT NULL,
	[order_id] [nvarchar](450) NULL,
	[payment_method] [nvarchar](max) NOT NULL,
	[amount] [float] NOT NULL,
	[transaction_status] [nvarchar](max) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_transaction] PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[warranty_card]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warranty_card](
	[warranty_card_id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_detail_id] [bigint] NOT NULL,
	[start_time] [datetime2](7) NOT NULL,
	[end_time] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_warranty_card] PRIMARY KEY CLUSTERED 
(
	[warranty_card_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[warranty_request]    Script Date: 6/15/2024 9:59:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warranty_request](
	[warranty_request_id] [bigint] IDENTITY(1,1) NOT NULL,
	[warranty_reason] [nvarchar](max) NOT NULL,
	[customer_id] [bigint] NOT NULL,
	[sale_staff_id] [bigint] NULL,
	[delivery_staff_id] [bigint] NULL,
	[warranty_card_id] [bigint] NOT NULL,
	[receive_time] [datetime2](7) NOT NULL,
	[return_time] [datetime2](7) NULL,
	[warranty_status] [nvarchar](max) NOT NULL,
	[shipping_address] [nvarchar](max) NOT NULL,
	[phone_number] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_warranty_request] PRIMARY KEY CLUSTERED 
(
	[warranty_request_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_accessory_accessory_type_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_accessory_accessory_type_id] ON [dbo].[accessory]
(
	[accessory_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_accessory_shape_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_accessory_shape_id] ON [dbo].[accessory]
(
	[shape_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_accessory_image_accessory_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_accessory_image_accessory_id] ON [dbo].[accessory_image]
(
	[accessory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_account_rank_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_account_rank_id] ON [dbo].[account]
(
	[rank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_blog_author_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_blog_author_id] ON [dbo].[blog]
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_diamond_shape_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_diamond_shape_id] ON [dbo].[diamond]
(
	[shape_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_feedback_accessory_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_feedback_accessory_id] ON [dbo].[feedback]
(
	[accessory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_feedback_order_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_feedback_order_id] ON [dbo].[feedback]
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_customer_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_customer_id] ON [dbo].[order]
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_delivery_staff_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_delivery_staff_id] ON [dbo].[order]
(
	[delivery_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_price_rate_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_price_rate_id] ON [dbo].[order]
(
	[price_rate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_promotion_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_promotion_id] ON [dbo].[order]
(
	[promotion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_rank_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_rank_id] ON [dbo].[order]
(
	[rank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_sale_staff_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_sale_staff_id] ON [dbo].[order]
(
	[sale_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_accessory_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_detail_accessory_id] ON [dbo].[order_detail]
(
	[accessory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_diamond_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_order_detail_diamond_id] ON [dbo].[order_detail]
(
	[diamond_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_diamond_price_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_detail_diamond_price_id] ON [dbo].[order_detail]
(
	[diamond_price_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_material_price_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_detail_material_price_id] ON [dbo].[order_detail]
(
	[material_price_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_order_detail_order_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_detail_order_id] ON [dbo].[order_detail]
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_payment_MerchantId]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_payment_MerchantId] ON [dbo].[payment]
(
	[MerchantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_payment_PaymentDestinationId]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_payment_PaymentDestinationId] ON [dbo].[payment]
(
	[PaymentDestinationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PaymentDestination_DesParentId]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_PaymentDestination_DesParentId] ON [dbo].[PaymentDestination]
(
	[DesParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_paymentNotification_NotiMerchantId]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_paymentNotification_NotiMerchantId] ON [dbo].[paymentNotification]
(
	[NotiMerchantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_paymentNotification_NotiPaymentId]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_paymentNotification_NotiPaymentId] ON [dbo].[paymentNotification]
(
	[NotiPaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_paymentSignature_PaymentId]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_paymentSignature_PaymentId] ON [dbo].[paymentSignature]
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_paymentTransaction_AccountId]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_paymentTransaction_AccountId] ON [dbo].[paymentTransaction]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_paymentTransaction_PaymentId]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_paymentTransaction_PaymentId] ON [dbo].[paymentTransaction]
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_price_rate_account_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_price_rate_account_id] ON [dbo].[price_rate]
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_transaction_order_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_transaction_order_id] ON [dbo].[transaction]
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_card_order_detail_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_warranty_card_order_detail_id] ON [dbo].[warranty_card]
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_request_customer_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_warranty_request_customer_id] ON [dbo].[warranty_request]
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_request_delivery_staff_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_warranty_request_delivery_staff_id] ON [dbo].[warranty_request]
(
	[delivery_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_request_sale_staff_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_warranty_request_sale_staff_id] ON [dbo].[warranty_request]
(
	[sale_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_request_warranty_card_id]    Script Date: 6/15/2024 9:59:24 AM ******/
CREATE NONCLUSTERED INDEX [IX_warranty_request_warranty_card_id] ON [dbo].[warranty_request]
(
	[warranty_card_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[accessory]  WITH CHECK ADD  CONSTRAINT [FK_accessory_accessory_type_accessory_type_id] FOREIGN KEY([accessory_type_id])
REFERENCES [dbo].[accessory_type] ([accessory_type_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[accessory] CHECK CONSTRAINT [FK_accessory_accessory_type_accessory_type_id]
GO
ALTER TABLE [dbo].[accessory]  WITH CHECK ADD  CONSTRAINT [FK_accessory_shape_shape_id] FOREIGN KEY([shape_id])
REFERENCES [dbo].[shape] ([shape_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[accessory] CHECK CONSTRAINT [FK_accessory_shape_shape_id]
GO
ALTER TABLE [dbo].[accessory_image]  WITH CHECK ADD  CONSTRAINT [FK_accessory_image_accessory_accessory_id] FOREIGN KEY([accessory_id])
REFERENCES [dbo].[accessory] ([accessory_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[accessory_image] CHECK CONSTRAINT [FK_accessory_image_accessory_accessory_id]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK_account_rank_rank_id] FOREIGN KEY([rank_id])
REFERENCES [dbo].[rank] ([rank_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_rank_rank_id]
GO
ALTER TABLE [dbo].[blog]  WITH CHECK ADD  CONSTRAINT [FK_blog_account_author_id] FOREIGN KEY([author_id])
REFERENCES [dbo].[account] ([account_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[blog] CHECK CONSTRAINT [FK_blog_account_author_id]
GO
ALTER TABLE [dbo].[diamond]  WITH CHECK ADD  CONSTRAINT [FK_diamond_shape_shape_id] FOREIGN KEY([shape_id])
REFERENCES [dbo].[shape] ([shape_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[diamond] CHECK CONSTRAINT [FK_diamond_shape_shape_id]
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD  CONSTRAINT [FK_feedback_accessory_accessory_id] FOREIGN KEY([accessory_id])
REFERENCES [dbo].[accessory] ([accessory_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[feedback] CHECK CONSTRAINT [FK_feedback_accessory_accessory_id]
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD  CONSTRAINT [FK_feedback_order_order_id] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[feedback] CHECK CONSTRAINT [FK_feedback_order_order_id]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_account_customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_account_customer_id]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_account_delivery_staff_id] FOREIGN KEY([delivery_staff_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_account_delivery_staff_id]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_account_sale_staff_id] FOREIGN KEY([sale_staff_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_account_sale_staff_id]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_price_rate_price_rate_id] FOREIGN KEY([price_rate_id])
REFERENCES [dbo].[price_rate] ([price_rate_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_price_rate_price_rate_id]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_promotion_promotion_id] FOREIGN KEY([promotion_id])
REFERENCES [dbo].[promotion] ([promotion_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_promotion_promotion_id]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_rank_rank_id] FOREIGN KEY([rank_id])
REFERENCES [dbo].[rank] ([rank_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_rank_rank_id]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_accessory_accessory_id] FOREIGN KEY([accessory_id])
REFERENCES [dbo].[accessory] ([accessory_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_accessory_accessory_id]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_diamond_diamond_id] FOREIGN KEY([diamond_id])
REFERENCES [dbo].[diamond] ([diamond_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_diamond_diamond_id]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_diamond_price_diamond_price_id] FOREIGN KEY([diamond_price_id])
REFERENCES [dbo].[diamond_price] ([diamond_price_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_diamond_price_diamond_price_id]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_material_price_material_price_id] FOREIGN KEY([material_price_id])
REFERENCES [dbo].[material_price] ([material_price_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_material_price_material_price_id]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_order_order_id] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_order_order_id]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [FK_payment_merchant_MerchantId] FOREIGN KEY([MerchantId])
REFERENCES [dbo].[merchant] ([Id])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [FK_payment_merchant_MerchantId]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [FK_payment_PaymentDestination_PaymentDestinationId] FOREIGN KEY([PaymentDestinationId])
REFERENCES [dbo].[PaymentDestination] ([Id])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [FK_payment_PaymentDestination_PaymentDestinationId]
GO
ALTER TABLE [dbo].[PaymentDestination]  WITH CHECK ADD  CONSTRAINT [FK_PaymentDestination_PaymentDestination_DesParentId] FOREIGN KEY([DesParentId])
REFERENCES [dbo].[PaymentDestination] ([Id])
GO
ALTER TABLE [dbo].[PaymentDestination] CHECK CONSTRAINT [FK_PaymentDestination_PaymentDestination_DesParentId]
GO
ALTER TABLE [dbo].[paymentNotification]  WITH CHECK ADD  CONSTRAINT [FK_paymentNotification_merchant_NotiMerchantId] FOREIGN KEY([NotiMerchantId])
REFERENCES [dbo].[merchant] ([Id])
GO
ALTER TABLE [dbo].[paymentNotification] CHECK CONSTRAINT [FK_paymentNotification_merchant_NotiMerchantId]
GO
ALTER TABLE [dbo].[paymentNotification]  WITH CHECK ADD  CONSTRAINT [FK_paymentNotification_payment_NotiPaymentId] FOREIGN KEY([NotiPaymentId])
REFERENCES [dbo].[payment] ([Id])
GO
ALTER TABLE [dbo].[paymentNotification] CHECK CONSTRAINT [FK_paymentNotification_payment_NotiPaymentId]
GO
ALTER TABLE [dbo].[paymentSignature]  WITH CHECK ADD  CONSTRAINT [FK_paymentSignature_payment_PaymentId] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[payment] ([Id])
GO
ALTER TABLE [dbo].[paymentSignature] CHECK CONSTRAINT [FK_paymentSignature_payment_PaymentId]
GO
ALTER TABLE [dbo].[paymentTransaction]  WITH CHECK ADD  CONSTRAINT [FK_paymentTransaction_account_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[paymentTransaction] CHECK CONSTRAINT [FK_paymentTransaction_account_AccountId]
GO
ALTER TABLE [dbo].[paymentTransaction]  WITH CHECK ADD  CONSTRAINT [FK_paymentTransaction_payment_PaymentId] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[payment] ([Id])
GO
ALTER TABLE [dbo].[paymentTransaction] CHECK CONSTRAINT [FK_paymentTransaction_payment_PaymentId]
GO
ALTER TABLE [dbo].[price_rate]  WITH CHECK ADD  CONSTRAINT [FK_price_rate_account_account_id] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[price_rate] CHECK CONSTRAINT [FK_price_rate_account_account_id]
GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD  CONSTRAINT [FK_transaction_order_order_id] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
GO
ALTER TABLE [dbo].[transaction] CHECK CONSTRAINT [FK_transaction_order_order_id]
GO
ALTER TABLE [dbo].[warranty_card]  WITH CHECK ADD  CONSTRAINT [FK_warranty_card_order_detail_order_detail_id] FOREIGN KEY([order_detail_id])
REFERENCES [dbo].[order_detail] ([order_detail_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[warranty_card] CHECK CONSTRAINT [FK_warranty_card_order_detail_order_detail_id]
GO
ALTER TABLE [dbo].[warranty_request]  WITH CHECK ADD  CONSTRAINT [FK_warranty_request_account_customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[warranty_request] CHECK CONSTRAINT [FK_warranty_request_account_customer_id]
GO
ALTER TABLE [dbo].[warranty_request]  WITH CHECK ADD  CONSTRAINT [FK_warranty_request_account_delivery_staff_id] FOREIGN KEY([delivery_staff_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[warranty_request] CHECK CONSTRAINT [FK_warranty_request_account_delivery_staff_id]
GO
ALTER TABLE [dbo].[warranty_request]  WITH CHECK ADD  CONSTRAINT [FK_warranty_request_account_sale_staff_id] FOREIGN KEY([sale_staff_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[warranty_request] CHECK CONSTRAINT [FK_warranty_request_account_sale_staff_id]
GO
ALTER TABLE [dbo].[warranty_request]  WITH CHECK ADD  CONSTRAINT [FK_warranty_request_warranty_card_warranty_card_id] FOREIGN KEY([warranty_card_id])
REFERENCES [dbo].[warranty_card] ([warranty_card_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[warranty_request] CHECK CONSTRAINT [FK_warranty_request_warranty_card_warranty_card_id]
GO
USE [master]
GO
ALTER DATABASE [DATJ] SET  READ_WRITE 
GO
