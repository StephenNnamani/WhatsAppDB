USE [master]
GO
/****** Object:  Database [DBWhatsapp]    Script Date: 02/02/2023 15:50:33 ******/
CREATE DATABASE [DBWhatsapp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBWhatsapp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.AMARACHIDB\MSSQL\DATA\DBWhatsapp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBWhatsapp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.AMARACHIDB\MSSQL\DATA\DBWhatsapp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBWhatsapp] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBWhatsapp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBWhatsapp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBWhatsapp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBWhatsapp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBWhatsapp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBWhatsapp] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBWhatsapp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBWhatsapp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBWhatsapp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBWhatsapp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBWhatsapp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBWhatsapp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBWhatsapp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBWhatsapp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBWhatsapp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBWhatsapp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBWhatsapp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBWhatsapp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBWhatsapp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBWhatsapp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBWhatsapp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBWhatsapp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBWhatsapp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBWhatsapp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBWhatsapp] SET  MULTI_USER 
GO
ALTER DATABASE [DBWhatsapp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBWhatsapp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBWhatsapp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBWhatsapp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBWhatsapp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBWhatsapp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBWhatsapp] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBWhatsapp] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBWhatsapp]
GO
/****** Object:  Table [dbo].[Chats]    Script Date: 02/02/2023 15:50:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chats](
	[ChatID] [uniqueidentifier] NOT NULL,
	[SenderID] [uniqueidentifier] NOT NULL,
	[ReceiverID] [uniqueidentifier] NOT NULL,
	[Message] [text] NOT NULL,
	[Timestamp] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupMembers]    Script Date: 02/02/2023 15:50:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMembers](
	[GroupID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 02/02/2023 15:50:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[GroupID] [uniqueidentifier] NOT NULL,
	[GroupName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status_Views]    Script Date: 02/02/2023 15:50:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status_Views](
	[ViewID] [uniqueidentifier] NOT NULL,
	[StatusID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[IsViewed] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ViewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 02/02/2023 15:50:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[StatusID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[Number_of_Views] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/02/2023 15:50:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [uniqueidentifier] NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Profile_Pictures] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Chats] ([ChatID], [SenderID], [ReceiverID], [Message], [Timestamp]) VALUES (N'e5d42a16-16ec-45b6-a7b5-08388229d1b8', N'8562b1c3-b233-40fa-991e-7370ce3e06d9', N'0285b454-4d49-45fe-8cbf-75e6c030d6a1', N'Hi there!', CAST(N'2023-02-01T09:00:00.000' AS DateTime))
INSERT [dbo].[Chats] ([ChatID], [SenderID], [ReceiverID], [Message], [Timestamp]) VALUES (N'b48ad776-dbc8-4531-8014-f75b013dd68e', N'0285b454-4d49-45fe-8cbf-75e6c030d6a1', N'8562b1c3-b233-40fa-991e-7370ce3e06d9', N'How are you', CAST(N'2023-02-01T09:05:00.000' AS DateTime))
GO
INSERT [dbo].[GroupMembers] ([GroupID], [UserID]) VALUES (N'14ae592e-8eb1-4231-904d-17080be7e853', N'8562b1c3-b233-40fa-991e-7370ce3e06d9')
INSERT [dbo].[GroupMembers] ([GroupID], [UserID]) VALUES (N'14ae592e-8eb1-4231-904d-17080be7e853', N'15b0bc9e-1215-459b-bbc1-e1482c31e43c')
INSERT [dbo].[GroupMembers] ([GroupID], [UserID]) VALUES (N'f9c7eb82-0123-4fdc-9811-40e44d27ebb8', N'fc65f568-4c8e-4793-80a4-841c8e791f4d')
INSERT [dbo].[GroupMembers] ([GroupID], [UserID]) VALUES (N'f9c7eb82-0123-4fdc-9811-40e44d27ebb8', N'15b0bc9e-1215-459b-bbc1-e1482c31e43c')
GO
INSERT [dbo].[Groups] ([GroupID], [GroupName]) VALUES (N'14ae592e-8eb1-4231-904d-17080be7e853', N'Bezao')
INSERT [dbo].[Groups] ([GroupID], [GroupName]) VALUES (N'f9c7eb82-0123-4fdc-9811-40e44d27ebb8', N'Genesys')
GO
INSERT [dbo].[Users] ([UserID], [UserName], [PhoneNumber], [Profile_Pictures]) VALUES (N'8562b1c3-b233-40fa-991e-7370ce3e06d9', N'Mary MAry', N'+234-45678907', NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [PhoneNumber], [Profile_Pictures]) VALUES (N'0285b454-4d49-45fe-8cbf-75e6c030d6a1', N'Mary', N'+234-4567890', NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [PhoneNumber], [Profile_Pictures]) VALUES (N'fc65f568-4c8e-4793-80a4-841c8e791f4d', N'John Soma', N'+234-87654329', NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [PhoneNumber], [Profile_Pictures]) VALUES (N'15b0bc9e-1215-459b-bbc1-e1482c31e43c', N'John', N'+234-8765432', NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__85FB4E38DA8CF566]    Script Date: 02/02/2023 15:50:33 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Status_Views] ADD  DEFAULT ((0)) FOR [IsViewed]
GO
ALTER TABLE [dbo].[Chats]  WITH CHECK ADD FOREIGN KEY([ReceiverID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Chats]  WITH CHECK ADD FOREIGN KEY([SenderID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[GroupMembers]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
GO
ALTER TABLE [dbo].[GroupMembers]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Status_Views]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])
GO
ALTER TABLE [dbo].[Status_Views]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Statuses]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
USE [master]
GO
ALTER DATABASE [DBWhatsapp] SET  READ_WRITE 
GO
