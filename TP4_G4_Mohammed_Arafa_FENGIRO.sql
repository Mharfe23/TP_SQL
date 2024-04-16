use locationchambre;
create table client(NC smallint,Nom varchar(15),Prenom varchar(20));
create table Location (NC smallint,NCH smallint,DL DATE,PL smallint unsigned);

alter table client add constraint pk_NC PRIMARY KEY (NC);
alter table Location add constraint pk_loc Primary key (NC,NCH,DL);
alter table location add constraint FK_loc Foreign Key (NC) references Client(NC)
		,add constraint FK_loc2 Foreign Key (NCH) references Chambre(NC);
alter table Client add column Adresse Varchar(50) after Prenom;

insert into Client values (1,'mohammed','fengiro','N3 avenue hassan 2'),
		(2,'taha','faidi','N19 avenue Chmaao'),('3','Saad','pedro','Avenue hassan');

insert into Location values (1,11,'2024-09-01',3),(2,9,'2024-08-07',2),
		(3,5,'2024-02-28',5);
        

select DISTINCT * from Client,Location where Client.NC=Location.NC and NCH=2;  

select Distinct Client.NC from Client,categoriechambre,chambre where (categoriechambre.NTC=chambre.NTC 
		and client.NC=chambre.NC) and categoriechambre.FL >250;
        
select Distinct Location.NC,Location.NCH,Location.DL,Location.PL,categoriechambre.FL*Location.PL as PRIX_TOTAL
	from Location,categoriechambre,chambre where (categoriechambre.NTC=chambre.NTC 
	and location.NC=chambre.NC);

select Client.Nom,Client.prenom,categoriechambre.Nom,Location.PL,categoriechambre.FL,categoriechambre.FL*Location.PL as FRAIS_GLOBAL
	From Client,categoriechambre,Location,chambre where (categoriechambre.NTC=chambre.NTC 
	and Client.NC=chambre.NC and Location.NC=Client.NC);

select * from Chambre,Location
		where Location.NCH = Chambre.NC and Location.DL < '2024-01-10';

select * from Chambre,Location
		where Location.NCH = Chambre.NC and Location.PL between 2 and 5;

select NC, count(*) as nbr_location from location group by NC; #qestion 11

select NC, count(DISTINCT NCH) as nbr_location from location group by NC;

select NCH, count(DISTINCT NC) as nbr_location from location group by NCH;

select NC, count(*) as nbr_location from location where PL between 3 and 7 group by NC;

select NCH, count(DISTINCT location.NC) as nbr_location from location,categoriechambre,chambre
		where (categoriechambre.NTC = chambre.NTC 
		and chambre.NC = location.NCH )and FL <= 150
		group by NCH;

select l.NC,sum(cat_ch.FL*PL) as somme_total_par_client
	from location as l,categoriechambre as cat_ch,chambre
    where l.NCH=chambre.NC group by NC;
    
select l.NC,sum(cat_ch.FL*PL) as somme_total_par_client
	from location as l,categoriechambre as cat_ch,chambre
    where l.NCH=chambre.NC and chambre.NTC=cat_ch.NTC group by NC;
    
select l.NC,sum(cat_ch.FL*PL) as somme_total_par_client
	from location as l,categoriechambre as cat_ch,chambre
    where l.NCH=chambre.NC and chambre.NTC=cat_ch.NTC and l.NC in (1,3,5) group by NC;
    
select l.NC,sum(cat_ch.FL*PL) as somme_total_par_client
	from location as l,categoriechambre as cat_ch,chambre
    where l.NCH=chambre.NC and chambre.NTC=cat_ch.NTC 
    group by NC
    having count(l.NC)>4;
    
select l.NC,sum(cat_ch.FL*PL) as somme_total_par_client
	from location as l,categoriechambre as cat_ch,chambre
    where l.NCH=chambre.NC and chambre.NTC=cat_ch.NTC 
    group by NC
    having somme_total_par_client between 500 and 2000;
    
