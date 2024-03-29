USE [master]
GO
/****** Object:  Database [education]    Script Date: 3/10/2015 11:29:00 PM ******/
CREATE DATABASE [education]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'education', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\education.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'education_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\education_log.ldf' , SIZE = 5824KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [education] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [education].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [education] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [education] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [education] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [education] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [education] SET ARITHABORT OFF 
GO
ALTER DATABASE [education] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [education] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [education] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [education] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [education] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [education] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [education] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [education] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [education] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [education] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [education] SET  DISABLE_BROKER 
GO
ALTER DATABASE [education] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [education] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [education] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [education] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [education] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [education] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [education] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [education] SET RECOVERY FULL 
GO
ALTER DATABASE [education] SET  MULTI_USER 
GO
ALTER DATABASE [education] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [education] SET DB_CHAINING OFF 
GO
ALTER DATABASE [education] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [education] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'education', N'ON'
GO
USE [education]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 3/10/2015 11:29:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parent_id] [int] NULL,
	[level] [int] NULL,
	[path] [nvarchar](255) NULL,
	[title] [nvarchar](255) NULL,
	[note] [nvarchar](255) NULL,
	[discription] [nvarchar](255) NULL,
	[image] [nvarchar](255) NULL,
 CONSTRAINT [categories_PK_categories_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[content]    Script Date: 3/10/2015 11:29:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NULL,
	[introtext] [nvarchar](max) NULL,
	[fulltext] [nvarchar](max) NULL,
	[state] [int] NULL,
	[catid] [int] NULL,
	[created] [datetime] NULL,
	[create_by] [nvarchar](50) NULL,
	[image] [nvarchar](255) NULL,
	[ordering] [int] NULL,
	[hit] [int] NULL,
	[note] [nchar](50) NULL,
 CONSTRAINT [content_PK_content_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mediagallery]    Script Date: 3/10/2015 11:29:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mediagallery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[filename] [nvarchar](255) NULL,
	[caption] [nvarchar](1000) NULL,
	[published] [int] NULL,
	[ordering] [int] NULL,
 CONSTRAINT [mediagallery_PK_mediagallery_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[menu]    Script Date: 3/10/2015 11:29:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NULL,
	[note] [nvarchar](255) NULL,
	[link] [nvarchar](255) NULL,
	[parent_id] [int] NULL,
	[level] [int] NULL,
	[ordering] [int] NULL,
	[home] [int] NULL,
	[image] [nvarchar](255) NULL,
	[published] [int] NULL,
 CONSTRAINT [menu_PK_menu_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[roles]    Script Date: 3/10/2015 11:29:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 3/10/2015 11:29:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NULL,
	[password] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[image] [nvarchar](255) NULL,
	[level] [int] NULL,
 CONSTRAINT [users_PK_users_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usersinroles]    Script Date: 3/10/2015 11:29:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usersinroles](
	[roleid] [int] NOT NULL,
	[userid] [int] NOT NULL,
 CONSTRAINT [PK_usersinroles] PRIMARY KEY CLUSTERED 
(
	[userid] ASC,
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [parent_id], [level], [path], [title], [note], [discription], [image]) VALUES (1, NULL, NULL, NULL, N'Slogan', NULL, NULL, NULL)
INSERT [dbo].[categories] ([id], [parent_id], [level], [path], [title], [note], [discription], [image]) VALUES (2, NULL, NULL, NULL, N'News and event', NULL, NULL, NULL)
INSERT [dbo].[categories] ([id], [parent_id], [level], [path], [title], [note], [discription], [image]) VALUES (3, NULL, NULL, NULL, N'Services', NULL, NULL, NULL)
INSERT [dbo].[categories] ([id], [parent_id], [level], [path], [title], [note], [discription], [image]) VALUES (4, 2, NULL, NULL, N'MBA', N'web-design', NULL, NULL)
INSERT [dbo].[categories] ([id], [parent_id], [level], [path], [title], [note], [discription], [image]) VALUES (5, 2, NULL, NULL, N'College, Pre-College and Master', N'logo-design', NULL, NULL)
INSERT [dbo].[categories] ([id], [parent_id], [level], [path], [title], [note], [discription], [image]) VALUES (6, 2, NULL, NULL, N'Study abroad language', N'print-design', NULL, NULL)
INSERT [dbo].[categories] ([id], [parent_id], [level], [path], [title], [note], [discription], [image]) VALUES (2009, 2, NULL, NULL, N'About', N'About', NULL, NULL)
SET IDENTITY_INSERT [dbo].[categories] OFF
SET IDENTITY_INSERT [dbo].[content] ON 

INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (1, N'Lorem Website', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor...', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ', NULL, 6, NULL, N'thanh', N'/Content/Image/images/work1.jpg', NULL, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (2, N'Lorem Website', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor...', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ', NULL, 6, NULL, N'thanh', N'/Content/Image/images/work2.jpg', NULL, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (3, N'Lorem Website', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor...', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ', 1, 6, NULL, N'admin', N'/Content/Image/images/work3.jpg', 3, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (4, N'Lorem Website', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor...', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ', 1, 4, NULL, N'admin', N'/Content/Image/images/work4.jpg', 4, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (5, N'Lorem Website', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor...', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ', 1, 4, NULL, N'admin', N'/Content/Image/images/work1.jpg', 5, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (6, N'Lorem Website', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor...', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ', 1, 4, NULL, N'admin', N'/Content/Image/images/work2.jpg', 6, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (7, N'Lorem Website', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor...', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ', 1, 5, NULL, N'admin', N'/Content/Image/images/work3.jpg', 7, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (8, N'Lorem Website', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor...', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ', 1, 5, NULL, N'admin', N'/Content/Image/images/work4.jpg', 8, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (9, N'Lorem Website', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor...', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ', 1, 5, NULL, N'admin', N'/Content/Image/images/work1.jpg', 9, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (10, N'Lorem Website c', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor...', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ', 1, 6, NULL, N'admin', N'/Content/Image/images/work2.jpg', 10, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (11, N'Lorem Website b', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor...', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ', NULL, 5, NULL, N'thanh', N'/Content/Image/images/work11.jpg', NULL, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (12, N'Lorem Website a', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor...', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ', 1, 4, NULL, N'admin', N'/Content/Image/images/work4.jpg', 12, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (13, NULL, N'<h1>We are <span class="violet">Tung</span>, your slogan here........</h1>', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.', 1, 1, NULL, N'admin', NULL, 1, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (14, N'College, Pre-College', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et...', NULL, 1, 3, NULL, NULL, N'fa-cloud', 1, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (15, N'Study abroad language', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et...', NULL, 1, 3, NULL, NULL, N'fa-tasks', 2, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (16, N'Tung Academy', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et...', NULL, 1, 3, NULL, NULL, N'fa-magic', 3, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (17, N'Short-term study abroad', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et...', NULL, 1, 3, NULL, NULL, N'fa-print', 4, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (18, N'Lorem Ipsum Dolor Sit Amet', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper <span class="violet">suscipit lobortis</span>nisl ut aliquip ex ea commodo consequat. Lorem ipsum <strong>dolor sit amet</strong>, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do <strong>eiusmod tempor</strong> incididunt.', NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (19, N'Lorem Ipsum', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper <span class="violet">suscipit lobortis</span> nisl ut aliquip ex ea commodo consequat. Lorem ipsum <strong>dolor sit amet</strong>, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorpe suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do <strong>eiusmod tempor</strong> incididunt.', NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (20, N'Dolor Sit Amet', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper <span class="violet">suscipit lobortis</span> 
nisl ut aliquip ex ea commodo consequat. Lorem ipsum <strong>dolor sit amet</strong>, consectetur adipisicing elit,sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do <strong>eiusmod tempor</strong> incididunt.', NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (21, NULL, N'Below you can find more information about our company', N'<h3>
	About Tung&nbsp;</h3>
<p>
	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper <span class="violet">suscipit lobortis</span> nisl ut aliquip ex ea commodo consequat. Lorem ipsum <strong>dolor sit amet</strong>, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do <strong>eiusmod tempor</strong> incididunt.</p>
<h3>
	Our Mission</h3>
<p>
	Lorem ipsum dolor sit amet, <span class="violet">consectetur adipisicing</span> elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, <strong>consectetur adipisicing</strong> elit, sed do eiusmod <span class="violet">tempor incididunt</span> ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</p>
<h3>
	Why Choose Us</h3>
<p>
	Lorem ipsum dolor sit amet, <strong>consectetur adipisicing elit</strong>, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis <span class="violet">nostrud exerci</span> tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</p>
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (23, N'Test', N'test', N'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (26, N'Demo', N'Demo', N'Demo', NULL, 2009, NULL, N'thanh', N'/Content/Image/images/work10.jpg', NULL, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (27, N'1', N'1', N'1', NULL, 4, NULL, N'thanh', N'/Content/Image/images/work6.jpg', NULL, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (29, N'Tin tuc', N'1', N'1', NULL, 2009, NULL, N'thanh', N'/Content/Image/images/work1.jpg', NULL, NULL, NULL)
INSERT [dbo].[content] ([id], [title], [introtext], [fulltext], [state], [catid], [created], [create_by], [image], [ordering], [hit], [note]) VALUES (30, N'1', N'1', N'1', NULL, 4, NULL, N'thanh', N'/Content/Image/images/work1.jpg', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[content] OFF
SET IDENTITY_INSERT [dbo].[mediagallery] ON 

INSERT [dbo].[mediagallery] ([id], [filename], [caption], [published], [ordering]) VALUES (1, N'1.jpg', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. ', NULL, NULL)
INSERT [dbo].[mediagallery] ([id], [filename], [caption], [published], [ordering]) VALUES (2, N'2.jpg', N'Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit ', NULL, NULL)
INSERT [dbo].[mediagallery] ([id], [filename], [caption], [published], [ordering]) VALUES (3, N'3.jpg', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. ', NULL, NULL)
INSERT [dbo].[mediagallery] ([id], [filename], [caption], [published], [ordering]) VALUES (4, N'4.jpg', N'Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit ', NULL, NULL)
SET IDENTITY_INSERT [dbo].[mediagallery] OFF
SET IDENTITY_INSERT [dbo].[menu] ON 

INSERT [dbo].[menu] ([id], [title], [note], [link], [parent_id], [level], [ordering], [home], [image], [published]) VALUES (1, N'Home', N'fa-home', N'home', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[menu] ([id], [title], [note], [link], [parent_id], [level], [ordering], [home], [image], [published]) VALUES (2, N'News', N'fa-comments', N'news', NULL, NULL, 2, NULL, NULL, NULL)
INSERT [dbo].[menu] ([id], [title], [note], [link], [parent_id], [level], [ordering], [home], [image], [published]) VALUES (3, N'Services', N'fa-tasks', N'services', NULL, NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[menu] ([id], [title], [note], [link], [parent_id], [level], [ordering], [home], [image], [published]) VALUES (4, N'About', N'fa-user', N'about', NULL, NULL, 4, NULL, NULL, NULL)
INSERT [dbo].[menu] ([id], [title], [note], [link], [parent_id], [level], [ordering], [home], [image], [published]) VALUES (5, N'Contact', N'fa-envelope', N'contact', NULL, NULL, 5, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[menu] OFF
INSERT [dbo].[roles] ([id], [name]) VALUES (1, N'superadmin')
INSERT [dbo].[roles] ([id], [name]) VALUES (2, N'admin')
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [email], [password], [fullname], [address], [phone], [image], [level]) VALUES (1, N'thanh', N'123', N'thanhbui', N'abc', NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [email], [password], [fullname], [address], [phone], [image], [level]) VALUES (2, N'tung', N'123', N'tungnguyen', N'abc', NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [email], [password], [fullname], [address], [phone], [image], [level]) VALUES (1002, N'dao', N'123', N'daotran', N'abc', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
INSERT [dbo].[usersinroles] ([roleid], [userid]) VALUES (1, 1)
INSERT [dbo].[usersinroles] ([roleid], [userid]) VALUES (2, 2)
ALTER TABLE [dbo].[content]  WITH CHECK ADD  CONSTRAINT [FK_content_ToTable] FOREIGN KEY([catid])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[content] CHECK CONSTRAINT [FK_content_ToTable]
GO
ALTER TABLE [dbo].[usersinroles]  WITH CHECK ADD  CONSTRAINT [FK_usersinroles_roles] FOREIGN KEY([roleid])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[usersinroles] CHECK CONSTRAINT [FK_usersinroles_roles]
GO
ALTER TABLE [dbo].[usersinroles]  WITH CHECK ADD  CONSTRAINT [FK_usersinroles_users] FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[usersinroles] CHECK CONSTRAINT [FK_usersinroles_users]
GO
USE [master]
GO
ALTER DATABASE [education] SET  READ_WRITE 
GO
