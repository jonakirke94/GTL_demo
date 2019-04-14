USE [master]
GO
/****** Object:  Database [GTL_Auth_Demo]    Script Date: 14-04-2019 13:52:30 ******/
CREATE DATABASE [GTL_Auth_Demo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GTL_Auth_Demo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GTL_Auth_Demo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GTL_Auth_Demo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GTL_Auth_Demo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GTL_Auth_Demo] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GTL_Auth_Demo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GTL_Auth_Demo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GTL_Auth_Demo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GTL_Auth_Demo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GTL_Auth_Demo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GTL_Auth_Demo] SET ARITHABORT OFF 
GO
ALTER DATABASE [GTL_Auth_Demo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GTL_Auth_Demo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GTL_Auth_Demo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GTL_Auth_Demo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GTL_Auth_Demo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GTL_Auth_Demo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GTL_Auth_Demo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GTL_Auth_Demo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GTL_Auth_Demo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GTL_Auth_Demo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GTL_Auth_Demo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GTL_Auth_Demo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GTL_Auth_Demo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GTL_Auth_Demo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GTL_Auth_Demo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GTL_Auth_Demo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GTL_Auth_Demo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GTL_Auth_Demo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GTL_Auth_Demo] SET  MULTI_USER 
GO
ALTER DATABASE [GTL_Auth_Demo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GTL_Auth_Demo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GTL_Auth_Demo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GTL_Auth_Demo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GTL_Auth_Demo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GTL_Auth_Demo] SET QUERY_STORE = OFF
GO
USE [GTL_Auth_Demo]
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
USE [GTL_Auth_Demo]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 14-04-2019 13:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[NormalizedName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 14-04-2019 13:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[NormalizedName] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[City] [nvarchar](256) NULL,
	[Zipcode] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[LastChanged] [datetime] NULL,
	[PasswordSalt] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 14-04-2019 13:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Name], [NormalizedName], [Email], [NormalizedEmail], [City], [Zipcode], [PasswordHash], [LastChanged], [PasswordSalt]) VALUES (2, N'Jonathan', N'Jonathan', N'jonakirke94@gmail.com', N'jonakirke94@gmail.com', NULL, NULL, N'5VBZkuoVhHrhrri9Y96ZYbw5/QTNXFpZA9Uwjsb2E9o=', CAST(N'2019-04-14T12:12:55.967' AS DateTime), N'3lMsQrpypglX8BuupozdHQ==')
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Role_NormalizedName]    Script Date: 14-04-2019 13:52:31 ******/
CREATE NONCLUSTERED INDEX [IX_Role_NormalizedName] ON [dbo].[Role]
(
	[NormalizedName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_User_NormalizedEmail]    Script Date: 14-04-2019 13:52:31 ******/
CREATE NONCLUSTERED INDEX [IX_User_NormalizedEmail] ON [dbo].[User]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_User_NormalizedName]    Script Date: 14-04-2019 13:52:31 ******/
CREATE NONCLUSTERED INDEX [IX_User_NormalizedName] ON [dbo].[User]
(
	[NormalizedName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_Role_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_Role_User]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
USE [master]
GO
ALTER DATABASE [GTL_Auth_Demo] SET  READ_WRITE 
GO
