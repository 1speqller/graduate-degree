USE [EMDatabase]
GO
/****** Object:  Table [dbo].[Beneficiary]    Script Date: 16.06.2022 19:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beneficiary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[CertificateId] [int] NOT NULL,
	[ClassesId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
 CONSTRAINT [PK_Invalid] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BeneficiaryType]    Script Date: 16.06.2022 19:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BeneficiaryType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](300) NULL,
 CONSTRAINT [PK_StudentsType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 16.06.2022 19:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Date] [date] NOT NULL,
	[Descriprion] [nvarchar](200) NULL,
 CONSTRAINT [PK_Certificate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 16.06.2022 19:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[Character] [nvarchar](1) NULL,
	[SchoolShift] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountStudents]    Script Date: 16.06.2022 19:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountStudents](
	[ClassId] [int] NOT NULL,
	[ManyChildren] [int] NOT NULL,
	[LowIncome] [int] NOT NULL,
	[Invalid] [int] NOT NULL,
	[Orphan] [int] NOT NULL,
	[OVZ] [int] NOT NULL,
	[InHomeOVZ] [int] NOT NULL,
	[InHomeInvalid] [int] NOT NULL,
	[InHomeNoStatus] [int] NOT NULL,
	[InFeedingParents] [int] NOT NULL,
	[NoType] [int] NOT NULL,
	[AllStudents] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginHistory]    Script Date: 16.06.2022 19:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Successful] [bit] NOT NULL,
 CONSTRAINT [PK_LoginHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 16.06.2022 19:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[School]    Script Date: 16.06.2022 19:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[School](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Locality] [nvarchar](100) NULL,
 CONSTRAINT [PK_School] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 16.06.2022 19:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Login] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[RoleId] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Beneficiary] ON 

INSERT [dbo].[Beneficiary] ([Id], [FirstName], [LastName], [CertificateId], [ClassesId], [TypeId], [Patronymic]) VALUES (1, N'Петров', N'Петр', 1, 1, 1, N'Петрович')
INSERT [dbo].[Beneficiary] ([Id], [FirstName], [LastName], [CertificateId], [ClassesId], [TypeId], [Patronymic]) VALUES (2, N'Ветров', N'Данил', 2, 1, 2, NULL)
INSERT [dbo].[Beneficiary] ([Id], [FirstName], [LastName], [CertificateId], [ClassesId], [TypeId], [Patronymic]) VALUES (3, N'Иванов', N'Иван', 3, 1, 8, NULL)
INSERT [dbo].[Beneficiary] ([Id], [FirstName], [LastName], [CertificateId], [ClassesId], [TypeId], [Patronymic]) VALUES (4, N'Данилов', N'Даниил', 5, 2, 9, NULL)
INSERT [dbo].[Beneficiary] ([Id], [FirstName], [LastName], [CertificateId], [ClassesId], [TypeId], [Patronymic]) VALUES (5, N'Семёнов', N'Семен', 8, 3, 10, N'Семёнович')
SET IDENTITY_INSERT [dbo].[Beneficiary] OFF
GO
SET IDENTITY_INSERT [dbo].[BeneficiaryType] ON 

INSERT [dbo].[BeneficiaryType] ([Id], [Name], [Description]) VALUES (1, N'Без категории', N'Обычный учащийся')
INSERT [dbo].[BeneficiaryType] ([Id], [Name], [Description]) VALUES (2, N'Многодетная семья', NULL)
INSERT [dbo].[BeneficiaryType] ([Id], [Name], [Description]) VALUES (3, N'Малообеспеченная семья', NULL)
INSERT [dbo].[BeneficiaryType] ([Id], [Name], [Description]) VALUES (4, N'Инвалид', NULL)
INSERT [dbo].[BeneficiaryType] ([Id], [Name], [Description]) VALUES (5, N'Сирота', NULL)
INSERT [dbo].[BeneficiaryType] ([Id], [Name], [Description]) VALUES (6, N'ОВЗ', NULL)
INSERT [dbo].[BeneficiaryType] ([Id], [Name], [Description]) VALUES (7, N'На дому ОВЗ', NULL)
INSERT [dbo].[BeneficiaryType] ([Id], [Name], [Description]) VALUES (8, N'На дому Инвалид', NULL)
INSERT [dbo].[BeneficiaryType] ([Id], [Name], [Description]) VALUES (9, N'На дому Без статуса', NULL)
INSERT [dbo].[BeneficiaryType] ([Id], [Name], [Description]) VALUES (10, N'Питающийся за счёт родительских средств', NULL)
SET IDENTITY_INSERT [dbo].[BeneficiaryType] OFF
GO
SET IDENTITY_INSERT [dbo].[Certificate] ON 

INSERT [dbo].[Certificate] ([Id], [Name], [Date], [Descriprion]) VALUES (1, N'Льгота №1', CAST(N'2023-12-22' AS Date), NULL)
INSERT [dbo].[Certificate] ([Id], [Name], [Date], [Descriprion]) VALUES (2, N'Льгота №2', CAST(N'2024-09-28' AS Date), NULL)
INSERT [dbo].[Certificate] ([Id], [Name], [Date], [Descriprion]) VALUES (3, N'Льгота №3', CAST(N'2023-07-30' AS Date), NULL)
INSERT [dbo].[Certificate] ([Id], [Name], [Date], [Descriprion]) VALUES (5, N'Льгота №4', CAST(N'2022-03-14' AS Date), NULL)
INSERT [dbo].[Certificate] ([Id], [Name], [Date], [Descriprion]) VALUES (6, N'Льгота №5', CAST(N'2022-03-14' AS Date), NULL)
INSERT [dbo].[Certificate] ([Id], [Name], [Date], [Descriprion]) VALUES (7, N'Льгота №6', CAST(N'2022-03-14' AS Date), NULL)
INSERT [dbo].[Certificate] ([Id], [Name], [Date], [Descriprion]) VALUES (8, N'Льгота №7', CAST(N'2022-03-14' AS Date), NULL)
INSERT [dbo].[Certificate] ([Id], [Name], [Date], [Descriprion]) VALUES (9, N'Льгота №8', CAST(N'2022-03-14' AS Date), NULL)
INSERT [dbo].[Certificate] ([Id], [Name], [Date], [Descriprion]) VALUES (10, N'1', CAST(N'2022-06-05' AS Date), NULL)
INSERT [dbo].[Certificate] ([Id], [Name], [Date], [Descriprion]) VALUES (11, N'1', CAST(N'2022-06-05' AS Date), NULL)
INSERT [dbo].[Certificate] ([Id], [Name], [Date], [Descriprion]) VALUES (12, N'1', CAST(N'2022-05-27' AS Date), NULL)
INSERT [dbo].[Certificate] ([Id], [Name], [Date], [Descriprion]) VALUES (13, N'1', CAST(N'2022-05-27' AS Date), NULL)
INSERT [dbo].[Certificate] ([Id], [Name], [Date], [Descriprion]) VALUES (14, N'1', CAST(N'2022-05-27' AS Date), NULL)
INSERT [dbo].[Certificate] ([Id], [Name], [Date], [Descriprion]) VALUES (15, N'geg11', CAST(N'2022-04-07' AS Date), NULL)
INSERT [dbo].[Certificate] ([Id], [Name], [Date], [Descriprion]) VALUES (16, N'Сертификат 1924', CAST(N'2022-07-10' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Certificate] OFF
GO
SET IDENTITY_INSERT [dbo].[Classes] ON 

INSERT [dbo].[Classes] ([Id], [Year], [SchoolId], [Character], [SchoolShift]) VALUES (1, 1, 1, N'А', 1)
INSERT [dbo].[Classes] ([Id], [Year], [SchoolId], [Character], [SchoolShift]) VALUES (2, 1, 1, N'Б', 1)
INSERT [dbo].[Classes] ([Id], [Year], [SchoolId], [Character], [SchoolShift]) VALUES (3, 1, 1, N'В', 1)
INSERT [dbo].[Classes] ([Id], [Year], [SchoolId], [Character], [SchoolShift]) VALUES (4, 1, 2, N'А', 1)
INSERT [dbo].[Classes] ([Id], [Year], [SchoolId], [Character], [SchoolShift]) VALUES (5, 1, 2, N'Б', 1)
INSERT [dbo].[Classes] ([Id], [Year], [SchoolId], [Character], [SchoolShift]) VALUES (6, 11, 1, N'Я', 1)
INSERT [dbo].[Classes] ([Id], [Year], [SchoolId], [Character], [SchoolShift]) VALUES (7, 2, 1, N'Г', 2)
INSERT [dbo].[Classes] ([Id], [Year], [SchoolId], [Character], [SchoolShift]) VALUES (8, 3, 1, N'Б', 1)
INSERT [dbo].[Classes] ([Id], [Year], [SchoolId], [Character], [SchoolShift]) VALUES (10, 4, 1, N'А', 1)
INSERT [dbo].[Classes] ([Id], [Year], [SchoolId], [Character], [SchoolShift]) VALUES (11, 5, 1, N'Б', 1)
INSERT [dbo].[Classes] ([Id], [Year], [SchoolId], [Character], [SchoolShift]) VALUES (12, 6, 1, N'В', 1)
INSERT [dbo].[Classes] ([Id], [Year], [SchoolId], [Character], [SchoolShift]) VALUES (13, 7, 1, N'А', 1)
INSERT [dbo].[Classes] ([Id], [Year], [SchoolId], [Character], [SchoolShift]) VALUES (15, 8, 1, N'Б', 2)
INSERT [dbo].[Classes] ([Id], [Year], [SchoolId], [Character], [SchoolShift]) VALUES (16, 9, 1, N'В', 1)
INSERT [dbo].[Classes] ([Id], [Year], [SchoolId], [Character], [SchoolShift]) VALUES (17, 10, 1, N'Г', 1)
SET IDENTITY_INSERT [dbo].[Classes] OFF
GO
INSERT [dbo].[CountStudents] ([ClassId], [ManyChildren], [LowIncome], [Invalid], [Orphan], [OVZ], [InHomeOVZ], [InHomeInvalid], [InHomeNoStatus], [InFeedingParents], [NoType], [AllStudents]) VALUES (1, 23, 0, 0, 0, 1, 0, 0, 0, 0, 61, 85)
INSERT [dbo].[CountStudents] ([ClassId], [ManyChildren], [LowIncome], [Invalid], [Orphan], [OVZ], [InHomeOVZ], [InHomeInvalid], [InHomeNoStatus], [InFeedingParents], [NoType], [AllStudents]) VALUES (2, 34, 0, 1, 1, 0, 0, 0, 0, 0, 52, 88)
INSERT [dbo].[CountStudents] ([ClassId], [ManyChildren], [LowIncome], [Invalid], [Orphan], [OVZ], [InHomeOVZ], [InHomeInvalid], [InHomeNoStatus], [InFeedingParents], [NoType], [AllStudents]) VALUES (3, 26, 0, 0, 1, 3, 0, 0, 0, 0, 52, 82)
INSERT [dbo].[CountStudents] ([ClassId], [ManyChildren], [LowIncome], [Invalid], [Orphan], [OVZ], [InHomeOVZ], [InHomeInvalid], [InHomeNoStatus], [InFeedingParents], [NoType], [AllStudents]) VALUES (4, 18, 0, 2, 0, 4, 2, 0, 0, 0, 116, 142)
INSERT [dbo].[CountStudents] ([ClassId], [ManyChildren], [LowIncome], [Invalid], [Orphan], [OVZ], [InHomeOVZ], [InHomeInvalid], [InHomeNoStatus], [InFeedingParents], [NoType], [AllStudents]) VALUES (6, 10, 0, 25, 0, 0, 10, 10, 10, 2, 2, 100)
INSERT [dbo].[CountStudents] ([ClassId], [ManyChildren], [LowIncome], [Invalid], [Orphan], [OVZ], [InHomeOVZ], [InHomeInvalid], [InHomeNoStatus], [InFeedingParents], [NoType], [AllStudents]) VALUES (7, 26, 0, 0, 1, 3, 0, 0, 0, 0, 52, 82)
INSERT [dbo].[CountStudents] ([ClassId], [ManyChildren], [LowIncome], [Invalid], [Orphan], [OVZ], [InHomeOVZ], [InHomeInvalid], [InHomeNoStatus], [InFeedingParents], [NoType], [AllStudents]) VALUES (8, 34, 0, 1, 1, 0, 0, 0, 0, 0, 52, 88)
INSERT [dbo].[CountStudents] ([ClassId], [ManyChildren], [LowIncome], [Invalid], [Orphan], [OVZ], [InHomeOVZ], [InHomeInvalid], [InHomeNoStatus], [InFeedingParents], [NoType], [AllStudents]) VALUES (10, 18, 0, 2, 0, 4, 2, 0, 0, 0, 116, 142)
INSERT [dbo].[CountStudents] ([ClassId], [ManyChildren], [LowIncome], [Invalid], [Orphan], [OVZ], [InHomeOVZ], [InHomeInvalid], [InHomeNoStatus], [InFeedingParents], [NoType], [AllStudents]) VALUES (11, 23, 0, 0, 0, 1, 0, 0, 0, 0, 61, 85)
INSERT [dbo].[CountStudents] ([ClassId], [ManyChildren], [LowIncome], [Invalid], [Orphan], [OVZ], [InHomeOVZ], [InHomeInvalid], [InHomeNoStatus], [InFeedingParents], [NoType], [AllStudents]) VALUES (12, 26, 0, 0, 1, 3, 0, 0, 0, 0, 52, 82)
INSERT [dbo].[CountStudents] ([ClassId], [ManyChildren], [LowIncome], [Invalid], [Orphan], [OVZ], [InHomeOVZ], [InHomeInvalid], [InHomeNoStatus], [InFeedingParents], [NoType], [AllStudents]) VALUES (13, 10, 0, 25, 0, 0, 10, 10, 10, 2, 2, 100)
INSERT [dbo].[CountStudents] ([ClassId], [ManyChildren], [LowIncome], [Invalid], [Orphan], [OVZ], [InHomeOVZ], [InHomeInvalid], [InHomeNoStatus], [InFeedingParents], [NoType], [AllStudents]) VALUES (15, 18, 0, 2, 0, 4, 2, 0, 0, 0, 116, 142)
INSERT [dbo].[CountStudents] ([ClassId], [ManyChildren], [LowIncome], [Invalid], [Orphan], [OVZ], [InHomeOVZ], [InHomeInvalid], [InHomeNoStatus], [InFeedingParents], [NoType], [AllStudents]) VALUES (16, 34, 0, 1, 1, 0, 0, 0, 0, 0, 52, 88)
INSERT [dbo].[CountStudents] ([ClassId], [ManyChildren], [LowIncome], [Invalid], [Orphan], [OVZ], [InHomeOVZ], [InHomeInvalid], [InHomeNoStatus], [InFeedingParents], [NoType], [AllStudents]) VALUES (17, 23, 0, 0, 0, 1, 0, 0, 0, 0, 61, 85)
GO
SET IDENTITY_INSERT [dbo].[LoginHistory] ON 

INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1, 3, CAST(N'2022-05-19T19:50:32.617' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (2, 3, CAST(N'2022-05-19T20:00:20.863' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (3, 3, CAST(N'2022-05-19T20:05:47.880' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (4, 3, CAST(N'2022-05-19T20:12:39.627' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (5, 3, CAST(N'2022-05-19T20:12:43.643' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (6, 3, CAST(N'2022-05-19T20:14:26.540' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (7, 3, CAST(N'2022-05-19T21:18:07.727' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (8, 3, CAST(N'2022-05-19T21:18:44.950' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (9, 3, CAST(N'2022-05-19T21:34:45.760' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (10, 3, CAST(N'2022-05-21T11:44:05.093' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (11, 3, CAST(N'2022-05-21T11:45:43.167' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (12, 3, CAST(N'2022-05-21T12:00:38.963' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (13, 3, CAST(N'2022-05-21T12:01:22.107' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (14, 3, CAST(N'2022-05-21T12:01:27.850' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (15, 3, CAST(N'2022-05-21T12:02:20.053' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (16, 3, CAST(N'2022-05-21T12:02:23.377' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (17, 3, CAST(N'2022-05-21T12:02:26.717' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (18, 3, CAST(N'2022-05-21T12:03:24.040' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (19, 3, CAST(N'2022-05-21T12:04:52.417' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (20, 3, CAST(N'2022-05-21T12:05:00.213' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (21, 3, CAST(N'2022-05-21T12:05:50.073' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (22, 3, CAST(N'2022-05-21T12:06:01.243' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (23, 3, CAST(N'2022-05-21T12:06:05.957' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (24, 3, CAST(N'2022-05-21T12:06:25.460' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (25, 3, CAST(N'2022-05-21T12:06:28.020' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (26, 3, CAST(N'2022-05-21T12:06:31.380' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (27, 3, CAST(N'2022-05-21T12:06:41.303' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (28, 3, CAST(N'2022-05-21T12:06:43.420' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (29, 3, CAST(N'2022-05-21T12:07:01.643' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (30, 3, CAST(N'2022-05-21T12:13:25.040' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (31, 3, CAST(N'2022-05-21T12:41:11.483' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (32, 3, CAST(N'2022-05-21T12:42:01.517' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (33, 3, CAST(N'2022-05-21T12:44:04.543' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (34, 3, CAST(N'2022-05-21T12:54:03.070' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (35, 3, CAST(N'2022-05-21T12:55:29.043' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (36, 3, CAST(N'2022-05-21T12:58:36.087' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (37, 3, CAST(N'2022-05-21T14:48:20.683' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (38, 3, CAST(N'2022-05-21T14:49:07.170' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (39, 3, CAST(N'2022-05-21T14:54:05.850' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (40, 3, CAST(N'2022-05-21T18:31:47.387' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (41, 3, CAST(N'2022-05-21T19:23:45.450' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (42, 3, CAST(N'2022-05-21T19:29:17.347' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (43, 3, CAST(N'2022-05-21T19:30:00.817' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (44, 3, CAST(N'2022-05-21T19:48:47.350' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (45, 3, CAST(N'2022-05-21T20:02:01.477' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (46, 3, CAST(N'2022-05-21T20:14:33.900' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (47, 3, CAST(N'2022-05-21T20:18:25.553' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (48, 3, CAST(N'2022-05-21T20:21:35.130' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (49, 3, CAST(N'2022-05-21T20:24:36.790' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (50, 3, CAST(N'2022-05-21T20:28:02.070' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (51, 3, CAST(N'2022-05-21T20:35:44.327' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (52, 3, CAST(N'2022-05-21T20:40:41.047' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (53, 3, CAST(N'2022-05-21T20:41:20.773' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (54, 3, CAST(N'2022-05-21T20:52:46.913' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (55, 3, CAST(N'2022-05-22T09:57:23.767' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (56, 3, CAST(N'2022-05-22T09:58:13.407' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (57, 3, CAST(N'2022-05-22T15:05:35.300' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (58, 3, CAST(N'2022-05-22T15:09:43.327' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (59, 3, CAST(N'2022-05-22T15:15:08.923' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (60, 3, CAST(N'2022-05-22T15:15:57.490' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (61, 3, CAST(N'2022-05-22T15:17:40.870' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (62, 3, CAST(N'2022-05-22T15:19:16.480' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (63, 3, CAST(N'2022-05-22T15:20:26.877' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (64, 3, CAST(N'2022-05-22T15:20:58.883' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (65, 3, CAST(N'2022-05-22T15:21:57.470' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (66, 3, CAST(N'2022-05-22T15:29:13.883' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (67, 3, CAST(N'2022-05-22T15:35:00.823' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (68, 3, CAST(N'2022-05-22T15:38:31.063' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (69, 3, CAST(N'2022-05-22T15:40:24.077' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (70, 3, CAST(N'2022-05-22T15:43:05.470' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (71, 3, CAST(N'2022-05-22T15:46:04.370' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (72, 3, CAST(N'2022-05-22T15:46:50.660' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (73, 3, CAST(N'2022-05-22T15:55:26.467' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (74, 3, CAST(N'2022-05-22T15:56:33.477' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (75, 3, CAST(N'2022-05-22T15:57:55.463' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (76, 3, CAST(N'2022-05-22T15:58:42.977' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1055, 3, CAST(N'2022-05-23T14:07:57.247' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1056, 3, CAST(N'2022-05-24T09:46:33.263' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1057, 3, CAST(N'2022-05-24T17:25:45.537' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1058, 3, CAST(N'2022-05-24T18:09:57.353' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1059, 3, CAST(N'2022-05-24T18:17:49.747' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1060, 3, CAST(N'2022-05-24T18:32:37.620' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1061, 3, CAST(N'2022-05-24T18:34:13.303' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1062, 3, CAST(N'2022-05-24T19:10:43.413' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1063, 3, CAST(N'2022-05-24T20:04:23.267' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1064, 3, CAST(N'2022-05-26T15:41:04.213' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1065, 3, CAST(N'2022-05-26T15:52:41.997' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1066, 3, CAST(N'2022-05-26T15:53:38.657' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1067, 3, CAST(N'2022-05-26T15:57:49.873' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1068, 3, CAST(N'2022-05-26T15:59:15.600' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1069, 3, CAST(N'2022-05-26T16:00:22.250' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1070, 3, CAST(N'2022-05-26T16:03:58.460' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1071, 3, CAST(N'2022-05-26T16:08:46.210' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1072, 3, CAST(N'2022-05-26T16:15:29.573' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1073, 3, CAST(N'2022-05-26T16:17:22.977' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1074, 3, CAST(N'2022-05-26T16:17:55.757' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1075, 3, CAST(N'2022-05-26T16:20:20.753' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1076, 3, CAST(N'2022-05-26T16:21:20.073' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1077, 3, CAST(N'2022-05-26T16:23:31.007' AS DateTime), 1)
GO
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1078, 3, CAST(N'2022-05-26T16:24:36.393' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1079, 3, CAST(N'2022-05-26T17:06:19.293' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1080, 3, CAST(N'2022-05-26T17:07:27.380' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1081, 3, CAST(N'2022-05-26T17:09:30.513' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1082, 3, CAST(N'2022-05-26T17:17:32.207' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1083, 1, CAST(N'2022-05-26T17:17:35.913' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1084, 3, CAST(N'2022-05-26T18:02:33.093' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1085, 3, CAST(N'2022-05-26T18:03:40.780' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1086, 1, CAST(N'2022-05-26T18:09:37.987' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1087, 1, CAST(N'2022-05-26T18:10:02.203' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1088, 1, CAST(N'2022-05-26T18:10:15.957' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1089, 1, CAST(N'2022-05-26T18:10:18.363' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1090, 3, CAST(N'2022-05-26T18:20:36.980' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1091, 1, CAST(N'2022-05-26T18:20:40.790' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1092, 3, CAST(N'2022-05-26T18:21:17.390' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1093, 1, CAST(N'2022-05-26T18:21:49.573' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1094, 1, CAST(N'2022-05-26T18:22:13.710' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1095, 1, CAST(N'2022-05-26T18:23:13.943' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1096, 1, CAST(N'2022-05-26T18:24:21.827' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1097, 1, CAST(N'2022-05-26T18:25:21.063' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1098, 1, CAST(N'2022-05-26T18:26:01.453' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1099, 1, CAST(N'2022-05-26T18:26:50.383' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1100, 1, CAST(N'2022-05-26T18:26:59.640' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1101, 1, CAST(N'2022-05-26T18:29:56.950' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1102, 4, CAST(N'2022-05-26T18:30:11.907' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1103, 1, CAST(N'2022-05-26T18:32:16.640' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1104, 4, CAST(N'2022-05-26T18:32:37.733' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1105, 4, CAST(N'2022-05-26T18:36:10.440' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1106, 4, CAST(N'2022-05-26T18:36:29.430' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1107, 4, CAST(N'2022-05-26T18:37:00.200' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1108, 4, CAST(N'2022-05-26T18:41:38.037' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1109, 1, CAST(N'2022-05-26T18:55:23.453' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1110, 1, CAST(N'2022-05-26T18:55:51.413' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1111, 3, CAST(N'2022-05-26T18:56:20.497' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1112, 1, CAST(N'2022-05-26T18:59:47.710' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1113, 1, CAST(N'2022-05-26T19:01:46.510' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1114, 1, CAST(N'2022-05-26T19:03:40.437' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1115, 4, CAST(N'2022-05-26T19:03:49.427' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1116, 3, CAST(N'2022-05-27T12:02:25.427' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1117, 3, CAST(N'2022-05-27T12:14:32.990' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1118, 3, CAST(N'2022-05-27T12:15:05.293' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1119, 3, CAST(N'2022-05-27T12:18:26.020' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1120, 3, CAST(N'2022-05-27T12:40:09.620' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1121, 3, CAST(N'2022-05-27T12:41:22.033' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1122, 3, CAST(N'2022-05-27T12:43:18.360' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1123, 3, CAST(N'2022-05-27T12:50:12.353' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1124, 4, CAST(N'2022-05-27T12:50:38.477' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1125, 4, CAST(N'2022-05-27T12:51:39.287' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1126, 1, CAST(N'2022-05-27T12:51:45.597' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1127, 3, CAST(N'2022-05-27T12:51:56.410' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1128, 3, CAST(N'2022-05-27T13:01:34.997' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1129, 1, CAST(N'2022-05-27T19:39:54.257' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1130, 1, CAST(N'2022-05-27T19:42:17.720' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1131, 4, CAST(N'2022-05-27T19:44:50.343' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1132, 3, CAST(N'2022-05-27T19:45:14.037' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1133, 3, CAST(N'2022-05-27T19:49:35.367' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1134, 3, CAST(N'2022-05-27T19:50:20.343' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1135, 1, CAST(N'2022-05-28T12:56:30.247' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1136, 1, CAST(N'2022-05-28T20:04:16.997' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1137, 1, CAST(N'2022-05-28T20:05:49.740' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1138, 1, CAST(N'2022-05-28T20:08:20.873' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1139, 1, CAST(N'2022-05-28T20:10:23.877' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1140, 1, CAST(N'2022-05-28T20:11:34.117' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1141, 3, CAST(N'2022-05-28T20:11:53.520' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1142, 3, CAST(N'2022-05-28T20:12:35.567' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1143, 3, CAST(N'2022-05-28T20:15:02.123' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1144, 3, CAST(N'2022-05-28T20:15:06.220' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1145, 3, CAST(N'2022-05-28T20:17:17.357' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1146, 3, CAST(N'2022-05-28T20:17:36.487' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1147, 3, CAST(N'2022-05-28T20:18:02.247' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1148, 3, CAST(N'2022-05-28T20:18:13.973' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1149, 1, CAST(N'2022-05-31T12:19:43.460' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1150, 1, CAST(N'2022-05-31T12:24:00.833' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1151, 1, CAST(N'2022-05-31T12:25:02.463' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1152, 1, CAST(N'2022-05-31T12:26:37.300' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1153, 1, CAST(N'2022-05-31T12:26:49.180' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1154, 1, CAST(N'2022-05-31T12:30:31.293' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1155, 1, CAST(N'2022-05-31T12:31:36.487' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1156, 1, CAST(N'2022-05-31T13:50:09.267' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1157, 1, CAST(N'2022-05-31T13:51:06.793' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1158, 1, CAST(N'2022-05-31T13:52:39.510' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1159, 1, CAST(N'2022-05-31T13:54:16.237' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1160, 1, CAST(N'2022-05-31T13:55:35.423' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1161, 1, CAST(N'2022-05-31T14:00:29.473' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1162, 1, CAST(N'2022-05-31T14:01:47.593' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1163, 1, CAST(N'2022-05-31T14:03:30.127' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1164, 1, CAST(N'2022-05-31T14:04:19.677' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1165, 1, CAST(N'2022-05-31T14:04:59.660' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1166, 1, CAST(N'2022-05-31T14:05:00.730' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1167, 1, CAST(N'2022-05-31T15:20:26.250' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1168, 1, CAST(N'2022-05-31T15:21:33.873' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1169, 1, CAST(N'2022-05-31T15:22:30.113' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1170, 1, CAST(N'2022-05-31T15:25:15.413' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1171, 1, CAST(N'2022-05-31T15:27:33.740' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1172, 1, CAST(N'2022-05-31T15:38:43.320' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1173, 1, CAST(N'2022-05-31T15:39:54.357' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1174, 1, CAST(N'2022-05-31T18:50:29.140' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1175, 1, CAST(N'2022-05-31T18:53:35.357' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1176, 1, CAST(N'2022-05-31T18:56:23.673' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1177, 1, CAST(N'2022-05-31T19:02:56.393' AS DateTime), 1)
GO
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1178, 1, CAST(N'2022-05-31T19:04:15.363' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1179, 1, CAST(N'2022-05-31T19:06:56.267' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1180, 1, CAST(N'2022-05-31T19:12:34.267' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1181, 1, CAST(N'2022-05-31T19:33:38.610' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1182, 1, CAST(N'2022-05-31T19:37:06.110' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1183, 1, CAST(N'2022-05-31T19:46:40.403' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1184, 1, CAST(N'2022-05-31T19:49:07.307' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1185, 1, CAST(N'2022-05-31T19:51:19.213' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1186, 1, CAST(N'2022-05-31T19:51:58.057' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1187, 1, CAST(N'2022-05-31T21:49:35.520' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1188, 1, CAST(N'2022-06-02T21:36:26.920' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1189, 1, CAST(N'2022-06-05T16:53:06.677' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1190, 3, CAST(N'2022-06-05T16:53:34.007' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1191, 3, CAST(N'2022-06-05T16:53:39.847' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1192, 1, CAST(N'2022-06-05T16:53:47.810' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1193, 3, CAST(N'2022-06-05T16:53:57.107' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1194, 3, CAST(N'2022-06-05T17:12:01.727' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1195, 1, CAST(N'2022-06-06T09:49:42.617' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1196, 1, CAST(N'2022-06-06T09:49:50.207' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1197, 3, CAST(N'2022-06-06T09:50:19.147' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1198, 3, CAST(N'2022-06-06T09:50:22.573' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1199, 3, CAST(N'2022-06-06T09:50:25.597' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1200, 3, CAST(N'2022-06-06T09:50:47.397' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1201, 1, CAST(N'2022-06-06T09:55:54.967' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1202, 1, CAST(N'2022-06-06T09:56:38.657' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1203, 3, CAST(N'2022-06-06T09:57:50.443' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1204, 1, CAST(N'2022-06-06T22:18:10.710' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1205, 1, CAST(N'2022-06-06T22:26:39.263' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1206, 1, CAST(N'2022-06-06T22:27:21.957' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1207, 1, CAST(N'2022-06-06T22:41:02.927' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1208, 1, CAST(N'2022-06-06T22:47:19.537' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1209, 1, CAST(N'2022-06-06T22:55:17.197' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1210, 1, CAST(N'2022-06-06T22:57:07.473' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1211, 1, CAST(N'2022-06-06T23:02:52.630' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1212, 1, CAST(N'2022-06-06T23:03:43.420' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1213, 1, CAST(N'2022-06-06T23:09:17.217' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1214, 1, CAST(N'2022-06-06T23:11:49.350' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1215, 1, CAST(N'2022-06-06T23:26:43.227' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1216, 1, CAST(N'2022-06-06T23:28:06.393' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1217, 1, CAST(N'2022-06-06T23:31:31.437' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1218, 1, CAST(N'2022-06-06T23:37:53.517' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1219, 1, CAST(N'2022-06-06T23:38:52.493' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1220, 1, CAST(N'2022-06-06T23:41:13.837' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1221, 1, CAST(N'2022-06-06T23:42:34.180' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1222, 1, CAST(N'2022-06-06T23:43:38.177' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1223, 1, CAST(N'2022-06-06T23:45:32.740' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1224, 3, CAST(N'2022-06-06T23:52:32.053' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1225, 3, CAST(N'2022-06-06T23:58:39.833' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1226, 3, CAST(N'2022-06-06T23:58:44.820' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1227, 1, CAST(N'2022-06-07T07:52:20.083' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (1228, 1, CAST(N'2022-06-07T08:00:23.643' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (2227, 1, CAST(N'2022-06-07T22:19:55.123' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (2228, 1, CAST(N'2022-06-07T22:23:13.537' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (2229, 3, CAST(N'2022-06-16T18:44:52.760' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (2230, 3, CAST(N'2022-06-16T18:44:58.723' AS DateTime), 0)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (2231, 3, CAST(N'2022-06-16T18:45:11.790' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (2232, 3, CAST(N'2022-06-16T18:55:11.047' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (2233, 3, CAST(N'2022-06-16T18:56:35.867' AS DateTime), 1)
INSERT [dbo].[LoginHistory] ([Id], [UserId], [Date], [Successful]) VALUES (2234, 3, CAST(N'2022-06-16T19:07:27.850' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[LoginHistory] OFF
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Administrator')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Manager')
GO
SET IDENTITY_INSERT [dbo].[School] ON 

INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (1, 1, N'МБОУ СШ №1', NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (2, 2, N'МБОУ СШ №2', NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (3, 3, N'МБОУ СШ №3', NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (4, 4, N'МБОУ СШ №4', NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (5, 5, N'МБОУ СШ №5', NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (6, 6, N'МБОУ СШ №6', NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (7, 7, N'МБОУ СШ №7', NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (8, 8, N'МБОУ СШ №8', NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (9, 9, N'МБОУ СШ №9', NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (10, 10, NULL, NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (11, 11, NULL, NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (12, 12, NULL, NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (13, 13, NULL, NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (14, 14, NULL, NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (15, 15, NULL, NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (16, 16, NULL, NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (17, 17, NULL, NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (18, 19, NULL, NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (19, 20, NULL, NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (20, 24, NULL, NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (21, 25, NULL, NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (22, 27, NULL, NULL)
INSERT [dbo].[School] ([Id], [Number], [Description], [Locality]) VALUES (23, 1000, N'Администратор', NULL)
SET IDENTITY_INSERT [dbo].[School] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Login], [Password], [Name], [RoleId], [SchoolId], [Id]) VALUES (N'1', N'1', N'Семён', 2, 1, 1)
INSERT [dbo].[User] ([Login], [Password], [Name], [RoleId], [SchoolId], [Id]) VALUES (N'3', N'3', N'Елена', 1, 23, 3)
INSERT [dbo].[User] ([Login], [Password], [Name], [RoleId], [SchoolId], [Id]) VALUES (N'2', N'2', N'Даниил', 2, 2, 4)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Beneficiary]  WITH CHECK ADD  CONSTRAINT [FK_Beneficiary_BeneficiaryType1] FOREIGN KEY([TypeId])
REFERENCES [dbo].[BeneficiaryType] ([Id])
GO
ALTER TABLE [dbo].[Beneficiary] CHECK CONSTRAINT [FK_Beneficiary_BeneficiaryType1]
GO
ALTER TABLE [dbo].[Beneficiary]  WITH CHECK ADD  CONSTRAINT [FK_Beneficiary_Certificate] FOREIGN KEY([CertificateId])
REFERENCES [dbo].[Certificate] ([Id])
GO
ALTER TABLE [dbo].[Beneficiary] CHECK CONSTRAINT [FK_Beneficiary_Certificate]
GO
ALTER TABLE [dbo].[Beneficiary]  WITH CHECK ADD  CONSTRAINT [FK_Beneficiary_Classes] FOREIGN KEY([ClassesId])
REFERENCES [dbo].[Classes] ([Id])
GO
ALTER TABLE [dbo].[Beneficiary] CHECK CONSTRAINT [FK_Beneficiary_Classes]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [FK_Class_School] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[School] ([Id])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [FK_Class_School]
GO
ALTER TABLE [dbo].[CountStudents]  WITH CHECK ADD  CONSTRAINT [FK_CountStudents_Classes] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Classes] ([Id])
GO
ALTER TABLE [dbo].[CountStudents] CHECK CONSTRAINT [FK_CountStudents_Classes]
GO
ALTER TABLE [dbo].[LoginHistory]  WITH CHECK ADD  CONSTRAINT [FK_LoginHistory_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[LoginHistory] CHECK CONSTRAINT [FK_LoginHistory_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_School] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[School] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_School]
GO
