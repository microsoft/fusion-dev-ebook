/****** Object:  Table [dbo].[Appointments]    Script Date: 06/04/2021 10:57:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Appointments]') AND type in (N'U'))
BEGIN
	/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
	ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_Appointments_Engineers_EngineerId]
	ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_Appointments_Customers_CustomerId]
	ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_Appointments_AppointmentStatuses_AppointmentStatusId]
	DROP TABLE [dbo].[Appointments]
END
GO

/****** Object:  Table [dbo].[Appointments]    Script Date: 06/04/2021 10:57:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Appointments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerId] [bigint] NOT NULL,
	[ProblemDetails] [nvarchar](max) NULL,
	[AppointmentStatusId] [bigint] NOT NULL,
	[EngineerId] [nvarchar](450) NULL,
	[StartDateTime] [datetime2](7) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[ImageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[AppointmentStatuses]    Script Date: 06/04/2021 11:01:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AppointmentStatuses]') AND type in (N'U'))
DROP TABLE [dbo].[AppointmentStatuses]
GO

/****** Object:  Table [dbo].[AppointmentStatuses]    Script Date: 06/04/2021 11:01:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AppointmentStatuses](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppointmentStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 06/04/2021 11:02:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customers]') AND type in (N'U'))
DROP TABLE [dbo].[Customers]
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 06/04/2021 11:02:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customers](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[ContactNumber] [nvarchar](max) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Engineers]    Script Date: 06/04/2021 11:02:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Engineers]') AND type in (N'U'))
DROP TABLE [dbo].[Engineers]
GO

/****** Object:  Table [dbo].[Engineers]    Script Date: 06/04/2021 11:02:30 ******/
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

SET IDENTITY_INSERT [dbo].[AppointmentStatuses] ON 

INSERT [dbo].[AppointmentStatuses] ([Id], [StatusName]) VALUES (1, N'Unresolved')
INSERT [dbo].[AppointmentStatuses] ([Id], [StatusName]) VALUES (2, N'Parts Ordered')
INSERT [dbo].[AppointmentStatuses] ([Id], [StatusName]) VALUES (3, N'Fixed')
SET IDENTITY_INSERT [dbo].[AppointmentStatuses] OFF
GO

