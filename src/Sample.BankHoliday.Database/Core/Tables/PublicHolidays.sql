CREATE TABLE [Core].[PublicHolidays] (
    [PublicHolidays_Id]  INT           DEFAULT (NEXT VALUE FOR [Core].[id_sequence]) NOT NULL,
    [PublicHolidaysName] VARCHAR (50)  NOT NULL,
    [Area]               VARCHAR (50)  NOT NULL,
    [Canton]             CHAR (2)      NULL,
    [PLZ]                SMALLINT      NULL,
    [Date]               DATE          NOT NULL,
    [Size]               VARCHAR (50)  NOT NULL,
    [DeltaHours]         INT           NULL,
    [created_by]         VARCHAR (500) DEFAULT (user_name()) NOT NULL,
    [created_at]         DATETIME2 (2) DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Core_PublicHolidays] PRIMARY KEY CLUSTERED ([PublicHolidays_Id] ASC),
    CONSTRAINT [CK_Core_PublicHolidaysArea] CHECK ([Area]='City' OR [Area]='Canton' OR [Area]='Country'),
    CONSTRAINT [CK_Core_PublicHolidaysAreaCantonPLZ] CHECK ([Area]='Canton' AND [Canton] IS NOT NULL OR [Area]='City' AND [PLZ] IS NOT NULL OR [Area]='Country'),
    CONSTRAINT [CK_Core_PublicHolidaysSize] CHECK ([Size]='Hours' OR [Size]='HalfDay' OR [Size]='FullDay')
);



