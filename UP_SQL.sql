USE [master]
GO
/****** Object:  Database [Biomater]    Script Date: 06.04.2024 13:37:54 ******/
CREATE DATABASE [Biomater]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Biomater', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Biomater.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Biomater_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Biomater_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Biomater] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Biomater].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Biomater] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Biomater] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Biomater] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Biomater] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Biomater] SET ARITHABORT OFF 
GO
ALTER DATABASE [Biomater] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Biomater] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Biomater] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Biomater] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Biomater] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Biomater] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Biomater] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Biomater] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Biomater] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Biomater] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Biomater] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Biomater] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Biomater] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Biomater] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Biomater] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Biomater] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Biomater] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Biomater] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Biomater] SET  MULTI_USER 
GO
ALTER DATABASE [Biomater] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Biomater] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Biomater] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Biomater] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Biomater] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Biomater] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Biomater] SET QUERY_STORE = OFF
GO
USE [Biomater]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 06.04.2024 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[path] [nvarchar](max) NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Server$]    Script Date: 06.04.2024 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Server$](
	[Code] [int] IDENTITY(1,1) NOT NULL,
	[Service] [nvarchar](255) NULL,
	[Price] [nvarchar](255) NULL,
	[Анализатор] [nvarchar](50) NULL,
 CONSTRAINT [PK_Server$] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User$]    Script Date: 06.04.2024 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User$](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[login] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[ip] [nvarchar](255) NULL,
	[lastenter] [date] NULL,
	[services] [nvarchar](255) NULL,
	[type] [int] NULL,
	[Time] [nvarchar](50) NULL,
	[foto] [nvarchar](100) NULL,
	[email] [nchar](30) NULL,
	[Телефон] [nvarchar](11) NULL,
	[Статус] [bit] NULL,
	[LastActiveTime] [time](7) NULL,
 CONSTRAINT [PK_User$] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Администратор]    Script Date: 06.04.2024 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Администратор](
	[Код_администратора] [int] IDENTITY(1,1) NOT NULL,
	[Логин] [nchar](20) NULL,
	[Пароль] [nchar](20) NULL,
 CONSTRAINT [PK_Администратор] PRIMARY KEY CLUSTERED 
(
	[Код_администратора] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Анализатор]    Script Date: 06.04.2024 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Анализатор](
	[Код_анализатора] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Анализатор] PRIMARY KEY CLUSTERED 
