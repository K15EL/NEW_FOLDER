USE [master]
GO
/****** Object:  Database [StudySchedule]    Script Date: 30.04.2022 0:16:29 ******/
CREATE DATABASE [StudySchedule]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudySchedule', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StudySchedule.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudySchedule_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StudySchedule_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StudySchedule] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudySchedule].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudySchedule] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudySchedule] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudySchedule] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudySchedule] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudySchedule] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudySchedule] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudySchedule] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudySchedule] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudySchedule] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudySchedule] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudySchedule] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudySchedule] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudySchedule] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudySchedule] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudySchedule] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudySchedule] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudySchedule] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudySchedule] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudySchedule] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudySchedule] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudySchedule] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudySchedule] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudySchedule] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudySchedule] SET  MULTI_USER 
GO
ALTER DATABASE [StudySchedule] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudySchedule] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudySchedule] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudySchedule] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudySchedule] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudySchedule] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [StudySchedule] SET QUERY_STORE = OFF
GO
USE [StudySchedule]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 30.04.2022 0:16:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[group_id] [int] IDENTITY(1,1) NOT NULL,
	[faculty] [int] NOT NULL,
	[course] [int] NOT NULL,
	[number] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Less_time]    Script Date: 30.04.2022 0:16:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Less_time](
	[lesson_numb] [int] IDENTITY(1,1) NOT NULL,
	[beg_time] [time](7) NOT NULL,
	[end_time] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[lesson_numb] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lessons]    Script Date: 30.04.2022 0:16:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lessons](
	[less_id] [int] IDENTITY(1,1) NOT NULL,
	[less_type] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[less_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule_db]    Script Date: 30.04.2022 0:16:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule_db](
	[discipline_id] [int] IDENTITY(1,1) NOT NULL,
	[mdate] [date] NOT NULL,
	[lesson_numb] [int] NOT NULL,
	[less_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[discipline_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([group_id], [faculty], [course], [number]) VALUES (4, 8, 1, 102)
INSERT [dbo].[Groups] ([group_id], [faculty], [course], [number]) VALUES (5, 8, 2, 204)
INSERT [dbo].[Groups] ([group_id], [faculty], [course], [number]) VALUES (6, 8, 3, 303)
INSERT [dbo].[Groups] ([group_id], [faculty], [course], [number]) VALUES (7, 8, 4, 405)
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[Less_time] ON 

INSERT [dbo].[Less_time] ([lesson_numb], [beg_time], [end_time]) VALUES (1, CAST(N'09:00:00' AS Time), CAST(N'10:30:00' AS Time))
INSERT [dbo].[Less_time] ([lesson_numb], [beg_time], [end_time]) VALUES (2, CAST(N'10:45:00' AS Time), CAST(N'12:15:00' AS Time))
INSERT [dbo].[Less_time] ([lesson_numb], [beg_time], [end_time]) VALUES (3, CAST(N'13:00:00' AS Time), CAST(N'14:30:00' AS Time))
INSERT [dbo].[Less_time] ([lesson_numb], [beg_time], [end_time]) VALUES (4, CAST(N'14:45:00' AS Time), CAST(N'16:15:00' AS Time))
INSERT [dbo].[Less_time] ([lesson_numb], [beg_time], [end_time]) VALUES (5, CAST(N'16:30:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Less_time] ([lesson_numb], [beg_time], [end_time]) VALUES (6, CAST(N'18:15:00' AS Time), CAST(N'19:45:00' AS Time))
SET IDENTITY_INSERT [dbo].[Less_time] OFF
GO
SET IDENTITY_INSERT [dbo].[lessons] ON 

INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (1, N'Программирование')
INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (2, N'Иностранный язык')
INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (3, N'Физическая культура')
INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (4, N'Информатика')
INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (5, N'Линейная алгебра')
INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (6, N'Математический анализ')
INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (7, N'История')
INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (8, N'ТВиМС')
INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (9, N'Физика')
INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (10, N'Военная подготовка')
INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (11, N'Философия')
INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (12, N'Теоретическая механика')
INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (13, N'Теория функций')
INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (14, N'Экономика')
INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (15, N'БЖД')
INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (16, N'Численные методы')
INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (17, N'Случайные процессы')
INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (18, N'УрЧП')
INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (19, N'Методы оптимизации')
INSERT [dbo].[lessons] ([less_id], [less_type]) VALUES (20, N'Динамические системы')
SET IDENTITY_INSERT [dbo].[lessons] OFF
GO
SET IDENTITY_INSERT [dbo].[Schedule_db] ON 

INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (1, CAST(N'2022-04-26' AS Date), 2, 2, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (2, CAST(N'2022-04-26' AS Date), 3, 7, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (3, CAST(N'2022-04-27' AS Date), 2, 3, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (4, CAST(N'2022-04-27' AS Date), 3, 4, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (5, CAST(N'2022-04-27' AS Date), 4, 1, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (6, CAST(N'2022-04-28' AS Date), 1, 5, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (7, CAST(N'2022-04-28' AS Date), 2, 6, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (8, CAST(N'2022-04-28' AS Date), 3, 5, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (9, CAST(N'2022-04-28' AS Date), 4, 3, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (10, CAST(N'2022-04-29' AS Date), 2, 7, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (11, CAST(N'2022-04-29' AS Date), 3, 7, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (12, CAST(N'2022-04-30' AS Date), 3, 1, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (13, CAST(N'2022-04-30' AS Date), 4, 1, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (14, CAST(N'2022-05-03' AS Date), 2, 2, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (15, CAST(N'2022-05-03' AS Date), 3, 7, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (16, CAST(N'2022-05-04' AS Date), 1, 3, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (17, CAST(N'2022-05-04' AS Date), 2, 4, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (18, CAST(N'2022-05-04' AS Date), 3, 1, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (19, CAST(N'2022-05-05' AS Date), 1, 5, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (20, CAST(N'2022-05-05' AS Date), 2, 6, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (21, CAST(N'2022-05-05' AS Date), 3, 5, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (22, CAST(N'2022-05-05' AS Date), 4, 3, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (23, CAST(N'2022-05-06' AS Date), 2, 7, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (24, CAST(N'2022-05-06' AS Date), 3, 7, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (25, CAST(N'2022-05-07' AS Date), 3, 1, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (26, CAST(N'2022-05-07' AS Date), 4, 1, 4)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (27, CAST(N'2022-04-26' AS Date), 1, 8, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (28, CAST(N'2022-04-26' AS Date), 2, 2, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (29, CAST(N'2022-04-26' AS Date), 3, 6, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (30, CAST(N'2022-04-26' AS Date), 4, 9, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (31, CAST(N'2022-04-27' AS Date), 1, 10, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (32, CAST(N'2022-04-27' AS Date), 2, 10, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (33, CAST(N'2022-04-27' AS Date), 3, 10, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (34, CAST(N'2022-04-27' AS Date), 4, 10, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (35, CAST(N'2022-04-28' AS Date), 1, 11, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (36, CAST(N'2022-04-28' AS Date), 2, 9, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (37, CAST(N'2022-04-28' AS Date), 3, 6, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (38, CAST(N'2022-04-28' AS Date), 4, 12, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (39, CAST(N'2022-04-29' AS Date), 1, 12, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (40, CAST(N'2022-04-29' AS Date), 2, 12, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (41, CAST(N'2022-04-29' AS Date), 3, 13, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (42, CAST(N'2022-04-29' AS Date), 4, 3, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (43, CAST(N'2022-04-30' AS Date), 1, 11, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (44, CAST(N'2022-04-30' AS Date), 2, 14, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (45, CAST(N'2022-04-30' AS Date), 3, 15, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (46, CAST(N'2022-05-03' AS Date), 1, 8, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (47, CAST(N'2022-05-03' AS Date), 2, 2, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (48, CAST(N'2022-05-03' AS Date), 3, 6, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (49, CAST(N'2022-05-04' AS Date), 1, 10, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (50, CAST(N'2022-05-04' AS Date), 2, 10, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (51, CAST(N'2022-05-04' AS Date), 3, 10, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (52, CAST(N'2022-05-04' AS Date), 4, 10, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (53, CAST(N'2022-05-05' AS Date), 1, 11, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (54, CAST(N'2022-05-05' AS Date), 2, 9, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (55, CAST(N'2022-05-05' AS Date), 3, 6, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (56, CAST(N'2022-05-05' AS Date), 4, 12, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (57, CAST(N'2022-05-06' AS Date), 1, 9, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (58, CAST(N'2022-05-06' AS Date), 2, 9, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (59, CAST(N'2022-05-06' AS Date), 3, 13, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (60, CAST(N'2022-05-06' AS Date), 4, 3, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (61, CAST(N'2022-05-07' AS Date), 1, 14, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (62, CAST(N'2022-05-07' AS Date), 2, 11, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (63, CAST(N'2022-05-07' AS Date), 3, 14, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (64, CAST(N'2022-05-07' AS Date), 4, 15, 5)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (65, CAST(N'2022-04-26' AS Date), 1, 16, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (66, CAST(N'2022-04-26' AS Date), 2, 16, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (67, CAST(N'2022-04-26' AS Date), 3, 17, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (68, CAST(N'2022-04-26' AS Date), 4, 18, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (69, CAST(N'2022-04-27' AS Date), 2, 19, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (70, CAST(N'2022-04-27' AS Date), 3, 2, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (71, CAST(N'2022-04-28' AS Date), 1, 4, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (72, CAST(N'2022-04-28' AS Date), 2, 1, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (73, CAST(N'2022-04-28' AS Date), 3, 1, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (74, CAST(N'2022-04-28' AS Date), 4, 1, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (75, CAST(N'2022-04-29' AS Date), 1, 16, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (76, CAST(N'2022-04-29' AS Date), 2, 19, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (77, CAST(N'2022-04-29' AS Date), 3, 12, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (78, CAST(N'2022-04-29' AS Date), 4, 3, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (79, CAST(N'2022-04-30' AS Date), 1, 10, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (80, CAST(N'2022-04-30' AS Date), 2, 10, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (81, CAST(N'2022-04-30' AS Date), 3, 10, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (82, CAST(N'2022-04-30' AS Date), 4, 10, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (83, CAST(N'2022-05-03' AS Date), 1, 14, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (84, CAST(N'2022-05-03' AS Date), 2, 12, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (85, CAST(N'2022-05-03' AS Date), 3, 17, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (86, CAST(N'2022-05-03' AS Date), 4, 18, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (87, CAST(N'2022-05-04' AS Date), 2, 19, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (88, CAST(N'2022-05-04' AS Date), 3, 2, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (89, CAST(N'2022-05-05' AS Date), 1, 4, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (90, CAST(N'2022-05-05' AS Date), 2, 4, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (91, CAST(N'2022-05-05' AS Date), 3, 4, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (92, CAST(N'2022-05-05' AS Date), 4, 4, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (93, CAST(N'2022-05-06' AS Date), 1, 16, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (94, CAST(N'2022-05-06' AS Date), 2, 19, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (95, CAST(N'2022-05-06' AS Date), 3, 12, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (96, CAST(N'2022-05-06' AS Date), 4, 3, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (97, CAST(N'2022-05-07' AS Date), 1, 10, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (98, CAST(N'2022-05-07' AS Date), 2, 10, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (99, CAST(N'2022-05-07' AS Date), 3, 10, 6)
GO
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (100, CAST(N'2022-05-07' AS Date), 4, 10, 6)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (101, CAST(N'2022-04-26' AS Date), 1, 4, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (102, CAST(N'2022-04-26' AS Date), 2, 4, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (103, CAST(N'2022-04-26' AS Date), 3, 19, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (104, CAST(N'2022-04-26' AS Date), 4, 19, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (105, CAST(N'2022-04-27' AS Date), 1, 14, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (106, CAST(N'2022-04-27' AS Date), 2, 20, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (107, CAST(N'2022-04-27' AS Date), 3, 20, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (108, CAST(N'2022-04-28' AS Date), 1, 10, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (109, CAST(N'2022-04-28' AS Date), 2, 10, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (110, CAST(N'2022-04-28' AS Date), 3, 10, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (111, CAST(N'2022-04-28' AS Date), 4, 10, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (112, CAST(N'2022-04-29' AS Date), 1, 1, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (113, CAST(N'2022-04-29' AS Date), 2, 4, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (114, CAST(N'2022-05-03' AS Date), 1, 19, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (115, CAST(N'2022-05-03' AS Date), 2, 19, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (116, CAST(N'2022-05-03' AS Date), 3, 15, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (117, CAST(N'2022-05-03' AS Date), 4, 15, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (118, CAST(N'2022-05-04' AS Date), 1, 14, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (119, CAST(N'2022-05-04' AS Date), 2, 20, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (120, CAST(N'2022-05-04' AS Date), 3, 20, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (121, CAST(N'2022-05-05' AS Date), 1, 10, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (122, CAST(N'2022-05-05' AS Date), 2, 10, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (123, CAST(N'2022-05-05' AS Date), 3, 10, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (124, CAST(N'2022-05-05' AS Date), 4, 10, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (125, CAST(N'2022-05-06' AS Date), 1, 16, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (126, CAST(N'2022-05-06' AS Date), 2, 4, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (127, CAST(N'2022-05-06' AS Date), 3, 16, 7)
INSERT [dbo].[Schedule_db] ([discipline_id], [mdate], [lesson_numb], [less_id], [group_id]) VALUES (128, CAST(N'2022-05-06' AS Date), 4, 16, 7)
SET IDENTITY_INSERT [dbo].[Schedule_db] OFF
GO
ALTER TABLE [dbo].[Schedule_db]  WITH CHECK ADD FOREIGN KEY([group_id])
REFERENCES [dbo].[Groups] ([group_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Schedule_db]  WITH CHECK ADD FOREIGN KEY([less_id])
REFERENCES [dbo].[lessons] ([less_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Schedule_db]  WITH CHECK ADD FOREIGN KEY([lesson_numb])
REFERENCES [dbo].[Less_time] ([lesson_numb])
GO
USE [master]
GO
ALTER DATABASE [StudySchedule] SET  READ_WRITE 
GO
