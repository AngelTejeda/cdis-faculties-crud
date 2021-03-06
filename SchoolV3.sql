USE [master]
GO
ALTER DATABASE [SchoolV3] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
DROP DATABASE IF EXISTS [SchoolV3]
GO
/****** Object:  Database [SchoolV3]    Script Date: 30-Sep-21 11:34:44 PM ******/
CREATE DATABASE [SchoolV3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SchoolV3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SchoolV3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SchoolV3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SchoolV3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SchoolV3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SchoolV3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SchoolV3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SchoolV3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SchoolV3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SchoolV3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SchoolV3] SET ARITHABORT OFF 
GO
ALTER DATABASE [SchoolV3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SchoolV3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SchoolV3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SchoolV3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SchoolV3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SchoolV3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SchoolV3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SchoolV3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SchoolV3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SchoolV3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SchoolV3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SchoolV3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SchoolV3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SchoolV3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SchoolV3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SchoolV3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SchoolV3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SchoolV3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SchoolV3] SET  MULTI_USER 
GO
ALTER DATABASE [SchoolV3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SchoolV3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SchoolV3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SchoolV3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SchoolV3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SchoolV3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SchoolV3] SET QUERY_STORE = OFF
GO
USE [SchoolV3]
GO
/****** Object:  Table [dbo].[City]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city_name] [varchar](50) NOT NULL,
	[state_id] [int] NOT NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[country_id] [int] IDENTITY(1,1) NOT NULL,
	[country_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[faculty_id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](10) NOT NULL,
	[faculty_name] [varchar](100) NOT NULL,
	[foundation_date] [date] NOT NULL,
	[university_id] [int] NOT NULL,
	[city_id] [int] NOT NULL,
 CONSTRAINT [PK_Facultad] PRIMARY KEY CLUSTERED 
(
	[faculty_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacultySubject]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacultySubject](
	[faculty_subject_id] [int] IDENTITY(1,1) NOT NULL,
	[faculty_id] [int] NOT NULL,
	[subject_id] [int] NOT NULL,
 CONSTRAINT [PK_FacultySubject] PRIMARY KEY CLUSTERED 
(
	[faculty_subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[state_id] [int] IDENTITY(1,1) NOT NULL,
	[state_name] [varchar](50) NOT NULL,
	[country_id] [int] NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[student_id] [int] NOT NULL,
	[student_name] [varchar](100) NOT NULL,
	[birth_date] [date] NOT NULL,
	[semester] [int] NOT NULL,
	[faculty_id] [int] NOT NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subject_id] [int] IDENTITY(1,1) NOT NULL,
	[subject_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[University]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[University](
	[university_id] [int] IDENTITY(1,1) NOT NULL,
	[university_name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Universidad] PRIMARY KEY CLUSTERED 
(
	[university_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](10) NOT NULL,
	[user_type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([city_id], [city_name], [state_id]) VALUES (1, N'Monterrey', 1)
INSERT [dbo].[City] ([city_id], [city_name], [state_id]) VALUES (2, N'San Nicolás', 1)
INSERT [dbo].[City] ([city_id], [city_name], [state_id]) VALUES (3, N'Acatlán', 2)
INSERT [dbo].[City] ([city_id], [city_name], [state_id]) VALUES (4, N'Miguel Hidalgo', 2)
INSERT [dbo].[City] ([city_id], [city_name], [state_id]) VALUES (5, N'Cuatitlán', 2)
INSERT [dbo].[City] ([city_id], [city_name], [state_id]) VALUES (6, N'Guadalajara', 3)
INSERT [dbo].[City] ([city_id], [city_name], [state_id]) VALUES (7, N'Tonalá', 3)
INSERT [dbo].[City] ([city_id], [city_name], [state_id]) VALUES (8, N'Cambridge', 4)
INSERT [dbo].[City] ([city_id], [city_name], [state_id]) VALUES (9, N'New Haven', 5)
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([country_id], [country_name]) VALUES (1, N'México')
INSERT [dbo].[Country] ([country_id], [country_name]) VALUES (2, N'Estados Unidos de América')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Faculty] ON 

INSERT [dbo].[Faculty] ([faculty_id], [code], [faculty_name], [foundation_date], [university_id], [city_id]) VALUES (1, N'FCFM01', N'Facultad de Ciencias Físico Matemáticas', CAST(N'1943-01-25' AS Date), 1, 2)
INSERT [dbo].[Faculty] ([faculty_id], [code], [faculty_name], [foundation_date], [university_id], [city_id]) VALUES (2, N'FIME01', N'Facultad de Ingeniería Mecánica Eléctrica', CAST(N'1930-06-19' AS Date), 1, 2)
INSERT [dbo].[Faculty] ([faculty_id], [code], [faculty_name], [foundation_date], [university_id], [city_id]) VALUES (3, N'CUCS01', N'Centro Universitario de Ciencias de la Salud', CAST(N'1950-10-12' AS Date), 2, 6)
INSERT [dbo].[Faculty] ([faculty_id], [code], [faculty_name], [foundation_date], [university_id], [city_id]) VALUES (4, N'FESU01', N'Facultad de Estudios Superiores (FES) Acatlán', CAST(N'1980-12-05' AS Date), 3, 3)
INSERT [dbo].[Faculty] ([faculty_id], [code], [faculty_name], [foundation_date], [university_id], [city_id]) VALUES (5, N'FESU02', N'Facultad de Estudios Superiores (FES) Cuautitlán', CAST(N'1953-06-02' AS Date), 3, 5)
INSERT [dbo].[Faculty] ([faculty_id], [code], [faculty_name], [foundation_date], [university_id], [city_id]) VALUES (6, N'SEAS01', N'School of Engineering and Applied Sciences', CAST(N'1900-05-12' AS Date), 3, 8)
INSERT [dbo].[Faculty] ([faculty_id], [code], [faculty_name], [foundation_date], [university_id], [city_id]) VALUES (7, N'DOCS01', N'Department of Computer Science', CAST(N'1926-11-22' AS Date), 4, 9)
SET IDENTITY_INSERT [dbo].[Faculty] OFF
GO
SET IDENTITY_INSERT [dbo].[FacultySubject] ON 

INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (1, 7, 4)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (2, 7, 5)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (3, 7, 6)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (4, 6, 1)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (5, 6, 3)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (6, 5, 1)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (7, 5, 5)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (8, 5, 6)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (9, 4, 2)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (10, 4, 3)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (11, 4, 5)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (12, 4, 6)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (13, 3, 2)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (14, 3, 6)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (15, 2, 2)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (16, 2, 4)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (17, 2, 6)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (18, 1, 1)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (19, 1, 2)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (20, 1, 3)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (21, 1, 4)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (22, 1, 5)
INSERT [dbo].[FacultySubject] ([faculty_subject_id], [faculty_id], [subject_id]) VALUES (23, 1, 6)
SET IDENTITY_INSERT [dbo].[FacultySubject] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([state_id], [state_name], [country_id]) VALUES (1, N'Nuevo León', 1)
INSERT [dbo].[State] ([state_id], [state_name], [country_id]) VALUES (2, N'Ciudad de México', 1)
INSERT [dbo].[State] ([state_id], [state_name], [country_id]) VALUES (3, N'Jalisco', 1)
INSERT [dbo].[State] ([state_id], [state_name], [country_id]) VALUES (4, N'Massachusetts', 2)
INSERT [dbo].[State] ([state_id], [state_name], [country_id]) VALUES (5, N'Connecticut', 2)
SET IDENTITY_INSERT [dbo].[State] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (1, N'Álgebra')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (2, N'Cálculo Diferencial')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (3, N'Cálculo Integral')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (4, N'Metodología de la Programación')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (5, N'Programación Estructurada')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (6, N'Programación Orientada a Objetos')
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
SET IDENTITY_INSERT [dbo].[University] ON 

INSERT [dbo].[University] ([university_id], [university_name]) VALUES (1, N'Universidad Autónoma de Nuevo León')
INSERT [dbo].[University] ([university_id], [university_name]) VALUES (2, N'Universidad de Guadalajara')
INSERT [dbo].[University] ([university_id], [university_name]) VALUES (3, N'Universidad Nacional Autónoma de México')
INSERT [dbo].[University] ([university_id], [university_name]) VALUES (4, N'Harvard University')
INSERT [dbo].[University] ([university_id], [university_name]) VALUES (5, N'Yale University')
SET IDENTITY_INSERT [dbo].[University] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([user_id], [username], [password], [user_type]) VALUES (1, N'angelT', N'2501', N'Administrator')
INSERT [dbo].[User] ([user_id], [username], [password], [user_type]) VALUES (2, N'andreaM', N'1103', N'Teacher')
INSERT [dbo].[User] ([user_id], [username], [password], [user_type]) VALUES (3, N'default', N'1234', N'Default')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_Codigo]    Script Date: 30-Sep-21 11:34:44 PM ******/
ALTER TABLE [dbo].[Faculty] ADD  CONSTRAINT [AK_Codigo] UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([state_id])
REFERENCES [dbo].[State] ([state_id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[Faculty]  WITH CHECK ADD  CONSTRAINT [FK_Faculty_City] FOREIGN KEY([city_id])
REFERENCES [dbo].[City] ([city_id])
GO
ALTER TABLE [dbo].[Faculty] CHECK CONSTRAINT [FK_Faculty_City]
GO
ALTER TABLE [dbo].[Faculty]  WITH CHECK ADD  CONSTRAINT [FK_Faculty_University] FOREIGN KEY([university_id])
REFERENCES [dbo].[University] ([university_id])
GO
ALTER TABLE [dbo].[Faculty] CHECK CONSTRAINT [FK_Faculty_University]
GO
ALTER TABLE [dbo].[FacultySubject]  WITH CHECK ADD  CONSTRAINT [FK_FacultySubject_Faculty] FOREIGN KEY([faculty_id])
REFERENCES [dbo].[Faculty] ([faculty_id])
GO
ALTER TABLE [dbo].[FacultySubject] CHECK CONSTRAINT [FK_FacultySubject_Faculty]
GO
ALTER TABLE [dbo].[FacultySubject]  WITH CHECK ADD  CONSTRAINT [FK_FacultySubject_Subject] FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subject] ([subject_id])
GO
ALTER TABLE [dbo].[FacultySubject] CHECK CONSTRAINT [FK_FacultySubject_Subject]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([country_id])
REFERENCES [dbo].[Country] ([country_id])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Country]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Faculty] FOREIGN KEY([faculty_id])
REFERENCES [dbo].[Faculty] ([faculty_id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Faculty]
GO
/****** Object:  StoredProcedure [dbo].[City_GetListByState]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[City_GetListByState]
	-- Add the parameters for the stored procedure here
	@state_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM City
	WHERE state_id = @state_id
END
GO
/****** Object:  StoredProcedure [dbo].[Country_GetList]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Country_GetList]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Country
END
GO
/****** Object:  StoredProcedure [dbo].[Faculty_Add]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Faculty_Add]
	-- Add the parameters for the stored procedure here
	@code varchar(10),
	@faculty_name varchar(100),
	@foundation_date date,
	@university_id int,
	@city_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Faculty
	VALUES (@code, @faculty_name, @foundation_date, @university_id, @city_id)
END
GO
/****** Object:  StoredProcedure [dbo].[Faculty_Delete]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Faculty_Delete]
	@faculty_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE Faculty
	WHERE faculty_id = @faculty_id
END
GO
/****** Object:  StoredProcedure [dbo].[Faculty_GetList]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Faculty_GetList]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT f.faculty_id, f.code, f.faculty_name, f.foundation_date, f.university_id, f.city_id, c.state_id, s.country_id
	FROM Faculty f
	JOIN City c ON f.city_id = c.city_id
	JOIN [State] s ON c.state_id = s.state_id
END
GO
/****** Object:  StoredProcedure [dbo].[Faculty_GetListJoinFK]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Faculty_GetListJoinFK]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT f.faculty_id, f.code, f.faculty_name, f.foundation_date, u.university_name, c.city_name, s.state_name, co.country_name
	FROM Faculty f
	JOIN University u ON f.university_id = u.university_id
	JOIN City c ON f.city_id = c.city_id
	JOIN [State] s ON c.state_id = s.state_id
	JOIN Country co ON s.country_id = co.country_id
END
GO
/****** Object:  StoredProcedure [dbo].[Faculty_GetSingleByCode]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Faculty_GetSingleByCode]
	-- Add the parameters for the stored procedure here
	@code varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Faculty
	WHERE code = @code
END
GO
/****** Object:  StoredProcedure [dbo].[Faculty_GetSingleById]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Faculty_GetSingleById]
	@faculty_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT f.faculty_id, f.code, f.faculty_name, f.foundation_date, f.university_id, f.city_id, c.state_id, s.country_id
	FROM Faculty f
	JOIN City c ON f.city_id = c.city_id
	JOIN [State] s ON c.state_id = s.state_id
	WHERE f.faculty_id = @faculty_id
END
GO
/****** Object:  StoredProcedure [dbo].[Faculty_GetSingleByIdJoinFK]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Faculty_GetSingleByIdJoinFK]
	@faculty_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT f.faculty_id, f.code, f.faculty_name, f.foundation_date, f.university_id, u.university_name, c.city_name, s.state_name, co.country_name
	FROM Faculty f
	JOIN University u ON f.university_id = u.university_id
	JOIN City c ON f.city_id = c.city_id
	JOIN [State] s ON c.state_id = s.state_id
	JOIN Country co ON s.country_id = co.country_id
	WHERE f.faculty_id = @faculty_id
END
GO
/****** Object:  StoredProcedure [dbo].[Faculty_Update]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Faculty_Update]
	-- Add the parameters for the stored procedure here
	@faculty_id int,
	@code varchar(10),
	@faculty_name varchar(100),
	@foundation_date date,
	@university_id int,
	@city_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Faculty
	SET code = @code, faculty_name = @faculty_name, foundation_date = @foundation_date, university_id = @university_id, city_id = @city_id
	WHERE faculty_id = @faculty_id
END
GO
/****** Object:  StoredProcedure [dbo].[State_GetListByCountry]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[State_GetListByCountry]
	@country_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM [State]
	WHERE country_id = @country_id
END
GO
/****** Object:  StoredProcedure [dbo].[Student_Add]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Student_Add]
	-- Add the parameters for the stored procedure here
	@student_id int,
	@student_name varchar(100),
	@birth_date Date,
	@semester int,
	@faculty_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Student
	VALUES(@student_id, @student_name, @birth_date, @semester, @faculty_id)
END
GO
/****** Object:  StoredProcedure [dbo].[Student_Delete]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Student_Delete]
	-- Add the parameters for the stored procedure here
	@student_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Student
	WHERE @student_id = @student_id
END
GO
/****** Object:  StoredProcedure [dbo].[Student_GetListJoinFK]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Student_GetListJoinFK]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT s.student_id, s.student_name, s.birth_date, s.semester, f.faculty_name
	FROM Student s
	JOIN Faculty f ON s.faculty_id = f.faculty_id
END
GO
/****** Object:  StoredProcedure [dbo].[Student_GetSingle]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Student_GetSingle]
	@student_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Student
	WHERE student_id= @student_id
END
GO
/****** Object:  StoredProcedure [dbo].[Student_Update]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Student_Update]
	-- Add the parameters for the stored procedure here
	@student_id int,
	@student_name varchar(100),
	@birth_date Date,
	@semester int,
	@faculty_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Student
	SET student_name = @student_name, birth_date = @birth_date, semester= @semester, faculty_id = @faculty_id
	WHERE student_id = @student_id
END
GO
/****** Object:  StoredProcedure [dbo].[University_GetList]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[University_GetList]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM University
END
GO
/****** Object:  StoredProcedure [dbo].[User_Login]    Script Date: 30-Sep-21 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[User_Login]
	-- Add the parameters for the stored procedure here
	@username varchar(50),
	@password varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM [User]
	WHERE username = @username AND [password] = @password
END
GO
USE [master]
GO
ALTER DATABASE [SchoolV3] SET  READ_WRITE 
GO
