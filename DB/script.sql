USE [master]
GO
/****** Object:  Database [dbemarketing]    Script Date: 29.01.2023 19:47:47 ******/
CREATE DATABASE [dbemarketing]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbemarketing', FILENAME = N'G:\DATABASE\dbemarketing.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbemarketing_log', FILENAME = N'G:\DATABASE\dbemarketing_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbemarketing] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbemarketing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbemarketing] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbemarketing] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbemarketing] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbemarketing] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbemarketing] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbemarketing] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbemarketing] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbemarketing] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbemarketing] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbemarketing] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbemarketing] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbemarketing] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbemarketing] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbemarketing] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbemarketing] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbemarketing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbemarketing] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbemarketing] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbemarketing] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbemarketing] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbemarketing] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbemarketing] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbemarketing] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbemarketing] SET  MULTI_USER 
GO
ALTER DATABASE [dbemarketing] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbemarketing] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbemarketing] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbemarketing] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbemarketing] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbemarketing] SET QUERY_STORE = OFF
GO
USE [dbemarketing]
GO
/****** Object:  Table [dbo].[tbl_admin]    Script Date: 29.01.2023 19:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_admin](
	[ad_id] [int] IDENTITY(1,1) NOT NULL,
	[ad_username] [nvarchar](50) NOT NULL,
	[ad_password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_category]    Script Date: 29.01.2023 19:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_category](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_name] [nvarchar](50) NOT NULL,
	[cat_image] [nvarchar](max) NOT NULL,
	[cat_fk_ad] [int] NULL,
	[cat_status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_product]    Script Date: 29.01.2023 19:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product](
	[pro_id] [int] IDENTITY(1,1) NOT NULL,
	[pro_name] [nvarchar](50) NOT NULL,
	[pro_image] [nvarchar](max) NOT NULL,
	[pro_des] [nvarchar](max) NOT NULL,
	[pro_price] [int] NOT NULL,
	[pro_fk_cat] [int] NOT NULL,
	[pro_fk_user] [int] NOT NULL,
 CONSTRAINT [PK__tbl_prod__335E4CA6068ED469] PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 29.01.2023 19:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user](
	[u_id] [int] IDENTITY(1,1) NOT NULL,
	[u_name] [nvarchar](50) NOT NULL,
	[u_email] [nvarchar](50) NOT NULL,
	[u_password] [nvarchar](50) NOT NULL,
	[u_contact] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[u_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_admin] ON 

INSERT [dbo].[tbl_admin] ([ad_id], [ad_username], [ad_password]) VALUES (1, N'root', N'admin123')
INSERT [dbo].[tbl_admin] ([ad_id], [ad_username], [ad_password]) VALUES (2, N'admin', N'admin23')
INSERT [dbo].[tbl_admin] ([ad_id], [ad_username], [ad_password]) VALUES (3, N'test', N'admin123')
SET IDENTITY_INSERT [dbo].[tbl_admin] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_category] ON 

INSERT [dbo].[tbl_category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (2, N'Mobile Phones', N'~/Content/upload/1417452414Screenshot_6.png', 1, 1)
INSERT [dbo].[tbl_category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (4, N'TV', N'~/Content/upload/919275082cat_tv.jpg', 1, 1)
SET IDENTITY_INSERT [dbo].[tbl_category] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_product] ON 

INSERT [dbo].[tbl_product] ([pro_id], [pro_name], [pro_image], [pro_des], [pro_price], [pro_fk_cat], [pro_fk_user]) VALUES (3, N'Samsung s21', N'~/Content/upload/978859463mobile 1.jpeg', N'fgregergergerg', 1000, 2, 1)
SET IDENTITY_INSERT [dbo].[tbl_product] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_user] ON 

INSERT [dbo].[tbl_user] ([u_id], [u_name], [u_email], [u_password], [u_contact]) VALUES (1, N'Alex', N'Alex@gmail.com', N'12456', N'555214789')
INSERT [dbo].[tbl_user] ([u_id], [u_name], [u_email], [u_password], [u_contact]) VALUES (3, N'Nika', N'Nika@mail.com', N'741', N'45545454')
SET IDENTITY_INSERT [dbo].[tbl_user] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_admi__9CC20817764C8549]    Script Date: 29.01.2023 19:47:47 ******/
ALTER TABLE [dbo].[tbl_admin] ADD UNIQUE NONCLUSTERED 
(
	[ad_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_cate__FA8C179072C833D0]    Script Date: 29.01.2023 19:47:47 ******/
ALTER TABLE [dbo].[tbl_category] ADD UNIQUE NONCLUSTERED 
(
	[cat_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_user__3DF9EF221443FEF1]    Script Date: 29.01.2023 19:47:47 ******/
ALTER TABLE [dbo].[tbl_user] ADD UNIQUE NONCLUSTERED 
(
	[u_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_user__F8193DB7774F0F1E]    Script Date: 29.01.2023 19:47:47 ******/
ALTER TABLE [dbo].[tbl_user] ADD UNIQUE NONCLUSTERED 
(
	[u_contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_category]  WITH CHECK ADD FOREIGN KEY([cat_fk_ad])
REFERENCES [dbo].[tbl_admin] ([ad_id])
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD  CONSTRAINT [FK__tbl_produ__pro_f__412EB0B6] FOREIGN KEY([pro_fk_cat])
REFERENCES [dbo].[tbl_category] ([cat_id])
GO
ALTER TABLE [dbo].[tbl_product] CHECK CONSTRAINT [FK__tbl_produ__pro_f__412EB0B6]
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD  CONSTRAINT [FK__tbl_produ__pro_f__4222D4EF] FOREIGN KEY([pro_fk_user])
REFERENCES [dbo].[tbl_user] ([u_id])
GO
ALTER TABLE [dbo].[tbl_product] CHECK CONSTRAINT [FK__tbl_produ__pro_f__4222D4EF]
GO
USE [master]
GO
ALTER DATABASE [dbemarketing] SET  READ_WRITE 
GO
