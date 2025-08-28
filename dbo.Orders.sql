CREATE TABLE [dbo].[Orders] (
    [OrderId]               INT             IDENTITY (1, 1) NOT NULL,
    [ProductId]             INT             NOT NULL,
    [Quantity]              INT             NOT NULL,
    [UnitPrice]             DECIMAL (18, 2) NOT NULL,
    [DistributorName]       NVARCHAR (100)  NULL,
    [EstimatedDeliveryDays] INT             NULL,
    [OrderDate]             DATETIME        NULL,
    [TotalPrice]            DECIMAL (18, 2) NULL,
    PRIMARY KEY CLUSTERED ([OrderId] ASC)
);

