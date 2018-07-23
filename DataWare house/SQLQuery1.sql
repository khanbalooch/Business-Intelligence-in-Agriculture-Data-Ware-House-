use saad;
select PesticideSprayDate from TestData
where PesticideSprayDate = '-';
use khan;
Update AgricultureData SET District_Tehsil  = 'UNKNOWN' where District_Tehsil is NULL
Update AgricultureData SET Mouza_Town  = 'UNKNOWN' where Mouza_Town is NULL
Update AgricultureData SET FarmerName_FatherName  = 'UNKNOWN' where FarmerName_FatherName is NULL
Update AgricultureData SET  Area = 999 where Area is NULL
Update AgricultureData SET SowingDate = 12/12/2050 where SowingDate is NULL
Update AgricultureData SET VisitDate = 12/12/2050 where VisitDate is NULL
Update AgricultureData SET PestPopulation1 = 999 where PestPopulation1 is NULL
Update AgricultureData SET PestPopulation2 = 999 where PestPopulation2 is NULL
Update AgricultureData SET PestPopulation3 = 999 where PestPopulation3 is NULL
Update AgricultureData SET PestPopulation4 = 999 where PestPopulation4 is NULL
Update AgricultureData SET PestPopulation5 = 999 where PestPopulation5 is NULL
Update AgricultureData SET PestPopulation6 = 999 where PestPopulation6 is NULL
Update AgricultureData SET PestPopulation7 = 999 where PestPopulation7 is NULL
Update AgricultureData SET PestPopulation8 = 999 where PestPopulation8 is NULL
Update AgricultureData SET PestPopulation9 = 999 where PestPopulation9 is NULL
Update AgricultureData SET PestPopulation10 = 999 where PestPopulation10 is NULL
Update AgricultureData SET PestPopulation11 = 999 where PestPopulation11 is NULL
Update AgricultureData SET PestPopulation12 = 999 where PestPopulation12 is NULL
Update AgricultureData SET PesticideUsed = 'UNKNOWN' where PesticideUsed is NULL
Update AgricultureData SET PesticideDosage = 999 where PesticideDosage is NULL
Update AgricultureData SET CLCV = 'UNKNOWN' where CLCV is NULL
Update AgricultureData SET PlantHeight = 999 where PlantHeight is NULL
Update AgricultureData SET AreaUnit = 'UNKNOWN' where AreaUnit is NULL
Update AgricultureData SET PesticideDosageUnit = 'UNKNOWN' where PesticideDosageUnit is NULL
Update AgricultureData SET CLCVStatus = 'UNKNOWN' where CLCVStatus is NULL
Update AgricultureData SET PlantHeightUnit = 'UNKNOWN' where PlantHeightUnit is NULL

drop table TestData;

select *into TestData from AgricultureData
where District_Tehsil = 'Multan';

select * from AgricultureData
where PlantHeight is NULL or PlantHeight = '' or PlantHeight = '-'

select * from AgricultureData
where PesticideSprayDate is NULL or PesticideSprayDate = '' or PesticideSprayDate = '-'

select * from TestData;
Update  AgricultureData 
SET District_Tehsil = 'UNKNOWN',
	PestPopulation1 = PestPopulation10
where District_Tehsil  like '%s/o%'


update AgricultureData set AreaUnit = COALESCE(NULLIF(AreaUnit, ''), 'UNKNOWN')

SET DATEFORMAT DMY;
update TestData set  Area = CONVERT(int,Area);
update TestData set  SowingDate = convert(date,SowingDate);
update TestData set  VisitDate = convert(date,VisitDate);
update TestData set  PestPopulation1 = CONVERT(float,PestPopulation1);
update TestData set  PestPopulation2 = CONVERT(float,PestPopulation2);
update TestData set  PestPopulation3 = CONVERT(float,PestPopulation3);
update TestData set  PestPopulation4 = CONVERT(float,PestPopulation4);
update TestData set  PestPopulation5 = CONVERT(float,PestPopulation5);
update TestData set  PestPopulation6 = CONVERT(float,PestPopulation6);
update TestData set  PestPopulation7 = CONVERT(float,PestPopulation7);
update TestData set  PestPopulation8 = CONVERT(float,PestPopulation8);
update TestData set  PestPopulation9 = CONVERT(float,PestPopulation9);
update TestData set  PestPopulation10 = CONVERT(float,PestPopulation10);
update TestData set  PestPopulation11 = CONVERT(float,PestPopulation11);
update TestData set  PestPopulation12 = CONVERT(float,PestPopulation12);
update TestData set  PesticideSprayDate = convert(date,PesticideSprayDate);
update TestData set  PesticideDosage = CONVERT(int,PesticideUsed);
update TestData set  CLCV = CONVERT(int,CLCV);
update TestData set  PlantHeight = CONVERT(int,PlantHeight);


select * from agricultureData