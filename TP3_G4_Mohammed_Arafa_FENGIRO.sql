USE locationchambre;
alter table typechambre alter column FL set default 150;
insert into typechambre(NTC,NOM) values (6,'chambre double');
select * from typechambre;
alter table typechambre  alter column FL Drop default;
alter table chambre add column NE smallint unsigned default 1 after NC;
update chambre set NE= floor(5*rand()+1);
describe chambre;
alter table typechambre rename CategorieChambre;
alter table CategorieChambre add constraint Uniq_NOM_FL UNIQUE (NOM,FL);
CREATE INDEX ind_NC ON chambre(NC);
ALTER TABLE categoriechambre add index ind_nom_fl (NOM,FL);
insert into chambre values (11,1,6,200),(17,5,4,300),(15,2,2,150),(19,3,6,270);
select NE,count(*) as nbr_de_chambre from chambre group by NE;
select NE,sum(FS) as somme,avg(FS) as moyen from chambre group by NE;
select NE,sum(FL) as somme,avg(FL) as moyen from chambre,categoriechambre where categoriechambre.NTC = chambre.NTC  group by NE;
select count(*) from chambre where FS >6;
select count(*) from chambre,categoriechambre where categoriechambre.NTC = chambre.NTC and NOM like '%Simple%' and FS<5;
select NE,count(*) as nbr_de_chambre from chambre group by NE having count(*)>=3;
select NE,count(*) as nbr_de_chambre 
	from chambre,categoriechambre 
    where (chambre.NTC = categoriechambre.NTC) and NOM like 'Double' 
    group by NE having sum(FS)<500;
select NTC,min(FS),max(FS) from chambre group by NTC having min(FS)>120 ;
select NTC,min(FS),max(FS) from chambre where (NC between 1 and 11) group by NTC having max(FS)<120 ;
select NTC, count(*) from chambre group by NTC having avg(FS) between 100 and 200 ;