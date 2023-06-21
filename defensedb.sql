-- Database: defense

-- DROP DATABASE IF EXISTS defense;

CREATE DATABASE defense
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
CREATE TABLE squad (
squadno INTEGER UNIQUE NOT NULL,
squad_name VARCHAR(100),
Captain_id  INTEGER    NOT NULL,
year   INTEGER NOT NULL,
totalCapacity INTEGER    NOT NULL CHECK (totalCapacity > 0),
PRIMARY KEY(squadno)
);
select * from squad
INSERT INTO squad VALUES(101,'Madras Regiment', 13011, 1992,20);
INSERT INTO squad VALUES(102,'Madras Regiment',27989,2013,25);
INSERT INTO squad VALUES(103,'Rajputana Rifles' ,14255,1996,18);
INSERT INTO squad VALUES(104,'Rajputana Rifles' ,14256,2010,22);
INSERT INTO squad VALUES(105,'Sikh Regiment',12402,1980,15);
INSERT INTO squad VALUES(106,'Sikh Regiment',11046,2011,19);
INSERT INTO squad VALUES(107,'Jat Regiment',11238,1994,18);
INSERT INTO squad VALUES(108,'Jat Regiment',10305,2014,24);
INSERT INTO squad VALUES(109,'Rajput Regiment',12356,1982,15);
INSERT INTO squad VALUES(110,'Rajput Regiment',49158,2011,18);
drop table squad;
truncate table squad;
delete from squad
where squad_name='Madras Regiment'
rename squad to unit
update squad
set squad_name='Gorkha Regiment'
where squadno=105
alter table squad
drop column year

SELECT UPPER(squad_name) as Upper_Case_Squad_Name
FROM squad;

SELECT ASCII(squad_name) AS NumCodeOfFirstChar
FROM squad;

SELECT LOWER(squad_name) AS Lower_case_Squad_Name
FROM squad;

SELECT RIGHT(squad_name, 8) AS ExtractString
FROM squad;

SELECT LEFT(squad_name, 8) AS ExtractString
FROM squad;

SELECT NOW();

select squad_name, sum(totalCapacity)
from squad
Group by squad_name
order by sum(totalCapacity) desc

select squad_name, avg(totalCapacity)
from squad
Group by squad_name

select squad_name, min(totalCapacity)
from squad
Group by squad_name

select squad_name, max(totalCapacity)
from squad
Group by squad_name

select squad_name, count(*)
from squad
Group by squad_name
having squad_name='Jat Regiment'

CREATE TABLE location (
pincode  VARCHAR(6) PRIMARY KEY CHECK (length(pincode) = 6),
district VARCHAR(100) NOT NULL,
state    VARCHAR(100) NOT NULL,
country  VARCHAR(100) NOT NULL,
UNIQUE (pincode)
);
select * from location
INSERT INTO location VALUES(382421,'Gandhinagar','Gujarat','India');
INSERT INTO location VALUES(382422,'Allahabad','Uttar Pradesh','India');
INSERT INTO location VALUES(382424,'patna','Bihar','India');
INSERT INTO location VALUES(382425,'jabalpur','Madhya Pradesh','India');
INSERT INTO location VALUES(382427,'Pune','Maharashtra','India');
INSERT INTO location VALUES(382428,'Delhi','Delhi','India');
INSERT INTO location VALUES(382429,'Kargil','J&K','India');
INSERT INTO location VALUES(382431,'Gangtok','Sikkim','India');
INSERT INTO location VALUES(382434,'Roorkee','Uttarakhand','India');
INSERT INTO location VALUES(382437,'Chiniot','Punjab','India');
drop table location;
truncate table location;
delete from location
where district='Pune'
alter table location
add continent varchar(100);
update location
set district='Chandigarh'
where pincode='382437'
alter table location
drop column country

select country, count(pincode)
from location
Group by country
having country='India'