(
	[Код_анализатора] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Биоматериал]    Script Date: 06.04.2024 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Биоматериал](
	[Код_биоматериала] [int] IDENTITY(1,1) NOT NULL,
	[Код_штрихкода] [int] NULL,
	[Наименование] [nchar](30) NULL,
	[Код_заказа] [int] NULL,
 CONSTRAINT [PK_Биоматериал] PRIMARY KEY CLUSTERED 
(
	[Код_биоматериала] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Бухгалтер]    Script Date: 06.04.2024 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Бухгалтер](
	[Код_бухгалтера] [int] IDENTITY(1,1) NOT NULL,
	[Логин] [nchar](20) NULL,
	[Пароль] [nchar](20) NULL,
	[ФИО] [nchar](100) NULL,
	[Последняя_дата] [datetime] NULL,
	[Набор_услуг] [nchar](100) NULL,
	[Страховой_счёт] [int] NULL,
 CONSTRAINT [PK_Бухгалтер] PRIMARY KEY CLUSTERED 
(
	[Код_бухгалтера] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 06.04.2024 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[Код_заказа] [int] IDENTITY(1,1) NOT NULL,
	[Дата_создания] [datetime] NULL,
	[Код_услуги] [int] NULL,
	[Статус_услуги] [nchar](20) NULL,
	[Статус_заказа] [nchar](20) NULL,
	[Время_выполнения] [int] NULL,
	[Код_биоматериала] [int] NULL,
	[Код_пациента] [int] NULL,
 CONSTRAINT [PK_Заказ] PRIMARY KEY CLUSTERED 
(
	[Код_заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Лаборант]    Script Date: 06.04.2024 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Лаборант](
	[Код_лаборанта] [int] IDENTITY(1,1) NOT NULL,
	[Логин] [nchar](20) NULL,
	[Пароль] [nchar](20) NULL,
	[ФИО] [nchar](100) NULL,
	[Последняя_дата] [datetime] NULL,
	[Набор_услуг] [nchar](100) NULL,
 CONSTRAINT [PK_Лаборант] PRIMARY KEY CLUSTERED 
(
	[Код_лаборанта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Лист1$]    Script Date: 06.04.2024 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Лист1$](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[услуги_id] [int] NULL,
 CONSTRAINT [PK_Лист1$] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Оказанная_услуга]    Script Date: 06.04.2024 13:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Оказанная_услуга](
	[Код_оказанной_услуги] [int] NOT NULL,
	[Код_услуги] [int] IDENTITY(1,1) NOT NULL,
	[Дата_оказания] [date] NULL,
	[Код_лаборанта] [int] NULL,
	[Код_анализатора] [int] NOT NULL,
	[Отчет] [nchar](150) NULL,
 CONSTRAINT [PK_Оказанная_услуга] PRIMARY KEY CLUSTERED 
(
	[Код_оказанной_услуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Паспорт]    Script Date: 06.04.2024 13:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Паспорт](
	[Код_паспорта] [int] IDENTITY(1,1) NOT NULL,
	[Серия] [int] NULL,
	[Номер] [int] NULL,
 CONSTRAINT [PK_Паспорт] PRIMARY KEY CLUSTERED 
(
	[Код_паспорта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пациент]    Script Date: 06.04.2024 13:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пациент](
	[Код_пациента] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [nchar](50) NULL,
	[Дата_рождения] [date] NULL,
	[Код_паспорта] [int] NULL,
	[Телефон] [nvarchar](11) NULL,
	[email] [nchar](30) NULL,
	[Код_полиса] [int] NULL,
	[Код_страховой] [int] NOT NULL,
 CONSTRAINT [PK_Пациент] PRIMARY KEY CLUSTERED 
(
	[Код_пациента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Полис]    Script Date: 06.04.2024 13:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Полис](
	[Код_полиса] [int] IDENTITY(1,1) NOT NULL,
	[Номер_полиса] [nvarchar](50) NULL,
	[Тип_полиса] [nchar](20) NULL,
 CONSTRAINT [PK_Полис] PRIMARY KEY CLUSTERED 
(
	[Код_полиса] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователь]    Script Date: 06.04.2024 13:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователь](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [nvarchar](255) NULL,
	[email] [nchar](30) NULL,
	[Логин] [nchar](30) NULL,
	[Пароль] [nchar](30) NULL,
	[Тип_пользователя] [int] NULL,
 CONSTRAINT [PK_Пользователь] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Страховая]    Script Date: 06.04.2024 13:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Страховая](
	[Код_страховой] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nchar](20) NULL,
	[Адрес] [nchar](30) NULL,
	[ИНН] [nvarchar](50) NULL,
	[р/с] [int] NULL,
	[БИК] [int] NOT NULL,
 CONSTRAINT [PK_Страховая] PRIMARY KEY CLUSTERED 
(
	[Код_страховой] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тип_пользователя]    Script Date: 06.04.2024 13:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тип_пользователя](
	[Код_пользователя] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nchar](20) NULL,
 CONSTRAINT [PK_Тип_пользователя] PRIMARY KEY CLUSTERED 
(
	[Код_пользователя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Услуги_лаб]    Script Date: 06.04.2024 13:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Услуги_лаб](
	[Код_услуги] [int] NOT NULL,
	[Код_наименования] [int] IDENTITY(1,1) NOT NULL,
	[Стоимость] [int] NULL,
	[Срок_выполнения] [datetime] NULL,
	[Среднее_отклонение] [int] NOT NULL,
 CONSTRAINT [PK_Услуги_лаб] PRIMARY KEY CLUSTERED 
(
	[Код_услуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Server$] ON 
GO
INSERT [dbo].[Server$] ([Code], [Service], [Price], [Анализатор]) VALUES (176, N'Билирубин общий', N'102.85', N'1')
GO
INSERT [dbo].[Server$] ([Code], [Service], [Price], [Анализатор]) VALUES (229, N'СПИД', N'341.78', N'2')
GO
INSERT [dbo].[Server$] ([Code], [Service], [Price], [Анализатор]) VALUES (258, N'Креатинин', N'143.22', N'2')
GO
INSERT [dbo].[Server$] ([Code], [Service], [Price], [Анализатор]) VALUES (287, N'Волчаночный антикоагулянт', N'290.11', N'1')
GO
INSERT [dbo].[Server$] ([Code], [Service], [Price], [Анализатор]) VALUES (311, N'Амилаза', N'361.88', N'2')
GO
INSERT [dbo].[Server$] ([Code], [Service], [Price], [Анализатор]) VALUES (323, N'Глюкоза', N'447.65', N'2')
GO
INSERT [dbo].[Server$] ([Code], [Service], [Price], [Анализатор]) VALUES (346, N'Общий белок', N'396.03', N'2')
GO
INSERT [dbo].[Server$] ([Code], [Service], [Price], [Анализатор]) VALUES (415, N'Кальций общий', N'419.9', N'2')
GO
INSERT [dbo].[Server$] ([Code], [Service], [Price], [Анализатор]) VALUES (501, N'Гепатит В', N'176.83', N'2')
GO
INSERT [dbo].[Server$] ([Code], [Service], [Price], [Анализатор]) VALUES (543, N'Гепатит С', N'289.99', N'1')
GO
INSERT [dbo].[Server$] ([Code], [Service], [Price], [Анализатор]) VALUES (548, N'Альбумин', N'234.09', N'1')
GO
INSERT [dbo].[Server$] ([Code], [Service], [Price], [Анализатор]) VALUES (557, N'ВИЧ', N'490.77', N'2')
GO
INSERT [dbo].[Server$] ([Code], [Service], [Price], [Анализатор]) VALUES (619, N'TSH', N'262.71', N'1')
GO
INSERT [dbo].[Server$] ([Code], [Service], [Price], [Анализатор]) VALUES (659, N'Сифилис RPR', N'443.66', N'1')
GO
INSERT [dbo].[Server$] ([Code], [Service], [Price], [Анализатор]) VALUES (797, N'АТ и АГ к ВИЧ 1/2', N'370.62', N'1')
GO
INSERT [dbo].[Server$] ([Code], [Service], [Price], [Анализатор]) VALUES (836, N'Железо', N'105.32', N'1')
GO
INSERT [dbo].[Server$] ([Code], [Service], [Price], [Анализатор]) VALUES (855, N'Ковид IgM', N'209.78', N'1')
GO
SET IDENTITY_INSERT [dbo].[Server$] OFF
GO
SET IDENTITY_INSERT [dbo].[User$] ON 
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (1, N'Biol Lolly', N'LIonGin12', N'ihIOU9gj', N'147.231.50.234', CAST(N'2024-03-28' AS Date), N'[{"code":557},{"code":836},{"code":287}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, 1, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (2, N'Northrop Mably', N'nmably1', N'ukM0e6', N'22.32.15.211', CAST(N'2024-04-06' AS Date), N'[{"code":855},{"code":619},{"code":557},{"code":836},{"code":548}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, 1, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (3, N'Fabian Rolf', N'frolf2', N'7QpCwac0yi', N'113.92.142.29', CAST(N'2024-04-06' AS Date), N'[{"code":543},{"code":836}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, 1, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (4, N'Lauree Raden', N'lraden3', N'5Ydp2mz', N'39.24.146.52', CAST(N'1900-01-01' AS Date), N'[{"code":855},{"code":258}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (5, N'Barby Follos', N'bfollos4', N'ckmAJPQV', N'87.232.97.3', NULL, N'[{"code":543},{"code":415},{"code":619},{"code":557}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (6, N'Mile Enterle', N'menterle5', N'0PRom6i', N'85.121.209.6', NULL, N'[{"code":557},{"code":836},{"code":229}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (7, N'Midge Peaker', N'mpeaker6', N'0Tc5oRc', N'196.39.132.128', NULL, N'[{"code":287},{"code":619},{"code":548},{"code":346}]', 4, NULL, N'Администратор.jpg', NULL, NULL, 1, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (8, N'Manon Robichon', N'mrobichon7', N'LEwEjMlmE5X', N'143.159.207.105', CAST(N'1900-01-01' AS Date), N'[{"code":415},{"code":311},{"code":176},{"code":855}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (9, N'Stavro Robken', N'srobken8', N'Cbmj3Yi', N'12.154.73.196', CAST(N'1900-01-01' AS Date), N'[{"code":323},{"code":548},{"code":346}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, 1, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (10, N'Bryan Tidmas', N'btidmas9', N'dYDHbBQfK', N'24.42.134.21', CAST(N'1900-01-01' AS Date), N'[{"code":229},{"code":346},{"code":501},{"code":548}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (11, N'Jeannette Fussie', N'jfussiea', N'EGxXuLQ9', N'98.194.112.137', CAST(N'1900-01-01' AS Date), N'[{"code":287}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (12, N'Stephen Antonacci', N'santonaccib', N'YcXAhY3Pja', N'198.146.255.15', CAST(N'1900-01-01' AS Date), N'[{"code":619},{"code":258},{"code":229},{"code":557},{"code":797}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (13, N'Niccolo Bountiff', N'nbountiffc', N'5xfyjS9ZULGA', N'231.78.246.229', CAST(N'2024-03-27' AS Date), N'[{"code":323},{"code":311},{"code":557}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (14, N'Clemente Benjefield', N'cbenjefieldd', N'tQOsP0ei9TuD', N'88.126.93.246', CAST(N'1900-01-01' AS Date), N'[{"code":855},{"code":176},{"code":176},{"code":855}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (15, N'Orlan Corbyn', N'ocorbyne', N'bG1ZIzwIoU', N'232.175.48.179', CAST(N'1900-01-01' AS Date), N'[{"code":229},{"code":836},{"code":287},{"code":619}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (16, N'Coreen Stickins', N'cstickinsf', N'QRYADbgNj', N'64.30.175.158', CAST(N'1900-01-01' AS Date), N'[{"code":557}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (17, N'Daveta Clarage', N'dclarageg', N'Yp59ZIDnWe', N'139.88.229.111', CAST(N'1900-01-01' AS Date), N'[{"code":346},{"code":836},{"code":346}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (18, N'Javier McCawley', N'jmccawleyh', N'g58zLcmCYON', N'14.199.67.32', CAST(N'1900-01-01' AS Date), N'[{"code":619},{"code":258}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (19, N'Daile Band', N'dbandi', N'yFAaYuVW', N'206.105.148.56', CAST(N'1900-01-01' AS Date), N'[{"code":176},{"code":543},{"code":855},{"code":258}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (20, N'Angil Buttery', N'abutteryj', N'ttOFbWWGtD', N'192.158.7.138', CAST(N'1900-01-01' AS Date), N'[{"code":323},{"code":855},{"code":659},{"code":287}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (21, N'Kyla Kinman', N'kkinmank', N'qUr6fdWP6L5G', N'134.99.243.113', CAST(N'1900-01-01' AS Date), N'[{"code":346},{"code":855},{"code":323},{"code":557},{"code":501}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (22, N'Selena Skepper', N'sskepperl', N'jHYN0v3', N'52.90.89.126', CAST(N'1900-01-01' AS Date), N'[{"code":855},{"code":287}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (23, N'Alyson Yeoland', N'ayeolandm', N'QQezRBV9', N'239.7.55.187', CAST(N'1900-01-01' AS Date), N'[{"code":836},{"code":836},{"code":229},{"code":258},{"code":836}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (24, N'Claudie Speeding', N'cspeedingn', N'UCLYITfw2Vo', N'127.37.194.127', CAST(N'1900-01-01' AS Date), N'[{"code":548},{"code":557},{"code":176}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (25, N'Alaric Scarisbrick', N'ascarisbricko', N'fzBcv6GbyCp', N'97.227.15.172', CAST(N'1900-01-01' AS Date), N'[{"code":543},{"code":836}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (26, N'Marie Thurby', N'mthurbyp', N'wg0uIskqei', N'94.70.148.135', CAST(N'1900-01-01' AS Date), N'[{"code":548},{"code":855}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (27, N'Cloe Roxbrough', N'croxbroughq', N'67CVVym', N'185.110.201.36', CAST(N'1900-01-01' AS Date), N'[{"code":501},{"code":797},{"code":797}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (28, N'Pegeen McCotter', N'pmccotterr', N'QG5tdzRpGZJ2', N'22.179.187.229', CAST(N'1900-01-01' AS Date), N'[{"code":176},{"code":855}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (29, N'Iggie Calleja', N'icallejas', N'aeDvZk8o9', N'67.237.123.227', CAST(N'1900-01-01' AS Date), N'[{"code":836},{"code":176},{"code":619},{"code":258}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (30, N'Nelle Brosch', N'nbroscht', N'DmPJt2', N'251.1.59.65', CAST(N'1900-01-01' AS Date), N'[{"code":346}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (31, N'Shae Allsepp', N'sallseppu', N't0ko0854Cpvv', N'88.20.74.85', CAST(N'1900-01-01' AS Date), N'[{"code":548},{"code":229},{"code":258},{"code":619}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (32, N'Eldridge Abbatucci', N'eabbatucciv', N'gUtNdsDu', N'52.44.134.126', CAST(N'1900-01-01' AS Date), N'[{"code":836},{"code":836},{"code":797}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (33, N'Skip Garnham', N'sgarnhamw', N'eml6RqbK', N'100.17.131.54', CAST(N'1900-01-01' AS Date), N'[{"code":548}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (34, N'Ric Kitchenside', N'rkitchensidex', N'xaa7miQ7yB', N'29.100.76.146', CAST(N'1900-01-01' AS Date), N'[{"code":501},{"code":258},{"code":659},{"code":501},{"code":659}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (35, N'Urbanus Di Meo', N'udiy', N'dHqu78cU6NOP', N'90.30.202.251', CAST(N'1900-01-01' AS Date), N'[{"code":797},{"code":287},{"code":855},{"code":346}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (36, N'Monty Beidebeke', N'mbeidebekez', N'F5T5spAU9A4O', N'3.32.202.92', CAST(N'1900-01-01' AS Date), N'[{"code":415},{"code":543},{"code":836}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (37, N'Byrann Savins', N'bsavins10', N'l6sYf29NLN', N'123.187.14.103', CAST(N'1900-01-01' AS Date), N'[{"code":836}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (38, N'Sonnie Riby', N'sriby11', N'Va34LYqFh', N'16.81.16.23', CAST(N'1900-01-01' AS Date), N'[{"code":501}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (39, N'Sherill Birney', N'sbirney12', N'Ggygo2ePsETs', N'144.76.193.237', CAST(N'1900-01-01' AS Date), N'[{"code":836},{"code":258},{"code":619}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (40, N'Indira Kleanthous', N'ikleanthous13', N'3H0GS7a', N'169.108.108.88', CAST(N'1900-01-01' AS Date), N'[{"code":797},{"code":346},{"code":543},{"code":501},{"code":258}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (41, N'Maison Skerme', N'mskerme14', N'wy1HWA', N'143.177.136.232', CAST(N'1900-01-01' AS Date), N'[{"code":176},{"code":619}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (42, N'Hanan Cahey', N'hcahey15', N'NSXcG9khd', N'18.127.87.158', CAST(N'1900-01-01' AS Date), N'[{"code":501},{"code":258}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (43, N'Tore Rusling', N'trusling16', N'abol9dYC8e', N'142.216.95.251', CAST(N'1900-01-01' AS Date), N'[{"code":619}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (44, N'Jeddy De Souza', N'jde17', N'gK6Hsl8Q', N'229.104.255.175', CAST(N'1900-01-01' AS Date), N'[{"code":415},{"code":619}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (45, N'Flossi McLeoid', N'fmcleoid18', N'B9zr0N7cJw', N'90.207.38.179', CAST(N'1900-01-01' AS Date), N'[{"code":543}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (46, N'Nikoletta Megainey', N'nmegainey19', N'gph7QurFf', N'172.249.218.50', CAST(N'1900-01-01' AS Date), N'[{"code":415}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (47, N'Adan Bliven', N'abliven1a', N'vVxlf94KpeX', N'49.101.94.118', CAST(N'1900-01-01' AS Date), N'[{"code":323},{"code":548}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (48, N'Mohandis Rossoni', N'mrossoni1b', N'nLXj2lS', N'161.5.132.42', CAST(N'1900-01-01' AS Date), N'[{"code":176},{"code":659},{"code":287}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (49, N'Nappie Redington', N'nredington1c', N'DCbOb1SX', N'174.42.8.3', CAST(N'1900-01-01' AS Date), N'[{"code":548}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (50, N'Lenka Francie', N'lfrancie1d', N'DoGeHWuAAM', N'182.2.128.34', CAST(N'1900-01-01' AS Date), N'[{"code":659},{"code":501},{"code":415}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (51, N'Ashley Blowin', N'ablowin1e', N'aQygVtMjN', N'73.212.243.168', CAST(N'1900-01-01' AS Date), N'[{"code":176},{"code":311},{"code":855},{"code":176}]', 2, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (52, N'Vale Goroni', N'vgoroni1f', N'bWr0QU', N'93.126.120.134', CAST(N'1900-01-01' AS Date), N'[{"code":287},{"code":287},{"code":659}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (53, N'Suki Grafom', N'sgrafom1g', N'JcNcVDAouYzA', N'9.26.5.107', CAST(N'1900-01-01' AS Date), N'[{"code":797},{"code":323},{"code":548}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (54, N'Justis Gianneschi', N'jgianneschi1h', N'oieX5u3sUfpD', N'139.241.156.87', CAST(N'1900-01-01' AS Date), N'[{"code":836},{"code":543},{"code":548},{"code":311}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (55, N'Emilie Collett', N'ecollett1i', N'Y0uMyKB0W', N'47.0.240.7', CAST(N'1900-01-01' AS Date), N'[{"code":543},{"code":287},{"code":258}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (56, N'Byrom Terrell', N'bterrell1j', N'hswseW', N'157.21.33.53', CAST(N'1900-01-01' AS Date), N'[{"code":287},{"code":557},{"code":543}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (57, N'Daphne Bifield', N'dbifield1k', N'oYAQ4URihIA', N'24.185.229.169', CAST(N'1900-01-01' AS Date), N'[{"code":619},{"code":323},{"code":855},{"code":229}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (58, N'Blanca Staig', N'bstaig1l', N'MygqEtjMtUbC', N'171.78.28.229', CAST(N'1900-01-01' AS Date), N'[{"code":176},{"code":855}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (59, N'Adriaens Kennsley', N'akennsley1m', N'CTUdBfJsy6qF', N'208.81.128.179', CAST(N'1900-01-01' AS Date), N'[{"code":836},{"code":548}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (60, N'Emlyn Bartak', N'ebartak1n', N'y3t4H1', N'130.247.20.138', CAST(N'1900-01-01' AS Date), N'[{"code":543}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (61, N'Victoria Willshire', N'vwillshire1o', N'VFSLc2t', N'243.230.165.161', CAST(N'1900-01-01' AS Date), N'[{"code":557},{"code":287},{"code":836},{"code":287}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (62, N'Egon Savin', N'esavin1p', N'axnJY9s', N'40.140.160.210', CAST(N'1900-01-01' AS Date), N'[{"code":346},{"code":258},{"code":543},{"code":323},{"code":176}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (63, N'Phillie Elsom', N'pelsom1q', N'OXzMECG', N'253.7.8.82', CAST(N'1900-01-01' AS Date), N'[{"code":323},{"code":501},{"code":501}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (64, N'Adan Semaine', N'asemaine1r', N'MdJRkHor5SP', N'76.252.15.218', CAST(N'1900-01-01' AS Date), N'[{"code":258}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (65, N'Constantino Northrop', N'cnorthrop1s', N'UIwCvTA7MRS0', N'119.130.24.85', CAST(N'1900-01-01' AS Date), N'[{"code":176},{"code":229}]', 1, N'00:00:01', N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (66, N'Rodie Easson', N'reasson1t', N'3J0jgg9RWlXs', N'212.248.119.232', CAST(N'1900-01-01' AS Date), N'[{"code":855},{"code":287},{"code":797}]', 2, N'00:00:01', N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (67, N'Alida Boleyn', N'aboleyn1u', N'3q2mQdDRmtr', N'181.14.56.184', CAST(N'1900-01-01' AS Date), N'[{"code":229},{"code":323},{"code":501},{"code":258},{"code":415}]', 3, N'00:00:01', N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (68, N'Hill Scholfield', N'hscholfield1v', N'1Pbs3K6qXYB', N'15.7.205.224', CAST(N'1900-01-01' AS Date), N'[{"code":619},{"code":258},{"code":501},{"code":287}]', 2, N'00:00:01', N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (69, N'Cordell Cowpe', N'ccowpe1w', N'VHr417Ft0', N'237.236.173.63', CAST(N'1900-01-01' AS Date), N'[{"code":346},{"code":311},{"code":346},{"code":176}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (70, N'Alexandro Eldon', N'aeldon1x', N'rrywOQRmFKyh', N'4.174.11.210', CAST(N'1900-01-01' AS Date), N'[{"code":836},{"code":346},{"code":836}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (71, N'Kayle Collin', N'kcollin1y', N'Q0ZV21vew0', N'52.19.142.168', CAST(N'1900-01-01' AS Date), N'[{"code":346}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (72, N'Inesita Larkins', N'ilarkins1z', N'DEFNpHtU', N'3.26.42.188', CAST(N'1900-01-01' AS Date), N'[{"code":548},{"code":258},{"code":311},{"code":229}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (73, N'Waylin Lound', N'wlound20', N'a2G4Ihh2o', N'31.243.68.215', CAST(N'1900-01-01' AS Date), N'[{"code":619},{"code":659},{"code":346}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (74, N'Mechelle Gillogley', N'mgillogley21', N'EjUHfCUFqF', N'79.38.53.53', CAST(N'1900-01-01' AS Date), N'[{"code":346},{"code":176},{"code":176},{"code":415},{"code":415}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (75, N'Donal Muccino', N'dmuccino22', N'E4okVgx', N'109.138.101.234', CAST(N'1900-01-01' AS Date), N'[{"code":176},{"code":619},{"code":287},{"code":311},{"code":619}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (76, N'Joye Leadbetter', N'jleadbetter23', N'ZNsaKdgb', N'51.245.190.167', CAST(N'1900-01-01' AS Date), N'[{"code":548},{"code":543},{"code":548},{"code":855}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (77, N'Gianina Trump', N'gtrump24', N'6XXY7IS26Ci', N'11.191.37.17', CAST(N'1900-01-01' AS Date), N'[{"code":258}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (78, N'Read LeEstut', N'rleestut25', N'zq3C4rUR', N'119.247.100.162', CAST(N'1900-01-01' AS Date), N'[{"code":323},{"code":287},{"code":659},{"code":176}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (79, N'Jill Anscott', N'janscott26', N'5maCRrCZLu', N'104.85.178.46', CAST(N'1900-01-01' AS Date), N'[{"code":287}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (80, N'Bud Douch', N'bdouch27', N'KAkwrli', N'72.132.101.188', CAST(N'1900-01-01' AS Date), N'[{"code":287}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (81, N'Cicily Ossenna', N'cossenna28', N'vfKJkCeohOzZ', N'230.85.180.186', CAST(N'1900-01-01' AS Date), N'[{"code":501},{"code":176},{"code":176}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (82, N'Hew Izzat', N'hizzat29', N'Uifdtu', N'143.246.125.169', CAST(N'1900-01-01' AS Date), N'[{"code":287},{"code":501},{"code":287},{"code":311}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (83, N'Eddie Gimeno', N'egimeno2a', N'oF1hbmKlZ', N'60.57.115.125', CAST(N'1900-01-01' AS Date), N'[{"code":659},{"code":543},{"code":501},{"code":659},{"code":548}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (84, N'Sybyl Fierro', N'sfierro2b', N'VjUrQ2', N'250.233.247.215', CAST(N'1900-01-01' AS Date), N'[{"code":415},{"code":323},{"code":346},{"code":311}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (85, N'Nicol Troup', N'ntroup2c', N'KmDDYf1Pu', N'121.7.142.165', CAST(N'1900-01-01' AS Date), N'[{"code":415},{"code":176},{"code":836},{"code":287}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (86, N'Bondy Pattenden', N'bpattenden2d', N'IOUkHpOn', N'45.121.26.90', CAST(N'1900-01-01' AS Date), N'[{"code":836},{"code":229},{"code":346},{"code":346}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (87, N'Angus Cockman', N'acockman2e', N'fDKhK7OK', N'167.9.255.77', CAST(N'1900-01-01' AS Date), N'[{"code":323},{"code":229},{"code":258},{"code":258},{"code":415}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (88, N'Mord Hanscome', N'mhanscome2f', N'xBHzpa7eP0u', N'121.181.10.230', CAST(N'1900-01-01' AS Date), N'[{"code":346},{"code":548},{"code":548}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (89, N'Susy Leblanc', N'sleblanc2g', N'T2et1U5M', N'118.164.120.202', CAST(N'1900-01-01' AS Date), N'[{"code":855},{"code":619}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (90, N'Gerard Ciccoloi', N'gciccoloi2h', N'w4dZ3hxiCiAg', N'71.235.27.27', CAST(N'1900-01-01' AS Date), N'[{"code":548},{"code":311},{"code":346},{"code":311}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (91, N'Seamus Sayburn', N'ssayburn2i', N'1hTM7EVKaS', N'75.194.92.114', CAST(N'1900-01-01' AS Date), N'[{"code":557},{"code":548},{"code":557},{"code":323},{"code":557}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (92, N'Washington Gentiry', N'wgentiry2j', N'z2X9UH5', N'188.49.78.185', CAST(N'1900-01-01' AS Date), N'[{"code":323},{"code":855},{"code":229}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (93, N'Rebekkah Westall', N'rwestall2k', N'xLgunbO9x6', N'212.150.81.93', CAST(N'1900-01-01' AS Date), N'[{"code":501},{"code":501},{"code":855},{"code":797},{"code":501}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (94, N'Court Kulic', N'ckulic2l', N'FLHYRN', N'154.121.193.131', CAST(N'1900-01-01' AS Date), N'[{"code":323}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (95, N'Lorilee Roux', N'lroux2m', N'98cCxHeeK31', N'229.187.60.106', CAST(N'1900-01-01' AS Date), N'[{"code":415},{"code":543}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (96, N'Modestine Rolinson', N'mrolinson2n', N'faGzyW8hEca', N'9.203.185.188', CAST(N'1900-01-01' AS Date), N'[{"code":311},{"code":855},{"code":797},{"code":855}]', 1, NULL, N'laborant_1.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (97, N'Shelbi Ellgood', N'sellgood2o', N'3do5MME', N'199.226.26.7', CAST(N'1900-01-01' AS Date), N'[{"code":176},{"code":836},{"code":346},{"code":501},{"code":176}]', 3, NULL, N'Бухгалтер.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (98, N'Barbabra Retchless', N'bretchless2p', N'WraGihh', N'86.66.23.203', CAST(N'1900-01-01' AS Date), N'[{"code":229},{"code":415},{"code":258},{"code":619}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (99, N'Robinetta Jerzak', N'rjerzak2q', N'hAp8jki', N'205.158.144.210', CAST(N'1900-01-01' AS Date), N'[{"code":659}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (100, N'Vance Boots', N'vboots2r', N'bgJfSDEVEQm6', N'91.73.40.29', CAST(N'1900-01-01' AS Date), N'[{"code":548},{"code":346},{"code":311}]', 2, NULL, N'laborant_2.jpg', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'00:00:03', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'00:00:03', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'00:00:02', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'00:00:03', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (105, N'Mashel Roll', N'Abcd1234', N'!nik1212', NULL, CAST(N'2024-03-29' AS Date), NULL, 2, NULL, NULL, N'hik@mail.com                  ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (106, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (107, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (108, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (109, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (110, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (111, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (112, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (113, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (114, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (115, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (116, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (117, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (118, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (119, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (120, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (121, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (122, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (123, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (124, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (125, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (126, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (127, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (128, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (129, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (130, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (131, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (132, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (133, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (134, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (135, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (136, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (137, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (138, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (139, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (140, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (141, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (142, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (143, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (144, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (145, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (146, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (147, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (148, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (149, N'OL Koll', N'6dkhJHiu78', N'!Jooll123212', NULL, NULL, NULL, 1, NULL, NULL, N'gfiodj@kjsh.hf                ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (150, N'KJH ikdgj', N'b87623Nhsd', N'kjhg435d!', NULL, NULL, NULL, 2, NULL, NULL, N'gdfkj@jhs.uidfh               ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (151, N'KJHk dfk', N'TV_75hgfdF', N'N&!78n87r', NULL, NULL, NULL, 2, NULL, NULL, N'gfdio@hj.h                    ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (152, N'Dolli Houu', N'gf86jGIKH--kd', N'!NJ985f*', NULL, NULL, NULL, 2, NULL, NULL, N'kfjjj6tyu4@jhgh.hg            ', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (153, N'fgdh', N'gfg&*67fdsg-FhhjhH5', N'!NJ9*fsdg', NULL, NULL, NULL, 2, NULL, NULL, N'k@j.fjgfjigjofjgijhijhiofgjhfg', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (154, N'Gyer mkl', N'Y!Iu54T*RgdfjkJg', N'!jioKj85958iUHi', NULL, NULL, NULL, 3, NULL, NULL, N'rrrrrr@jkdfio.udghuhjgfhgfhghg', NULL, NULL, NULL)
GO
INSERT [dbo].[User$] ([id], [name], [login], [password], [ip], [lastenter], [services], [type], [Time], [foto], [email], [Телефон], [Статус], [LastActiveTime]) VALUES (155, N'Kol Hi', N'gfg&*67fdsg-FhhjhH5', N'!idfuhJ89854', NULL, NULL, NULL, 2, NULL, NULL, N'erihg@hdfj.duko               ', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[User$] OFF
GO
SET IDENTITY_INSERT [dbo].[Анализатор] ON 
GO
INSERT [dbo].[Анализатор] ([Код_анализатора], [Наименование]) VALUES (1, N'Biorad                                            ')
GO
INSERT [dbo].[Анализатор] ([Код_анализатора], [Наименование]) VALUES (2, N'Ledetect                                          ')
GO
SET IDENTITY_INSERT [dbo].[Анализатор] OFF
GO
SET IDENTITY_INSERT [dbo].[Биоматериал] ON 
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (1, 439352, NULL, 4)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (2, 682415, NULL, 5)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (3, 588673, NULL, 6)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (4, 6, NULL, 7)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (5, 6, NULL, 8)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (6, 895789, NULL, 9)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (7, 892114, NULL, 10)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (8, 836578, NULL, 11)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (9, 633718, NULL, 12)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (10, 234978, NULL, NULL)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (11, 198394, NULL, NULL)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (12, 457561, NULL, NULL)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (13, 854689, NULL, NULL)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (14, 311026, NULL, NULL)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (15, 767, NULL, NULL)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (16, 675675, NULL, NULL)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (17, 675475, NULL, NULL)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (18, 897587, NULL, NULL)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (19, 359379, NULL, NULL)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (20, 910926, NULL, NULL)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (21, 568787, NULL, NULL)
GO
INSERT [dbo].[Биоматериал] ([Код_биоматериала], [Код_штрихкода], [Наименование], [Код_заказа]) VALUES (22, 594241, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Биоматериал] OFF
GO
SET IDENTITY_INSERT [dbo].[Заказ] ON 
GO
INSERT [dbo].[Заказ] ([Код_заказа], [Дата_создания], [Код_услуги], [Статус_услуги], [Статус_заказа], [Время_выполнения], [Код_биоматериала], [Код_пациента]) VALUES (4, CAST(N'2024-03-30T12:58:29.843' AS DateTime), 229, N'Завершен            ', N'Завершен            ', NULL, NULL, 2)
GO
INSERT [dbo].[Заказ] ([Код_заказа], [Дата_создания], [Код_услуги], [Статус_услуги], [Статус_заказа], [Время_выполнения], [Код_биоматериала], [Код_пациента]) VALUES (5, CAST(N'2024-03-30T13:00:39.653' AS DateTime), 311, N'Завершен            ', N'Завершен            ', NULL, NULL, 1)
GO
INSERT [dbo].[Заказ] ([Код_заказа], [Дата_создания], [Код_услуги], [Статус_услуги], [Статус_заказа], [Время_выполнения], [Код_биоматериала], [Код_пациента]) VALUES (18, CAST(N'2024-04-02T19:50:02.683' AS DateTime), 797, N'Выполнение          ', N'Выполнение          ', NULL, NULL, 3)
GO
INSERT [dbo].[Заказ] ([Код_заказа], [Дата_создания], [Код_услуги], [Статус_услуги], [Статус_заказа], [Время_выполнения], [Код_биоматериала], [Код_пациента]) VALUES (19, CAST(N'2024-04-03T19:16:22.347' AS DateTime), 287, N'пллдчсодчуогго      ', N'варыврап            ', NULL, NULL, 4)
GO
INSERT [dbo].[Заказ] ([Код_заказа], [Дата_создания], [Код_услуги], [Статус_услуги], [Статус_заказа], [Время_выполнения], [Код_биоматериала], [Код_пациента]) VALUES (20, CAST(N'2024-04-03T19:17:04.310' AS DateTime), 311, N'апрапрв             ', N'апрапр6767          ', NULL, NULL, NULL)
GO
INSERT [dbo].[Заказ] ([Код_заказа], [Дата_создания], [Код_услуги], [Статус_услуги], [Статус_заказа], [Время_выполнения], [Код_биоматериала], [Код_пациента]) VALUES (21, CAST(N'2024-04-03T19:53:44.547' AS DateTime), 323, N'gfhfgh              ', N'ghjghj              ', NULL, NULL, 3)
GO
INSERT [dbo].[Заказ] ([Код_заказа], [Дата_создания], [Код_услуги], [Статус_услуги], [Статус_заказа], [Время_выполнения], [Код_биоматериала], [Код_пациента]) VALUES (22, CAST(N'2024-04-03T19:54:33.230' AS DateTime), 311, N'fghh                ', N'hfghfgh             ', NULL, NULL, 3)
GO
INSERT [dbo].[Заказ] ([Код_заказа], [Дата_создания], [Код_услуги], [Статус_услуги], [Статус_заказа], [Время_выполнения], [Код_биоматериала], [Код_пациента]) VALUES (23, CAST(N'2024-04-05T19:34:18.853' AS DateTime), 287, N'Завершен            ', N'Завершен            ', NULL, NULL, 3)
GO
INSERT [dbo].[Заказ] ([Код_заказа], [Дата_создания], [Код_услуги], [Статус_услуги], [Статус_заказа], [Время_выполнения], [Код_биоматериала], [Код_пациента]) VALUES (24, CAST(N'2024-04-05T19:52:15.587' AS DateTime), 323, N'r                   ', N'gergerdghjhjhhj     ', NULL, NULL, 4)
GO
INSERT [dbo].[Заказ] ([Код_заказа], [Дата_создания], [Код_услуги], [Статус_услуги], [Статус_заказа], [Время_выполнения], [Код_биоматериала], [Код_пациента]) VALUES (25, CAST(N'2024-04-05T19:56:03.310' AS DateTime), 323, N'fghkytyjnuyiyni     ', N'u                   ', NULL, NULL, 4)
GO
INSERT [dbo].[Заказ] ([Код_заказа], [Дата_создания], [Код_услуги], [Статус_услуги], [Статус_заказа], [Время_выполнения], [Код_биоматериала], [Код_пациента]) VALUES (26, CAST(N'2024-04-06T09:53:41.337' AS DateTime), 501, N'Завершён            ', N'Завершён            ', NULL, NULL, 3)
GO
INSERT [dbo].[Заказ] ([Код_заказа], [Дата_создания], [Код_услуги], [Статус_услуги], [Статус_заказа], [Время_выполнения], [Код_биоматериала], [Код_пациента]) VALUES (27, CAST(N'2024-04-06T10:53:35.370' AS DateTime), 287, N'ав                  ', N'ыва                 ', NULL, NULL, NULL)
GO
INSERT [dbo].[Заказ] ([Код_заказа], [Дата_создания], [Код_услуги], [Статус_услуги], [Статус_заказа], [Время_выполнения], [Код_биоматериала], [Код_пациента]) VALUES (28, CAST(N'2024-04-06T11:29:28.827' AS DateTime), 258, N'Завершен            ', N'Завершен            ', NULL, NULL, 3)
GO
SET IDENTITY_INSERT [dbo].[Заказ] OFF
GO
SET IDENTITY_INSERT [dbo].[Лист1$] ON 
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (1, 1, 557)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (2, 1, 836)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (3, 1, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (4, 2, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (5, 2, 619)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (6, 2, 557)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (7, 2, 836)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (8, 2, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (9, 3, 543)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (10, 3, 836)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (11, 4, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (12, 4, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (13, 5, 543)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (14, 5, 415)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (15, 5, 619)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (16, 5, 557)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (17, 6, 557)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (18, 6, 836)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (19, 6, 229)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (20, 7, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (21, 7, 619)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (22, 7, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (23, 7, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (24, 8, 415)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (25, 8, 311)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (26, 8, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (27, 8, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (28, 9, 323)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (29, 9, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (30, 9, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (31, 10, 229)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (32, 10, 345)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (33, 10, 501)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (34, 10, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (35, 11, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (36, 12, 619)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (37, 12, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (38, 12, 229)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (39, 12, 557)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (40, 12, 797)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (41, 13, 323)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (42, 13, 311)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (43, 13, 557)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (44, 14, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (45, 14, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (46, 14, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (47, 15, 229)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (48, 15, 836)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (49, 15, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (50, 15, 619)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (51, 16, 557)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (52, 17, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (53, 17, 836)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (54, 17, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (55, 18, 619)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (56, 18, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (57, 19, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (58, 19, 543)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (59, 19, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (60, 19, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (61, 20, 323)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (62, 20, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (63, 20, 659)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (64, 20, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (65, 21, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (66, 21, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (67, 21, 323)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (68, 21, 557)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (69, 21, 501)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (70, 22, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (71, 22, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (72, 23, 229)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (73, 23, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (74, 23, 836)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (75, 24, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (76, 24, 557)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (77, 24, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (78, 25, 543)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (79, 25, 836)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (80, 26, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (81, 26, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (82, 27, 501)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (83, 27, 797)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (84, 28, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (85, 28, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (86, 29, 836)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (87, 29, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (88, 29, 619)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (89, 29, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (90, 30, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (91, 31, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (92, 31, 229)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (93, 31, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (94, 31, 619)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (95, 32, 836)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (96, 32, 797)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (97, 33, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (98, 34, 501)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (99, 34, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (100, 34, 659)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (101, 34, 659)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (102, 35, 797)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (103, 35, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (104, 35, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (105, 35, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (106, 36, 415)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (107, 36, 543)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (108, 36, 836)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (109, 37, 836)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (110, 38, 501)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (111, 39, 836)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (112, 39, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (113, 39, 619)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (114, 40, 797)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (115, 40, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (116, 40, 543)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (117, 40, 501)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (118, 40, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (119, 41, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (120, 41, 619)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (121, 42, 501)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (122, 42, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (123, 43, 619)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (124, 44, 415)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (125, 44, 619)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (126, 45, 543)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (127, 46, 415)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (128, 47, 323)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (129, 47, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (130, 48, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (131, 48, 659)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (132, 48, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (133, 49, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (134, 50, 659)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (135, 50, 501)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (136, 50, 415)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (137, 51, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (138, 51, 311)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (139, 51, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (140, 52, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (141, 52, 659)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (142, 53, 797)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (143, 53, 323)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (144, 53, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (145, 54, 836)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (146, 54, 543)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (147, 54, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (148, 54, 301)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (149, 55, 543)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (150, 55, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (151, 55, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (152, 56, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (153, 56, 557)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (154, 56, 543)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (155, 57, 619)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (156, 57, 323)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (157, 57, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (158, 57, 229)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (159, 58, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (160, 58, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (161, 59, 836)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (162, 59, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (163, 60, 543)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (164, 61, 557)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (165, 61, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (166, 61, 836)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (167, 62, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (168, 62, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (169, 62, 543)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (170, 62, 323)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (171, 62, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (172, 63, 323)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (173, 63, 501)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (174, 64, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (175, 65, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (176, 65, 229)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (177, 66, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (178, 66, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (179, 66, 797)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (180, 67, 229)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (181, 67, 323)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (182, 67, 501)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (183, 67, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (184, 67, 415)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (185, 68, 619)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (186, 68, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (187, 68, 501)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (188, 68, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (189, 69, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (190, 69, 311)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (191, 69, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (192, 70, 836)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (193, 70, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (194, 71, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (195, 72, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (196, 72, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (197, 72, 311)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (198, 72, 229)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (199, 73, 619)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (200, 73, 659)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (201, 73, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (202, 74, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (203, 74, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (204, 74, 415)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (205, 75, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (206, 75, 619)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (207, 75, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (208, 75, 311)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (209, 76, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (210, 76, 543)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (211, 76, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (212, 77, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (213, 78, 323)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (214, 78, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (215, 78, 659)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (216, 78, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (217, 79, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (218, 80, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (219, 81, 501)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (220, 81, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (221, 82, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (222, 82, 501)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (223, 82, 311)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (224, 83, 659)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (225, 83, 543)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (226, 83, 501)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (227, 83, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (228, 84, 415)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (229, 84, 323)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (230, 84, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (231, 84, 311)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (232, 85, 415)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (233, 85, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (234, 85, 836)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (235, 85, 287)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (236, 86, 636)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (237, 86, 229)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (238, 86, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (239, 87, 323)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (240, 87, 229)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (241, 87, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (242, 87, 415)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (243, 88, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (244, 88, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (245, 89, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (246, 89, 619)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (247, 90, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (248, 90, 311)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (249, 90, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (250, 91, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (251, 91, 323)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (252, 91, 557)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (253, 92, 323)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (254, 92, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (255, 92, 229)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (256, 93, 501)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (257, 93, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (258, 93, 797)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (259, 94, 323)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (260, 95, 415)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (261, 95, 543)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (262, 96, 311)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (263, 96, 855)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (264, 96, 797)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (265, 97, 176)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (266, 97, 836)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (267, 97, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (268, 97, 501)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (269, 98, 229)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (270, 98, 415)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (271, 98, 258)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (272, 98, 619)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (273, 99, 659)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (274, 100, 548)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (275, 100, 346)
GO
INSERT [dbo].[Лист1$] ([id], [user_id], [услуги_id]) VALUES (276, 100, 311)
GO
SET IDENTITY_INSERT [dbo].[Лист1$] OFF
GO
SET IDENTITY_INSERT [dbo].[Паспорт] ON 
GO
INSERT [dbo].[Паспорт] ([Код_паспорта], [Серия], [Номер]) VALUES (5, 6745, 438956)
GO
INSERT [dbo].[Паспорт] ([Код_паспорта], [Серия], [Номер]) VALUES (6, 6754, 783865)
GO
INSERT [dbo].[Паспорт] ([Код_паспорта], [Серия], [Номер]) VALUES (7, 3456, 905473)
GO
INSERT [dbo].[Паспорт] ([Код_паспорта], [Серия], [Номер]) VALUES (8, 8743, 785476)
GO
INSERT [dbo].[Паспорт] ([Код_паспорта], [Серия], [Номер]) VALUES (9, 4353, 456356)
GO
INSERT [dbo].[Паспорт] ([Код_паспорта], [Серия], [Номер]) VALUES (10, 8679, 546546)
GO
INSERT [dbo].[Паспорт] ([Код_паспорта], [Серия], [Номер]) VALUES (11, 3453, 654654)
GO
SET IDENTITY_INSERT [dbo].[Паспорт] OFF
GO
SET IDENTITY_INSERT [dbo].[Пациент] ON 
GO
INSERT [dbo].[Пациент] ([Код_пациента], [ФИО], [Дата_рождения], [Код_паспорта], [Телефон], [email], [Код_полиса], [Код_страховой]) VALUES (1, N'Tell Well                                         ', NULL, NULL, N'89086547834', N'gol@gmail.com                 ', 0, 1)
GO
INSERT [dbo].[Пациент] ([Код_пациента], [ФИО], [Дата_рождения], [Код_паспорта], [Телефон], [email], [Код_полиса], [Код_страховой]) VALUES (2, N'Uil Ter                                           ', CAST(N'1992-03-20' AS Date), 8, N'89656547634', N'oi54@gfo.com                  ', 3, 3)
GO
INSERT [dbo].[Пациент] ([Код_пациента], [ФИО], [Дата_рождения], [Код_паспорта], [Телефон], [email], [Код_полиса], [Код_страховой]) VALUES (3, N'Ginny Long                                        ', CAST(N'1991-07-16' AS Date), 9, N'57868974568', N'nilo@jhf.vhj                  ', 1, 2)
GO
INSERT [dbo].[Пациент] ([Код_пациента], [ФИО], [Дата_рождения], [Код_паспорта], [Телефон], [email], [Код_полиса], [Код_страховой]) VALUES (4, N'Gill Hill                                         ', CAST(N'1991-07-12' AS Date), 10, N'85281089343', N'sejhf@jhdfs.ksh               ', 1, 1)
GO
INSERT [dbo].[Пациент] ([Код_пациента], [ФИО], [Дата_рождения], [Код_паспорта], [Телефон], [email], [Код_полиса], [Код_страховой]) VALUES (5, N'Koly Gos                                          ', CAST(N'1990-11-21' AS Date), 11, N'89074732463', N'gjh@jhd.nv                    ', 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Пациент] OFF
GO
SET IDENTITY_INSERT [dbo].[Полис] ON 
GO
INSERT [dbo].[Полис] ([Код_полиса], [Номер_полиса], [Тип_полиса]) VALUES (0, N'6758536573465963', N'Электронный         ')
GO
INSERT [dbo].[Полис] ([Код_полиса], [Номер_полиса], [Тип_полиса]) VALUES (1, N'6578465129657384', N'Бумажный            ')
GO
INSERT [dbo].[Полис] ([Код_полиса], [Номер_полиса], [Тип_полиса]) VALUES (3, N'6509316482354765', N'Карта               ')
GO
INSERT [dbo].[Полис] ([Код_полиса], [Номер_полиса], [Тип_полиса]) VALUES (12, N'9856897358875689', NULL)
GO
INSERT [dbo].[Полис] ([Код_полиса], [Номер_полиса], [Тип_полиса]) VALUES (13, N'9027834868675287', NULL)
GO
SET IDENTITY_INSERT [dbo].[Полис] OFF
GO
SET IDENTITY_INSERT [dbo].[Страховая] ON 
GO
INSERT [dbo].[Страховая] ([Код_страховой], [Наименование], [Адрес], [ИНН], [р/с], [БИК]) VALUES (1, N'ГорСтрах            ', N'ул. 20 лет Победы             ', N'545656385465', 737, 3245)
GO
INSERT [dbo].[Страховая] ([Код_страховой], [Наименование], [Адрес], [ИНН], [р/с], [БИК]) VALUES (2, N'STR                 ', N'ш. Космонавтов                ', N'684937659473', 234, 7454)
GO
INSERT [dbo].[Страховая] ([Код_страховой], [Наименование], [Адрес], [ИНН], [р/с], [БИК]) VALUES (3, N'СраховКа            ', N'ул. Семилетки 8               ', N'678374973054', 324, 6747)
GO
SET IDENTITY_INSERT [dbo].[Страховая] OFF
GO
SET IDENTITY_INSERT [dbo].[Тип_пользователя] ON 
GO
INSERT [dbo].[Тип_пользователя] ([Код_пользователя], [Наименование]) VALUES (1, N'Лаборант            ')
GO
INSERT [dbo].[Тип_пользователя] ([Код_пользователя], [Наименование]) VALUES (2, N'Лаборант-исследов   ')
GO
INSERT [dbo].[Тип_пользователя] ([Код_пользователя], [Наименование]) VALUES (3, N'Бухгалтер           ')
GO
INSERT [dbo].[Тип_пользователя] ([Код_пользователя], [Наименование]) VALUES (4, N'Администратор       ')
GO
SET IDENTITY_INSERT [dbo].[Тип_пользователя] OFF
GO
ALTER TABLE [dbo].[User$]  WITH CHECK ADD  CONSTRAINT [FK_User$_Тип_пользователя] FOREIGN KEY([type])
REFERENCES [dbo].[Тип_пользователя] ([Код_пользователя])
GO
ALTER TABLE [dbo].[User$] CHECK CONSTRAINT [FK_User$_Тип_пользователя]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Server$] FOREIGN KEY([Код_услуги])
REFERENCES [dbo].[Server$] ([Code])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Server$]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Биоматериал] FOREIGN KEY([Код_биоматериала])
REFERENCES [dbo].[Биоматериал] ([Код_биоматериала])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Биоматериал]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Пациент] FOREIGN KEY([Код_пациента])
REFERENCES [dbo].[Пациент] ([Код_пациента])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Пациент]
GO
ALTER TABLE [dbo].[Лист1$]  WITH CHECK ADD  CONSTRAINT [FK_Лист1$_User$] FOREIGN KEY([user_id])
REFERENCES [dbo].[User$] ([id])
GO
ALTER TABLE [dbo].[Лист1$] CHECK CONSTRAINT [FK_Лист1$_User$]
GO
ALTER TABLE [dbo].[Оказанная_услуга]  WITH CHECK ADD  CONSTRAINT [FK_Оказанная_услуга_Анализатор] FOREIGN KEY([Код_анализатора])
REFERENCES [dbo].[Анализатор] ([Код_анализатора])
GO
ALTER TABLE [dbo].[Оказанная_услуга] CHECK CONSTRAINT [FK_Оказанная_услуга_Анализатор]
GO
ALTER TABLE [dbo].[Оказанная_услуга]  WITH CHECK ADD  CONSTRAINT [FK_Оказанная_услуга_Лаборант] FOREIGN KEY([Код_лаборанта])
REFERENCES [dbo].[Лаборант] ([Код_лаборанта])
GO
ALTER TABLE [dbo].[Оказанная_услуга] CHECK CONSTRAINT [FK_Оказанная_услуга_Лаборант]
GO
ALTER TABLE [dbo].[Оказанная_услуга]  WITH CHECK ADD  CONSTRAINT [FK_Оказанная_услуга_Услуги_лаб] FOREIGN KEY([Код_услуги])
REFERENCES [dbo].[Услуги_лаб] ([Код_услуги])
GO
ALTER TABLE [dbo].[Оказанная_услуга] CHECK CONSTRAINT [FK_Оказанная_услуга_Услуги_лаб]
GO
ALTER TABLE [dbo].[Пациент]  WITH CHECK ADD  CONSTRAINT [FK_Пациент_Паспорт] FOREIGN KEY([Код_паспорта])
REFERENCES [dbo].[Паспорт] ([Код_паспорта])
GO
ALTER TABLE [dbo].[Пациент] CHECK CONSTRAINT [FK_Пациент_Паспорт]
GO
ALTER TABLE [dbo].[Пациент]  WITH CHECK ADD  CONSTRAINT [FK_Пациент_Полис] FOREIGN KEY([Код_полиса])
REFERENCES [dbo].[Полис] ([Код_полиса])
GO
ALTER TABLE [dbo].[Пациент] CHECK CONSTRAINT [FK_Пациент_Полис]
GO
ALTER TABLE [dbo].[Пациент]  WITH CHECK ADD  CONSTRAINT [FK_Пациент_Страховая] FOREIGN KEY([Код_страховой])
REFERENCES [dbo].[Страховая] ([Код_страховой])
GO
ALTER TABLE [dbo].[Пациент] CHECK CONSTRAINT [FK_Пациент_Страховая]
GO
ALTER TABLE [dbo].[Услуги_лаб]  WITH CHECK ADD  CONSTRAINT [FK_Услуги_лаб_Server$] FOREIGN KEY([Код_наименования])
REFERENCES [dbo].[Server$] ([Code])
GO
ALTER TABLE [dbo].[Услуги_лаб] CHECK CONSTRAINT [FK_Услуги_лаб_Server$]
GO
USE [master]
GO
ALTER DATABASE [Biomater] SET  READ_WRITE 
GO
