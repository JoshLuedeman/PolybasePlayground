USE [Baseball]
GO

/****** Object:  Table [dbo].[baseball_teams]    Script Date: 11/25/2016 8:57:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

CREATE EXTERNAL TABLE [dbo].[baseball_teams]
(
	[team_id] [varchar](3) NULL,
	[league_id] [varchar](1) NULL,
	[city_name] [varchar](25) NULL,
	[team_name] [varchar](25) NULL,
	[team_year] [int] NULL
)
WITH (DATA_SOURCE = [PolyPgHadoop],LOCATION = N'/baseball_teams/',FILE_FORMAT = [CSV],REJECT_TYPE = VALUE,REJECT_VALUE = 0)

GO