CREATE TABLE company (
company_id INTEGER NOT NULL,
company_name VARCHAR(100) PRIMARY KEY,
country_name VARCHAR(100) NOT NULL
);
select * from company
INSERT INTO "company" (company_id,company_name, country_name) VALUES (1001,'Bersa', 'Argentina');
INSERT INTO "company" (company_id,company_name, country_name) VALUES (1002,'Boeing Australia', 'Australia');
INSERT INTO "company" (company_id,company_name, country_name) VALUES (1003,'Steyr Mannlicher', 'Austria');
INSERT INTO "company" (company_id,company_name, country_name) VALUES (1004,'MDI Azerbaijan', 'Azerbaijan');
INSERT INTO "company" (company_id,company_name, country_name) VALUES (1005,'Defence Advancement Trading Company (DATCO)', 'Bangladesh');
INSERT INTO "company" (company_id,company_name, country_name) VALUES (1006,'Fabrique Nationale de Herstal', 'Belgium');
INSERT INTO "company" (company_id,company_name, country_name) VALUES (1007,'Pretis dd', 'Bosnia and Herzegovina');
INSERT INTO "company" (company_id,company_name, country_name) VALUES (1008,'Avibras', 'Brazil');
INSERT INTO "company" (company_id,company_name, country_name) VALUES (1009,'TEREM', 'Bulgaria');
INSERT INTO "company" (company_id,company_name, country_name) VALUES (1010,'Hindustan Aeronautics Limited', 'India');
drop table company;
truncate table company;
delete from company
where company_name='Bersa'

update company
set country_name='Russia'
where company_id=1005
alter table company
drop column country_name



CREATE TABLE weapons (
weapon_id   INTEGER UNIQUE NOT NULL,
weapon_name VARCHAR(100) UNIQUE NOT NULL,
manufacturing_date DATE NOT NULL,
manufacturing_location VARCHAR(100),
company_name VARCHAR(100) NOT NULL REFERENCES company(company_name),
PRIMARY KEY(weapon_id, weapon_name, company_name)
);
select * from weapons
INSERT INTO "weapons" (weapon_id, weapon_name, manufacturing_date, manufacturing_location, company_name) VALUES (1053,'Glock-18','2000-01-1','Argentina','Bersa');
INSERT INTO "weapons" (weapon_id, weapon_name, manufacturing_date, manufacturing_location, company_name) VALUES (1054,'Dual Berettas','2001-02-2','Australia','Boeing Australia');
INSERT INTO "weapons" (weapon_id, weapon_name, manufacturing_date, manufacturing_location, company_name) VALUES (1055,'P250','2005-03-3','Austria','Steyr Mannlicher');
INSERT INTO "weapons" (weapon_id, weapon_name, manufacturing_date, manufacturing_location, company_name) VALUES (1056,'Tec-9','2002-04-4','Azerbaijan','MDI Azerbaijan');
INSERT INTO "weapons" (weapon_id, weapon_name, manufacturing_date, manufacturing_location, company_name) VALUES (1057,'Desert Eagle','2003-05-5','Bangladesh','Defence Advancement Trading Company (DATCO)');
INSERT INTO "weapons" (weapon_id, weapon_name, manufacturing_date, manufacturing_location, company_name) VALUES (1058,'R8 Revolver','2001-06-6','Belgium','Fabrique Nationale de Herstal');
INSERT INTO "weapons" (weapon_id, weapon_name, manufacturing_date, manufacturing_location, company_name) VALUES (1059,'USP-S','2002-07-7','Bosnia and Herzegovina','Pretis dd');
INSERT INTO "weapons" (weapon_id, weapon_name, manufacturing_date, manufacturing_location, company_name) VALUES (1060,'P2000','2006-08-8','Brazil','Avibras');
INSERT INTO "weapons" (weapon_id, weapon_name, manufacturing_date, manufacturing_location, company_name) VALUES (1061,'Five-Seven','2005-09-9','Bulgaria','TEREM');
INSERT INTO "weapons" (weapon_id, weapon_name, manufacturing_date, manufacturing_location, company_name) VALUES (1062,'Nova','2001-10-10','India','Hindustan Aeronautics Limited');
drop table weapons;
truncate table weapons;
delete from weapons
where weapon_name='Desert Eagle'

update weapons
set manufacturing_location='England'
where weapon_id=1061
alter table weapons
drop column manufacturing_location

