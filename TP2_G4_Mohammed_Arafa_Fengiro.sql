use locationchambre;
create table chambre (NC smallint,NTC mediumint(2),FS Decimal(5,2));
alter table chambre 
		add constraint PK_NC primary key (NC),
        add constraint FK_ntc Foreign key (NTC) references typechambre(NTC);
create unique index nc_index on chambre(NC);
create index ntc_index on chambre(NTC);
insert into chambre values (12,2,60),(9,4,70),(3,2,200),(4,2,40),(5,4,90);
select * from chambre;
select NC,FS,typechambre.FL from chambre,typechambre where chambre.NTC=typechambre.NTC;
select FL+FS,NC from chambre,typechambre where chambre.NTC=typechambre.NTC;
select * from chambre;
select * from chambre where NTC=(select NTC from chambre limit 1);
select * from chambre,typechambre where chambre.NTC=typechambre.NTC and FL>280;
select * from chambre,typechambre where chambre.NTC=typechambre.NTC and (FL>180 and FL<250);
select * from chambre where NTC in (1,3,5);
select * from chambre,typechambre where (chambre.NTC=typechambre.NTC and (FL>180 and FL<250) and chambre.NTC in (1,3,5));
select * from chambre,typechambre where (chambre.NTC=typechambre.NTC and typechambre.NOM like '%Simple%');
select * from chambre,typechambre where (chambre.NTC=typechambre.NTC and typechambre.NOM like '%Simple%') and (FL>180 and FL<250) and chambre.NTC in (1,3,5);
select typechambre.NOM,chambre.NTC,count(chambre.NTC) from chambre,typechambre where chambre.NTC=typechambre.NTC group by typechambre.NOM,chambre.NTC;
select typechambre.NOM,chambre.NTC,sum(chambre.FS) as sum,avg(chambre.FS) as moy from chambre,typechambre where (chambre.NTC=typechambre.NTC) group by typechambre.NOM,chambre.NTC;
select typechambre.NOM,chambre.NTC,min(chambre.FS) as min,max(chambre.FS) as max from chambre,typechambre where (chambre.NTC=typechambre.NTC) group by typechambre.NOM,chambre.NTC;
update chambre,typechambre set chambre.FS=chambre.FS+20 where (typechambre.NTC=chambre.NTC) and typechambre.FL<130;
update chambre,typechambre set chambre.FS=chambre.FS - 15 where (typechambre.NTC=chambre.NTC) and typechambre.NOM like '%Double%'