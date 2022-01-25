CREATE TABLE [Core].[OverwriteBusinessLogic] (
    [OverwriteBusinessLogic_Id] INT           DEFAULT (NEXT VALUE FOR [Core].[id_sequence]) NOT NULL,
    [Store_Id]                  INT           NOT NULL,
    [Action]                    VARCHAR (50)  NOT NULL,
    [Date]                      DATE          NOT NULL,
    [OpenHours]                 VARCHAR (50)  NOT NULL,
    [Comment]                   VARCHAR (255) NOT NULL,
    [created_by]                VARCHAR (500) DEFAULT (user_name()) NOT NULL,
    [created_at]                DATETIME2 (2) DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Core_OverwriteBusinessLogic] PRIMARY KEY CLUSTERED ([OverwriteBusinessLogic_Id] ASC),
    CONSTRAINT [CK_Core_OverwriteBusinessLogic_Action] CHECK ([Action]='EnforcedOpening' OR [Action]='EnforcedClosing')
);

