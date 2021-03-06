/*
   Thursday, December 22, 20166:03:04 AM
   User: 
   Server: DESKTOP-J7TCB2L\SQLEXPRESS
   Database: khan
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Location_Dimension
	(
	TehsilName varchar(50) NOT NULL,
	MouzaName varchar(50) NOT NULL,
	Location_ID int NOT NULL IDENTITY (1, 1)
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Location_Dimension ADD CONSTRAINT
	PK_Location_Dimension PRIMARY KEY CLUSTERED 
	(
	Location_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Location_Dimension SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Farmer_Dimension
	(
	Farmer_ID int NOT NULL IDENTITY (1, 1),
	FarmerName varchar(50) NULL,
	FatherName varchar(50) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Farmer_Dimension ADD CONSTRAINT
	PK_Farmer_Dimension PRIMARY KEY CLUSTERED 
	(
	Farmer_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Farmer_Dimension SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Crop_Dimension
	(
	Crop_ID int NOT NULL IDENTITY (1, 1),
	VarietyOfCrop varchar(50) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Crop_Dimension ADD CONSTRAINT
	PK_Crop_Dimension PRIMARY KEY CLUSTERED 
	(
	Crop_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Crop_Dimension SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Date_Dimension
	(
	Date_ID int NOT NULL IDENTITY (1, 1),
	SowingDate date NULL,
	VisitDate date NULL,
	PesticideSprayDate date NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Date_Dimension ADD CONSTRAINT
	PK_Date_Dimension PRIMARY KEY CLUSTERED 
	(
	Date_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Date_Dimension SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Pesticide_Dimension
	(
	Pesticide_ID int NOT NULL IDENTITY (1, 1),
	PesticideName varchar(50) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Pesticide_Dimension ADD CONSTRAINT
	PK_Pesticide_Dimension PRIMARY KEY CLUSTERED 
	(
	Pesticide_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Pesticide_Dimension SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Agriculture_Fact_Table
	(
	Fact_ID_SR int NOT NULL IDENTITY (1, 1),
	Location_ID_FK int NULL,
	Pesticide_ID_FK int NULL,
	Farmer_ID_FK int NULL,
	Crop_ID_FK int NULL,
	Date_ID_FK int NULL,
	PestPopulation1 varchar(50) NULL,
	PestPopulation2 varchar(50) NULL,
	PestPopulation3 varchar(50) NULL,
	PestPopulation4 varchar(50) NULL,
	PestPopulation5 varchar(50) NULL,
	PestPopulation6 varchar(50) NULL,
	PestPopulation7 varchar(50) NULL,
	PestPopulation8 varchar(50) NULL,
	PestPopulation9 varchar(50) NULL,
	PestPopulation10 varchar(50) NULL,
	PestPopulation11 varchar(50) NULL,
	PestPopulation12 varchar(50) NULL,
	CLCV float(53) NULL,
	ClCVStatus varchar(50) NULL,
	PlantHeight float(53) NULL,
	Area float(53) NULL,
	PesticideDosage float(53) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Agriculture_Fact_Table ADD CONSTRAINT
	PK_Agriculture_Fact_Table PRIMARY KEY CLUSTERED 
	(
	Fact_ID_SR
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Agriculture_Fact_Table ADD CONSTRAINT
	FK_Agriculture_Fact_Table_Location_Dimension FOREIGN KEY
	(
	Location_ID_FK
	) REFERENCES dbo.Location_Dimension
	(
	Location_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Agriculture_Fact_Table ADD CONSTRAINT
	FK_Agriculture_Fact_Table_Pesticide_Dimension FOREIGN KEY
	(
	Pesticide_ID_FK
	) REFERENCES dbo.Pesticide_Dimension
	(
	Pesticide_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Agriculture_Fact_Table ADD CONSTRAINT
	FK_Agriculture_Fact_Table_Farmer_Dimension FOREIGN KEY
	(
	Farmer_ID_FK
	) REFERENCES dbo.Farmer_Dimension
	(
	Farmer_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Agriculture_Fact_Table ADD CONSTRAINT
	FK_Agriculture_Fact_Table_Crop_Dimension FOREIGN KEY
	(
	Crop_ID_FK
	) REFERENCES dbo.Crop_Dimension
	(
	Crop_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Agriculture_Fact_Table ADD CONSTRAINT
	FK_Agriculture_Fact_Table_Date_Dimension FOREIGN KEY
	(
	Date_ID_FK
	) REFERENCES dbo.Date_Dimension
	(
	Date_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Agriculture_Fact_Table SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
