USE [master]
GO
/****** Object:  Database [quizApp]    Script Date: 5/16/2025 11:03:45 PM ******/
CREATE DATABASE [quizApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quizApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\quizApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'quizApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\quizApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [quizApp] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quizApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quizApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quizApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quizApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quizApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quizApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [quizApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [quizApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quizApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quizApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quizApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quizApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quizApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quizApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quizApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quizApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [quizApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quizApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quizApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quizApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quizApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quizApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quizApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quizApp] SET RECOVERY FULL 
GO
ALTER DATABASE [quizApp] SET  MULTI_USER 
GO
ALTER DATABASE [quizApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quizApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quizApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quizApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [quizApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [quizApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'quizApp', N'ON'
GO
ALTER DATABASE [quizApp] SET QUERY_STORE = ON
GO
ALTER DATABASE [quizApp] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [quizApp]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 5/16/2025 11:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NULL,
	[Text] [nvarchar](max) NULL,
	[CorrectAnser] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 5/16/2025 11:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](max) NULL,
	[Explain] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (1, 1, N'Turn on S3 Transfer Acceleration on the destination S3 bucket. Use multipart uploads to directly upload site data to the destination S3 bucket.', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (2, 1, N'Upload the data from each site to an S3 bucket in the closest Region. Use S3 Cross-Region Replication to copy objects to the destination S3 bucket. Then remove the data from the origin S3 bucket.', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (3, 1, N'Schedule AWS Snowball Edge Storage Optimized device jobs daily to transfer data from each site to the closest Region. Use S3 Cross-Region Replication to copy objects to the destination S3 bucket.', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (4, 1, N'Upload the data from each site to an Amazon EC2 instance in the closest Region. Store the data in an Amazon Elastic Block Store (Amazon EBS) volume. At regular intervals, take an EBS snapshot and copy it to the Region that contains the destination S3 bucket. Restore the EBS volume in that Region.', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (5, 2, N'Use an API Gateway integration to publish a message to an Amazon Simple Notification Service (Amazon SNS) topic when the application receives an order. Subscribe an AWS Lambda function to the topic to perform processing.', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (6, 2, N'Use an API Gateway integration to send a message to an Amazon Simple Queue Service (Amazon SQS) FIFO queue when the application receives an order. Configure the SQS FIFO queue to invoke an AWS Lambda function for processing.', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (7, 2, N'Use an API Gateway authorizer to block any requests while the application processes an order.', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (8, 2, N'Use an API Gateway integration to send a message to an Amazon Simple Queue Service (Amazon SQS) standard queue when the application receives an order. Configure the SQS standard queue to invoke an AWS Lambda function for processing.', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (9, 3, N'Create AWS Secrets Manager secrets for encrypted certificates. Manually update the certificates as needed. Control access to the data by using fine-grained IAM access.', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (10, 3, N'Create an AWS Lambda function that uses the Python cryptography library to receive and perform encryption operations. Store the function in an Amazon S3 bucket.', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (11, 3, N'Create an AWS Key Management Service (AWS KMS) customer managed key. Allow the EC2 role to use the KMS key for encryption operations. Store the encrypted data on Amazon S3.', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (12, 3, N'Create an AWS Key Management Service (AWS KMS) customer managed key. Allow the EC2 role to use the KMS key for encryption operations. Store the encrypted data on Amazon Elastic Block Store (Amazon EBS) volumes.', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (13, 4, N'Use Amazon S3 File Gateway. Integrate S3 File Gateway with the on-premises applications to store and directly retrieve files by using the SMB file system.', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (14, 4, N'Use an AWS Storage Gateway Volume Gateway with cached volumes as iSCSI targets.', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (15, 4, N'Use an AWS Storage Gateway Volume Gateway with stored volumes as iSCSI targets.', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (16, 4, N'Use an AWS Storage Gateway Tape Gateway. Integrate Tape Gateway with the on-premises applications to store virtual tapes in Amazon S3.', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (17, 5, N'Use Amazon CloudWatch to monitor the CPUUtilization metric for each instance in both Auto Scaling groups. Configure each Auto Scaling group''s minimum capacity to meet its peak workload value.', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (18, 5, N'Use Amazon CloudWatch to monitor the CPUUtilization metric for each instance in both Auto Scaling groups. Configure a CloudWatch alarm to invoke an Amazon Simple Notification Service (Amazon SNS) topic to create additional Auto Scaling groups on demand.', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (19, 5, N'Provision two Amazon Simple Queue Service (Amazon SQS) queues. Use one SQS queue for order collection. Use the second SQS queue for order fulfillment. Configure the EC2 instances to poll their respective queues. Scale the Auto Scaling groups based on notifications that the queues send.', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (20, 5, N'Provision two Amazon Simple Queue Service (Amazon SQS) queues. Use one SQS queue for order collection. Use the second SQS queue for order fulfillment. Configure the EC2 instances to poll their respective queues. Scale the Auto Scaling groups based on the number of messages in each queue.', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (26, 7, N'Nguyễn Ánh (Gia Long)', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (27, 7, N'Nguyễn Huệ (Quang Trung)', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (28, 7, N'Nguyễn Trãi', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (29, 7, N'Nguyễn Du', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (30, 8, N'Khởi nghĩa Nguyễn Hữu Cầu', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (31, 8, N'Khởi nghĩa Tây Sơn', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (32, 8, N'Khởi nghĩa Lam Sơn', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (33, 8, N'Phong trào Cần Vương', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (34, 9, N'1954', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (35, 9, N'1945', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (36, 9, N'1968', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (37, 9, N'1975', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (38, 10, N'Hiệp định Genève', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (39, 10, N'Hiệp định Paris', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (40, 10, N'Hiệp định Sài Gòn', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (41, 10, N'Hiệp định Potsdam', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (42, 11, N'Nguyễn Huệ (Quang Trung)', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (43, 11, N'Lê Lợi', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (44, 11, N'Trần Hưng Đạo', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (45, 11, N'Nguyễn Ánh', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (46, 12, N'Trận Ngọc Hồi - Đống Đa', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (47, 12, N'Trận Bạch Đằng', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (48, 12, N'Trận Điện Biên Phủ', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (49, 12, N'Trận Chi Lăng', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (50, 13, N'1225', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (51, 13, N'1010', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (52, 13, N'1428', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (53, 13, N'1802', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (54, 14, N'Lý Thường Kiệt', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (55, 14, N'Trần Hưng Đạo', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (56, 14, N'Nguyễn Trãi', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (57, 14, N'Hồ Xuân Hương', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (58, 15, N'1287-1288', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (59, 15, N'1258', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (60, 15, N'1077', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (61, 15, N'938', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (62, 16, N'Lê Lợi', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (63, 16, N'Nguyễn Huệ', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (64, 16, N'Trần Hưng Đạo', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (65, 16, N'Lý Thường Kiệt', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (66, 17, N'Chiến dịch Hồ Chí Minh', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (67, 17, N'Chiến dịch Điện Biên Phủ', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (68, 17, N'Trận Ngọc Hồi - Đống Đa', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (69, 17, N'Phong trào Đông Du', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (70, 18, N'Lý Thái Tổ', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (71, 18, N'Trần Thủ Độ', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (72, 18, N'Nguyễn Ánh', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (73, 18, N'Lê Lợi', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (74, 19, N'Vua Hàm Nghi', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (75, 19, N'Vua Tự Đức', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (76, 19, N'Vua Duy Tân', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (77, 19, N'Vua Bảo Đại', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (78, 20, N'Phan Bội Châu', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (79, 20, N'Phan Châu Trinh', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (80, 20, N'Hồ Chí Minh', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (81, 20, N'Nguyễn Ái Quốc', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (82, 21, N'2/9/1945', 1)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (83, 21, N'30/4/1975', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (84, 21, N'1/5/1945', 0)
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [Text], [CorrectAnser]) VALUES (85, 21, N'19/8/1945', 0)
SET IDENTITY_INSERT [dbo].[Answer] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (1, N'A company collects data for temperature, humidity, and atmospheric pressure in cities across multiple continents. The average volume of data that the company collects from each site daily is 500 GB. Each site has a high-speed Internet connection. The company wants to aggregate the data from all these global sites as quickly as possible in a single Amazon S3 bucket. The solution must minimize operational complexity. 
Which solution meets these requirements?', N'Keyword:
From GLOBAL sites as quickly as possible in a SINGLE S3 bucket.
Minimize operational complexity')
INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (2, N'A company is building an ecommerce web application on AWS. The application sends information about new orders to an Amazon API Gateway REST API to process. The company wants to ensure that orders are processed in the order that they are received.
Which solution will meet these requirements?', N'B because FIFO is made for that specific purpose')
INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (3, N'A company''s containerized application runs on an Amazon EC2 instance. The application needs to download security certificates before it can communicate with other business applications. The company wants a highly secure solution to encrypt and decrypt the certificates in near real time. The solution also needs to store data in highly available storage after the data is encrypted.
Which solution will meet these requirements with the LEAST operational overhead?', N'Explanation for question number 3')
INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (4, N'A company currently stores 5 TB of data in on-premises block storage systems. The company''s current storage solution provides limited space for additional data. The company runs applications on premises that must be able to retrieve frequently accessed data with low latency. The company requires a cloud-based storage solution.
Which solution will meet these requirements with the MOST operational efficiency?', N'Explanation for question number 4')
INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (5, N'A company operates a food delivery service. Because of recent growth, the company''s order processing system is experiencing scaling problems during peak traffic hours. The current architecture includes Amazon EC2 instances in an Auto Scaling group that collect orders from an application. A second group of EC2 instances in an Auto Scaling group fulfills the orders.
The order collection process occurs quickly, but the order fulfillment process can take longer. Data must not be lost because of a scaling event.
A solutions architect must ensure that the order collection process and the order fulfillment process can both scale adequately during peak traffic hours.
Which solution will meet these requirements?', N'Explanation for question number 5')
INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (7, N'Vị vua nào sáng lập ra nhà Nguyễn, triều đại phong kiến cuối cùng của Việt Nam?', N'Nhà Nguyễn được thành lập bởi Nguyễn Ánh (tức vua Gia Long) vào năm 1802 sau khi ông đánh bại nhà Tây Sơn và thống nhất đất nước.')
INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (8, N'Cuộc khởi nghĩa nào do Nguyễn Hữu Cầu lãnh đạo vào thế kỷ 18?', N'Khởi nghĩa Nguyễn Hữu Cầu (1741-1751) diễn ra dưới thời chúa Trịnh, chống lại sự áp bức của chính quyền. Ông được gọi là "Chúa Chổm".')
INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (9, N'Chiến thắng Điện Biên Phủ diễn ra vào năm nào?', N'Chiến thắng Điện Biên Phủ năm 1954 là mốc son lịch sử, đánh dấu sự thất bại của thực dân Pháp, dẫn đến Hiệp định Genève.')
INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (10, N'Hiệp định nào chấm dứt chiến tranh Đông Dương lần thứ nhất?', N'Hiệp định Genève 1954 được ký kết sau chiến thắng Điện Biên Phủ, chia Việt Nam thành hai miền tại vĩ tuyến 17.')
INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (11, N'Vị anh hùng nào lãnh đạo cuộc khởi nghĩa Tây Sơn?', N'Nguyễn Huệ (Quang Trung) cùng anh em Tây Sơn (Nguyễn Nhạc, Nguyễn Lữ) đã lãnh đạo cuộc khởi nghĩa Tây Sơn, lật đổ nhà Nguyễn và Trịnh.')
INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (12, N'Trận đánh nào do vua Quang Trung chỉ huy, đánh bại quân Thanh vào năm 1789?', N'Trận Ngọc Hồi - Đống Đa (1789) là chiến thắng vang dội của vua Quang Trung, đánh bại 29 vạn quân Thanh trong dịp Tết Kỷ Dậu.')
INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (13, N'Nhà Trần được thành lập vào năm nào?', N'Nhà Trần được thành lập năm 1225, khi Trần Thủ Độ sắp xếp cho Trần Cảnh cưới Lý Chiêu Hoàng, kết thúc nhà Lý.')
INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (14, N'Ai là tác giả của bài thơ "Nam quốc sơn hà"?', N'Tướng quân Lý Thường Kiệt sáng tác bài thơ "Nam quốc sơn hà" năm 1077 trong cuộc kháng chiến chống quân Tống, khẳng định chủ quyền Việt Nam.')
INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (15, N'Cuộc kháng chiến chống quân Nguyên Mông lần thứ ba diễn ra vào năm nào?', N'Cuộc kháng chiến chống Nguyên Mông lần thứ ba diễn ra năm 1287-1288, với chiến thắng Bạch Đằng do Trần Hưng Đạo chỉ huy.')
INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (16, N'Vị vua nào lãnh đạo cuộc kháng chiến chống quân Minh vào đầu thế kỷ 15?', N'Lê Lợi lãnh đạo cuộc khởi nghĩa Lam Sơn (1418-1427), đánh bại quân Minh và lập ra nhà Hậu Lê năm 1428.')
INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (17, N'Trận đánh nào đánh dấu sự thống nhất đất nước Việt Nam vào năm 1975?', N'Chiến dịch Hồ Chí Minh (30/4/1975) giải phóng Sài Gòn, thống nhất Việt Nam, kết thúc chiến tranh Việt Nam.')
INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (18, N'Nhà Lý được thành lập bởi vị vua nào?', N'Lý Thái Tổ (Lý Công Uẩn) thành lập nhà Lý năm 1010, dời đô từ Hoa Lư về Đại La, đặt tên là Thăng Long.')
INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (19, N'Phong trào Cần Vương diễn ra dưới thời vua nào?', N'Phong trào Cần Vương (1885-1896) diễn ra dưới thời vua Hàm Nghi, kêu gọi giúp vua chống thực dân Pháp sau khi kinh đô Huế thất thủ.')
INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (20, N'Ai là lãnh tụ của phong trào Đông Du đầu thế kỷ 20?', N'Phan Bội Châu lãnh đạo phong trào Đông Du (1905-1909), đưa thanh niên Việt Nam sang Nhật học tập để chuẩn bị chống Pháp.')
INSERT [dbo].[Question] ([QuestionId], [Text], [Explain]) VALUES (21, N'Ngày nào được chọn làm Ngày Quốc khánh của Việt Nam?', N'Ngày 2/9/1945, Chủ tịch Hồ Chí Minh đọc Tuyên ngôn Độc lập tại Quảng trường Ba Đình, khai sinh nước Việt Nam Dân chủ Cộng hòa.')
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([QuestionId])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
USE [master]
GO
ALTER DATABASE [quizApp] SET  READ_WRITE 
GO
