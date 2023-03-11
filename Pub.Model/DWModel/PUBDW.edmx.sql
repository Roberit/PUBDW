
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/08/2023 18:59:42
-- Generated from EDMX file: C:\Users\luis0\OneDrive\Escritorio\PubsDW\PubDW\Pub.Model\DWModel\PUBDW.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DWPubsSales];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'DimStores'
CREATE TABLE [dbo].[DimStores] (
    [StoreKey] int IDENTITY(1,1) NOT NULL,
    [StoreId] nvarchar(4)  NOT NULL,
    [StoreName] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'DimTitles'
CREATE TABLE [dbo].[DimTitles] (
    [TitleKey] int IDENTITY(1,1) NOT NULL,
    [TitleId] nvarchar(6)  NOT NULL,
    [TitleName] nvarchar(100)  NOT NULL,
    [TitleType] nvarchar(50)  NOT NULL,
    [PublisherKey] int  NOT NULL,
    [TitlePrice] decimal(18,4)  NOT NULL,
    [PublishedDateKey] int  NOT NULL
);
GO

-- Creating table 'DimDates'
CREATE TABLE [dbo].[DimDates] (
    [DateKey] int  NOT NULL,
    [Date] datetime  NOT NULL,
    [DateName] nvarchar(50)  NOT NULL,
    [Month] smallint  NOT NULL,
    [MonthName] nvarchar(50)  NOT NULL,
    [Quarter] smallint  NOT NULL,
    [QuarterName] nvarchar(50)  NOT NULL,
    [Year] smallint  NOT NULL,
    [YearName] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'FactSale'
CREATE TABLE [dbo].[FactSale] (
    [OrderNumber] nvarchar(50)  NOT NULL,
    [OrderDateKey] int  NOT NULL,
    [TitleKey] int  NOT NULL,
    [StoreKey] int  NOT NULL,
    [SalesQuantity] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [StoreKey] in table 'DimStores'
ALTER TABLE [dbo].[DimStores]
ADD CONSTRAINT [PK_DimStores]
    PRIMARY KEY CLUSTERED ([StoreKey] ASC);
GO

-- Creating primary key on [TitleKey] in table 'DimTitles'
ALTER TABLE [dbo].[DimTitles]
ADD CONSTRAINT [PK_DimTitles]
    PRIMARY KEY CLUSTERED ([TitleKey] ASC);
GO

-- Creating primary key on [DateKey] in table 'DimDates'
ALTER TABLE [dbo].[DimDates]
ADD CONSTRAINT [PK_DimDates]
    PRIMARY KEY CLUSTERED ([DateKey] ASC);
GO

-- Creating primary key on [OrderNumber] in table 'FactSale'
ALTER TABLE [dbo].[FactSale]
ADD CONSTRAINT [PK_FactSale]
    PRIMARY KEY CLUSTERED ([OrderNumber] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [PublishedDateKey] in table 'DimTitles'
ALTER TABLE [dbo].[DimTitles]
ADD CONSTRAINT [FK_DimDateDimTitle]
    FOREIGN KEY ([PublishedDateKey])
    REFERENCES [dbo].[DimDates]
        ([DateKey])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DimDateDimTitle'
CREATE INDEX [IX_FK_DimDateDimTitle]
ON [dbo].[DimTitles]
    ([PublishedDateKey]);
GO

-- Creating foreign key on [OrderDateKey] in table 'FactSale'
ALTER TABLE [dbo].[FactSale]
ADD CONSTRAINT [FK_DimDateFactSales]
    FOREIGN KEY ([OrderDateKey])
    REFERENCES [dbo].[DimDates]
        ([DateKey])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DimDateFactSales'
CREATE INDEX [IX_FK_DimDateFactSales]
ON [dbo].[FactSale]
    ([OrderDateKey]);
GO

-- Creating foreign key on [TitleKey] in table 'FactSale'
ALTER TABLE [dbo].[FactSale]
ADD CONSTRAINT [FK_DimTitleFactSales]
    FOREIGN KEY ([TitleKey])
    REFERENCES [dbo].[DimTitles]
        ([TitleKey])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DimTitleFactSales'
CREATE INDEX [IX_FK_DimTitleFactSales]
ON [dbo].[FactSale]
    ([TitleKey]);
GO

-- Creating foreign key on [StoreKey] in table 'FactSale'
ALTER TABLE [dbo].[FactSale]
ADD CONSTRAINT [FK_DimStoreFactSales]
    FOREIGN KEY ([StoreKey])
    REFERENCES [dbo].[DimStores]
        ([StoreKey])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DimStoreFactSales'
CREATE INDEX [IX_FK_DimStoreFactSales]
ON [dbo].[FactSale]
    ([StoreKey]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------