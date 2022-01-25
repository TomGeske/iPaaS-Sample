CREATE TABLE [Core].[WeekKalendarDetail] (
    [WeekKalendarDetail_Id] INT           DEFAULT (NEXT VALUE FOR [Core].[id_sequence]) NOT NULL,
    [WeekKalendar_Id]       INT           NOT NULL,
    [WeekDay]               INT           NOT NULL,
    [FullDayPattern]        VARCHAR (50)  NOT NULL,
    [HalfDayPattern]        VARCHAR (50)  NOT NULL,
    [created_by]            VARCHAR (500) DEFAULT (user_name()) NOT NULL,
    [created_at]            DATETIME2 (2) DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Core_WeekKalendarDetail] PRIMARY KEY CLUSTERED ([WeekKalendarDetail_Id] ASC),
    CONSTRAINT [FK_Core_WeekKalendarDetail_WeekKalendar] FOREIGN KEY ([WeekKalendar_Id]) REFERENCES [Core].[WeekKalendar] ([WeekKalendar_Id])
);

