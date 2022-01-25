CREATE TABLE [Core].[Store] (
    [Store_Id]        INT           DEFAULT (NEXT VALUE FOR [Core].[id_sequence]) NOT NULL,
    [StoreName]       VARCHAR (255) NOT NULL,
    [Canton]          CHAR (2)      NOT NULL,
    [Streeet]         VARCHAR (50)  NOT NULL,
    [PLZ]             SMALLINT      NOT NULL,
    [City]            VARCHAR (50)  NOT NULL,
    [StoreType]       VARCHAR (50)  NOT NULL,
    [WeekKalendar_Id] INT           NOT NULL,
    [created_by]      VARCHAR (500) DEFAULT (user_name()) NOT NULL,
    [created_at]      DATETIME2 (2) DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Core_Store] PRIMARY KEY CLUSTERED ([Store_Id] ASC),
    CONSTRAINT [CK_Core_StoreType] CHECK ([StoreType]='Denner Satellit' OR [StoreType]='Denner Discount'),
    CONSTRAINT [FK_Core_Store_WeekKalendar] FOREIGN KEY ([WeekKalendar_Id]) REFERENCES [Core].[WeekKalendar] ([WeekKalendar_Id])
);



