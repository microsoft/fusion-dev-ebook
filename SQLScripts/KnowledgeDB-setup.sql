/****** Object:  Table [dbo].[BoilerParts]    Script Date: 07/04/2021 09:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoilerParts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Overview] [nvarchar](max) NULL,
 CONSTRAINT [PK_BoilerParts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tips]    Script Date: 07/04/2021 09:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tips](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[KnowledgeBaseBoilerPartId] [bigint] NOT NULL,
	[KnowledgeBaseEngineerId] [nvarchar](450) NULL,
	[Subject] [nvarchar](max) NULL,
	[Body] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tips] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Knowledge]    Script Date: 07/04/2021 09:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[Knowledge] AS
SELECT T.Id, T.Subject, T.Body, B.Name, B.Overview
FROM [dbo].[Tips] T INNER JOIN [dbo].[BoilerParts] B 
ON B.Id=T.KnowledgeBaseBoilerPartId
GO
/****** Object:  Table [dbo].[Engineers]    Script Date: 07/04/2021 09:28:03 ******/
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

SET IDENTITY_INSERT [dbo].[BoilerParts] ON 
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (1, N'Pumped Water Controller', N'Water pump controller for combination boiler')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (2, N'3.5 W/S Heater', N'Small heat exchanger for domestic boiler')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (3, N'Inlet Valve', N'Water inlet valve with one-way operation')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (4, N'Mid-position Valve', N'Bi-directional pressure release')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (5, N'5.0 W/S Heater', N'Medium heat exchanger for canteen boiler')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (6, N'Fan Controller', N'Controller for air-con unit')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (7, N'Pumpless Water Controller', N'Water controller for combination boiler')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (8, N'7.5 W/S Heater', N'Heat exchanger for domestic boiler')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (9, N'ACME Inlet Valve', N'ACME branded water inlet valve with one-way operation')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (10, N'ACME Mid-position Valve', N'Bi-directional pressure release')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (11, N'ACME Pumped Water Controller', N'ACME branded water pump controller for combination boiler')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (12, N'10 W/S Heater', N'Large heat exchanger for commercial boiler')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (13, N'Van Arsdel Inlet Valve', N'Van Arsdel water inlet valve with one-way operation')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (14, N'Van Arsdel Mid-position Valve', N'Van Arsdel Bi-directional pressure release')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (15, N'15.0 W/S Heater', N'Biggest heat exchanger for commercial boiler')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (16, N'ACME Fan Controller', N'ACME branded controller for air-con unit')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (17, N'Van Arsdel Pumped Water Controller', N'Van Arsdel water pump controller for combination boiler')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (18, N'12.5 W/S Heater', N'Avergage heat exchanger for commercial boiler')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (19, N'ACME Pilot Glass Retaining Plate', N'ACME Pilot Glass Retaining Plate for use on all gass boilers')
GO
INSERT [dbo].[BoilerParts] ([Id], [Name], [Overview]) VALUES (20, N'Main burner injector', N'The injector allows the correct ratio of gas flow through the pilot burner')
GO
SET IDENTITY_INSERT [dbo].[BoilerParts] OFF
GO

INSERT [dbo].[Engineers] ([Id], [Name], [ContactNumber]) VALUES (N'ab9f4790-05f2-4cc3-9f01-8dfa7d848179', N'Michelle Harris', N'555-1000')
GO
INSERT [dbo].[Engineers] ([Id], [Name], [ContactNumber]) VALUES (N'cd3ed834-49fe-42c0-9b57-6627fe13c8ba', N'Quincy Watson', N'555-1002')
GO
INSERT [dbo].[Engineers] ([Id], [Name], [ContactNumber]) VALUES (N'f97f7495-101d-45b3-ac62-45a15e4d56c5', N'Sara Perez', N'555-1001')
GO


