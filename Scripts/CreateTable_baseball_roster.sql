USE [Baseball]
GO

/****** Object:  Table [dbo].[baseball_rosters]    Script Date: 11/25/2016 8:56:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

CREATE EXTERNAL TABLE [dbo].[baseball_rosters]
(
	[player_id] [varchar](25) NULL,
	[last_name] [varchar](50) NULL,
	[first_name] [varchar](25) NULL,
	[batting_hand] [varchar](2) NULL,
	[throwing_hand] [varchar](2) NULL,
	[team_id] [varchar](3) NULL,
	[position_name] [varchar](5) NULL,
	[roster_year] [int] NULL
)
WITH (DATA_SOURCE = [PolyPgHadoop],LOCATION = N'/baseball_rosters/',FILE_FORMAT = [CSV],REJECT_TYPE = VALUE,REJECT_VALUE = 0)

GO

