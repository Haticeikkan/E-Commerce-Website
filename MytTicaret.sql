USE [master]
GO
/****** Object:  Database [MytTicaret]    Script Date: 30.09.2023 17:51:38 ******/
CREATE DATABASE [MytTicaret]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MytTicaret', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERH\MSSQL\DATA\MytTicaret.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MytTicaret_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERH\MSSQL\DATA\MytTicaret_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MytTicaret] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MytTicaret].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MytTicaret] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MytTicaret] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MytTicaret] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MytTicaret] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MytTicaret] SET ARITHABORT OFF 
GO
ALTER DATABASE [MytTicaret] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MytTicaret] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MytTicaret] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MytTicaret] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MytTicaret] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MytTicaret] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MytTicaret] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MytTicaret] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MytTicaret] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MytTicaret] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MytTicaret] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MytTicaret] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MytTicaret] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MytTicaret] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MytTicaret] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MytTicaret] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MytTicaret] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MytTicaret] SET RECOVERY FULL 
GO
ALTER DATABASE [MytTicaret] SET  MULTI_USER 
GO
ALTER DATABASE [MytTicaret] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MytTicaret] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MytTicaret] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MytTicaret] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MytTicaret] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MytTicaret', N'ON'
GO
ALTER DATABASE [MytTicaret] SET QUERY_STORE = OFF
GO
USE [MytTicaret]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 30.09.2023 17:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[Blog_id] [int] IDENTITY(1,1) NOT NULL,
	[Blog_Baslık] [nvarchar](50) NOT NULL,
	[Blog_Ozet] [nvarchar](500) NOT NULL,
	[Blog_Acıklama] [text] NOT NULL,
	[Blog_Resmi] [nvarchar](50) NULL,
	[Yonetici_id] [int] NOT NULL,
	[Uye_id] [int] NOT NULL,
 CONSTRAINT [PK__Blog__C163EC104EB9C348] PRIMARY KEY CLUSTERED 