CREATE TABLE reward (
sold_id      INTEGER NOT NULL REFERENCES soldier (id)
ON UPDATE CASCADE ON DELETE CASCADE,
medalname VARCHAR(100) NOT NULL ,
Year      INTEGER NOT NULL,
PRIMARY KEY (sold_id)
);
INSERT INTO "reward" (sold_id, medalname, Year) VALUES (29603,'Ashok Chakra Award ',1992);
INSERT INTO "reward" (sold_id, medalname, Year) VALUES (21474,'Kirti Chakra ',1993);
INSERT INTO "reward" (sold_id, medalname, Year) VALUES (12498,'Shaurya Chakra ',2000);
INSERT INTO "reward" (sold_id, medalname, Year) VALUES (14298,'Sarvottam Yudh Seva Medal',2001);
INSERT INTO "reward" (sold_id, medalname, Year) VALUES (10923,'Yudh Seva Medal',1997);
INSERT INTO "reward" (sold_id, medalname, Year) VALUES (12398,'Ati Vishisht Seva Medal ',2006);
INSERT INTO "reward" (sold_id, medalname, Year) VALUES (12245,'Vishisht Seva Medal',2009);
INSERT INTO "reward" (sold_id, medalname, Year) VALUES (10305,'Ashok Chakra Award ',2016);
INSERT INTO "reward" (sold_id, medalname, Year) VALUES (12051,'Sarvottam Yudh Seva Medal',2018);
INSERT INTO "reward" (sold_id, medalname, Year) VALUES (12300,'Bharat Award ',2008);
select * from reward
truncate table reward;
delete from reward
where medalname='Ati Vishisht Seva Medal'
rename reward to award
update reward
set medalname='Bharat Seva Medal'
where sold-id=12300
alter table reward
drop column Year
drop table reward

CREATE TABLE inventory (
weapon_name   VARCHAR(100)  REFERENCES weapons (weapon_name),

no_of_wep     INTEGER NOT NULL,

PRIMARY KEY (weapon_name,no_of_wep)
);
select * from inventory
INSERT INTO "inventory" (weapon_name,no_of_wep) VALUES ('Glock-18',2000);
INSERT INTO "inventory" (weapon_name,no_of_wep) VALUES ('Dual Berettas',1000);
INSERT INTO "inventory" (weapon_name,no_of_wep) VALUES ('P250',1500);
INSERT INTO "inventory" (weapon_name,no_of_wep) VALUES ('Tec-9',400);
INSERT INTO "inventory" (weapon_name,no_of_wep) VALUES ('Desert Eagle',500);
INSERT INTO "inventory" (weapon_name,no_of_wep) VALUES ('R8 Revolver',600);
INSERT INTO "inventory" (weapon_name,no_of_wep) VALUES ('USP-S', 754);
INSERT INTO "inventory" (weapon_name,no_of_wep) VALUES ('P2000',562);
INSERT INTO "inventory" (weapon_name,no_of_wep) VALUES ('Five-Seven',800);
INSERT INTO "inventory" (weapon_name,no_of_wep) VALUES ('Nova',895);

select * from inventory
drop table inventory;
truncate table inventory;
delete from inventory
where weapon_name='Desert Eagle'
rename inventory to storage
update inventory
set weapon_name='MB14'
where weapon_name='Nova'
alter table inventory
drop column no_of_wep

select weapon_name, max(no_of_wep)
from inventory
group by weapon_name, no_of_wep
having no_of_wep>1000
order by no_of_wep asc

