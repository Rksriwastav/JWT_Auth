USE [master]
GO
/****** Object:  Database [technology]    Script Date: 02/04/2019 3:44:51 PM ******/
CREATE DATABASE [technology]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'technology', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\technology.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'technology_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\technology_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [technology] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [technology].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [technology] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [technology] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [technology] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [technology] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [technology] SET ARITHABORT OFF 
GO
ALTER DATABASE [technology] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [technology] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [technology] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [technology] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [technology] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [technology] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [technology] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [technology] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [technology] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [technology] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [technology] SET  ENABLE_BROKER 
GO
ALTER DATABASE [technology] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [technology] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [technology] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [technology] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [technology] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [technology] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [technology] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [technology] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [technology] SET  MULTI_USER 
GO
ALTER DATABASE [technology] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [technology] SET DB_CHAINING OFF 
GO
ALTER DATABASE [technology] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [technology] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [technology]
GO
/****** Object:  StoredProcedure [dbo].[proc_login_auth]    Script Date: 02/04/2019 3:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_login_auth](@username varchar(50),@password varchar(50))
as begin
select * from UserTable where Username=@username and Password=@password
end
GO
/****** Object:  StoredProcedure [dbo].[Proc_Test]    Script Date: 02/04/2019 3:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery1.sql|7|0|C:\Users\HOME\AppData\Local\Temp\~vs7C89.sql
CREATE procedure [dbo].[Proc_Test](@Id int, @name varchar(45))
As
declare @query varchar(max)
begin
set @query='select * from TechnologyPerson where 1=1';
if @Id>0
set @query=@query+'and id='+CONVERT(varchar, @Id);
if @name is not null and @name <>'null' and @name <>''
set @query=@query+' and Name like '''+CONVERT(varchar, @Name)+'%''';
execute(@query)
--select @query;
end
GO
/****** Object:  Table [dbo].[Country]    Script Date: 02/04/2019 3:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[CId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TechnologyPerson]    Script Date: 02/04/2019 3:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TechnologyPerson](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Designation] [varchar](50) NULL,
	[ProfilePic] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 02/04/2019 3:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 02/04/2019 3:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Salary] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [technology] SET  READ_WRITE 
GO
