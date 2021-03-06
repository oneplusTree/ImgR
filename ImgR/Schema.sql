USE [Newsletter]
GO
/****** Object:  Table [dbo].[tbl_Image]    Script Date: 9/23/2016 5:05:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Image](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[OwnerID] [bigint] NULL,
	[OwnerType] [int] NULL,
	[Name] [varchar](255) NOT NULL,
	[Extension] [varchar](255) NOT NULL,
	[URL] [varchar](max) NULL,
	[Title] [varchar](255) NULL,
	[Category] [varchar](255) NULL,
	[Description] [varchar](max) NULL,
	[CreationTime] [datetime] NULL,
	[Active] [bit] NULL,
	[ResizeOf] [bigint] NOT NULL,
	[BackupOf] [bigint] NOT NULL,
	[Width] [int] NOT NULL,
	[Height] [int] NOT NULL,
	[ResizeForDevices] [bit] NOT NULL,
	[TargetDevice] [int] NULL,
	[ResizeDevice] [int] NULL,
 CONSTRAINT [PK_tbl_Image] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ImageDevice]    Script Date: 9/23/2016 5:05:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ImageDevice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[ShortName] [varchar](255) NOT NULL,
	[UserAgent] [varchar](500) NOT NULL,
	[Width] [int] NOT NULL,
	[Height] [int] NOT NULL,
	[Orientation] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_ImageDevice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tbl_Image] ADD  DEFAULT ((0)) FOR [ResizeOf]
GO
ALTER TABLE [dbo].[tbl_Image] ADD  DEFAULT ((0)) FOR [BackupOf]
GO
ALTER TABLE [dbo].[tbl_Image] ADD  DEFAULT ((0)) FOR [Width]
GO
ALTER TABLE [dbo].[tbl_Image] ADD  DEFAULT ((0)) FOR [Height]
GO
ALTER TABLE [dbo].[tbl_Image]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Image_tbl_ImageDevice] FOREIGN KEY([TargetDevice])
REFERENCES [dbo].[tbl_ImageDevice] ([ID])
GO
ALTER TABLE [dbo].[tbl_Image] CHECK CONSTRAINT [FK_tbl_Image_tbl_ImageDevice]
GO
