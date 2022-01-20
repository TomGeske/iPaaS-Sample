CREATE TABLE [Core].[WeekKalendar] (
    [WeekKalendar_Id]  INT           DEFAULT (NEXT VALUE FOR [Core].[id_sequence]) NOT NULL,
    [WeekKalendarName] VARCHAR (255) NOT NULL,
    [created_by]       VARCHAR (500) DEFAULT (user_name()) NOT NULL,
    [created_at]       DATETIME2 (2) DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Core_WeekKalendar] PRIMARY KEY CLUSTERED ([WeekKalendar_Id] ASC),
    CONSTRAINT [UK_Core_WeekKalendar_WeekKalendarName] UNIQUE NONCLUSTERED ([WeekKalendarName] ASC)
);



