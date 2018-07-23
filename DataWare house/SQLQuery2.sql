use saad;
select * into TestData from AgricultureData
where District_Tehsil = 'Hafizwala';
select * from TestData;
drop table TestData;

select PesticideDosage+' ' as PesticideDosage, LEN(PesticideDosage+' ')+1 as sLength, CHARINDEX( ' ', PesticideDosage+' ') as SpaceIndex from TestData;
select RIGHT(PesticideDosage,0) from TestData;
ALTER TABLE dbo.TestData ADD AreaUnit VARCHAR(100) Default 'UNKNOWN' ;
select PesticideDosage, LEN(PesticideDosage), CHARINDEX(' ', PesticideDosage )  from TestData ;
--++++++++++++++++separating Area unit+++++++++++++++++++++++++++
ALTER TABLE dbo.TestData 
	ADD AreaUnit VARCHAR(100) Default 'UNKNOWN' ,  
		PesticideDosageUnit VARCHAR(100) Default 'UNKNOWN',
		CLCVStatus VARCHAR(100) Default 'UNKNOWN',
		PlantHeightUnit VARCHAR(100) Default 'UNKNOWN';
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
update TestData
set AreaUnit= RIGHT(Area, LEN( Area ) - CHARINDEX(' ', Area )),
	Area = LEFT(Area, CHARINDEX(' ', Area)-1),
	
	PesticideDosageUnit= RIGHT(PesticideDosage+' ', LEN( PesticideDosage+' ' )+1 - CHARINDEX(' ', PesticideDosage+' ' )),
    PesticideDosage = LEFT(PesticideDosage+' ', CHARINDEX(' ', PesticideDosage+' ')-1),
	
	CLCVStatus = RIGHT(CLCV+' ', LEN( CLCV+' ' )+1 - CHARINDEX(' ', CLCV+' ' )),
    CLCV = LEFT(CLCV+' ', CHARINDEX(' ', CLCV+' ')-1),
	
	PlantHeightUnit = RIGHT(PlantHeight+' ', LEN( PlantHeight+' ' )+1 - CHARINDEX(' ', PlantHeight+' ' )),
    PlantHeight = LEFT(PlantHeight+' ', CHARINDEX(' ', PlantHeight+' ')-1);
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++separating PesticideDosageUnit+++++++++++++++++
ALTER TABLE dbo.TestData ADD PesticideDosageUnit VARCHAR(100) Default 'UNKNOWN' ;  
update TestData
set 
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--++++++++++++++++separating CLCVUnit+++++++++++++++++++++++++++++++

ALTER TABLE dbo.TestData ADD CLCVStatus VARCHAR(100) Default 'UNKNOWN' ;  
update TestData
set CLCVStatus = RIGHT(CLCV+' ', LEN( CLCV+' ' )+1 - CHARINDEX(' ', CLCV+' ' )),
    CLCV = LEFT(CLCV+' ', CHARINDEX(' ', CLCV+' ')-1);
    
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++separating PlantHeightUnit+++++++++++++++++++++++++++++++

ALTER TABLE dbo.TestData ADD PlantHeightUnit VARCHAR(100) Default 'UNKNOWN' ;  
update TestData
set PlantHeightUnit = RIGHT(PlantHeight+' ', LEN( PlantHeight+' ' )+1 - CHARINDEX(' ', PlantHeight+' ' )),
    PlantHeight = LEFT(PlantHeight+' ', CHARINDEX(' ', PlantHeight+' ')-1);
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+++++++++++++++++++++removing Nulls and Empty strings+++++++++++++++
update TestData
set PlantHeightUnit = 'UNKNOWN' where PlantHeightUnit = '',
update TestData
set	CLCVStatus = 'UNKNOWN' where CLCVStatus = '',
update TestData
set	PesticideDosageUnit = 'UNKNOWN' where PesticideDosageUnit = '';


