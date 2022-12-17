USE [master]
GO
/****** Object:  Database [ESTACAO]    Script Date: 16/12/2022 22:14:55 ******/
CREATE DATABASE [ESTACAO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ESTACAO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ESTACAO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ESTACAO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ESTACAO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ESTACAO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ESTACAO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ESTACAO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ESTACAO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ESTACAO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ESTACAO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ESTACAO] SET ARITHABORT OFF 
GO
ALTER DATABASE [ESTACAO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ESTACAO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ESTACAO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ESTACAO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ESTACAO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ESTACAO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ESTACAO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ESTACAO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ESTACAO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ESTACAO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ESTACAO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ESTACAO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ESTACAO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ESTACAO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ESTACAO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ESTACAO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ESTACAO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ESTACAO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ESTACAO] SET  MULTI_USER 
GO
ALTER DATABASE [ESTACAO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ESTACAO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ESTACAO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ESTACAO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ESTACAO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ESTACAO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ESTACAO] SET QUERY_STORE = OFF
GO
USE [ESTACAO]
GO
/****** Object:  Table [dbo].[Comandas]    Script Date: 16/12/2022 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comandas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [varchar](50) NULL,
 CONSTRAINT [PK_Comanda] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClienteComanda]    Script Date: 16/12/2022 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClienteComanda](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NULL,
	[IdComanda] [int] NULL,
	[Data] [date] NULL,
 CONSTRAINT [PK_ClienteComanda] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 16/12/2022 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](255) NULL,
	[Documento] [varchar](20) NULL,
	[DataCadastro] [date] NULL,
	[Telefone] [varchar](150) NULL,
	[Descricao] [varchar](255) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ClientesComanda]    Script Date: 16/12/2022 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ClientesComanda]
AS
SELECT dbo.Clientes.*, dbo.Comandas.Numero AS Comanda, dbo.ClienteComanda.Data
FROM     dbo.ClienteComanda INNER JOIN
                  dbo.Comandas ON dbo.ClienteComanda.IdComanda = dbo.Comandas.Id RIGHT OUTER JOIN
                  dbo.Clientes ON dbo.ClienteComanda.IdCliente = dbo.Clientes.Id
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1, N'RAQUEL NASCIMENTO', N'496.039.181-2', CAST(N'2022-12-02' AS Date), N'(11)96821-9804', NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (2, N'CLEBSON FARIAS', N'348.925.748-05', CAST(N'2022-12-02' AS Date), N'(11)04823-7702', NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (3, N'MARCOS LOPES', NULL, CAST(N'2022-12-02' AS Date), N'(11)98126-6704', NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (4, N'LARISSE PEREIRA', NULL, CAST(N'2022-12-02' AS Date), N'(11)96971-4558', NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (5, N'SANDRA CRISTINA', N'509.623.238-70', CAST(N'2022-12-02' AS Date), N'(11)98189-1319', NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (6, N'JONATAN AUGUSTO', N'379.924.758-01', CAST(N'2022-12-02' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (7, N'TIAGO VICENTE', N'banda', CAST(N'2022-12-02' AS Date), N'(11)98044-9993', NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (8, N'FABIA SODRE', NULL, CAST(N'2022-12-02' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (9, N'FRANCILE JESUS', NULL, CAST(N'2022-12-02' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (10, N'JULIA OLIVEIRA', NULL, CAST(N'2022-12-02' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (11, N'VINICIUS SILVA', NULL, CAST(N'2022-12-02' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (12, N'SHEILA DOS SANTOS', NULL, CAST(N'2022-12-02' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (13, N'MARGARETE RASTELLI', NULL, CAST(N'2022-12-02' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (14, N'JULIA VITORIA', NULL, CAST(N'2022-12-02' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (15, N'BRUNA ROCHA', NULL, CAST(N'2022-12-02' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (16, N'EZEQUIEL DA SILVA', NULL, CAST(N'2022-12-02' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (17, N'GUILHERME LUDOVICO', NULL, CAST(N'2022-12-02' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (18, N'COSME APARECIDO', NULL, CAST(N'2022-12-02' AS Date), NULL, N'banda')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (19, N'MAIARA DUARTE LEITE', NULL, CAST(N'2022-12-02' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (20, N'GUILHERME RUBINART', NULL, CAST(N'2022-12-02' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (21, N'IGOR SANTANA', NULL, CAST(N'2022-12-02' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (22, N'KAREN REGINA', NULL, CAST(N'2022-12-02' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (23, N'DONIZETE FERREIRA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (24, N'JULIO RODRIGUES', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (25, N'GRAÇA GOMES', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (26, N'AMANDA DUARTE', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (27, N'gui', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (28, N'GUILHERME MOURA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (29, N'CRISTIANE BERNARDO', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (30, N'VANUZA ANDRADE', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (31, N'sandijunior', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (32, N'PAULO DOMINGS', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (33, N'JACKSON MONTEIRO', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (34, N'KATIA ALMEIDA DA SILVA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (35, N'ANA PAULA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (36, N'DANIELLE SOUZA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (37, N'EMILY MESSIAS', NULL, CAST(N'2022-12-03' AS Date), NULL, N'convidado niver')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (38, N'TONNY', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (39, N'TALITA MIRANDA', NULL, CAST(N'2022-12-03' AS Date), NULL, N'convidade niver')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (40, N'JULIANA SANTOS', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (41, N'JUNIOR LIMA', NULL, CAST(N'2022-12-03' AS Date), NULL, N'convidado ')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (42, N'RODINERE SANTANA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (43, N'EMILLY FERREIRA', NULL, CAST(N'2022-12-03' AS Date), NULL, N'aniversariante')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (44, N'GABRIELA RIBEIRO', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (45, N'ISA FERREIRA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (46, N'GIORGI LUIZ', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (47, N'JEFERSON RAMOS', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (48, N'BRUNO SANTOS', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (49, N'GEISA GODOI', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (50, N'GEOVA ANDRE', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (51, N'PEDRO', NULL, CAST(N'2022-12-03' AS Date), NULL, N'"tio kamilly"')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (52, N'VANDICLEIDE SILVA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (53, N'GUILHERME MOREIRA', NULL, CAST(N'2022-12-03' AS Date), NULL, N'banda')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (54, N'WILBERT ULISSIS', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (55, N'CAROLINE LOPES', NULL, CAST(N'2022-12-03' AS Date), NULL, N'banda')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (56, N'ELLEN GABRIELLEN', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (57, N'DJ RAFINHA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (58, N'JAQUELINE MATIAS', NULL, CAST(N'2022-12-03' AS Date), NULL, N'banda')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (59, N'ALEXANDRE JARDIM', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (60, N'LEANDRO MARIANO', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (61, N'DEBORA ELLEN', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (62, N'GIULIA TRINDADE', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (63, N'PALOMA TOMAZ', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (64, N'BANDA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (65, N'KAROL FREITA', NULL, CAST(N'2022-12-03' AS Date), NULL, N'JAPA')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (66, N'ERICA BANDA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (67, N'PRISCILA BALBINA', NULL, CAST(N'2022-12-03' AS Date), NULL, N'MAE JAPA')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (68, N'BRUNO PIRES', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (69, N'ENZO RALA', NULL, CAST(N'2022-12-03' AS Date), NULL, N'JAPA')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (70, N'TAMARA ROBERTA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (71, N'GUILHERME CARVALHO', NULL, CAST(N'2022-12-03' AS Date), NULL, N'JAPA')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (72, N'ANDERSON MARTINS', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (73, N'WELLINGTON', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (74, N'JAQUELINE SILVA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (75, N'LETICIA ROCHa', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (76, N'THIAGO SILVA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (77, N'TIAGO RAMOS', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (78, N'KAREN LIMA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (79, N'NICE', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (80, N'CAIQUE GOMES', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (81, N'WILSON LOPES', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (82, N'DIEGO DE CASTRO', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (83, N'FLAVIO BARBOSA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (84, N'PALOMA ANGELICA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (85, N'RENATA AUGUSTINHO', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (86, N'DANILO SANTOS', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (87, N'OSIMAR SILVA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (88, N'INGRID FEITOSA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (89, N'KAUE RIAN', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (90, N'ADRIANO RIBEIRO', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (91, N'BRUNA FERRAZ', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (92, N'MICHELE FERREIRA DOS SANTOS', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (93, N'THAMIRES PORTELA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (94, N'JEFFERSON BEZERRA DE SOUZA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (95, N'HUGO ROGERIO', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (96, N'ANA PAULA PIMENTA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (97, N'ana carolina', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (98, N'FABIO PIMENTA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (99, N'KEZIAQ VITORIA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (100, N'VINICIUS ALVES CARDIM', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (101, N'JONATA WOLF', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (102, N'GISELE APARECIDA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (103, N'ELICIO PEREIRA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (104, N'VANESSA DA SILVA MOREIRA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (105, N'JUNIOR SILVA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (106, N'MICHELE RAFAELE', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (107, N'BEATRIZ BELUZUNCES', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (108, N'WILGNER', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (109, N'KELVYN MACHADO DA SILVA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (110, N'JUANE GONZAGA', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (111, N'VITORIA KELLY', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (112, N'WESSEL SOARES', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (113, N'MONIQUE FREIRE', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (114, N'TIAGO MARTINS', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (115, N'PAMELA ARAUJO', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (116, N',ATHEUS MEDEIROS', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (117, N'LUANA CRISTINA SILVAQ', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (118, N'DIOGO LPES NETO', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (119, N'DENNER VICENTE', NULL, CAST(N'2022-12-03' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (120, N'MATHEUS ANDRADE', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (121, N'ROBSON ROBERTO', NULL, CAST(N'2022-12-04' AS Date), N'aniversariante', NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (122, N'GISELE WOLFF', NULL, CAST(N'2022-12-04' AS Date), NULL, N'convidade')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (123, N'ROSANE SANTOS', NULL, CAST(N'2022-12-04' AS Date), NULL, N'convidada')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (124, N'RAFAEL LIMA', NULL, CAST(N'2022-12-04' AS Date), NULL, N'convidado')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (125, N'TANIA TEXEIRA', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (126, N'JOSE CICERO', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (127, N'ELIAS JUNIOR', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (128, N'ana carolina', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (129, N'EDUARDO DOS SANTOS', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (130, N'JOSEFA MARIA', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (131, N'CAIO HATAE', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (132, N'FELIPE NOGUEIRA', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (133, N'RAFAEL DANTAS', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (134, N'AMILTON FERREIRA', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (135, N'MAS RODRIGUES', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (136, N'KATIELE SANTOS', NULL, CAST(N'2022-12-04' AS Date), NULL, N'aniversariante')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (137, N'ELTON GONCALVES', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (138, N'JULIANA SILVA', N'34892060x', CAST(N'2022-12-04' AS Date), NULL, N'convidada')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (139, N'TAMIRES EDUARDA', NULL, CAST(N'2022-12-04' AS Date), NULL, N'convidada')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (140, N'ALAN DIAS', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (141, N'ERICK AUGUSTO', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (142, N'VIVIANE SALES', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (143, N'BIANCA ALMEIDA', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (144, N'BRUNO SOUZAQ', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (145, N'RICARDO MUNIZ', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (146, N'KAROLINE FERREIRA', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (147, N'JOSE ANTONIO', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (148, N'TIAGO LUCIO', NULL, CAST(N'2022-12-04' AS Date), NULL, N'NICK')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (149, N'ANDERSON CARLOS', NULL, CAST(N'2022-12-04' AS Date), NULL, N'NICK')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (150, N'DANILO MOREIRA', NULL, CAST(N'2022-12-04' AS Date), NULL, N'NICK')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (151, N'SAMANTA SILVA', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (152, N'ERIKA DA SILVA SOUZA', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (153, N'WLA costa', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (154, N'ALINE FERREIRA DA SILVA', NULL, CAST(N'2022-12-04' AS Date), NULL, N'LUKAO')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (155, N'KATHLEEN TALLMANN', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (156, N'WALACE SOUZA', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (157, N'DAMARES SILVA', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (158, N'PRISCILA DOMINGOS DA SILVA', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (159, N'NATAN DO NASCIMENOT LOPES', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (160, N'MICHELI MACHADO', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (161, N'JESSICA LOPES', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (162, N'FABIANA SANTOS', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (163, N'CAMILA SILVA', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (164, N'LAIZ CAROLINE', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (165, N'LETICA LIMA', NULL, CAST(N'2022-12-04' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (166, N'RICARDO GOMES', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (167, N'RENATA LOSS', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (168, N'RONALDO MARTINS', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (169, N'TATIANE SOARES', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (170, N'GUILHERME BASTOS', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (171, N'ISRAEL SANTOS', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (172, N'MARCOS MAIA', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (173, N'ANDERSON SANTOS', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (174, N'PRISCILA FERREIRA', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (175, N'JULIETE FERNANDES', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (176, N'IGOR GOMES', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (177, N'REBECA JULIA DE SOUSA', NULL, CAST(N'2022-12-05' AS Date), NULL, N'LUKAO')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (178, N'WILSON DOS SANTOS', NULL, CAST(N'2022-12-05' AS Date), NULL, N'LUKAO')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (179, N'LEANDRO QUEIROX', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (180, N'CAIO OLIVEIRA', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (181, N'RENATO LOBATO', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (182, N'ADRIANA GOMES', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (183, N'EDINALD LORETINO DA SILVA', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (184, N'AMANDA AZEVEDO', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (185, N'MAURILIO MOREIRA', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (186, N'RUAN VINICIUS', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (187, N'DAVID DO NASCIMENTO', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (188, N'JOSE CLAUDIO', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (189, N'TIAGO MATEUS', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (190, N'GABRIELA CASSIO BRITO', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (191, N'JESSICA ATAIDE', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (192, N'JOICE ATAIDE DOS SANTOS', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (193, N'ANDERSON ATAIDE', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (194, N'ALIS BOTERO', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (195, N'ADRIANO DA SILVA', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (196, N'CICERO DA SILVA', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (197, N'IGOR SANTOS', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (198, N'MELISSA CASTRO', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (199, N'WILLIAN ALVES', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (200, N'DANIELE SANTANA', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (201, N'ANTONIA NOBRE', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (202, N'DANIELY FERNANDES', N'38830831x', CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (203, N'GUILHERME MARTINS', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (204, N'PAMELA SILVA', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (205, N'HUMBERTO NERY', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (206, N'GUILHERME MIGUEL', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (207, N'BRUNO DOS SANTOS', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (208, N'STEFANI CRISTINA', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (209, N'MAICON MENDES', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (210, N'JULIO CESAR', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (211, N'ELIANE SUDARIA', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (212, N'IRLANDIO SILVA', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (213, N'ELIAS ROCHA', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (214, N'JHONATAN COSTAS', NULL, CAST(N'2022-12-05' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (215, N'LUAN VINICIUS', NULL, CAST(N'2022-12-08' AS Date), NULL, N'retorno')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (216, N'ANA BARBOSA', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (217, N'FLAVIO APARECIDO SANTOS', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (218, N'RAFAEL RODRIGUES', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (219, N'NATALIA DE ALMIEDA', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (220, N'ADRIANA DE SANTANA', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (221, N'ALEF NOBREGA', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (222, N'WANDERSON SILVA', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (223, N'ALESSANDRO CARVALHO', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (224, N'JEFERSON NOVES', N'35255745x', CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (225, N'BARONE BARROS', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (226, N'KAIQUE MATHEUS', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (227, N'WILLIAN EDUARDO', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (228, N'ISRAEL PEREIRA', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (229, N'JONATAN FILHO', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (230, N'KAIQUE CARDOZO', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (231, N'JHORDAM PIAGLO', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (232, N'WILSON DUARTE', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (233, N'PAULO', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (234, N'LUCIENE DE AGUIAR SILVA', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (235, N'CAMILLA SALLINA', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (236, N'RICARDO LIMA DA SILVA', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (237, N'RINALDO FIGUEREIDO', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (238, N'HYANKA RUFFO', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (239, N'DJ RAFINHA', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (240, N'BEATRIZ PEREIRA', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (241, N'ADRIANA PEREIRA DE COSTAS', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (242, N'AMANDA SOLANGE', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (243, N'SEVERINO SANTANA', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (244, N'WELLINGTO ROBERTO', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (245, N'CAMILA ANDRADE DOS SANTOS', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (246, N'TALITA ALVES', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (247, N'PEDRO OLIVEIRA', NULL, CAST(N'2022-12-08' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (248, N'FELIPE GONCALVES', N'48084818x', CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (249, N'MAISA ARAUJO', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (250, N'CHALIMAR SANTOS', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (251, N'TAUNY SANTOS', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (252, N'CELIA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (253, N'ERCILIA CASTRO', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (254, N'SARA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (255, N'JACIEL JOSE', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (256, N'JOSE ANTONIO', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (257, N'ALINE CASSIA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (258, N'MICHELI RAFAELA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (259, N'THAMIRES SILVA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (260, N'ANDREA SILVA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (261, N'DANIEL SILVA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (262, N'JOSE SANTOS', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (263, N'ANDERSON DA SILVA FIGO', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (264, N'JAEDSOM DE SOUZA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (265, N'GIOVANI DE SOUZA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (266, N'FABIO SANTANA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (267, N'CHARLENE MAGALHAES', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (268, N'WELLINGTON GONCALVES', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (269, N'MATHEUS MOREIRA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (270, N'JAQUELINE GONCALVES', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (271, N'MAROO MESAQUE', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (272, N'THAMIRES VIEIRA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (273, N'RODOLFO VENTURA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (274, N'RENAN LUIZ', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (275, N'FILIPE LIMA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (276, N'BRUNO HENRIQUE', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (277, N'TATIANE BARBOSA DA SILVA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (278, N'EDSON SOUZA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (279, N'JESSICA MARCELLY', NULL, CAST(N'2022-12-09' AS Date), NULL, N'CANTORA')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (280, N'ERIKA ARAUJO', NULL, CAST(N'2022-12-09' AS Date), NULL, N'BANDA')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (281, N'INAILDA BEZERRA DA SILVA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (282, N'JARBAS DA SILVA MEIRA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (283, N'VAGNER MARINHO DOS SANTOS', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (284, N'NICK', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (285, N'THALITA MIRANDA', NULL, CAST(N'2022-12-09' AS Date), NULL, N'NICK')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (286, N'JULIANA SILVA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (287, N'VALDINLE MARCELINA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (288, N'JOSE DJACIR DE ANDRADE', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (289, N'JEFERSON MARCELINO', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (290, N'LIDIA VASCONCELOS', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (291, N'DOUGLAS DE SOUZA', NULL, CAST(N'2022-12-09' AS Date), NULL, N'LUKAO')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (292, N'GUSTAVO HENRIQUE', NULL, CAST(N'2022-12-09' AS Date), NULL, N'LUKAO')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (293, N'CARLOS EDUARDO', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (294, N'ELSON LAURINDO', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (295, N'MICHAEL SILVA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (296, N'RAFAEL SODRE', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (297, N'STEVEM FIORINO', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (298, N'EBERT SANTANA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (299, N'JENYFFER LIMA DOS SANTOS', NULL, CAST(N'2022-12-09' AS Date), NULL, N'KAMILLY')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (300, N'EMERSON GERMANO', NULL, CAST(N'2022-12-09' AS Date), NULL, N'KAMILLY')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (301, N'ALESSANDRA BIANCA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (302, N'RICARDO CHACON', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (303, N'GERVAL MNTINI', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (304, N'LUIZA ROMANTO', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (305, N'JAMMILY OLIVEIRA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (306, N'MARCOS GOMES', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (307, N'FLAVIO DE SOUZA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (308, N'NADIA MELO', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (309, N'BARBARA MICHELLE', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (310, N'NATI', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (311, N'ANDERSON ALVES', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (312, N'ELTON CARLOS', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (313, N'FERNANDO SILVA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (314, N'CAROL RODRIGUES', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (315, N'GABRIELI LIMA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (316, N'EDUARDA FARIA AQUILINE FREITAS', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (317, N'MARI DE SOUZA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (318, N'LARISSA ALVES DA SILVA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (319, N'VIVIANE MOURA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (320, N'WELBER SILVA D EOLIVEIRA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (321, N'THALITA IVONI', N'39499422X', CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (322, N'LUAN FERREIRA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (323, N'ALINE APARECIDA', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (324, N'MARCIO BRITO', NULL, CAST(N'2022-12-09' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (325, N'SERGIO MACIEL', NULL, CAST(N'2022-12-10' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (326, N'NEGO PEU', NULL, CAST(N'2022-12-10' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (327, N'BEATRIZ FREIRE DA SILVA', NULL, CAST(N'2022-12-10' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (328, N'MONICA MARTINS', NULL, CAST(N'2022-12-10' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (329, N'MICAELLE SOUZA', NULL, CAST(N'2022-12-10' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (330, N'LUIZ HENRIQUE', NULL, CAST(N'2022-12-10' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (331, N'MARINA DOS SANTOS', NULL, CAST(N'2022-12-10' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (332, N'FELIPE SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (333, N'JAISON LICON', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (334, N'RAFAEL CHAGAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (335, N'BRUNO ANDRADE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (336, N'WADSON FERREIRA DOS REIS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (337, N'LUANE DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (338, N'ZENILDE GOMES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (339, N'LETICIA BENEDITO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (340, N'SUELLEN MENDES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (341, N'MICHEL SILVA', NULL, NULL, NULL, N'NEGO PEU')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (342, N'ERICK SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (343, N'MAURO RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (344, N'TONY SERAFIN', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (345, N'VANESSA COSTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (346, N'EMERSON SEVERINO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (347, N'JAMILLY SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (348, N'DJ GRS', NULL, NULL, NULL, N'LUKAO')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (349, N'FABIO SOUSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (350, N'MARCELO ANTONIO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (351, N'SIDNEY DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (352, N'SAMANTHA RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (353, N'AMELIA LOPES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (354, N'ADAILTON ROGERIO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (355, N'WASHINGTON GOMES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (356, N'NILMAR ALEXANDRE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (357, N'MARI SIQUEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (358, N'ROSEVAL BISTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (359, N'ROGER ANTONIO DE SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (360, N'THIANY FERREIRA DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (361, N'SHEILA SALVIANO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (362, N'KLEANDRO NUNES OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (363, N'ELEUSA GOMES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (364, N'JOELITO BAROSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (365, N'LU BARBOSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (366, N'JAMES FREITAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (367, N'VERONICA GOMES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (368, N'CRISTINA SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (369, N'ROSELI FATIMA OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (370, N'QLICE CRISTINA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (371, N'CLAUDIA SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (372, N'ELICIANE ROCHA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (373, N'EBERT SANTANA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (374, N'PEDRO LIMA', NULL, NULL, NULL, N'KAMILLY')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (375, N'KAROLINE SOARES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (376, N'BRUNO SOARES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (377, N'MILENA Mais', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (378, N'JULIANA SILVA VAZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (379, N'JOAO PAULO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (380, N'DENIS CARVALHO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (381, N'JOICE GONCALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (382, N'JOSELIA SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (383, N'ERICK PEREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (384, N'STEFANI PEREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (385, N'IGOR AUGUSTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (386, N'ONIO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (387, N'CIRO LUIZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (388, N'NATHALIA DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (389, N'MARVCOS MAIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (390, N'ANDERSON LEITE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (391, N'WESLAY STEVAN', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (392, N'MAIARA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (393, N'SIMONE DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (394, N'JORGINHO SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (395, N'RENA LUIZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (396, N'CRISTIANE NASCIMENTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (397, N'MATHEUS AUGUSTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (398, N'GUSTAVO PEREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (399, N'FERNANDO AUGUSTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (400, N'ADRIANa brito', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (401, N'KAREN FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (402, N'LEANDRO FERNANDES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (403, N'HELEN ELI', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (404, N'ALINE SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (405, N'WEBERSON CRUZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (406, N'FRANCIELI SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (407, N'ERIVK TEODORO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (408, N'AMANDA QUEIROZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (409, N'ALANA LOREN', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (410, N'MARISA VIEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (411, N'JHONI JESUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (412, N'CELIO ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (413, N'DANIELA SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (414, N'ISABELA MOURA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (415, N'JESSICA MARIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (416, N'LEANDRO OLIEVIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (417, N'VALDEIR SOARES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (418, N'KAROLAINE SUELE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (419, N'WALASE SOARES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (420, N'LUAN VINICIUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (421, N'TIAGO MATHEUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (422, N'JUNIOR CRUZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (423, N'VINICIUS SEVERIANO', NULL, NULL, NULL, N'BANDA')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (424, N'GLEISON BASTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (425, N'JACKELINE GONCALVES ALMEIDA', N'(11) 964545992', NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (426, N'ANTONIO JOSE DE OLIVEIRA', N'(11) 49325149', NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (427, N'', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (428, N'WILTON BATISTA', NULL, NULL, NULL, N'banda cebolla')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (429, N'BRUNO DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (430, N'', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (431, N'andreia Araujo', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (432, N'PAULO SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (433, N'LUCAS ADRIANO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (434, N'LUCAS DE PAULA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (435, N'GABRIEL DUARTE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (436, N'JAQUELINE MATIAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (437, N'ROGER BEZERRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (438, N'JAQUELINE ALVEZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (439, N'MATHEUS TEXEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (440, N'LUCAS HENRIQUE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (441, N'ISABELA BORGES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (442, N'TIAGO COSTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (443, N'BRUNA CASTRO', NULL, NULL, NULL, N'LUKAO')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (444, N'ERICA SA', NULL, NULL, NULL, N'LUKAO')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (445, N'AWANNY TIADUA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (446, N'IGOR YAN', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (447, N'GLAUCO VENANCIO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (448, N'MARIA CLESIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (449, N'YVIS MOTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (450, N'PALOMA GALVAO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (451, N'LUCINEIACAZIMIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (452, N'BEATRIZ LOPES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (453, N'MARLEIDE DE OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (454, N'VANLER SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (455, N'MILENA MATEUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (456, N'KAUE HENRIQUE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (457, N'TIAGO', NULL, NULL, NULL, N'BANDA')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (458, N'BRUNO CARDOSO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (459, N'DAVID CARDOSO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (460, N'JOAO DUQUE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (461, N'GUTTENBERG CASTRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (462, N'YERMYDENIS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (463, N'ROBERTA LAIS', NULL, NULL, NULL, N'BANDA')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (464, N'GENIVALDO COSTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (465, N'DOUGLAS ROBERTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (466, N'KELSON JUNIOR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (467, N'LUCAS EDUARDO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (468, N'RUAN PAULO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (469, N'LUCAS SENA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (470, N'MATHEUS EDUARDO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (471, N'DONY SERAFIM', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (472, N'MAURO RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (473, N'CARINA ARAUJO', NULL, NULL, NULL, N'LUKAO')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (474, N'CARLA ARAUJO', NULL, NULL, NULL, N'LUKAO')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (475, N'CLAUDIA ARAUJO', NULL, NULL, NULL, N'LUKAO')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (476, N'LEONARDO MENDES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (477, N'JACSON CARLOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (478, N'ROBSON SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (479, N'BRUNA PIRES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (480, N'FERNANDA CASTRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (481, N'LUIZ SERGIO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (482, N'VIVIA BARBOSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (483, N'MICHELI SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (484, N'JAQUELINE MARQUES', NULL, NULL, NULL, N'BANDA')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (485, N'ROSE DANTAS', N'61038190-163', NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (486, N'JONAS BRITO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (487, N'THIAGO SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (488, N'THAWANY MORAES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (489, N'FELIPE VAZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (490, N'EVERTON FEREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (491, N'EDGAR ROCHA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (492, N'RICARDO ANDRE FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (493, N'CLAYTON RIEIRO CHAVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (494, N'CLAUDIO FRANCISCO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (495, N'', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (496, N'MAIKO APARECIDO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (497, N'JULLIANA OLIVEIRA SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (498, N'REDA DE SOPUZA RIVBEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (499, N'BRUNO RAFAEL', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (500, N'ALISON MATHEUSP PEREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (501, N'LEANDRO ARAUJO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (502, N'PAULO CESAR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (503, N'JONAS GOUVEIA', NULL, NULL, NULL, N'LUKAO')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (504, N'WESLAY FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (505, N'VANESSA BERNARDO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (506, N'CLAUDIO MIYUKI NITTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (507, N'GABRIEL ZAQUEU DE ASSUNCAO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (508, N'PATRICIA ANA RODRIGUES SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (509, N'ELOISA RUIZ DE ANDRADE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (510, N'MIQUEIAS ALEFE CARVALHO SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (511, N'GLEISON GALINDO ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (512, N'WESLEY SOUSA FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (513, N'WAGNO FREIRE DO NASCIMENTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (514, N'JEAN GALINDO AÇLVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (515, N'WILLIAN CHARLES DA PAIXAO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (516, N'MARIANA CRISTINA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (517, N'MARIA LUCIA DE SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (518, N'ELIA SILVA', N'32619647X', NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (519, N'SILVIO RIBEIRO DE CARVALHO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (520, N'GABRIEL', NULL, NULL, N'BANDA', NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (521, N'GEOVANNA MILLENA PAZ SANTANA', NULL, NULL, NULL, N'ANIVERARIANTE')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (522, N'LAIS TAVARES DA SILVA', NULL, NULL, NULL, N'VIP ANI')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (523, N'GABRIEL ALMEIDA BRAGA', NULL, NULL, NULL, N'VIPANI')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (524, N'GABRIEL MATOS TARGINO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (525, N'JESSICA AMANDA DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (526, N'CAIO CARDOSO PINTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (527, N'DAVID CARVALHO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (528, N'MAIARA MAGALHAES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (529, N'DEBORA LOUISE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (530, N'DIEGO DO SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (531, N'NATALIA SILVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (532, N'VANESSA GODOY', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (533, N'BEATRIZ MOREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (534, N'MATEUS ROBERTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (535, N'THAUANALIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (536, N'NICOLAS NAL', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (537, N'FERNANDA GOMES OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (538, N'ROOZEWELT LEITE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (539, N'SABRINA MARQEUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (540, N'CARLA LEANDRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (541, N'FELIPE SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (542, N'NATANY HELLEN', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (543, N'LAION MENFES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (544, N'KELVIN REIS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (545, N'BRUNA SENA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (546, N'INGRID DE LUCAS LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (547, N'BEATRIZ EDUARDA DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (548, N'DANIEL CARLOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (549, N'JOAO VITOR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (550, N'RENAN FRANCISCO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (551, N'VINIVIUS DE ARAUJO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (552, N'VICTOR BASTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (553, N'JOAO VITOR BARBOSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (554, N'JOSE EDENILSON', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (555, N'FRANCISCO JUNIOR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (556, N'CARLA GONCALVES DE OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (557, N'ALCILENE OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (558, N'JUSARA RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (559, N'RODRIGO SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (560, N'ALESSANDRA OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (561, N'VIVIANE CRISTINA SILVA', N'45885086X', NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (562, N'DANILO GROGER', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (563, N'SABRINA MARINHO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (564, N'CLEIDSON DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (565, N'FERNANDA MARTINS DE ANDRADE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (566, N'GABRIELE SANTOS DE OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (567, N'ROSE OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (568, N'ALESSANDRA SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (569, N'BANDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (570, N'ANA CAROLINA ALMEIDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (571, N'REGINALDO BRUNO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (572, N'JOSE ANTONIO BATISTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (573, N'EMERSON CALDAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (574, N'CAROLINE FERNANDES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (575, N'GABRIELA CRISTINA', N'49740073X', NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (576, N'WELINGTON ANICETO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (577, N'LEONARDO VICENTE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (578, N'ALBERT RIBEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (579, N'LUCAS BATISTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (580, N'RICARDO VIANA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (581, N'BRENO RIBEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (582, N'EUDES GOMES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (583, N'CASSIA ARAUJO', NULL, NULL, NULL, N'LUKAO')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (584, N'CAMILA INEZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (585, N'KALISY DA ILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (586, N'THOMAS HANDERSON', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (587, N'MARIA ALICE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (588, N'DAIANE SOUSA', NULL, NULL, NULL, N'VIP')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (589, N'JHENIFER SOUSA', NULL, NULL, NULL, N'VIP')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (590, N'ISABELE DA CRUZ', NULL, NULL, NULL, N'VIP')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (591, N'JEAN SOUSA', NULL, NULL, NULL, N'ANIVERSARIANTE')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (592, N'MAYARA DAIANE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (593, N'MICHELIMACHADO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (594, N'JESSICA LOPES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (595, N'JAPA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (596, N'', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (597, N'FRANCISCO SANTIAGO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (598, N'DAILSON ARAUJO', NULL, NULL, NULL, N'BANDA')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (599, N'RAIMUNDO BORGES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (600, N'WAGNER OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (601, N'REBERT LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (602, N'JULIO CESAR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (603, N'ANTONIO NOBRE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (604, N'GUILHERME RIBEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (605, N'MISAEL MORAES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (606, N'LEONARDO DE MOURA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (607, N'JEAN CARLOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (608, N'FRANCISCO BRUNO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (609, N'AILTON LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (610, N'ALINE RIBEIRO SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (611, N'CAMILA PEREIRA DE FREITAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (612, N'EVERTON BARROS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (613, N'RAISSA DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (614, N'JULIANA PEREIRA DE FREITAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (615, N'JEFERSON SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (616, N'LUCAS PERRONE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (617, N'VITOR RIBEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (618, N'FELIPE ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (619, N'VITOR MANOEL', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (620, N'RYAN VILARE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (621, N'ANDRE MORAES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (622, N'ODAIR PEREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (623, N'FELIPE PEREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (624, N'JONATAN SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (625, N'RENATO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (626, N'IGOR AMARAL', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (627, N'MARINA DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (628, N'WAGNER DIAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (629, N'MOISES DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (630, N'ELAINE AVELINO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (631, N'FLAELSON FERNANDO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (632, N'RENATA SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (633, N'ORLANDO ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (634, N'FERNANDO FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (635, N'IARA APARECIDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (636, N'GABRIELI SOUZA SOBRAL', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (637, N'LUZIA DE OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (638, N'FERNANDA DA SILVA ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (639, N'ANTONIO SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (640, N'VINICIUS MESQUITA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (641, N'LUIZ JUNIOR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (642, N'MISAEL MIRANDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (643, N'ANDERSON OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (644, N'RAISSA CARDOSO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (645, N'PRISCILA OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (646, N'SUELEN FARIAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (647, N'JESSICA CALVACANTE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (648, N'GLAUCIA SILIANO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (649, N'LEONARDO MORAES', N'35007429X', NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (650, N'RENATA MACEDO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (651, N'EMILIA ROCHA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (652, N'RICARDO AUGUSTU', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (653, N'JUVINA MARIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (654, N'JEFERSON SANTANA', N'30959456X', NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (655, N'DIANA CRISTINA', NULL, NULL, NULL, N'LUKAO')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (656, N'VANESSA RIBEIRO', NULL, NULL, NULL, N'LUKAO')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (657, N'SAMILA GOMES DE SA', NULL, NULL, NULL, N'LUKAO')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (658, N'KELLY ROBERTO DA SILVA', NULL, NULL, NULL, N'LUKAO')
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (659, N'MARIA CAROLINA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (660, N'LILIAN FABIANA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (661, N'LIDIA BATISTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (662, N'ANTONIO JOSE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (663, N'TAIS DA SILVA SOBRINHO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (664, N'WESLEY VIANA DE REZENDE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (665, N'WILLIAN CANTOR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (666, N'WILLIAN SANTANA DOS REIS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (667, N'LAIS OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (668, N'JEILSON JOSE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (669, N'ROSANA BENTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (670, N'JOILSON SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (671, N'PAULO DE JESUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (672, N'FERNANDO BELCHIOR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (673, N'LUCAS C', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (674, N'LUCAS COSTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (675, N'GEISE BBANDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (676, N'LUCAS ROSALIS', N'38773788X', NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (677, N'COIMBRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (678, N'ELLEN MAGALHAES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (679, N'JANETE GOMES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (680, N'WILLIAN MOREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (681, N'ROBERT MATHEUS (ASHILEY)', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (682, N'CASSIA BETHANIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (683, N'TAMIRES FERREIRA DE FREITAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (684, N'JONATAS MORAIS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (685, N'RAFAEL RAMOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (686, N'IGOR COQUIN', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (687, N'CLEVERSON SOARES SANTANA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (688, N'JAQUELINE MOREIRA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (689, N'cleyton soaresSANTANA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (690, N'GUSTAVO DURAN', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (691, N'MILLENA NATAN', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (692, N'douglas freitas', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (693, N'Erica fernanda', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (694, N'DANILO DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (695, N'ROBERO ARAUJO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (696, N'LUIS RIBEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (697, N'STEPANIE SANTOS AQUINO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (698, N'LEIDY GONCALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (699, N'GABRIEL SANTANA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (700, N'GUSTAVO HENRIQUE DE SOUZA CERQUEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (701, N'MATHEUS ALVES DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (702, N'RENAN MELO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (703, N'MARCELO CAVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (704, N'ROBERTA APARECIDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (705, N'FAGNER JUNIOR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (706, N'GUSTAVO LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (707, N'PEDRO HENRIQUE MORAIS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (708, N'RAFAELA OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (709, N'HENDERSON', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (710, N'VITORIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (711, N'FLAVIA MARIA MARTINS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (712, N'ALISSON FERRIRA DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (713, N'LUCIANO SIQUEIRA FERREIRA', N'33380871X', NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (714, N'ROSILENE DE SOUZA SILVA FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (715, N'MARCOS PAULO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (716, N'PAIVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (717, N'DANIELE CHAGAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (718, N'GABI', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (719, N'ROBSON REIS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (720, N'CRISTIANE MARTINS DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (721, N'JONATAS AZEVEDO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (722, N'JEFERSON PAULA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (723, N'WELSON', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (724, N'TALITA RIBEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (725, N'ALINE QUEIROZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (726, N'ZACARIAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (727, N'EDILENE BACARINI', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (728, N'RIVALDO NOGUEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (729, N'JENIFER ANGELICA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (730, N'DANIELE SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (731, N'AGHATA SOUZA DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (732, N'PALOMA SÁ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (733, N'RAFAELA LOPES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (734, N'LUCAS LEANDRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (735, N'REGINALDO VIEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (736, N'ENDREW RODIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (737, N'LUIS FERNANDO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (738, N'CARLOS SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (739, N'NAYARA REIS SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (740, N'BEATTRIZ SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (741, N'AMAURI MORAIS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (742, N'PAULO ROBERTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (743, N'SILVANA MATHEUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (744, N'CARLOS DABACENO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (745, N'HENRIQUE BARBOSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (746, N'SUELLEN QUEIROZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (747, N'GUILHERME NEIVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (748, N'JESSICA DOS SANTOS LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (749, N'ROBSON BEZERRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (750, N'FELIPE ZANQUETA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (751, N'ANA CARLA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (752, N'alexandre jesus de oliveira', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (753, N'mauricio anselmo junior', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (754, N'CASSIO FEITOSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (755, N'GUILHERME ARRIAR BATISTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (756, N'MARCIO DE JESUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (757, N'FABIOLA SODRE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (758, N'FRANCIELE DE JESUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (759, N'SHEILA SANTOS DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (760, N'DEIZE DE ALMEIDA SILVA ROCHA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (761, N'JOÃO MOURA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (762, N'VALERIA DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (763, N'LAIS BOTEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (764, N'YASMIM VITORIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (765, N'YNGRID GOMES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (766, N'HEMILLY GOMES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (767, N'VANIA LUCIA ABRANTES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (768, N'WILSON GOMES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (769, N'ADRIANO TELES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (770, N'ADRIANA APARECIDA DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (771, N'LUCAS DA SILVA ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (772, N'ANGELINA RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (773, N'JULIA NUNES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (774, N'KAWANI REGIANE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (775, N'KATHELYN REGINA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (776, N'MATHEUS LAUDINO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (777, N'DANIELI RIBEIO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (778, N'EMANUEL MESSIAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (779, N'FERNANDA ARAUJO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (780, N'ALINE RIBEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (781, N'PAMELA RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (782, N'MILLENA RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (783, N'ROGERIO CARDOSO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (784, N'DIEGO ROBERTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (785, N'REGINALDO ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (786, N'MARCIA ALENCAR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (787, N'WELLINGTON BATISTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (788, N'NAQUINHO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (789, N'KLEITON COITO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (790, N'AMANDA CAROLINE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (791, N'DOUGLAS CORREIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (792, N'SAMYA NUNES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (793, N'MARILENE JESUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (794, N'REBECA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (795, N'KEILA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (796, N'CARLOS ALBERTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (797, N'MARIA APARECIDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (798, N'EDMARA VIEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (799, N'MAYARA ROCHA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (800, N'PAMELA BORGES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (801, N'LUCIANA LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (802, N'DIOGO DE SOUZA SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (803, N'FRANCISCO ALMEIDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (804, N'THAIS ALESSANDRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (805, N'SIMONE NASCIMENTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (806, N'GUSTAVO ALEXANDRE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (807, N'FABIO PRATES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (808, N'ADRIANA MARGARIDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (809, N'RICARDO GOMES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (810, N'LETICIA LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (811, N'GEMERSON PEREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (812, N'LEVI LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (813, N'JAMES SILVA SOUTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (814, N'LALESCA BRENA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (815, N'NATALY DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (816, N'KAUE RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (817, N'JUNIOR SANTANA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (818, N'GECIAN FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (819, N'ROBSON FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (820, N'GERLIANO FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (821, N'SIDNEI DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (822, N'THAIS OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (823, N'VIVIANE CARVALHO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (824, N'GIZELLI SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (825, N'BREENDA KAILANI', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (826, N'FRANCISCO BRUNO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (827, N'VANESSA BRITO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (828, N'EDI SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (829, N'LEANDRO MELO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (830, N'JAMILLE FARIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (831, N'CAMILA BARBOSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (832, N'ANA MARIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (833, N'KEITH SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (834, N'GENAYNA MIRANDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (835, N'DENISE LARISSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (836, N'FERNANDO FREDERICO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (837, N'TALITA SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (838, N'RODRIGO SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (839, N'MONICA WENCESLAU', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (840, N'NATHALIA ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (841, N'ELOIZA APARECIDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (842, N'MARCELO DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (843, N'WASHINGTON ROCHA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (844, N'ANDRE LUIZ REGES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (845, N'RENATO CABRAL', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (846, N'DENISE ANATALICE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (847, N'THULYO EDUARDO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (848, N'MARCELO DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (849, N'VITORIA FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (850, N'WILLIAM LUIZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (851, N'DAVI JESUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (852, N'DANIELE SANTANA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (853, N'RITA DE CASSIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (854, N'ADRIANO PEREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (855, N'LECINTIA MARTINS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (856, N'MARLI SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (857, N'MATHEUS SOUZA', N'0721502653', NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (858, N'JESONIAS JUNIOR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (859, N'WEBERSON LUIZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (860, N'PAULO CESAR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (861, N'LOUISE CAMPEL9O', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (862, N'LOUISE CAMPELO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (863, N'ANDREZA SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (864, N'CLERISTON SANTANA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (865, N'WENDER DO CARMO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (866, N'RODRIGO DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (867, N'MAIRA ANASTACIO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (868, N'RAFAELA CAROLINE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (869, N'EDSON PAULA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (870, N'RUTH SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (871, N'ALESSANDRO MARIANO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (872, N'JOYCE KELLY', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (873, N'THALITA ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (874, N'CAROLAINE ARAUJO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (875, N'LARISSA NADI', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (876, N'THIAGO OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (877, N'JULIANA NASCIMENTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (878, N'SULA FREITAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (879, N'PEDRO LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (880, N'ALAN NASCIMENTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (881, N'SHEILA MATIAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (882, N'FERNANDA ALCANTARA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (883, N'FABIANA FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (884, N'MARIA EDUARDA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (885, N'ARIANE BOAVENTURA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (886, N'NOELSON VASCONCELOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (887, N'CRISTIANO VIEIRA COSTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (888, N'MATEUS ITALO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (889, N'FABIO GABRIEL', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (890, N'FERNANDA OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (891, N'ANDREIAPAGLIONE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (892, N'CECILIA MAGLIONE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (893, N'JAQUELINE SALES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (894, N'MARIA APARECIDA DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (895, N'PALOMA DA SILVA ROCHA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (896, N'WARLEI JOSE DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (897, N'LEANDRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (898, N'FELIPE RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (899, N'ALINE MARZANO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (900, N'LUCAS HENRIQUE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (901, N'ROBERTO DE AGUIAR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (902, N'LUCAS DE OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (903, N'FERNANDO DE OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (904, N'BEATRIZ SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (905, N'MICHELE FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (906, N'EDSON ARANTES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (907, N'ISAC OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (908, N'ADENILSON FABIO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (909, N'RICARDO SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (910, N'MATHEUS MORAIS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (911, N'MATHEUS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (912, N'YURI MALAQUIAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (913, N'ANDERSSON LEITE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (914, N'WESLEY DA CRUZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (915, N'ASTELINA BARBOSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (916, N'FERNANDA PORTUGAL', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (917, N'AMANDA LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (918, N'GUILHERME JESUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (919, N'EMERSOM SEVERINO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (920, N'AMANDA MARIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (921, N'SERGIO BRAGA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (922, N'TAMIRES FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (923, N'DEBORA DE LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (924, N'ALINE DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (925, N'SIDNEI DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (926, N'ORLANDO CRISTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (927, N'DIEGO FERNANDES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (928, N'MATHEUS AUGUSTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (929, N'CHARLES DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (930, N'ELENIMAR PAULA DE CARVALHO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (931, N'FERNANDA DO MONTENEGRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (932, N'KAREN ROMÃO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (933, N'GUSTAVO PEREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (934, N'TAMIRES GOMES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (935, N'ANDRE LUIZ DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (936, N'GEISE GODOI', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (937, N'JEFFERSON RAMOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (938, N'JEFFERSON DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (939, N'HELLEN FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (940, N'VICTORIA CAROLINA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (941, N'CAROLINA ILIBIO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (942, N'DUDU', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (943, N'SIMONE MOURA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (944, N'MARCIA SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (945, N'JHENIFER RAISSA SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (946, N'LUZIANA APARECIDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (947, N'EDUARDO APARECIDO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (948, N'THEODORO GUILHERME', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (949, N'DIANA VILELA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (950, N'JANAINA DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (951, N'SHIRLEY CAMARGO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (952, N'RENATA FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (953, N'THAIGO TITO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (954, N'KAIC CARDOSO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (955, N'JORDAN HIAGO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (956, N'MARA SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (957, N'KARINA SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (958, N'FELIPE SOARES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (959, N'WESLEY SANTANA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (960, N'THAIS CAROLINE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (961, N'VANIA SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (962, N'ANA LUIZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (963, N'KELLY CRISTINA JESUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (964, N'ALINE GONÇALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (965, N'AKISSOM VIANA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (966, N'RALTY DE OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (967, N'ISABELA DE ALCANTARA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (968, N'DAIANA ARAUJO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (969, N'EDSON ILDO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (970, N'HELLEN VASCONCELOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (971, N'DERICK PEREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (972, N'DENIS CARVALHO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (973, N'IGOR BRENO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (974, N'JULIA MACEDO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (975, N'GABRIELA CRUZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (976, N'GABRIELA CRUZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (977, N'GILDER NASCIMENTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (978, N'BEATRIZ PEREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (979, N'ESTHER VIANA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (980, N'ERICA TEODORO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (981, N'FRANCIELE SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (982, N'PEDRO ZAMORA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (983, N'WILSON JUNIOR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (984, N'RAFAEL ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (985, N'JUNIOR SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (986, N'RENATO MEILAN', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (987, N'ARIADNE RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (988, N'PAULO BISPO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (989, N'LEONARDO HENRIQUE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (990, N'RICARDO HENRIQUE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (991, N'LIKA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (992, N'VANIA BARBOSA SEVERINO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (993, N'DIRCEU', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (994, N'JAQUELINE REIS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (995, N'TATIANE CRISTINA', N'42920257X', NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (996, N'SANTISTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (997, N'JOAO EDSON FERREIRA JUNIOR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (998, N'RODRIGO FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (999, N'JOAO ANTONIO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1000, N'ALESSANDRO DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1001, N'JOAO LUCIANO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1002, N'LORAINE DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1003, N'JONATANS OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1004, N'EVELYN CARVALHO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1005, N'FELIPE VIEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1006, N'CLAUDISON DIAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1007, N'DAIANE BARROS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1008, N'JESSICA BARROS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1009, N'MARA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1010, N'NATHALIE SOUZA NUNES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1011, N'FERNANDA BISPO LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1012, N'TAIS SOARES BASTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1013, N'MARIANA ESTAROPOLIS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1014, N'LIVIA DE3 ALMEIDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1015, N'JACQUELINE MAYARA DOS SANTOS FARIAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1016, N'DEBORA FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1017, N'RONALDO DA SILVA MARTINS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1018, N'HUGO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1019, N'LUANA PEREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1020, N'RODRIGO SANTOS SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1021, N'CESAR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1022, N'REGINALDO PEREIRA ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1023, N'LUZIA DE PAULA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1024, N'ANTONIO MARCOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1025, N'SILVANA ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1026, N'DIEGO RIBEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1027, N'BEATRIZ MELO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1028, N'ANGELA MARIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1029, N'RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1030, N'DONATO DE FRANÇA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1031, N'RUANDERSON', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1032, N'MANUEL RICHARD', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1033, N'ALINE CRISTINA SIMOES', N'27174425X', NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1034, N'JUNIOR LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1035, N'LUCAS BARBOSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1036, N'ROMEU SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1037, N'ISABELLA FERNANDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1038, N'EDGAR DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1039, N'HEBERT', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1040, N'DIRLEI GONCALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1041, N'emanuel reis', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1042, N'LEVI JUNIOR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1043, N'ELIANA BARBOSA DE OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1044, N'NAYARA ARAUJO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1045, N'MARILDA ILDA DA CONCEIÇÃO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1046, N'PAULO EDUARDO RICARDO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1047, N'TEREZA RICARDO DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1048, N'RENAN', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1049, N'GENI COSTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1050, N'DAVID WILLIAM', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1051, N'LUIS ANTONIO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1052, N'MAISA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1053, N'NATALIA MOREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1054, N'MARIANA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1055, N'JULIA SANCHES DE ALMEIDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1056, N'JULIA RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1057, N'FABIO GUILHERME DOS SANTOS MOTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1058, N'FERNANDA BEATRIZ CARDOSO DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1059, N'TIAGO FELIZ DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1060, N'JOAO GABRIEL PARDINHO MOREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1061, N'BEATRIZ COSTAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1062, N'LARISSA OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1063, N'VITOR CESAR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1064, N'MATHEUS LISBOA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1065, N'SALOMÉ SALUM', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1066, N'BETO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1067, N'KAUE SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1068, N'SHERLEM APARECIDA DO NASCIMENTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1069, N'MARI LUCIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1070, N'IGOR PERRONE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1071, N'FERNANDA PRADO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1072, N'MARCOS PAULO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1073, N'DALISSON ALMEIDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1074, N'KAREN BARBOSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1075, N'RUBENS VIEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1076, N'LILIANE DAMASCENO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1077, N'ANDREIA RITA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1078, N'BRUNO FONSECA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1079, N'PEDRO RICARDO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1080, N'JAQUELINE DE LIMA SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1081, N'RUTE VIEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1082, N'VICENTE JUNER', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1083, N'NICOLLY HORA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1084, N'MARIA EDUARDA DIAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1085, N'VICTOR CASTRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1086, N'FLAVIA LUPI', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1087, N'ARTHUR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1088, N'BEATRIZ DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1089, N'MARLA CAMPOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1090, N'JULIANA REZENDE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1091, N'ARIANA RODRIGUES DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1092, N'SAMIRA AVNER', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1093, N'LUIS FERNANDO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1094, N'VIVIANE MARTINS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1095, N'TALITA REGIS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1096, N'RENATA LOSS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1097, N'LUIS MOREIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1098, N'CAIO NASCIMENTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1099, N'DOUGLAS LEANDRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1100, N'LUCILENE VILA NOVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1101, N'LAUNE DE JESUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1102, N'DAIANE BATISTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1103, N'ALINE LINS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1104, N'MARIA APARECIDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1105, N'DOUGLAS APARECIDO DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1106, N'OTAVIO FAVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1107, N'LUAN ROCHA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1108, N'JOYCE BARROS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1109, N'TATIANE DIAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1110, N'DAIANE DE MOURA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1111, N'MARCELO BORGES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1112, N'LUCAS SENA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1113, N'LUCAS EDUARDO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1114, N'DANILO LEITE CHAGAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1115, N'GUSTAVOO HENRIQUE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1116, N'ROGERIO BRITO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1117, N'VITORIA LOPES DE PAULA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1118, N'RAVINI BORGES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1119, N'LARCIO GONCALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1120, N'LARISSA ALVES PEREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1121, N'CAIO CESAR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1122, N'DAIANE DE MOURA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1123, N'LARISSA FERNANDES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1124, N'POLIANA SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1125, N'MARIA CLARA DE ANDRADE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1126, N'PAMELA ROCHA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1127, N'RAFAELA DE SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1128, N'STAPHANYE SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1129, N'LETICIA LIMA FURTADO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1130, N'PATRICIA SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1131, N'MAIARA CRISTINE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1132, N'ANA JULIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1133, N'VITORIA NATALIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1134, N'VALTER FELIPE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1135, N'GRAZIELE FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1136, N'LUCIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1137, N'MALAQUIAS MACHADO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1138, N'BRUNO NOGUEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1139, N'YASMIN OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1140, N'LILIAN OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1141, N'SABRINA NATALIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1142, N'KAIQUE FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1143, N'ROSELENE DE SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1144, N'LUCIANO DE SIQUEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1145, N'BELLET', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1146, N'DENIS GOMES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1147, N'VANIA LUCIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1148, N'LEOPRINCE GONCALVES SOARES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1149, N'jhonata tibeiro de souza', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1150, N'DAIANE SANTOS CASSIMANO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1151, N'MARCIA ROSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1152, N'MAYRA VALERIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1153, N'ALESSANDRO MAURO DE CARVALHO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1154, N'WELLINGTON SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1155, N'GISELE CATARINE LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1156, N'DANIEL NEWMAN FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1157, N'MARCELA DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1158, N'CARINA FONTES DO NASCIMENTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1159, N'FELIPE GUSTAVO JESUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1160, N'RUAN GONÇALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1161, N'MARIANNA GOMES SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1162, N'MARIANNA GOMES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1163, N'CAROLINE RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1164, N'CAROLINE RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1165, N'KELLY SIMONE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1166, N'DIEGO COSTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1167, N'CAROLAINE DE OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1168, N'CAROLAINE DE OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1169, N'CINTHIA SALES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1170, N'CARLOS HENRIQUE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1171, N'RUAN PAULO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1172, N'JOAO MATEUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1173, N'MARCELO BORGES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1174, N'VINICIUS RIBEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1175, N'ADRIANO TELES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1176, N'PAULO HENRIQUE PERLINSKE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1177, N'CRISTIANE DE SOUZA SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1178, N'LUAN CARVALHO LOPES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1179, N'CHRISTOPHER DIAS FELIX', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1180, N'CHRISTOPHER DIAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1181, N'LICON DIAS FELIX', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1182, N'ORLANDO FEHER FILJO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1183, N'WADSON FERREIRA DOS REIS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1184, N'PAULO HENRIQUE SALES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1185, N'LAYS APARECIDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1186, N'KEVIN RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1187, N'MAKSUEL DE JESUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1188, N'ALMIR DE BRAGA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1189, N'BRENDON FREITAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1190, N'BEATRIZ CRUZ MUNHOZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1191, N'REBHECA MACHADO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1192, N'ROSA CRISTINA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1193, N'MONICA MENDONÇA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1194, N'CICERO ROMERO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1195, N'LUCAS ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1196, N'ADRIANO TITE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1197, N'KAUE ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1198, N'MATHEUS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1199, N'ALINE DA SILVA BARBOSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1200, N'TAIANE MONTEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1201, N'LUIZ FERNANDO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1202, N'VANDERSON OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1203, N'sthefani de lisboa', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1204, N'thiago sousa', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1205, N'julia bispo', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1206, N'ana clara berci', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1207, N'beariz vitoria', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1208, N'veronica demetrio', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1209, N'girlene alves', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1210, N'robson reis', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1211, N'maiara silva', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1212, N'daniela alves', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1213, N'gabriele alves', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1214, N'tatiana silveira', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1215, N'barbara bordão', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1216, N'anna maria leal', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1217, N'rosimeri alencar', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1218, N'kaique rogerio', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1219, N'kaynanbatista', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1220, N'ailton pereira', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1221, N'jhonathan batista', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1222, N'simoni dos santos', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1223, N'bruna campos41831590832', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1224, N'edson nascimento', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1225, N'thiago ferraz', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1226, N'EMERSON OLANDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1227, N'MACIEL DA CRUZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1228, N'ANTONIA JAIANE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1229, N'VINICIUS BORGES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1230, N'DOUGLAS TORES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1231, N'IGOR CARIOLANO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1232, N'UEDESE FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1233, N'MARCOS VINICIUS GONÇÃLVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1234, N'RAFAEL FREIRE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1235, N'KAROLINE RIBEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1236, N'PALOMA SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1237, N'SILMARA MOTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1238, N'TATIANE LISBOA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1239, N'PRISCILAOLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1240, N'VANESSA CARNEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1241, N'RODRIGO ROCHA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1242, N'PAULO MARQUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1243, N'TONY SERAFIM', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1244, N'JEFFERSON DE SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1245, N'DIEGO CONSELHO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1246, N'ADIEL FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1247, N'LEONILDA NASCIMENTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1248, N'MAURO RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1249, N'BRUNO GUILERME', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1250, N'MARCOS SANTANA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1251, N'SILVIA ELLEN NOGUEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1252, N'WALLISON PEREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1253, N'IGOR DAMACENO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1254, N'VALDO SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1255, N'PEDRO CABRAL', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1256, N'LUCAS SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1257, N'GEOVANA SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1258, N'CAROLINE ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1259, N'BRAYAN LOPES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1260, N'VINICIUS AVILLA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1261, N'KAUE HENRIQUE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1262, N'MILLENA OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1263, N'WILLIAM VINICIUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1264, N'JACSON REIS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1265, N'ELIAS FERNANDES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1266, N'DIEGO FERNANDES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1267, N'VICTOR DANTAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1268, N'PRISCILA ROCHA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1269, N'FABIO0 SARAIVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1270, N'LUIZ DE FRANÇA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1271, N'VICTOR LOPES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1272, N'MERISVALDO CARTANO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1273, N'MAYARA CONHASA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1274, N'ANE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1275, N'ELSON LAURI', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1276, N'BEATRIZ OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1277, N'JESSICA TELES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1278, N'TATIANE MOURA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1279, N'CAMILA MOURA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1280, N'FERNANDA ARAUJO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1281, N'GEANE CAETANO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1282, N'WILLIAM DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1283, N'ALINE RIBEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1284, N'VITORIA CRISTINA LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1285, N'FLAVIA RAFHAELA SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1286, N'MARCIEL DE SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1287, N'GABRIELA APARECIDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1288, N'FERNANDA PEREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1289, N'PABLO MARTINS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1290, N'ARIELLE BARBOZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1291, N'GIULIA FAGNANI', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1292, N'GEOVA ANDRE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1293, N'EDILENE MARIA SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1294, N'SIDNEI JESUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1295, N'BANDA 321', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1296, N'CLAYTON RIBEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1297, N'KAUE NASCIMENTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1298, N'RICARDO ANDRE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1299, N'ANDRE LUIZ DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1300, N'BRUNO RAFAEL', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1301, N'BRUNO RAFAEL BRITO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1302, N'DAVID OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1303, N'ALEX ASSUNSÃO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1304, N'RAFAEL DIAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1305, N'ROSEVALDO LINS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1306, N'denilson cardoso', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1307, N'milena saraiva', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1308, N'nilson luis', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1309, N'alessandra valim', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1310, N'banda tudo junto e misturado', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1311, N'ivani arruda', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1312, N'luiz felipe', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1313, N'isabelly araujo', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1314, N'maria eduarda', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1315, N'victor leal', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1316, N'flavia barros', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1317, N'luiz alberto', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1318, N'lais oliveira', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1319, N'diorge', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1320, N'tioga', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1321, N'hiago', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1322, N'alencar', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1323, N'juedison oliveira', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1324, N'sidney', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1325, N'larrisa', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1326, N'lucas', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1327, N'vanessa', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1328, N'juliana', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1329, N'diego', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1330, N'fernanda', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1331, N'ana', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1332, N'rafiinha', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1333, N'felipe', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1334, N'tatiana aniv', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1335, N'savioo', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1336, N'adainton', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1337, N'denise', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1338, N'francisco marcio', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1339, N'thamires ferreira', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1340, N'jaques nascimento', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1341, N'barbara vidal', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1342, N'geraldo lucas', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1343, N'joão cristian', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1344, N'leonardo oliveira', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1345, N'wilton soares', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1346, N'marcos henrique', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1347, N'ABNER HENRIQUE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1348, N'GABRIEL NILSON', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1349, N'GUSTAVO AVERSANTE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1350, N'FABRICIO LEITE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1351, N'KAMILA JAINE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1352, N'LUCAS NOGUEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1353, N'ANDERSON SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1354, N'KAUE FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1355, N'VANESSA DA ROCHA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1356, N'BRYAN GOMES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1357, N'PRISCILA FERREIRA PEDRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1358, N'GILDENISE FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1359, N'JUCIMARA FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1360, N'LUIZ OTAVIO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1361, N'GABRIEL REIS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1362, N'rayra luz', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1363, N'jhonatan gomes', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1364, N'ELTON GONÇALVES0', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1365, N'TYFANI OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1366, N'FELIPE RAMOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1367, N'JULIANA CARNEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1368, N'RAPHAEL PANTOLFI', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1369, N'LEONARDO ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1370, N'LARISSA RAMOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1371, N'CLEDIANE DE LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1372, N'KATIELE DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1373, N'SABRINA VIEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1374, N'LUCAS LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1375, N'RUDICLEY FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1376, N'GABRIEL PRATES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1377, N'WESLEY SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1378, N'WESLEY SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1379, N'YSLAIRIS MONTEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1380, N'JESSIKA MATTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1381, N'JOSE JOSIVALDO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1382, N'AGATA RIBEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1383, N'EBERTE SANTANA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1384, N'ELISIANE COSTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1385, N'EDNER BERNADO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1386, N'ALDEMIR ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1387, N'MATHEUS DENILSON', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1388, N'EVANILDO DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1389, N'JACIEL JOSE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1390, N'MARIA CLARA OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1391, N'ERIKA MOURA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1392, N'MARCOS HENRIQUE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1393, N'ANNY CAROLINE ARAUJO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1394, N'JHONY LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1395, N'TAMIRES NEVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1396, N'LAURO FELIPE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1397, N'WANDERLEY GUIMARÃES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1398, N'ELOIZA APARECIDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1399, N'BIANCA DE SANTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1400, N'JESSICA RIBEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1401, N'VINICIUS PORFIRIO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1402, N'CRISTINA SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1403, N'LUANE DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1404, N'DOUGLAS ROBERTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1405, N'MAYARA AISHA BARBOSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1406, N'DANILA CASSIANA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1407, N'MARILIA CARDOSO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1408, N'KELSON ROCHA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1409, N'JAIR NETO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1410, N'MATHEUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1411, N'GEORGE', N'IRMAO GIORGI', NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1412, N'SALATIEL RIBEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1413, N'ANTENOR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1414, N'RENATA VITALINA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1415, N'GUSTAVO DEPAIVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1416, N'JEL RIBEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1417, N'CAMILA QUEIROZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1418, N'ladyson de barros', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1419, N'DOLORES DA GUIA RIBEIRO PIRES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1420, N'RENAN RIBEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1421, N'ANA PIMENTEL', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1422, N'TIENE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1423, N'ELIZETE PIMENTEL', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1424, N'CARLOS FERNANDES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1425, N'YASMINI BARBOSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1426, N'THAYANARA CRISTINE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1427, N'GEOVANA RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1428, N'ED CARLOS JOSE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1429, N'WILLIAM RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1430, N'CLAUDIA PEREIRA ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1431, N'WILLIAM NICANOR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1432, N'HEBER ACCIOLE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1433, N'VITOR BASTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1434, N'VINICIUS DIAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1435, N'SABRINE DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1436, N'JAMILY BESS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1437, N'HIGOR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1438, N'GLEICE SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1439, N'KAYRA VITORIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1440, N'GUSTAVO HENRIQUE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1441, N'SUELEN VITORIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1442, N'KELVIN MACHADO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1443, N'BEATRIZ COSTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1444, N'TALES BRYAN', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1445, N'JOAO VITOR BARBOSA VIDAL', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1446, N'LARISSA NUNES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1447, N'BEATRIZ QUEIROZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1448, N'MARCOS DE JESUS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1449, N'LEIDE SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1450, N'JESSICA GOMES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1451, N'EVELIN SABRINA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1452, N'VALERIA GUEDES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1453, N'GABRIEL GANZAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1454, N'BRENO CASSIANO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1455, N'PATRICIA VOTRE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1456, N'ATILA FRANCISCO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1457, N'GIOVANE BARROS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1458, N'bertine ferreira', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1459, N'FERNANDO FEITOSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1460, N'KHAIRALLA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1461, N'YARA DE LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1462, N'GRAZIELE FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1463, N'Jessica Teles', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1464, N'Jackson dos Reis', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1465, N'SILVANA SILVA ALVES DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1466, N'JULIANA ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1467, N'THAIS TEIXEIRA MACHADO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1468, N'BRUNO SAMPAIO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1469, N'VALMIR RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1470, N'CLAUDINEY RODRIGUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1471, N'ANDRESSA SALAM', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1472, N'ROGER PEREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1473, N'NICOLAS VIEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1474, N'ROBERT SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1475, N'FELIPE MATHEUS MOREIRA DO NASCIMENTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1476, N'JENNIFER MARQUES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1477, N'THIAGO LOPES DA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1478, N'LUCIANA DE ARAUJO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1479, N'KETLEN SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1480, N'JONAS TEIXEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1481, N'CAMILA SALZEDAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1482, N'ADRIANO FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1483, N'WELLITON BARROS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1484, N'LUCAS RIBEIRO PRATES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1485, N'ALEXANDRE FERREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1486, N'HENRIQUE JULIANO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1487, N'ROBERTO SILVA DE OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1488, N'JENNIFER DINIZ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1489, N'CAROL DYBAL', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1490, N'ALINE DE OLIVEIRA BORENCIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1491, N'TAINAH CONCEIÇAO SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1492, N'OSVALDO ALVES JUNIOR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1493, N'LUIS FELIPE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1494, N'FLAVIA RAFAELA DOS SANTOS FARIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1495, N'CAMILA GOBI', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1496, N'MYLENA ALEXANDRE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1497, N'KAROLINE ALEXANDRE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1498, N'EDUARDA DUARTE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1499, N'JULIANA FALCAO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1500, N'THIAGO BARBOSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1501, N'EDUARDO BARBOSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1502, N'BRIAN PEDRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1503, N'WELLINGTON ROBERTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1504, N'DIEGO MACEDO SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1505, N'ROSENO JUNIOR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1506, N'DIH ALCIONE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1507, N'LILIAN SALES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1508, N'VICTOR VALETIN', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1509, N'THIAGO ARAUJO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1510, N'MICHEL SIMOES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1511, N'DAVID DAMACENO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1512, N'FERNANDO MORENO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1513, N'JUNIOR MIRANDA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1514, N'ALVARO TRANCA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1515, N'DILSON CARLOS LUIS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1516, N'ADEMARIO MACARIO DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1517, N'EMILI MESSIAS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1518, N'JHONATA PEREIRA DOS SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1519, N'BEATRIZ NOVAES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1520, N'YOLANDA MONTEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1521, N'GRAZIELA NOVAES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1522, N'FLAVIO BARBOSA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1523, N'RENATA AGOSTINE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1524, N'ADRIANO DAMACENO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1525, N'NAYARA SANTANA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1526, N'GILBERT OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1527, N'GABRIEL PAIVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1528, N'DANIELA LOPES DA SILVA GARCIA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1529, N'JOAO VICTOR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1530, N'DOUGLAS MACKOY', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1531, N'WELLINGTON MOTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1532, N'LUCAS DE OLIVEIRA SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1533, N'GUSTAVO PEREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1534, N'TACIANE RIBEIRO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1535, N'LUIS HENRIQUE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1536, N'DEIVISON DA COSTA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1537, N'EMILY ELIZETE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1538, N'JOYCE RAMOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1539, N'JOSE ALISSON', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1540, N'LETICIA PEREIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1541, N'LAINY OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1542, N'ELTON COSTA LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1543, N'SAMANTA BELLA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1544, N'ESTELA RODAC', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1545, N'ANDERSON RODAC', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1546, N'PRISCILA DOS SANTOS OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1547, N'BRUNA BERGENS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1548, N'THAIS LIMA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1549, N'MARIA LUEDINA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1550, N'CAROL RAMOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1551, N'JONNY ROSENO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1552, N'CAMILA SANTOS', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1553, N'ELIZETE DE SOUZA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1554, N'LUCAS EDUARDO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1555, N'DOUGLAS CUNHA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1556, N'CAMILA GOMES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1557, N'JULIA SILVA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1558, N'BIANCA SOARES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1559, N'DANIELA ALVES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1560, N'JOAO VICTOR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1561, N'DARLAN OLIVEIRA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1562, N'WILLIAN HENRIQUE', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1563, N'JOAO VICTOR', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1564, N'EMERSON GERMANO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1565, N'LETICIA NERES DO NASCIMENTO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1566, N'GABRIELA SILVA LOPES', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1567, N'ISAAC AMORIM', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1568, N'GEOVANA DIAS ALVARENGA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1569, N'LAZARO CARDOSO', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1570, N'tatiane', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1571, N'andre', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1572, N'cristiane', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1573, N'rodrigo', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1574, N'claudirene', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1575, N'yasmin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clientes] ([Id], [Nome], [Documento], [DataCadastro], [Telefone], [Descricao]) VALUES (1576, N'anderson', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
ALTER TABLE [dbo].[ClienteComanda]  WITH CHECK ADD  CONSTRAINT [FK_ClienteComanda_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[ClienteComanda] CHECK CONSTRAINT [FK_ClienteComanda_Cliente]
GO
ALTER TABLE [dbo].[ClienteComanda]  WITH CHECK ADD  CONSTRAINT [FK_ClienteComanda_Comanda] FOREIGN KEY([IdComanda])
REFERENCES [dbo].[Comandas] ([Id])
GO
ALTER TABLE [dbo].[ClienteComanda] CHECK CONSTRAINT [FK_ClienteComanda_Comanda]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ClienteComanda"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Clientes"
            Begin Extent = 
               Top = 0
               Left = 662
               Bottom = 209
               Right = 856
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Comandas"
            Begin Extent = 
               Top = 134
               Left = 288
               Bottom = 253
               Right = 482
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ClientesComanda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ClientesComanda'
GO
USE [master]
GO
ALTER DATABASE [ESTACAO] SET  READ_WRITE 
GO
