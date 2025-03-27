create database mobile_data;
use mobile_data;
drop table if exists mobiles;
select * from mobiles;
select count(*) from mobiles;

select * from mobiles;
-- change the table name
ALTER TABLE `mobile_data`.`mobiles` 
CHANGE COLUMN `Company Name` `Company_Name` TEXT NULL DEFAULT NULL ;

ALTER TABLE `mobile_data`.`mobiles` 
CHANGE COLUMN `Model Name` `Model_Name` TEXT NULL DEFAULT NULL ;
ALTER TABLE `mobile_data`.`mobiles` 
CHANGE COLUMN `Mobile Weight` `Mobile_Weight` TEXT NULL DEFAULT NULL ;
ALTER TABLE `mobile_data`.`mobiles` 
CHANGE COLUMN `Front Camera` `Front_Camera` TEXT NULL DEFAULT NULL ;
ALTER TABLE `mobile_data`.`mobiles` 
CHANGE COLUMN `Back Camera` `Back_Camera` TEXT NULL DEFAULT NULL ;
ALTER TABLE `mobile_data`.`mobiles` 
CHANGE COLUMN `Battery Capacity` `Battery_Capacity` TEXT NULL DEFAULT NULL ;
ALTER TABLE `mobile_data`.`mobiles` 
CHANGE COLUMN `Launched Price(Pakistan)` `Launched_Price_Pakistan` TEXT NULL DEFAULT NULL ;
ALTER TABLE `mobile_data`.`mobiles` 
CHANGE COLUMN `Launched Price(India)` `Launched_Price_India` TEXT NULL DEFAULT NULL ;
ALTER TABLE `mobile_data`.`mobiles` 
CHANGE COLUMN `Launched Price(China)` `Launched_Price_China` TEXT NULL DEFAULT NULL ;
ALTER TABLE `mobile_data`.`mobiles` 
CHANGE COLUMN `Launched Price(USA)` `Launched_Price_USA` TEXT NULL DEFAULT NULL ;
ALTER TABLE `mobile_data`.`mobiles` 
CHANGE COLUMN `Launched Price(Dubai)` `Launched_Price_Dubai` TEXT NULL DEFAULT NULL ;
ALTER TABLE `mobile_data`.`mobiles` 
CHANGE COLUMN `Launched Year` `Launched_Year` TEXT NULL DEFAULT NULL ;
-- check the duplicate
select * from mobiles
where Company_name is null or
Model_Name is null or
Mobile_Weight is null or
RAM is null or
Front_Camera is null or
Back_Camera is null or
Processor is null or
Battery_Capacity is null or 
Screen_Size is null or 
Launched_Price_Pakistan is null or 
Launched_Price_India is null or
Launched_Price_China is null or
Launched_Price_USA is null or
Launched_Price_Dubai is null or
Launched_Year is null ;
-- clean the unnecessary words and symbols
SET SQL_SAFE_UPDATES = 0;
update mobiles
set Launched_Price_Pakistan=REPLACE(Launched_Price_Pakistan,'Not available','PKR 491,393')
where Launched_Price_Pakistan = 'Not available';

update mobiles
set Launched_Price_China=REPLACE(Launched_Price_China,'CNY 17,999Â ','CNY 17,999')
where Launched_Price_China = 'CNY 17,999Â ';

update mobiles
set Launched_Price_China=REPLACE(Launched_Price_China,'Â¥13,999','CNY 13,999')
where Launched_Price_China = 'Â¥13,999';

update mobiles
set Launched_Price_USA=concat('USD',Round(CAST(substring_index(Launched_Price_USA,'',-1)as Decimal(10,2))))
where Launched_Price_USA like "USA%";

update mobiles
set Battery_Capacity=replace (Battery_Capacity, ',','')
where Battery_Capacity like '%mAh';
select * from mobiles;
-- drop the unwanted columns
ALTER TABLE `mobile_data`.`mobiles` 
DROP COLUMN `@`;
select * from mobiles;

