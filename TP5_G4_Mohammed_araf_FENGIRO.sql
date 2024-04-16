use locationchambre;

create view view1 as
select * from categoriechambre where FL>220;

insert into view1 values(1,'chambre avec ps3',230),(3,'chambre avec ps4',290),(5,'chambre tres simple',210);
#with check option refuse l'insertion des valeurs de FL <220
select * from view1;
select * from view1 where NOM like '%TV';
select * from view1 where FL<350;
select sum(FL) as Somme,avg(FL) as moyen from view1 ;
update view1 set FL=FL+15; 
select * from view1;
update view1 set FL=FL-30;
select * from view1;

alter view view1 as 
	select * from categoriechambre where FL>220 with check option;

insert into view1 values(7,'chambre avec ps3',230),(8,'chambre avec ps4',290),(9,'chambre tres simple',210);
update view1 set FL=FL-30;

alter view view_louée_2018 as 
	select * from location where DL between '1-1-2018' and '31-12-2018'
	with check option;

select * from view_louée_2018;

select * from view_louée_2018 where NC=2;

select * from view_louée_2018 where DL < '2018-4-1';
select NC,count(NCH) as nb_chambre_louée_2018 from view_louée_2018 group by NC;

select NCH from view_louée_2018 where PL>5;

select NCH from view_louée_2018,Client where client.NC=view_louée_2018.NC and NOM like 'BEN%' ;

select sum(FL) as somme_du_FL from categoriechambre,view_louée_2018,chambre
	where
	chambre.NC = view_louée_2018.NCH and chambre.NTC=categoriechambre.NTC;
