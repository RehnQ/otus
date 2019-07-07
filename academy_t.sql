USE [master]
GO
/****** Object:  Database [academy]    Script Date: 07.07.2019 14:56:05 ******/
CREATE DATABASE [academy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'e-shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\e-shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'e-shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\e-shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [academy] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [academy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [academy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [academy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [academy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [academy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [academy] SET ARITHABORT OFF 
GO
ALTER DATABASE [academy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [academy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [academy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [academy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [academy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [academy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [academy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [academy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [academy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [academy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [academy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [academy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [academy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [academy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [academy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [academy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [academy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [academy] SET RECOVERY FULL 
GO
ALTER DATABASE [academy] SET  MULTI_USER 
GO
ALTER DATABASE [academy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [academy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [academy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [academy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [academy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [academy] SET QUERY_STORE = OFF
GO
USE [academy]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 07.07.2019 14:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[balance] [float] NULL,
	[modification_date] [datetime] NULL,
	[name] [varchar](100) NULL,
	[object_id] [int] NULL,
	[currency_type_id] [varchar](3) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK__accounts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_acc] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[active_learnings]    Script Date: 07.07.2019 14:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[active_learnings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NULL,
	[person_id] [int] NULL,
	[score] [smallint] NULL,
 CONSTRAINT [PK__active_learnings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 07.07.2019 14:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[id] [int] NOT NULL,
	[name] [varchar](100) NULL,
	[price] [float] NULL,
	[max_score] [smallint] NULL,
	[passing_score] [smallint] NULL,
	[status_id] [int] NULL,
 CONSTRAINT [PK__courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[learnings]    Script Date: 07.07.2019 14:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[learnings](
	[id] [int] NOT NULL,
	[course_id] [int] NULL,
	[person_id] [int] NULL,
	[start_learning_date] [date] NULL,
	[end_learning_date] [date] NULL,
	[score] [smallint] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK__learnings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[positions]    Script Date: 07.07.2019 14:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[positions](
	[id] [int] NOT NULL,
	[name] [varchar](30) NULL,
 CONSTRAINT [PK__positions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status_course]    Script Date: 07.07.2019 14:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_course](
	[id] [int] NOT NULL,
	[status] [varchar](20) NULL,
 CONSTRAINT [PK_status_course_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status_learning]    Script Date: 07.07.2019 14:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_learning](
	[id] [int] NOT NULL,
	[status] [varchar](20) NULL,
 CONSTRAINT [PK_status_learning_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 07.07.2019 14:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[id] [int] NOT NULL,
	[fullname] [varchar](100) NULL,
	[login] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[birth_date] [date] NULL,
	[sex] [varchar](1) NULL,
	[position_parent_id] [int] NULL,
 CONSTRAINT [PK__students] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactions]    Script Date: 07.07.2019 14:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NULL,
	[receipt] [float] NULL,
	[modification_date] [datetime] NULL,
	[account_id] [int] NULL,
	[expense] [float] NULL,
 CONSTRAINT [PK_transactions_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20190615-170054]    Script Date: 07.07.2019 14:56:05 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20190615-170054] ON [dbo].[accounts]
(
	[balance] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20190620-234302]    Script Date: 07.07.2019 14:56:05 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20190620-234302] ON [dbo].[active_learnings]
(
	[course_id] ASC,
	[person_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20190615-172416]    Script Date: 07.07.2019 14:56:05 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20190615-172416] ON [dbo].[learnings]
(
	[course_id] ASC,
	[person_id] ASC,
	[score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20190615-172557]    Script Date: 07.07.2019 14:56:05 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20190615-172557] ON [dbo].[students]
(
	[fullname] ASC,
	[login] ASC,
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20190615-173230]    Script Date: 07.07.2019 14:56:05 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20190615-173230] ON [dbo].[transactions]
(
	[date] ASC,
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[accounts]  WITH CHECK ADD  CONSTRAINT [FK_accounts_students_id] FOREIGN KEY([object_id])
REFERENCES [dbo].[students] ([id])
GO
ALTER TABLE [dbo].[accounts] CHECK CONSTRAINT [FK_accounts_students_id]
GO
ALTER TABLE [dbo].[active_learnings]  WITH CHECK ADD  CONSTRAINT [FK_active_learnings_courses_id] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[active_learnings] CHECK CONSTRAINT [FK_active_learnings_courses_id]
GO
ALTER TABLE [dbo].[active_learnings]  WITH CHECK ADD  CONSTRAINT [FK_active_learnings_students_id] FOREIGN KEY([person_id])
REFERENCES [dbo].[students] ([id])
GO
ALTER TABLE [dbo].[active_learnings] CHECK CONSTRAINT [FK_active_learnings_students_id]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_status_course_id] FOREIGN KEY([status_id])
REFERENCES [dbo].[status_course] ([id])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_status_course_id]
GO
ALTER TABLE [dbo].[learnings]  WITH CHECK ADD  CONSTRAINT [FK_learnings_courses_id] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[learnings] CHECK CONSTRAINT [FK_learnings_courses_id]
GO
ALTER TABLE [dbo].[learnings]  WITH CHECK ADD  CONSTRAINT [FK_learnings_status_learning_id] FOREIGN KEY([status])
REFERENCES [dbo].[status_learning] ([id])
GO
ALTER TABLE [dbo].[learnings] CHECK CONSTRAINT [FK_learnings_status_learning_id]
GO
ALTER TABLE [dbo].[learnings]  WITH CHECK ADD  CONSTRAINT [FK_learnings_students_id] FOREIGN KEY([person_id])
REFERENCES [dbo].[students] ([id])
GO
ALTER TABLE [dbo].[learnings] CHECK CONSTRAINT [FK_learnings_students_id]
GO
ALTER TABLE [dbo].[students]  WITH CHECK ADD  CONSTRAINT [FK_students_positions_id] FOREIGN KEY([position_parent_id])
REFERENCES [dbo].[positions] ([id])
GO
ALTER TABLE [dbo].[students] CHECK CONSTRAINT [FK_students_positions_id]
GO
ALTER TABLE [dbo].[transactions]  WITH CHECK ADD  CONSTRAINT [FK_transactions_accounts_id] FOREIGN KEY([account_id])
REFERENCES [dbo].[accounts] ([id])
GO
ALTER TABLE [dbo].[transactions] CHECK CONSTRAINT [FK_transactions_accounts_id]
GO
ALTER TABLE [dbo].[transactions]  WITH CHECK ADD  CONSTRAINT [CHK_Trn] CHECK  (([receipt]>(0)))
GO
ALTER TABLE [dbo].[transactions] CHECK CONSTRAINT [CHK_Trn]
GO
ALTER TABLE [dbo].[transactions]  WITH CHECK ADD  CONSTRAINT [CHK_Trn2] CHECK  (([expense]>(0)))
GO
ALTER TABLE [dbo].[transactions] CHECK CONSTRAINT [CHK_Trn2]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'счета студентов' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'accounts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'для отслеживания прогресса студентов по актуальному обучению' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'active_learnings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'c наименованиями, статусом, стоимостью, максимальным и проходным баллом' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'courses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'c датами начала и окончания обучения и результатом' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'learnings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'здесь указаны сферы, где работают студенты' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'positions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'словарь для статусов по курсам (активный, в разработке, архивный)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'status_course'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'словарь для статусов по обучению' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'status_learning'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'с дополнительными параметрами (дата рождения) + информация из таблицы positions для сбора статистики' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'students'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'для отслеживания прихода/расхода средств' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'transactions'
GO
USE [master]
GO
ALTER DATABASE [academy] SET  READ_WRITE 
GO
