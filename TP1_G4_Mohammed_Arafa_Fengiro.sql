create database LocationChambre;
Use LocationChambre;
create table typechambre (NTC mediumint(2),NOM varchar(30),FL Decimal(6,2));
alter table typechambre 
		add constraint Pk_NTC Primary key (NTC),
		add constraint NotNull_nom check (NOM is NOT NULL),
        add constraint NotNull_FL check (FL is not NULL);
create unique index index_ntc on typechambre(NTC);
insert into typechambre values(1,'chambre double',70),
			(2,'chambre Simple',100),(3,'Chambre Double TV', 120), (4,'Chambre Simple TV', 200);
            
insert into typechambre values(5,'chambre avec clim',300);
select NOM from typechambre;
select NOM,FL from typechambre;
select * from typechambre order by FL ASC;
select * from typechambre order by FL ASC,NOM DESC;
select count(*) as nb_chambre from typechambre;
select max(FL) as max,min(FL) as min from typechambre;
select sum(FL) as somme,avg(FL) as moyenne from typechambre;
select * from typechambre where FL>150;
select * from typechambre where FL<200 and FL >100;
select * from typechambre where NOM like '%Simple%';
select * from typechambre where NOM NOT like '%TV%';
select * from typechambre where FL=(select min(FL) from typechambre);
update typechambre set NTC=30 where NTC=3;
update typechambre set FL=1.1*FL;
update typechambre set FL=1.15*FL where FL < 150;
update typechambre set FL=0.95*FL where NTC<4 and NTC>2;
delete from typechambre where FL<100 or FL>300;