CREATE TABLE Soldier (
id INTEGER NOT NULL,
name VARCHAR(100) NOT NULL,
gender VARCHAR(100) NOT NULL,
rank VARCHAR(30) NOT NULL,
doj DATE NOT NULL,
squadno INTEGER NOT NULL REFERENCES squad(squadno),
pincode  VARCHAR(6) NOT NULL REFERENCES Location(pincode),
height INTEGER CHECK (Height > 152),
weight INTEGER CHECK (Weight > 50),
dob   DATE NOT NULL,
weapon_id INTEGER NOT NULL REFERENCES weapons(weapon_id),
UNIQUE (id),
PRIMARY KEY (id)
);
select * from soldier
INSERT INTO soldier VALUES (29603,'Rohan Dhoot','Male','Soldier','2005-6-21',101,382421,182,76,'1987-8-24',1053);
INSERT INTO soldier VALUES (21474,'Brijmohan Singh', 'Male','Field Marshal','2010-12-21',102,382422,172,80,'1990-12-24',1054);
INSERT INTO soldier VALUES(12498,'Rajat Talesra', 'Male','Soldier','2008-12-4',103,382424,177,79,'1995-01-13',1055);
INSERT INTO soldier VALUES(14298,'Niranjan Arya', 'Male','Lieutenant General','2014-5-14',104,382425,158,82,'1996-11-12',1056);
INSERT INTO soldier VALUES (10923,'Disha Singh', 'Female','Major General','2001-05-25',105,382427,171,52,'1990-10-2',1057);
INSERT INTO soldier Values(12398,'Saurabh Pandit', 'Male','Soldier','2011-4-15',106,382428,185,74,'1996-03-29',1058);
INSERT INTO soldier VALUES(12245,'Dheeru', 'Male','Soldier','2010-9-11',107,382429,172,78,'1990-02-24', 1059);
INSERT INTO soldier VALUES (10305,'Vikul Kumar', 'Male','Captain','2014-10-11',108,382431,176,75,'1994-01-24',1060);
INSERT INTO soldier VALUES (12051,'Mayank', 'Male','Soldier','2011-9-21',109,382434,174,75,'1991-02-24',1061);
INSERT INTO soldier VALUES (12300,'Piyush', 'Male','Soldier', '2005-9-21',110,382437,162,68,'1985-01-24',1062);
drop table Soldier
truncate table soldier;
delete from soldier
where name='Piyush'

update soldier
set name='Rahul'
where id=12051

SELECT CURRENT_TIMESTAMP;

SELECT Name, Extract(DAY FROM dob) AS BirthDay FROM soldier;

SELECT Name, Extract(YEAR FROM dob) AS BirthYear FROM soldier;

SELECT Name, Extract(MONTH FROM dob) AS BirthYear FROM soldier;

SELECT weapons.weapon_name, weapons.weapon_id, inventory.no_of_wep
FROM weapons
INNER JOIN inventory
ON weapons.weapon_name = inventory.weapon_name;

SELECT soldier.id, soldier.name, soldier.rank, weapons.weapon_name
FROM soldier
LEFT JOIN weapons
ON soldier.weapon_id=weapons.weapon_id;

SELECT reward.medalname, soldier.id, soldier.name, soldier.rank
FROM reward
RIGHT JOIN soldier
ON reward.sold_id=soldier.id;

SELECT soldier.id, soldier.name, soldier.rank, squad.squad_name, squad.totalCapacity
FROM soldier
FULL OUTER JOIN squad
ON soldier.squadno=squad.squadno;

Select name from soldier
where not exists (select * from squad
where squad.squad_name='Rajput Regiment'
AND squad.squadno=soldier.squadno)

Select name, squadno from soldier
where squadno in (select squadno from squad)

Select name, squadno from soldier
where exists (select * from squad
where squad.squad_name='Jat Regiment'
AND squad.squadno=soldier.squadno)

SELECT soldier.id, soldier.name, soldier.rank, weapons.weapon_name, inventory.no_of_wep
FROM soldier, weapons, inventory
Where soldier.weapon_id=weapons.weapon_id and inventory.weapon_name=weapons.weapon_name;

SELECT soldier.id, soldier.name, soldier.rank, weapons.weapon_name, inventory.no_of_wep
FROM soldier
INNER JOIN weapons ON weapons.weapon_id = soldier.weapon_id
INNER JOIN inventory ON inventory.weapon_name = weapons.weapon_name
Order by inventory.no_of_wep ASC

SELECT soldier.id, soldier.name, soldier.rank, weapons.weapon_name, company.country_name
FROM soldier
INNER JOIN weapons ON weapons.weapon_id = soldier.weapon_id
INNER JOIN company ON company.company_name = weapons.company_name