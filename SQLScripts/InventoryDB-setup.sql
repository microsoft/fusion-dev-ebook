/****** Object:  Table [dbo].[BoilerParts]    Script Date: 07/04/2021 09:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoilerParts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CategoryId] [nvarchar](max) NULL,
	[Price] [money] NOT NULL,
	[Overview] [nvarchar](max) NULL,
	[NumberInStock] [int] NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_BoilerParts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Engineers]    Script Date: 07/04/2021 09:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Engineers](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ContactNumber] [nvarchar](max) NULL,
 CONSTRAINT [PK_Engineers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 07/04/2021 09:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BoilerPartId] [bigint] NOT NULL,
	[quantity] [bigint] NOT NULL,
	[TotalPrice] [money] NOT NULL,
	[OrderedDateTime] [datetime2](7) NOT NULL,
	[Delivered] [bit] NOT NULL,
	[DeliveredDateTime] [datetime2](7) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 07/04/2021 09:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BoilerPartId] [bigint] NOT NULL,
	[NumberToReserve] [int] NOT NULL,
	[EngineerId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[BoilerParts] ON 
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (1, N'Pumped Water Controller', N'PCB Assembly', 45.9900, N'Water pump controller for combination boiler', 0, N'http://contoso.com/image1')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (2, N'3.5 W/S Heater', N'Heat Exchanger', 125.5000, N'Small heat exchanger for domestic boiler', 5, N'http://contoso.com/image2')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (3, N'Inlet Valve', N'Valve', 120.2000, N'Water inlet valve with one-way operation', 13, N'http://contoso.com/image3')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (4, N'Mid-position Valve', N'Valve', 180.9000, N'Bi-directional pressure release', 8, N'http://contoso.com/image4')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (5, N'5.0 W/S Heater', N'Heat Exchanger', 145.9000, N'Medium heat exchanger for canteen boiler', 1, N'http://contoso.com/image5')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (6, N'Fan Controller', N'PCB Assembly', 28.3500, N'Controller for air-con unit', 7, N'http://contoso.com/image6')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (7, N'Pumpless Water Controller', N'PCB Assembly', 45.9900, N'Water pump controller for combination boiler', 0, N'http://contoso.com/image7')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (8, N'7.5 W/S Heater', N'Heat Exchanger', 125.5000, N'Small heat exchanger for domestic boiler', 5, N'http://contoso.com/image8')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (9, N'ACME Inlet Valve', N'Valve', 120.2000, N'Water inlet valve with one-way operation', 13, N'http://contoso.com/image9')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (10, N'ACME Mid-position Valve', N'Valve', 180.9000, N'Bi-directional pressure release', 8, N'http://contoso.com/image10')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (11, N'ACME Pumped Water Controller', N'PCB Assembly', 45.9900, N'Water pump controller for combination boiler', 0, N'http://contoso.com/image11')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (12, N'10 W/S Heater', N'Heat Exchanger', 125.5000, N'Small heat exchanger for domestic boiler', 5, N'http://contoso.com/image12')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (13, N'Van Arsdel Inlet Valve', N'Valve', 120.2000, N'Water inlet valve with one-way operation', 13, N'http://contoso.com/image13')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (14, N'Van Arsdel Mid-position Valve', N'Valve', 180.9000, N'Bi-directional pressure release', 8, N'http://contoso.com/image14')
GO 
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (15, N'15.0 W/S Heater', N'Heat Exchanger', 125.5000, N'Small heat exchanger for domestic boiler', 5, N'http://contoso.com/image15')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (16, N'ACME Fan Controller', N'PCB Assembly', 28.3500, N'Controller for air-con unit', 7, N'http://contoso.com/image16')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (17, N'Van Arsdel Pumped Water Controller', N'PCB Assembly', 45.9900, N'Water pump controller for combination boiler', 0, N'http://contoso.com/image17')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (18, N'12.5 W/S Heater', N'Heat Exchanger', 125.5000, N'Small heat exchanger for domestic boiler', 5, N'http://contoso.com/image18')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (19, N'ACME Pilot Glass Retaining Plate', N'Other', 40.0000, N'Controller for air-con unit', 7, N'http://contoso.com/image19')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [CategoryId], [Price], [Overview], [NumberInStock], [ImageUrl]) VALUES (20, N'Main burner injector', N'Injector', 129.9900, N'Controller for air-con unit', 7, N'http://contoso.com/image20')
GO

SET IDENTITY_INSERT [dbo].[BoilerParts] OFF
GO

INSERT [dbo].[Engineers] ([Id], [Name], [ContactNumber]) VALUES (N'ab9f4790-05f2-4cc3-9f01-8dfa7d848179', N'Michelle Harris', N'554-1000')
GO
INSERT [dbo].[Engineers] ([Id], [Name], [ContactNumber]) VALUES (N'cd3ed834-49fe-42c0-9b57-6627fe13c8ba', N'Quincy Watson', N'554-1002')
GO
INSERT [dbo].[Engineers] ([Id], [Name], [ContactNumber]) VALUES (N'f97f7495-101d-45b3-ac62-45a15e4d56c5', N'Sara Perez', N'554-1001')
GO

SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([Id], [BoilerPartId], [quantity], [TotalPrice], [OrderedDateTime], [Delivered], [DeliveredDateTime]) VALUES (24, 3, 5, 6010.0000, CAST(N'2021-04-06T18:02:36.2278013' AS DateTime2), 0, NULL)
GO
INSERT [dbo].[Orders] ([Id], [BoilerPartId], [quantity], [TotalPrice], [OrderedDateTime], [Delivered], [DeliveredDateTime]) VALUES (25, 7, 3, 6010.0000, CAST(N'2021-04-06T18:06:55.2472847' AS DateTime2), 0, NULL)
GO
INSERT [dbo].[Orders] ([Id], [BoilerPartId], [quantity], [TotalPrice], [OrderedDateTime], [Delivered], [DeliveredDateTime]) VALUES (26, 13, 10, 6010.0000, CAST(N'2021-04-06T18:07:46.7978629' AS DateTime2), 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO


SET IDENTITY_INSERT [dbo].[Reservations] ON 
GO
INSERT [dbo].[Reservations] ([Id], [BoilerPartId], [NumberToReserve], [EngineerId]) VALUES (2, 3, 2, N'ab9f4790-05f2-4cc3-9f01-8dfa7d848179')
GO
INSERT [dbo].[Reservations] ([Id], [BoilerPartId], [NumberToReserve], [EngineerId]) VALUES (3, 7, 1, N'cd3ed834-49fe-42c0-9b57-6627fe13c8ba')
GO
INSERT [dbo].[Reservations] ([Id], [BoilerPartId], [NumberToReserve], [EngineerId]) VALUES (4, 13, 5, N'f97f7495-101d-45b3-ac62-45a15e4d56c5')
GO
INSERT [dbo].[Reservations] ([Id], [BoilerPartId], [NumberToReserve], [EngineerId]) VALUES (5, 10, 5, N'cd3ed834-49fe-42c0-9b57-6627fe13c8ba')
GO
INSERT [dbo].[Reservations] ([Id], [BoilerPartId], [NumberToReserve], [EngineerId]) VALUES (6, 1, 2, N'cd3ed834-49fe-42c0-9b57-6627fe13c8ba')
GO
SET IDENTITY_INSERT [dbo].[Reservations] OFF
GO


/****** Object:  Index [IX_Orders_BoilerPartId]    Script Date: 07/04/2021 09:57:34 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_BoilerPartId] ON [dbo].[Orders]
(
	[BoilerPartId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reservations_BoilerPartId]    Script Date: 07/04/2021 09:57:34 ******/
CREATE NONCLUSTERED INDEX [IX_Reservations_BoilerPartId] ON [dbo].[Reservations]
(
	[BoilerPartId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Reservations_EngineerId]    Script Date: 07/04/2021 09:57:34 ******/
CREATE NONCLUSTERED INDEX [IX_Reservations_EngineerId] ON [dbo].[Reservations]
(
	[EngineerId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_BoilerParts_BoilerPartId] FOREIGN KEY([BoilerPartId])
REFERENCES [dbo].[BoilerParts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_BoilerParts_BoilerPartId]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_BoilerParts_BoilerPartId] FOREIGN KEY([BoilerPartId])
REFERENCES [dbo].[BoilerParts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_BoilerParts_BoilerPartId]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Engineers_EngineerId] FOREIGN KEY([EngineerId])
REFERENCES [dbo].[Engineers] ([Id])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Engineers_EngineerId]
GO