SET IDENTITY_INSERT [dbo].[Tips] ON 
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (1, 1, N'cd3ed834-49fe-42c0-9b57-6627fe13c8ba', N'How to get water to the right temperature', N'If water doesn''t get hot when radiators are on, replace the diverter valve.')
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (2, 2, N'cd3ed834-49fe-42c0-9b57-6627fe13c8ba', N'Where to site this boiler', N'When installing this unit, don''t place it more that 5 feet higher than the fuel tank, without a fuel pump.')
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (3, 3, N'ab9f4790-05f2-4cc3-9f01-8dfa7d848179', N'How to get this nozzle to light the furnace correctly', N'Sometimes the nozzle gets clogged with old oil or dirt. You can use a fine point to clear it, or replace.')
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (4, 4, N'cd3ed834-49fe-42c0-9b57-6627fe13c8ba', N'How to get water to the right temperature', N'If water doesn''t get hot when radiators are on, replace the diverter valve.')
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (5, 5, N'cd3ed834-49fe-42c0-9b57-6627fe13c8ba', N'Where to site this boiler', N'When installing this unit, don''t place it more that 5 feet higher than the fuel tank, without a fuel pump.')
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (6, 6, N'ab9f4790-05f2-4cc3-9f01-8dfa7d848179', N'How to get this nozzle to light the furnace correctly', N'Sometimes the nozzle gets clogged with old oil or dirt. You can use a fine point to clear it, or replace.')
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (7, 7, N'cd3ed834-49fe-42c0-9b57-6627fe13c8ba', N'How to get water to the right temperature', N'If water doesn''t get hot when radiators are on, replace the diverter valve.')
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (8, 8, N'cd3ed834-49fe-42c0-9b57-6627fe13c8ba', N'Where to site this boiler', N'When installing this unit, don''t place it more that 5 feet higher than the fuel tank, without a fuel pump.')
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (9, 9, N'f97f7495-101d-45b3-ac62-45a15e4d56c5', N'How to get this nozzle to light the furnace correctly', N'Sometimes the nozzle gets clogged with old oil or dirt. You can use a fine point to clear it, or replace.')
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (10, 10, N'cd3ed834-49fe-42c0-9b57-6627fe13c8ba', N'How to get water to the right temperature', N'If water doesn''t get hot when radiators are on, replace the diverter valve.')
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (12, 12, N'f97f7495-101d-45b3-ac62-45a15e4d56c5', N'Where to site this boiler', N'When installing this unit, don''t place it more that 5 feet higher than the fuel tank, without a fuel pump.')
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (13, 13, N'ab9f4790-05f2-4cc3-9f01-8dfa7d848179', N'How to get this nozzle to light the furnace correctly', N'Sometimes the nozzle gets clogged with old oil or dirt. You can use a fine point to clear it, or replace.')
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (11, 11, N'cd3ed834-49fe-42c0-9b57-6627fe13c8ba', N'How to get water to the right temperature', N'If water doesn''t get hot when radiators are on, replace the diverter valve.')
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (14, 14, N'cd3ed834-49fe-42c0-9b57-6627fe13c8ba', N'Where to site this boiler', N'When installing this unit, don''t place it more that 5 feet higher than the fuel tank, without a fuel pump.')
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (15, 15, N'ab9f4790-05f2-4cc3-9f01-8dfa7d848179', N'How to get this nozzle to light the furnace correctly', N'Sometimes the nozzle gets clogged with old oil or dirt. You can use a fine point to clear it, or replace.')
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (16, 16, N'cd3ed834-49fe-42c0-9b57-6627fe13c8ba', N'How to get water to the right temperature', N'If water doesn''t get hot when radiators are on, replace the diverter valve.')
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (17, 17, N'f97f7495-101d-45b3-ac62-45a15e4d56c5', N'Where to site this boiler', N'When installing this unit, don''t place it more that 5 feet higher than the fuel tank, without a fuel pump.')
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (18, 18, N'ab9f4790-05f2-4cc3-9f01-8dfa7d848179', N'How to get this nozzle to light the furnace correctly', N'Sometimes the nozzle gets clogged with old oil or dirt. You can use a fine point to clear it, or replace.')
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (19, 19, N'ab9f4790-05f2-4cc3-9f01-8dfa7d848179', N'How to get this nozzle to light the furnace correctly', N'Sometimes the nozzle gets clogged with old oil or dirt. You can use a fine point to clear it, or replace.')
GO
INSERT [dbo].[Tips] ([Id], [KnowledgeBaseBoilerPartId], [KnowledgeBaseEngineerId], [Subject], [Body]) VALUES (20, 20, N'cd3ed834-49fe-42c0-9b57-6627fe13c8ba', N'How to get water to the right temperature', N'If water doesn''t get hot when radiators are on, replace the diverter valve.')
GO

SET IDENTITY_INSERT [dbo].[Tips] OFF
GO



/****** Object:  Index [IX_Tips_KnowledgeBaseBoilerPartId]    Script Date: 07/04/2021 09:28:03 ******/
CREATE NONCLUSTERED INDEX [IX_Tips_KnowledgeBaseBoilerPartId] ON [dbo].[Tips]
(
	[KnowledgeBaseBoilerPartId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Tips_KnowledgeBaseEngineerId]    Script Date: 07/04/2021 09:28:03 ******/
CREATE NONCLUSTERED INDEX [IX_Tips_KnowledgeBaseEngineerId] ON [dbo].[Tips]
(
	[KnowledgeBaseEngineerId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tips]  WITH CHECK ADD  CONSTRAINT [FK_Tips_BoilerParts_KnowledgeBaseBoilerPartId] FOREIGN KEY([KnowledgeBaseBoilerPartId])
REFERENCES [dbo].[BoilerParts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tips] CHECK CONSTRAINT [FK_Tips_BoilerParts_KnowledgeBaseBoilerPartId]
GO
ALTER TABLE [dbo].[Tips]  WITH CHECK ADD  CONSTRAINT [FK_Tips_Engineers_KnowledgeBaseEngineerId] FOREIGN KEY([KnowledgeBaseEngineerId])
REFERENCES [dbo].[Engineers] ([Id])
GO
ALTER TABLE [dbo].[Tips] CHECK CONSTRAINT [FK_Tips_Engineers_KnowledgeBaseEngineerId]
GO