SET IDENTITY_INSERT [dbo].[Customers] ON
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    1,
    N'Damayanti Basumatary',
    N'4567 Main St Buffalo, NY98052',
    N'555-0199'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    2,
    N'Casey Jensen',
    N'4568 Main St Buffalo, NY98053',
    N'555-0200'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    3,
    N'Corey Gray',
    N'4569 Main St Buffalo, NY98054',
    N'555-0201'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    4,
    N'Hannah Jarvis',
    N'4570 Main St Buffalo, NY98055',
    N'555-0202'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    5,
    N'Avery Howard',
    N'4571 Main St Buffalo, NY98056',
    N'555-0203'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    6,
    N'Cora Thomas',
    N'4572 Main St Buffalo, NY98057',
    N'555-0204'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    7,
    N'Hailey Clark',
    N'4573 Main St Buffalo, NY98058',
    N'555-0205'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    8,
    N'Briana Hernandez',
    N'4574 Main St Buffalo, NY98059',
    N'555-0206'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    9,
    N'Aaron Gonzales',
    N'4575 Main St Buffalo, NY98060',
    N'555-0207'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    10,
    N'Amari Rivera',
    N'4576 Main St Buffalo, NY98061',
    N'555-0208'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    11,
    N'Gabriel Diaz',
    N'4577 Main St Buffalo, NY98062',
    N'555-0209'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    12,
    N'Elizabeth Moore',
    N'4578 Main St Buffalo, NY98063',
    N'555-0210'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    13,
    N'Christoper Reed',
    N'4579 Main St Buffalo, NY98064',
    N'555-0211'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    14,
    N'Anthony Ivanov',
    N'4580 Main St Buffalo, NY98065',
    N'555-0212'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    15,
    N'Andre Lawson',
    N'4581 Main St Buffalo, NY98066',
    N'555-0213'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    16,
    N'Ellis Turner',
    N'4582 Main St Buffalo, NY98067',
    N'555-0214'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    17,
    N'Felix Henderson',
    N'4583 Main St Buffalo, NY98068',
    N'555-0215'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    18,
    N'Eugenia Lopez',
    N'4584 Main St Buffalo, NY98069',
    N'555-0216'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    19,
    N'Abigail Jackson',
    N'4585 Main St Buffalo, NY98070',
    N'555-0217'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    20,
    N'Caleb Foster',
    N'4586 Main St Buffalo, NY98071',
    N'555-0218'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    21,
    N'Graham Barnes',
    N'4587 Main St Buffalo, NY98072',
    N'555-0219'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    22,
    N'Adrian King',
    N'4588 Main St Buffalo, NY98073',
    N'555-0220'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    23,
    N'Eric Solomon',
    N'4589 Main St Buffalo, NY98074',
    N'555-0221'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    24,
    N'Isabel Gracia',
    N'4590 Main St Buffalo, NY98075',
    N'555-0222'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    25,
    N'Hayden Cook',
    N'4591 Main St Buffalo, NY98076',
    N'555-0223'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    26,
    N'Amber Rodriguez',
    N'4592 Main St Buffalo, NY98077',
    N'555-0224'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    27,
    N'Ana Bowman',
    N'4593 Main St Buffalo, NY98078',
    N'555-0225'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    28,
    N'Devon Torres',
    N'4594 Main St Buffalo, NY98079',
    N'555-0226'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    29,
    N'Cameron Baker',
    N'4595 Main St Buffalo, NY98080',
    N'555-0227'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    30,
    N'Kayla Lewis',
    N'4596 Main St Buffalo, NY98081',
    N'555-0228'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    31,
    N'Jordan Mitchell',
    N'4597 Main St Buffalo, NY98082',
    N'555-0229'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    32,
    N'Brandon Stuart',
    N'4598 Main St Buffalo, NY98083',
    N'555-0230'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    33,
    N'Ashley Schroeder',
    N'4599 Main St Buffalo, NY98084',
    N'555-0231'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    34,
    N'Juan Morgan',
    N'4600 Main St Buffalo, NY98085',
    N'555-0232'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    35,
    N'Jacob Hancock',
    N'4601 Main St Buffalo, NY98086',
    N'555-0233'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    36,
    N'Jessie Irwin',
    N'4602 Main St Buffalo, NY98087',
    N'555-0234'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    37,
    N'Kai Carter',
    N'4603 Main St Buffalo, NY98088',
    N'555-0235'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    38,
    N'Joseph Price',
    N'4604 Main St Buffalo, NY98089',
    N'555-0236'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    39,
    N'Henry Ross',
    N'4605 Main St Buffalo, NY98090',
    N'555-0237'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    40,
    N'William Beringer',
    N'4606 Main St Buffalo, NY98091',
    N'555-0238'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    41,
    N'Mario Rogers',
    N'4607 Main St Buffalo, NY98092',
    N'555-0239'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    42,
    N'Michael Peltier',
    N'4608 Main St Buffalo, NY98093',
    N'555-0240'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    43,
    N'Serena Davis',
    N'4609 Main St Buffalo, NY98094',
    N'555-0241'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    44,
    N'Sam Centrell',
    N'4610 Main St Buffalo, NY98095',
    N'555-0242'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    45,
    N'Dylan Williams',
    N'4611 Main St Buffalo, NY98096',
    N'555-0243'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    46,
    N'Riley Ramirez',
    N'4612 Main St Buffalo, NY98097',
    N'555-0244'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    47,
    N'Remy Morris',
    N'4613 Main St Buffalo, NY98098',
    N'555-0245'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    48,
    N'Natasha Jones',
    N'4614 Main St Buffalo, NY98099',
    N'555-0246'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    49,
    N'Tomas Richardson',
    N'4615 Main St Buffalo, NY98100',
    N'555-0247'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    50,
    N'Vance DeLeon',
    N'4616 Main St Buffalo, NY98101',
    N'555-0248'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    51,
    N'Kendall Collins',
    N'4617 Main St Buffalo, NY98102',
    N'555-0249'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    52,
    N'Reed Flores',
    N'4618 Main St Buffalo, NY98103',
    N'555-0250'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    53,
    N'Kiana Anderson',
    N'4619 Main St Buffalo, NY98104',
    N'555-0251'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    54,
    N'Renata Hall',
    N'4620 Main St Buffalo, NY98105',
    N'555-0252'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    55,
    N'Taylor Phillips',
    N'4621 Main St Buffalo, NY98106',
    N'555-0253'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    56,
    N'Sara Perez',
    N'4622 Main St Buffalo, NY98107',
    N'555-0254'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    57,
    N'Nathan Rigby',
    N'4623 Main St Buffalo, NY98108',
    N'555-0255'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    58,
    N'Morgan Connors',
    N'4624 Main St Buffalo, NY98109',
    N'555-0256'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    59,
    N'Nicole Wagner',
    N'4625 Main St Buffalo, NY98110',
    N'555-0257'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    60,
    N'Markus Long',
    N'4626 Main St Buffalo, NY98111',
    N'555-0258'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    61,
    N'Logan Edwards',
    N'4627 Main St Buffalo, NY98112',
    N'555-0259'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    62,
    N'Monica Thomson',
    N'4628 Main St Buffalo, NY98113',
    N'555-0260'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    63,
    N'Olivia Wilson',
    N'4629 Main St Buffalo, NY98114',
    N'555-0261'
  );
