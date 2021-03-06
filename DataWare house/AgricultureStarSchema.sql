/*
   Thursday, December 22, 20166:04:15 AM
   User: 
   Server: DESKTOP-J7TCB2L\SQLEXPRESS
   Database: khan
   Application: 
*/
use khan;
select * from agriculturedata;
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
use khan

drop table PestPopulationAvgFact;
drop table PesticideEffectONPestPopulationFact;
drop table PesticideUsageByAreaFact;
drop table Agriculture_Fact_Table;
drop table Location_Dimension;
drop table Crop_Dimension;
drop table Date_Dimension;
drop table Farmer_Dimension;
drop table Pesticide_Dimension;

CREATE TABLE dbo.Location_Dimension
	(
	Location_ID int NOT NULL IDENTITY (1, 1),
	TehsilName varchar(50) NOT NULL,
	MouzaName varchar(50) NOT NULL
	
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Location_Dimension ADD CONSTRAINT
	PK_Location_Dimension PRIMARY KEY CLUSTERED 
	(
	Location_ID
	)  ON [PRIMARY]

GO
ALTER TABLE dbo.Location_Dimension SET (LOCK_ESCALATION = TABLE)
GO
CREATE TABLE dbo.Farmer_Dimension
	(
	Farmer_ID int NOT NULL IDENTITY (1, 1),
	FarmerName varchar(100) NULL,
	FatherName varchar(100) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Farmer_Dimension ADD CONSTRAINT
	PK_Farmer_Dimension PRIMARY KEY CLUSTERED 
	(
	Farmer_ID
	)  ON [PRIMARY]

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
	)  ON [PRIMARY]

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
	) 
GO
CREATE TABLE PestPopulationAvgFact(Pest1 float,Pest2 float,Pest3 float,Pest4 float,Pest5 float,Pest6 float,Pest7 float,
Pest8 float,Pest9 float,Pest10 float,Pest11 float,Pest12 float,PesticideUsed varchar(50));

CREATE TABLE PesticideEffectOnPestPopulationFact(Pest1 float,Pest2 float,Pest3 float,Pest4 float,Pest5 float,Pest6 float,Pest7 float,
Pest8 float,Pest9 float,Pest10 float,Pest11 float,Pest12 float,PesticideName varchar(50), year int)

CREATE TABLE PesticideUsageByAreaFact(Area varchar(100),PesticideName varchar(100),TotalUsage int)

CREATE TABLE dbo.Agriculture_Fact_Table
	(
	Fact_ID_SR int NOT NULL IDENTITY (1, 1),
	Location_ID_FK int NULL,
	Pesticide_ID_FK int NULL,
	Farmer_ID_FK int NULL,
	Crop_ID_FK int NULL,
	Date_ID_FK int NULL,
	PestPopulation1 float NULL,
	PestPopulation2 float NULL,
	PestPopulation3 float NULL,
	PestPopulation4 float NULL,
	PestPopulation5 float NULL,
	PestPopulation6 float NULL,
	PestPopulation7 float NULL,
	PestPopulation8 float NULL,
	PestPopulation9 float NULL,
	PestPopulation10 float NULL,
	PestPopulation11 float NULL,
	PestPopulation12 float NULL,
	PestPopulationAvg float NULL,
	CLCV float(53) NULL,
	PlantHeight float(53) NULL,
	Area float(53) NULL,
	PesticideDosage float(53) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Agriculture_Fact_Table ADD CONSTRAINT
	PK_Agriculture_Fact_Table PRIMARY KEY CLUSTERED 
	(
	Fact_ID_SR
	) 

GO
ALTER TABLE dbo.Agriculture_Fact_Table ADD CONSTRAINT
	FK_Agriculture_Fact_Table_Location_Dimension FOREIGN KEY
	(
	Location_ID_FK
	) REFERENCES dbo.Location_Dimension
	(
	Location_ID
	) 	
GO
ALTER TABLE dbo.Agriculture_Fact_Table ADD CONSTRAINT
	FK_Agriculture_Fact_Table_Pesticide_Dimension FOREIGN KEY
	(
	Pesticide_ID_FK
	) REFERENCES dbo.Pesticide_Dimension
	(
	Pesticide_ID
	) 	
GO
ALTER TABLE dbo.Agriculture_Fact_Table ADD CONSTRAINT
	FK_Agriculture_Fact_Table_Farmer_Dimension FOREIGN KEY
	(
	Farmer_ID_FK
	) REFERENCES dbo.Farmer_Dimension
	(
	Farmer_ID
	)
GO
ALTER TABLE dbo.Agriculture_Fact_Table ADD CONSTRAINT
	FK_Agriculture_Fact_Table_Crop_Dimension FOREIGN KEY
	(
	Crop_ID_FK
	) REFERENCES dbo.Crop_Dimension
	(
	Crop_ID
	)
GO
ALTER TABLE dbo.Agriculture_Fact_Table ADD CONSTRAINT
	FK_Agriculture_Fact_Table_Date_Dimension FOREIGN KEY
	(
	Date_ID_FK
	) REFERENCES dbo.Date_Dimension
	(
	Date_ID
	)
GO