(
	[Blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favoriler]    Script Date: 30.09.2023 17:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favoriler](
	[Favori_No] [int] IDENTITY(1,1) NOT NULL,
	[Uye_id] [int] NOT NULL,
	[Urun_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Favori_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 30.09.2023 17:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[Kategori_id] [int] IDENTITY(1,1) NOT NULL,
	[Kategori_Adi] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Kategori_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparisler]    Script Date: 30.09.2023 17:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparisler](
	[Kayıt_No] [int] IDENTITY(1,1) NOT NULL,
	[Siparis_id] [int] NULL,
	[Siparis_Adet] [smallint] NOT NULL,
	[Siparis_Tarihi] [smalldatetime] NOT NULL,
	[Uye_id] [int] NOT NULL,
	[Urun_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Kayıt_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 30.09.2023 17:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[Urun_id] [int] IDENTITY(1,1) NOT NULL,
	[Urun_Adi] [nvarchar](30) NOT NULL,
	[Urun_Fiyat] [float] NOT NULL,
	[Urun_Aciklama] [nvarchar](300) NULL,
	[Urun_Resmi] [nvarchar](50) NULL,
	[Kategori_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Urun_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uyeler]    Script Date: 30.09.2023 17:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uyeler](
	[Uye_id] [int] IDENTITY(1,1) NOT NULL,
	[Adi_Soyadi] [nvarchar](30) NOT NULL,
	[Cinsiyet] [nvarchar](5) NOT NULL,
	[Dogum_Tarihi] [smalldatetime] NOT NULL,
	[Adres] [nvarchar](300) NULL,
	[Telefon] [nvarchar](15) NOT NULL,
	[Mail] [nvarchar](50) NOT NULL,
	[Kullanici_Adi] [nvarchar](30) NOT NULL,
	[Sifre] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Uye_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yoneticiler]    Script Date: 30.09.2023 17:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yoneticiler](
	[Yonetici_id] [int] IDENTITY(1,1) NOT NULL,
	[Y_Kullanici_Adi] [nvarchar](30) NOT NULL,
	[Y_Sifre] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Yonetici_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yorumlar]    Script Date: 30.09.2023 17:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorumlar](
	[Yorum_id] [int] IDENTITY(1,1) NOT NULL,
	[Yorum_Yazar] [nvarchar](50) NOT NULL,
	[Yorum_Acıklama] [text] NOT NULL,
 CONSTRAINT [PK__Yorumlar__9C6C0B23E1F71DE4] PRIMARY KEY CLUSTERED 
(
	[Yorum_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([Blog_id], [Blog_Baslık], [Blog_Ozet], [Blog_Acıklama], [Blog_Resmi], [Yonetici_id], [Uye_id]) VALUES (1, N'TÜRKİYE TEKSTİLİ', N'Türkiye, dünya tekstil piyasasında önemli bir oyuncu olarak kabul edilir. Ülke, dünya genelinde çeşitli tekstil ürünleri için önemli bir ihracatçıdır.', N'Türkiye, dünya tekstil piyasasında önemli bir oyuncu olarak kabul edilir. Ülke, dünya genelinde çeşitli tekstil ürünleri için önemli bir ihracatçıdır. Özellikle iç giyim, gecelik elbise, çorap, battaniye ve çocuk giyim gibi ürünlerde Türkiye, dünya piyasasında lider konumdadır.
Türkiye tekstil sektörü, ülke ekonomisinin önemli bir bileşenidir ve ihracatın yüzde 20''sini oluşturur. Ülke, Avrupa Birliği (AB), İslam İşbirliği Teşkilatı (OIC) ve diğer ülkelere tekstil ihracatı yapmaktadır. Türkiye, ABD, Almanya, İngiltere, İtalya, Fransa, İspanya ve Rusya gibi ülkelerle büyük ticaret hacimlerine sahiptir.
Türkiye tekstil sektörü, ülkedeki ucuz işgücü ve iyi nitelikli hammadde kaynakları nedeniyle ülke ekonomisine önemli bir katkı sağlar. Ülke, özellikle pamuk, ipek, yün ve poliester gibi hammaddeleri için önemli bir üreticidir.
Türkiye dünya tekstil piyasasında önemli bir oyuncu olarak kabul edilir ve sektörü, ülke ekonomisine büyük katkı sağlar.', N'blog.png', 1, 1)
INSERT [dbo].[Blog] ([Blog_id], [Blog_Baslık], [Blog_Ozet], [Blog_Acıklama], [Blog_Resmi], [Yonetici_id], [Uye_id]) VALUES (3, N'DİKİŞ MAKİNESI', N'Dikiş makinesi tarihi 1790''da İngiliz mucit Thomas Saint''in deri üzerine delikler açılması ve bu delikler üzerinden sürekli olarak iplik geçirilmesini sağlayacak bir makinenin patentini üzerine alması ile başlar.', N'Dikiş makinesi tarihi 1790''da İngiliz mucit Thomas Saint''in deri üzerine delikler açılması ve bu delikler üzerinden sürekli olarak iplik geçirilmesini sağlayacak bir makinenin patentini üzerine alması ile başlar ancak bu makine hiçbir zaman üretilmemiştir. 1830 yılında Fransız Barthelemy Thimonier, "zincir dikiş" yöntemini kullanan bir makine yaptı. Bunu takip eden bir düzine yıl içerisinde Thimonier, bu makineden seksen adet üretti ancak bu makineler, işlerinin elinden alınmasından korkan bir grup terzi tarafından yok edildi.
Günümüzde kullanılan dikiş makinelerine benzer bir dikiş makinesi ilke kez Amerikalı Walter Hunt (1796-1859) tarafından üretildi. Hunt, 1834 yılında geliştirdiği buluşunda iki makara iplik ve bir dikiş iğnesi kullanarak bir "çapraz dikiş" oluşturdu. Bu dikiş yönteminde iki iplik delikten geçtiğinde birbirlerine kenetleniyordu.', N'dikismakine.png', 1, 1)
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([Kategori_id], [Kategori_Adi]) VALUES (1, N'Pamuklu Kumaş')
INSERT [dbo].[Kategoriler] ([Kategori_id], [Kategori_Adi]) VALUES (2, N'Kışlık Kumaş')
INSERT [dbo].[Kategoriler] ([Kategori_id], [Kategori_Adi]) VALUES (3, N'Kot Kumaş')
INSERT [dbo].[Kategoriler] ([Kategori_id], [Kategori_Adi]) VALUES (4, N'Krep Kumaş')
INSERT [dbo].[Kategoriler] ([Kategori_id], [Kategori_Adi]) VALUES (5, N'Muhtelif Kumaş')
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
SET IDENTITY_INSERT [dbo].[Siparisler] ON 

INSERT [dbo].[Siparisler] ([Kayıt_No], [Siparis_id], [Siparis_Adet], [Siparis_Tarihi], [Uye_id], [Urun_id]) VALUES (1, 1, 1, CAST(N'2023-09-17T00:00:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[Siparisler] ([Kayıt_No], [Siparis_id], [Siparis_Adet], [Siparis_Tarihi], [Uye_id], [Urun_id]) VALUES (2, 1, 1, CAST(N'2023-09-17T00:00:00' AS SmallDateTime), 1, 4)
INSERT [dbo].[Siparisler] ([Kayıt_No], [Siparis_id], [Siparis_Adet], [Siparis_Tarihi], [Uye_id], [Urun_id]) VALUES (3, 2, 1, CAST(N'2023-09-29T03:32:00' AS SmallDateTime), 2, 2)
INSERT [dbo].[Siparisler] ([Kayıt_No], [Siparis_id], [Siparis_Adet], [Siparis_Tarihi], [Uye_id], [Urun_id]) VALUES (4, 3, 2, CAST(N'2023-09-29T03:32:00' AS SmallDateTime), 2, 2)
INSERT [dbo].[Siparisler] ([Kayıt_No], [Siparis_id], [Siparis_Adet], [Siparis_Tarihi], [Uye_id], [Urun_id]) VALUES (5, 3, 1, CAST(N'2023-09-29T03:32:00' AS SmallDateTime), 2, 4)
INSERT [dbo].[Siparisler] ([Kayıt_No], [Siparis_id], [Siparis_Adet], [Siparis_Tarihi], [Uye_id], [Urun_id]) VALUES (6, 4, 1, CAST(N'2023-09-29T20:08:00' AS SmallDateTime), 1010, 2)
INSERT [dbo].[Siparisler] ([Kayıt_No], [Siparis_id], [Siparis_Adet], [Siparis_Tarihi], [Uye_id], [Urun_id]) VALUES (7, 5, 1, CAST(N'2023-09-29T20:31:00' AS SmallDateTime), 1010, 2)
INSERT [dbo].[Siparisler] ([Kayıt_No], [Siparis_id], [Siparis_Adet], [Siparis_Tarihi], [Uye_id], [Urun_id]) VALUES (8, 6, 1, CAST(N'2023-09-30T00:38:00' AS SmallDateTime), 1010, 2)
INSERT [dbo].[Siparisler] ([Kayıt_No], [Siparis_id], [Siparis_Adet], [Siparis_Tarihi], [Uye_id], [Urun_id]) VALUES (9, 7, 2, CAST(N'2023-09-30T05:33:00' AS SmallDateTime), 1011, 2)
INSERT [dbo].[Siparisler] ([Kayıt_No], [Siparis_id], [Siparis_Adet], [Siparis_Tarihi], [Uye_id], [Urun_id]) VALUES (10, 7, 1, CAST(N'2023-09-30T05:33:00' AS SmallDateTime), 1011, 12)
SET IDENTITY_INSERT [dbo].[Siparisler] OFF
SET IDENTITY_INSERT [dbo].[Urunler] ON 

INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (1, N'Etamin', 50, N'Pamuklu Kumaş', N'etamin.png', 1)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (2, N'Fantastik', 65, N'Pamuklu Kumaş', N'fantastik.png', 1)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (3, N'Flanell', 70, N'Pamuklu Kumaş', N'flanell.png', 1)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (4, N'Flora', 60, N'Pamuklu Kumaş', N'flora.png', 1)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (5, N'Holiday', 55, N'Pamuklu Kumaş', N'holiday.png', 1)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (6, N'Texas', 60, N'Pamuklu Kumaş', N'texas.png', 1)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (7, N'Viskolet', 55, N'Pamuklu Kumaş', N'viskolet.png', 1)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (8, N'Vista', 65, N'Pamuklu Kumaş', N'vista.png', 1)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (9, N'Aksu', 100, N'Kışlık Kumaş', N'aksu.png', 2)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (11, N'Alaska', 120, N'Kışlık Kumaş', N'alaska.png', 2)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (12, N'Buklet', 80, N'Kışlık Kumaş', N'buklet.png', 2)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (13, N'Candy', 55, N'Kışlık Kumaş', N'candy.png', 2)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (14, N'Kelebek', 110, N'Kışlık Kumaş', N'kelebek.png', 2)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (15, N'Winter', 75, N'Kışlık Kumaş', N'winter.png', 2)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (16, N'Levi', 80, N'Kot Kumaş', N'levi.png', 3)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (17, N'Mavi', 100, N'Kot Kumaş', N'mavi.png', 3)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (18, N'Wrang', 120, N'Kot Kumaş', N'wrang.png', 3)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (19, N'İbiza', 100, N'Krep Kumaş', N'ibiza.png', 4)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (20, N'İncir', 80, N'Krep Kumaş', N'incir.png', 4)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (21, N'Lacci', 75, N'Krep Kumaş', N'lacci.png', 4)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (22, N'Lavanta', 85, N'Krep Kumaş', N'lavanta.png', 4)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (23, N'Masal', 60, N'Krep Kumaş', N'masal.png', 4)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (24, N'Moss', 95, N'Krep Kumaş', N'moss.png', 4)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (25, N'Roman', 55, N'Krep Kumaş', N'roman.png', 4)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (26, N'Cesika', 80, N'Muhtelif Kumaş', N'cesika.png', 5)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (27, N'Çizgili Çicekler', 80, N'Muhtelif Kumaş', N'cizgilicicekler.png', 5)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (28, N'Eva', 90, N'Muhtelif Kumaş', N'eva.png', 5)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (29, N'Hokka', 95, N'Muhtelif Kumaş', N'hokka.png', 5)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (30, N'Kareliler', 120, N'Muhtelif Kumaş', N'kareliler.png', 5)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (31, N'Midye', 100, N'Muhtelif Kumaş', N'midye.png', 5)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (32, N'Pink', 90, N'Muhtelif Kumaş', N'pink.png', 5)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (33, N'Uzay', 100, N'Muhtelif Kumaş', N'uzay.png', 5)
INSERT [dbo].[Urunler] ([Urun_id], [Urun_Adi], [Urun_Fiyat], [Urun_Aciklama], [Urun_Resmi], [Kategori_id]) VALUES (35, N'deneme', 150, N'Deneme', N'deneme.png', 1)
SET IDENTITY_INSERT [dbo].[Urunler] OFF
SET IDENTITY_INSERT [dbo].[Uyeler] ON 

INSERT [dbo].[Uyeler] ([Uye_id], [Adi_Soyadi], [Cinsiyet], [Dogum_Tarihi], [Adres], [Telefon], [Mail], [Kullanici_Adi], [Sifre]) VALUES (1, N'Ayse ikkan', N'Kadın', CAST(N'1997-06-05T00:00:00' AS SmallDateTime), N'Bursa', N'555 555 55 55', N'ayse@gmail.com', N'ayse', N'ayse123')
INSERT [dbo].[Uyeler] ([Uye_id], [Adi_Soyadi], [Cinsiyet], [Dogum_Tarihi], [Adres], [Telefon], [Mail], [Kullanici_Adi], [Sifre]) VALUES (2, N'Hatice ikkan', N'Kadın', CAST(N'2000-05-07T00:00:00' AS SmallDateTime), N'Bursa', N'555 444 44 44', N'hat@gmail..com', N'hatice', N'hatice123')
INSERT [dbo].[Uyeler] ([Uye_id], [Adi_Soyadi], [Cinsiyet], [Dogum_Tarihi], [Adres], [Telefon], [Mail], [Kullanici_Adi], [Sifre]) VALUES (3, N'Sertan Kurt', N'Erkek', CAST(N'2004-09-12T00:00:00' AS SmallDateTime), N'Bursa', N'555 333 33 33', N'sertan@gmail.com', N'sertan', N'sertan123')
INSERT [dbo].[Uyeler] ([Uye_id], [Adi_Soyadi], [Cinsiyet], [Dogum_Tarihi], [Adres], [Telefon], [Mail], [Kullanici_Adi], [Sifre]) VALUES (5, N'Onur Dogan', N'Erkek', CAST(N'2003-01-01T00:00:00' AS SmallDateTime), N'Bursa', N'555 222 22 22', N'onur@gmail.com', N'onur', N'onur123')
INSERT [dbo].[Uyeler] ([Uye_id], [Adi_Soyadi], [Cinsiyet], [Dogum_Tarihi], [Adres], [Telefon], [Mail], [Kullanici_Adi], [Sifre]) VALUES (7, N'Haithm Baauozar', N'Erkek', CAST(N'1998-02-21T00:00:00' AS SmallDateTime), N'Sakarya', N'555 111 11 11', N'heto@gmail.com', N'haithm', N'haithm123')
INSERT [dbo].[Uyeler] ([Uye_id], [Adi_Soyadi], [Cinsiyet], [Dogum_Tarihi], [Adres], [Telefon], [Mail], [Kullanici_Adi], [Sifre]) VALUES (8, N'Fatma ikkan', N'Kadın', CAST(N'1965-06-05T00:00:00' AS SmallDateTime), N'Bursa', N'555 000 00 00', N'fatma@gmail.com', N'fatma', N'fatma123')
INSERT [dbo].[Uyeler] ([Uye_id], [Adi_Soyadi], [Cinsiyet], [Dogum_Tarihi], [Adres], [Telefon], [Mail], [Kullanici_Adi], [Sifre]) VALUES (1009, N'hatdeneme', N'kız', CAST(N'1998-02-05T00:00:00' AS SmallDateTime), N'bursa', N'5553332217', N'aaadeneme@gmail.com', N'hatdeneme', N'123')
INSERT [dbo].[Uyeler] ([Uye_id], [Adi_Soyadi], [Cinsiyet], [Dogum_Tarihi], [Adres], [Telefon], [Mail], [Kullanici_Adi], [Sifre]) VALUES (1010, N'hatdeneme4', N'kız', CAST(N'2000-01-01T00:00:00' AS SmallDateTime), N'bursa12', N'5553332218', N'aaadeneme2@gmail.com', N'hatdeneme2', N'123')
INSERT [dbo].[Uyeler] ([Uye_id], [Adi_Soyadi], [Cinsiyet], [Dogum_Tarihi], [Adres], [Telefon], [Mail], [Kullanici_Adi], [Sifre]) VALUES (1011, N'Sema Fazilet', N'Kız', CAST(N'1998-02-15T00:00:00' AS SmallDateTime), N'İstanbul', N'555 777 88 99', N'fazilet@gmail.com', N'semaf', N'123')
INSERT [dbo].[Uyeler] ([Uye_id], [Adi_Soyadi], [Cinsiyet], [Dogum_Tarihi], [Adres], [Telefon], [Mail], [Kullanici_Adi], [Sifre]) VALUES (1012, N'hatdene12', N'kız', CAST(N'1998-02-01T00:00:00' AS SmallDateTime), N'bursa', N'1112223344', N'aaa22@gmail.com', N'hatdene', N'123')
SET IDENTITY_INSERT [dbo].[Uyeler] OFF
SET IDENTITY_INSERT [dbo].[Yoneticiler] ON 

INSERT [dbo].[Yoneticiler] ([Yonetici_id], [Y_Kullanici_Adi], [Y_Sifre]) VALUES (1, N'hat', N'123')
INSERT [dbo].[Yoneticiler] ([Yonetici_id], [Y_Kullanici_Adi], [Y_Sifre]) VALUES (2, N'hat2', N'1234')
SET IDENTITY_INSERT [dbo].[Yoneticiler] OFF
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK__Blog__Uye_id__300424B4] FOREIGN KEY([Uye_id])
REFERENCES [dbo].[Uyeler] ([Uye_id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK__Blog__Uye_id__300424B4]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK__Blog__Yonetici_i__30F848ED] FOREIGN KEY([Yonetici_id])
REFERENCES [dbo].[Yoneticiler] ([Yonetici_id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK__Blog__Yonetici_i__30F848ED]
GO
ALTER TABLE [dbo].[Favoriler]  WITH CHECK ADD FOREIGN KEY([Urun_id])
REFERENCES [dbo].[Urunler] ([Urun_id])
GO
ALTER TABLE [dbo].[Favoriler]  WITH CHECK ADD FOREIGN KEY([Uye_id])
REFERENCES [dbo].[Uyeler] ([Uye_id])
GO
ALTER TABLE [dbo].[Siparisler]  WITH CHECK ADD FOREIGN KEY([Urun_id])
REFERENCES [dbo].[Urunler] ([Urun_id])
GO
ALTER TABLE [dbo].[Siparisler]  WITH CHECK ADD FOREIGN KEY([Uye_id])
REFERENCES [dbo].[Uyeler] ([Uye_id])
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD FOREIGN KEY([Kategori_id])
REFERENCES [dbo].[Kategoriler] ([Kategori_id])
GO
USE [master]
GO
ALTER DATABASE [MytTicaret] SET  READ_WRITE 
GO