INSERT [dbo].[Customers] ([Id], [Name], [Address], [ContactNumber])
VALUES (
    64,
    N'Miguel Reyes',
    N'4630 Main St Buffalo, NY98115',
    N'555-0262'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    65,
    N'Tyler Stein',
    N'4631 Main St Buffalo, NY98116',
    N'555-0263'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    66,
    N'Mateo Gomez',
    N'4632 Main St Buffalo, NY98117',
    N'555-0264'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    67,
    N'Mikaela Lee',
    N'4633 Main St Buffalo, NY98118',
    N'555-0265'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    68,
    N'Preston Morales',
    N'4634 Main St Buffalo, NY98119',
    N'555-0266'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    69,
    N'Omar Bennett',
    N'4635 Main St Buffalo, NY98120',
    N'555-0267'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    70,
    N'Quinn Campbell',
    N'4636 Main St Buffalo, NY98121',
    N'555-0268'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    71,
    N'Robin Kline',
    N'4637 Main St Buffalo, NY98122',
    N'555-0269'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    72,
    N'Quincy Watson',
    N'4638 Main St Buffalo, NY98123',
    N'555-0270'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    73,
    N'Malik Barden',
    N'4639 Main St Buffalo, NY98124',
    N'555-0271'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    74,
    N'Kerry Allen',
    N'4640 Main St Buffalo, NY98125',
    N'555-0272'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    75,
    N'Oscar Ward',
    N'4641 Main St Buffalo, NY98126',
    N'555-0273'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    76,
    N'Madison Butler',
    N'4642 Main St Buffalo, NY98127',
    N'555-0274'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    77,
    N'Rowan Murphy',
    N'4643 Main St Buffalo, NY98128',
    N'555-0275'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    78,
    N'Rory Nyuyen',
    N'4644 Main St Buffalo, NY98129',
    N'555-0276'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    79,
    N'Victoria Burke',
    N'4645 Main St Buffalo, NY98130',
    N'555-0277'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    80,
    N'Sydney Mattos',
    N'4646 Main St Buffalo, NY98131',
    N'555-0278'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    81,
    N'Wesley Brooks',
    N'4647 Main St Buffalo, NY98132',
    N'555-0279'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    82,
    N'Parker McLean',
    N'4648 Main St Buffalo, NY98133',
    N'555-0280'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    83,
    N'Maria Sullivan',
    N'4649 Main St Buffalo, NY98134',
    N'555-0281'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    84,
    N'Shawn Hughes',
    N'4650 Main St Buffalo, NY98135',
    N'555-0282'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    85,
    N'Michelle Harris',
    N'4651 Main St Buffalo, NY98136',
    N'555-0283'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    86,
    N'Abbi Atkins',
    N'4652 Main St Buffalo, NY98137',
    N'555-0284'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    87,
    N'Archie Boyle',
    N'4653 Main St Buffalo, NY98138',
    N'555-0285'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    88,
    N'Grace Owens',
    N'4654 Main St Buffalo, NY98139',
    N'555-0286'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    89,
    N'Aidan Hunt',
    N'4655 Main St Buffalo, NY98140',
    N'555-0287'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    90,
    N'Courtney Lynch',
    N'4656 Main St Buffalo, NY98141',
    N'555-0288'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    91,
    N'Gabriel Woods',
    N'4657 Main St Buffalo, NY98142',
    N'555-0289'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    92,
    N'Ethan Brooks',
    N'4658 Main St Buffalo, NY98143',
    N'555-0290'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    93,
    N'Evan Lewis',
    N'4659 Main St Buffalo, NY98144',
    N'555-0291'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    94,
    N'James Jenkins',
    N'4660 Main St Buffalo, NY98145',
    N'555-0292'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    95,
    N'Isaac Talbot',
    N'4661 Main St Buffalo, NY98146',
    N'555-0293'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    96,
    N'Jennifer Wilkins',
    N'4662 Main St Buffalo, NY98147',
    N'555-0294'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    97,
    N'Avery Smith',
    N'4663 Main St Buffalo, NY98148',
    N'555-0295'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    98,
    N'Mia Steele',
    N'4664 Main St Buffalo, NY98149',
    N'555-0296'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    99,
    N'Sonia Rees',
    N'4665 Main St Buffalo, NY98150',
    N'555-0297'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    100,
    N'Riley Johnson',
    N'4666 Main St Buffalo, NY98151',
    N'555-0298'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    101,
    N'Hollie Rees',
    N'4667 Main St Buffalo, NY98152',
    N'555-0299'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    102,
    N'Hayden Lopez',
    N'4668 Main St Buffalo, NY98153',
    N'555-0300'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    103,
    N'Parker Jones',
    N'4669 Main St Buffalo, NY98154',
    N'555-0301'
  );
