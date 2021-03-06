USE [master]
GO
/****** Object:  Database [PeopleLocations]    Script Date: 7/12/2013 4:09:12 PM ******/
CREATE DATABASE [PeopleLocations]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PeopleLocations', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PeopleLocations.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PeopleLocations_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PeopleLocations_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PeopleLocations] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PeopleLocations].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PeopleLocations] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PeopleLocations] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PeopleLocations] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PeopleLocations] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PeopleLocations] SET ARITHABORT OFF 
GO
ALTER DATABASE [PeopleLocations] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PeopleLocations] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PeopleLocations] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PeopleLocations] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PeopleLocations] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PeopleLocations] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PeopleLocations] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PeopleLocations] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PeopleLocations] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PeopleLocations] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PeopleLocations] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PeopleLocations] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PeopleLocations] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PeopleLocations] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PeopleLocations] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PeopleLocations] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PeopleLocations] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PeopleLocations] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PeopleLocations] SET RECOVERY FULL 
GO
ALTER DATABASE [PeopleLocations] SET  MULTI_USER 
GO
ALTER DATABASE [PeopleLocations] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PeopleLocations] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PeopleLocations] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PeopleLocations] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PeopleLocations', N'ON'
GO
USE [PeopleLocations]
GO
/****** Object:  User [logteam]    Script Date: 7/12/2013 4:09:12 PM ******/
CREATE USER [logteam] FOR LOGIN [logteam] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 7/12/2013 4:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[AddressText] [nvarchar](50) NOT NULL,
	[CityId] [int] NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cities]    Script Date: 7/12/2013 4:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](30) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Continents]    Script Date: 7/12/2013 4:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continents](
	[ContinentId] [int] IDENTITY(1,1) NOT NULL,
	[ContinentName] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Continents] PRIMARY KEY CLUSTERED 
(
	[ContinentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 7/12/2013 4:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](50) NOT NULL,
	[ContinentId] [int] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[People]    Script Date: 7/12/2013 4:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[PersonFirstName] [nvarchar](50) NOT NULL,
	[PersonLastName] [nvarchar](50) NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([AddressId], [AddressText], [CityId]) VALUES (1, N'5 Oxford Street', 3)
INSERT [dbo].[Addresses] ([AddressId], [AddressText], [CityId]) VALUES (2, N'10 Latinka Street', 5)
INSERT [dbo].[Addresses] ([AddressId], [AddressText], [CityId]) VALUES (3, N'1 Microsoft Way', 6)
INSERT [dbo].[Addresses] ([AddressId], [AddressText], [CityId]) VALUES (4, N'500 Oracle Parkway', 7)
SET IDENTITY_INSERT [dbo].[Addresses] OFF
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([CityId], [CityName], [CountryId]) VALUES (1, N'Cairo', 4)
INSERT [dbo].[Cities] ([CityId], [CityName], [CountryId]) VALUES (2, N'Washington, DC', 3)
INSERT [dbo].[Cities] ([CityId], [CityName], [CountryId]) VALUES (3, N'London', 5)
INSERT [dbo].[Cities] ([CityId], [CityName], [CountryId]) VALUES (4, N'Berlin', 2)
INSERT [dbo].[Cities] ([CityId], [CityName], [CountryId]) VALUES (5, N'Sofia', 1)
INSERT [dbo].[Cities] ([CityId], [CityName], [CountryId]) VALUES (6, N'Redmond', 3)
INSERT [dbo].[Cities] ([CityId], [CityName], [CountryId]) VALUES (7, N'Redwood City', 3)
SET IDENTITY_INSERT [dbo].[Cities] OFF
SET IDENTITY_INSERT [dbo].[Continents] ON 

INSERT [dbo].[Continents] ([ContinentId], [ContinentName]) VALUES (1, N'Asia')
INSERT [dbo].[Continents] ([ContinentId], [ContinentName]) VALUES (2, N'Africa')
INSERT [dbo].[Continents] ([ContinentId], [ContinentName]) VALUES (3, N'North America')
INSERT [dbo].[Continents] ([ContinentId], [ContinentName]) VALUES (4, N'South America')
INSERT [dbo].[Continents] ([ContinentId], [ContinentName]) VALUES (5, N'Antarctica')
INSERT [dbo].[Continents] ([ContinentId], [ContinentName]) VALUES (6, N'Europe')
INSERT [dbo].[Continents] ([ContinentId], [ContinentName]) VALUES (7, N'Australia')
SET IDENTITY_INSERT [dbo].[Continents] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountryId], [CountryName], [ContinentId]) VALUES (1, N'Bulgaria', 6)
INSERT [dbo].[Countries] ([CountryId], [CountryName], [ContinentId]) VALUES (2, N'Germany', 6)
INSERT [dbo].[Countries] ([CountryId], [CountryName], [ContinentId]) VALUES (3, N'USA', 3)
INSERT [dbo].[Countries] ([CountryId], [CountryName], [ContinentId]) VALUES (4, N'Egypt', 2)
INSERT [dbo].[Countries] ([CountryId], [CountryName], [ContinentId]) VALUES (5, N'UK', 6)
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([PersonId], [PersonFirstName], [PersonLastName], [AddressId]) VALUES (1, N'William', N'Gates', 3)
INSERT [dbo].[People] ([PersonId], [PersonFirstName], [PersonLastName], [AddressId]) VALUES (2, N'Larry', N'Ellison', 4)
SET IDENTITY_INSERT [dbo].[People] OFF
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([CityId])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Cities]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Countries]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Continents] FOREIGN KEY([ContinentId])
REFERENCES [dbo].[Continents] ([ContinentId])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Continents]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Addresses] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Addresses]
GO
USE [master]
GO
ALTER DATABASE [PeopleLocations] SET  READ_WRITE 
GO