INSERT [DBO].[CUSTOMERS] ([ID], [NAME], [ADDRESS], [CONTACTNUMBER])
VALUES (
    104,
    N'Peyton Davis',
    N'4670 Main St Buffalo, NY98155',
    N'555-0302'
  );
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO

INSERT [dbo].[Engineers] ([Id], [Name], [ContactNumber])
VALUES (
    N'ab9f4790-05f2-4cc3-9f01-8dfa7d848179',
    N'Sara Perez',
    N'555-1000'
  );
INSERT [dbo].[Engineers] ([Id], [Name], [ContactNumber])
VALUES (
    N'cd3ed834-49fe-42c0-9b57-6627fe13c8ba',
    N'Michelle Harris',
    N'555-1001'
  );
INSERT [dbo].[Engineers] ([Id], [Name], [ContactNumber])
VALUES (
    N'f97f7495-101d-45b3-ac62-45a15e4d56c5',
    N'Quincy Watson',
    N'555-1002'
  );
GO

SET IDENTITY_INSERT [dbo].[Appointments] ON 

GO 

CREATE TABLE #SampleDataTable (
    Id INT,
    Description NVARCHAR(max),
    Notes NVARCHAR(max)
  )
GO


INSERT INTO #SampleDataTable (Id, Description, Notes)
VALUES (0, 'Boiler wont start', 'Installed a new diverter valve'),
  (1, 'Can''t change temperature', 'Needed a new heat exchanger'),
  (2, 'Radiators aren''t working', ''),
  (3, 'Boiler is making a strange noise', 'Installed a second new diverter valve'),
  (4, 'No hot water but lights are working', '')
GO

DECLARE @Appt_Id INT,
  @randomCustomer INT,
  @Engid [nvarchar](450),
  @EngRowid INT,
  @StatusID INT,
  @randomProblem INT

SET @Appt_Id = 1 
SET @EngRowid = 1
SET @StatusID = 1

WHILE @Appt_Id < 200 BEGIN
    SELECT @randomCustomer = CAST(
        RAND(CHECKSUM(NEWID())) *(
        SELECT MAX(ID)
        FROM [dbo].[Customers]
        ) as int
    );
	SELECT @randomCustomer = IIF( @randomCustomer = 0, 1, @randomCustomer );

    SELECT @randomProblem = CAST(RAND(CHECKSUM(NEWID())) * 4 as int);

    WITH OrderedEngs AS  
    (  
        SELECT Id,
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNumber  
        FROM [dbo].[Engineers] 
    )   
    SELECT @Engid = Id    
    FROM OrderedEngs   
    WHERE RowNumber = @EngRowid;

  INSERT [dbo].[Appointments] (
      [Id],
      [CustomerId],
      [ProblemDetails],
      [AppointmentStatusId],
      [EngineerId],
      [StartDateTime],
      [Notes],
      [ImageUrl]
    )
  VALUES (
    @Appt_Id,
    @randomCustomer,
    (
    SELECT Description
    FROM #SampleDataTable
    WHERE Id = @randomProblem 
    ),
    @StatusID,
    @Engid,
    DATEADD(hour,(-200 + ROUND(RAND() * (301), 0)),GETDATE()),
    (
    SELECT Notes
    FROM #SampleDataTable
    WHERE Id = @randomProblem 
    ),
    NULL
  )
  SET @Appt_Id = @Appt_Id + 1
  SELECT @EngRowid = IIF( @EngRowid = 4, 1, @EngRowid + 1 );
  SELECT @StatusID = IIF( @StatusID = 3, 1, @StatusID + 1 );

END

SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO

ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_AppointmentStatuses_AppointmentStatusId] FOREIGN KEY([AppointmentStatusId])
REFERENCES [dbo].[AppointmentStatuses] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_AppointmentStatuses_AppointmentStatusId]
GO

ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Customers_CustomerId]
GO

ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Engineers_EngineerId] FOREIGN KEY([EngineerId])
REFERENCES [dbo].[Engineers] ([Id])
GO

ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Engineers_EngineerId]
GO