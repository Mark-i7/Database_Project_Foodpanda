------CREATE TABLE------

create table restaurants(
rest_id     number(10),
name        varchar2(50) not null,
location    varchar2(50),
transport_fee   number(10),
constraint rest_rest_id_pk primary key (rest_id)
);

create table foods(
food_id     number(10),
rest_id     number(10) not null,
constraint  food_rest_fk foreign key (rest_id)
references  restaurants(rest_id),
name        varchar2(50) not null,
type        varchar2(25) not null,
description varchar2(200),
price       number(8) not null,
constraint food_food_id_pk primary key (food_id)
);

create table rest_foods(
rest_foods_id   number(10),
rest_id         number(10) not null,
food_id         number(10) not null,
final_price     number(10) not null,
constraint  rest_foods_restid_fk foreign key (rest_id)
references  restaurants(rest_id),
constraint rest_foods_rf_id_pk primary key (rest_foods_id),
constraint  rest_foods_foodid_fk foreign key (food_id)
references  foods(food_id)
);

create table clients(
client_id   number(10),
name        varchar2(50) not null,
location_id number(10) not null,
nr_mobile   number(15),
constraint clients_client_id_pk primary key (client_id),
constraint  clients_locations_fk foreign key (location_id)
references  locations(location_id)
);

create table locations(
location_id number(10),
name        varchar2(50) not null,
is_it_safe  char(3) not null,
is_in_range char(3) not null,
city        varchar2(50) not null,
country     varchar2(50) not null,
constraint locations_location_id_pk primary key (location_id)
);
create table delivery(
delivery_id number(10),
rest_id     number(10) not null,
client_id   number(10) not null,
courier_id  number(10) not null,
amount      number(10) not null,
food_name   varchar2(50),
pick_up     timestamp default sysdate,
drop_off    timestamp default sysdate,
constraint delivery_delivery_id_pk primary key (delivery_id),
constraint  delivery_rest_id_fk foreign key (rest_id)
references  restaurants(rest_id),
constraint  delivery_client_id foreign key (client_id)
references  clients(client_id),
constraint  delivery_courier_id_fk foreign key (courier_id)
references  couriers(courier_id)
);

create table couriers(
courier_id      number(10),
name            varchar2(50) not null,
birth_date      date not null,
hire_date       date default sysdate,
vehicle_type    varchar(20) not null,
is_it_rented    char(3) not null,
batch_type      number(1) not null,
constraint couriers_courier_id primary key (courier_id),
constraint  courier_batch_type_fk foreign key (batch_type)
references  batch(type)
);

create table batch(
type            number(1),
payment_transp  number(5) not null,
payment_hours   number(5) not null,
constraint batch_type_pk primary key (type)
);

create table work(
work_id         number(10),
courier_id      number(10),
worked_hours    number(5),
nr_transp       number(5),
batch_type      char(3) not null,
salary          number(10),
constraint work_work_id_pk primary key (work_id),
constraint  work_couriers_fk foreign key (courier_id)
references  couriers(courier_id)
);

create table work_year(
courier_id      number(10),
salary_jan      number(10),
salary_feb      number(10),
salary_marc      number(10),
salary_april      number(10),
salary_may      number(10),
salary_june      number(10),
salary_july      number(10),
salary_aug      number(10),
salary_sep      number(10),
salary_oct      number(10),
salary_nov      number(10),
salary_dec      number(10),
constraint work_yearcourier_id_pk primary key (courier_id)
);

alter table work_year
add constraint  work_year_couriers_fk foreign key (courier_id)
references  couriers(courier_id);

create table rented_vehicles(
vehicle_id      number(10),
courier_id      number(10),
vehicle_type    varchar(20) not null,
is_it_rented    char(3) not null,
rent_duration   varchar2(20),
rent_fee        number(5),
constraint vehicles_vehicle_id_pk primary key (vehicle_id),
constraint  vehicles_couriers_fk foreign key (courier_id)
references  couriers(courier_id)
);

create table dispatchers(
disp_id     number(10),
name        varchar2(50) not null,
constraint dispatchers_disp_id_pk primary key (disp_id)
);

create table paybacks(
anulated_delivery_id    number(10),
delivery_id             number(10) not null,
disp_id                 number(10) not null,
client_id               number(10) not null,
courier_id              number(10) not null,
client_problem          char(3) not null,
courier_problem         char(3) not null,
issue_description       varchar2(100),
amount                  number(10),
constraint  paybacks_anulated_id_pk primary key (anulated_delivery_id),
constraint  paybacks_disp_fk foreign key (disp_id)
references  dispatchers(disp_id),
constraint  payback_courier_fk foreign key (courier_id)
references  couriers(courier_id)
);

--EXPLAIN PLAN--
create table PLAN_TABLE (
	statement_id 	varchar2(30),
	timestamp    	date,
	remarks      	varchar2(80),
	operation    	varchar2(30),
	options       	varchar2(255),
	object_node  	varchar2(128),
	object_owner 	varchar2(30),
	object_name  	varchar2(30),
	object_instance numeric,
	object_type     varchar2(30),
	optimizer       varchar2(255),
	search_columns  number,
	id		        numeric,
	parent_id	    numeric,
	position	    numeric,
	cost		    numeric,
	cardinality	    numeric,
	bytes		    numeric,
	other_tag       varchar2(255),
	partition_start varchar2(255),
    partition_stop  varchar2(255),
    partition_id    numeric,
	other		    long,
	distribution    varchar2(30),
	cpu_cost	    numeric,
	io_cost		    numeric,
	temp_space	    numeric,
    access_predicates varchar2(4000),
    filter_predicates varchar2(4000));

------INSERT------

insert all
into restaurants(rest_id,name,location,transport_fee)
values(1,'Tomek','Piata Trandafirilor 16',4)
into restaurants(rest_id,name,location,transport_fee)
values(2,'KFC','Gheorghe Doja 64',5)
into restaurants(rest_id,name,location,transport_fee)
values(3,'Pofte','Gheorghe Marinescu 66',3)
into restaurants(rest_id,name,location,transport_fee)
values(4,'Country Pub','Lavandei 2',7)
into restaurants(rest_id,name,location,transport_fee)
values(5,'Teka Bistro','Bolyai 19',4)
into restaurants(rest_id,name,location,transport_fee)
values(6,'44th Street','Revolutiei 44',6)
into restaurants(rest_id,name,location,transport_fee)
values(7,'Pelit Istambul Kebab','Bartok Bela 2',4)
into restaurants(rest_id,name,location,transport_fee)
values(8,'Bear King','Gheorghe Doja 190',6)
into restaurants(rest_id,name,location,transport_fee)
values(9,'Piaf Cafe','Bolyai 10',4)
into restaurants(rest_id,name,location,transport_fee)
values(10,'MC Donalds','Piata Trandafirilor 35',7)
into restaurants(rest_id,name,location,transport_fee)
values(11,'Green Kitchen','Piata Trandafirilor 27',5)
into restaurants(rest_id,name,location,transport_fee)
values(12,'Thai Kitchen','Piata Teatrului 11',8)
into restaurants(rest_id,name,location,transport_fee)
values(13,'Bistro Theater','Piata teatrului 7',5)
into restaurants(rest_id,name,location,transport_fee)
values(14,'El Greco','Piata Bernady Gyorgy 3',3)
into restaurants(rest_id,name,location,transport_fee)
values(15,'Dabo Doner','Postei 3',5)
select *from dual;

insert all
into foods(food_id,rest_id,name,type,description,price)
values(1,1,'Shaorma','Fast Food','Shaorma is a dish cuisine consisting of meat cut into thin slices,
stacked in a cone-like shape, and roasted on a slowly-turning vertical rotisserie or spit',25)
into foods(food_id,rest_id,name,type,description,price)
values(2,2,'Smart Menu','Fast Food','Duo Bucket meal + Chicken',33)
into foods(food_id,rest_id,name,type,description,price)
values(3,6,'The Box','Fast Food','Chicken Zinger and Krunchy Burger with fries ',40)
into foods(food_id,rest_id,name,type,description,price)
values(4,3,'Hamburger','Fast Casual',NULL,15)
into foods(food_id,rest_id,name,type,description,price)
values(5,4,'Pizza','Pub','Pizza is a savory dish of Italian origin consisting of a usually round,
flattened base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients',50)
into foods(food_id,rest_id,name,type,description,price)
values(6,5,'Teka Sandwich','Fast Casual','A sandwich is a food typically consisting of vegetables,
sliced cheese or meat, placed on or between slices of bread',21)
into foods(food_id,rest_id,name,type,description,price)
values(7,7,'Doner Kebab','Fast Food',NULL,25)
into foods(food_id,rest_id,name,type,description,price)
values(8,8,'Blue Cheese Wurstger','Fine Dining','Sausages are a meat product usually made from ground meat, often pork,
beef, or poultry, along with salt, spices and other flavouring',45)
into foods(food_id,rest_id,name,type,description,price)
values(9,10,'Big Tasty Menu','Fast Food','Big Tasty® Fresh 100% British and irish beef, melty cheese made with Emmental, topped with tomato, lettuce,
slivered onions and lashings of Big Tasty sauce, all on a sesame seed bun.',30)
into foods(food_id,rest_id,name,type,description,price)
values(10,15,'Maxi Big Mac Menu','Fast Food','Hamburger with fries and with extra Coca Cola',25)
into foods(food_id,rest_id,name,type,description,price)
values(11,11,'Mexi-Co','Fast Casual','Vegan Pasta Pesto with Roasted Cauliflower',50)
into foods(food_id,rest_id,name,type,description,price)
values(12,9,'Sweet satay','Fast Casual',NULL,53)
into foods(food_id,rest_id,name,type,description,price)
values(13,14,'Butterfly Prawns','Premium Casual','Prawns in panko crust, served with THAI sweet chilli sauce.',23)
into foods(food_id,rest_id,name,type,description,price)
values(14,13,'Chicken Satay','Premium Casual','Marinated chicken on skewers, served with a tasty peanut sauce.',43)
into foods(food_id,rest_id,name,type,description,price)
values(15,12,'Phad Thai','Premium Casual','The most famous THAI noodles dish, with rice noodles, ground peanut,
egg, spring onion, carrots, bean sprouts and tamarind sauce.',23)
select * from dual;

insert into foods(food_id,rest_id,name,type,description,price)
values(16,12,'Sweet Salads','Fast Casual',NULL,30);

insert into rest_foods(rest_foods_id,rest_id,food_id,final_price)
select 1,1,1,price+transport_fee
    from foods f join restaurants r
    on f.rest_id=r.rest_id
    where f.rest_id=1;
insert into rest_foods(rest_foods_id,rest_id,food_id,final_price)
select 2,2,2,price+transport_fee
    from foods f join restaurants r
    on f.rest_id=r.rest_id
    where f.rest_id=2;
insert into rest_foods(rest_foods_id,rest_id,food_id,final_price)
select 3,6,3,price+transport_fee
    from foods f join restaurants r
    on f.rest_id=r.rest_id
    where f.rest_id=6;
insert into rest_foods(rest_foods_id,rest_id,food_id,final_price)
select 4,3,4,price+transport_fee
    from foods f join restaurants r
    on f.rest_id=r.rest_id
    where f.rest_id=3;
insert into rest_foods(rest_foods_id,rest_id,food_id,final_price)
select 5,4,5,price+transport_fee
    from foods f join restaurants r
    on f.rest_id=r.rest_id
    where f.rest_id=4;
insert into rest_foods(rest_foods_id,rest_id,food_id,final_price)
select 6,5,6,price+transport_fee
    from foods f join restaurants r
    on f.rest_id=r.rest_id
    where f.rest_id=5;
insert into rest_foods(rest_foods_id,rest_id,food_id,final_price)
select 7,7,7,price+transport_fee
    from foods f join restaurants r
    on f.rest_id=r.rest_id
    where f.rest_id=7;
insert into rest_foods(rest_foods_id,rest_id,food_id,final_price)
select 8,8,8,price+transport_fee
    from foods f join restaurants r
    on f.rest_id=r.rest_id
    where f.rest_id=8;
insert into rest_foods(rest_foods_id,rest_id,food_id,final_price)
select 9,10,9,price+transport_fee
    from foods f join restaurants r
    on f.rest_id=r.rest_id
    where f.rest_id=10;
insert into rest_foods(rest_foods_id,rest_id,food_id,final_price)
select 10,15,10,price+transport_fee
    from foods f join restaurants r
    on f.rest_id=r.rest_id
    where f.rest_id=15;
insert into rest_foods(rest_foods_id,rest_id,food_id,final_price)
select 11,11,11,price+transport_fee
    from foods f join restaurants r
    on f.rest_id=r.rest_id
    where f.rest_id=11;
insert into rest_foods(rest_foods_id,rest_id,food_id,final_price)
select 12,9,12,price+transport_fee
    from foods f join restaurants r
    on f.rest_id=r.rest_id
    where f.rest_id=9;
insert into rest_foods(rest_foods_id,rest_id,food_id,final_price)
select 13,14,13,price+transport_fee
    from foods f join restaurants r
    on f.rest_id=r.rest_id
    where f.rest_id=14;
insert into rest_foods(rest_foods_id,rest_id,food_id,final_price)
select 14,13,14,price+transport_fee
    from foods f join restaurants r
    on f.rest_id=r.rest_id
    where f.rest_id=13;
insert into rest_foods(rest_foods_id,rest_id,food_id,final_price)
select 15,12,15,price+transport_fee
    from foods f join restaurants r
    on f.rest_id=r.rest_id
    where f.rest_id=12;
        
insert all
into clients(client_id,name,location_id,nr_mobile)
values(1,'Johny Deep',4,0761943876)
into clients(client_id,name,location_id,nr_mobile)
values(2,'Moldovan Beata',3,0711223832)
into clients(client_id,name,location_id,nr_mobile)
values(3,'Czimbalmos Szabolcs',14,0721923575)
into clients(client_id,name,location_id,nr_mobile)
values(4,'Ray Holt',1,071258036)
into clients(client_id,name,location_id,nr_mobile)
values(5,'Jake Peralta',2,074113846)
into clients(client_id,name,location_id,nr_mobile)
values(6,'Barabas Zsofi',13,0741924171)
into clients(client_id,name,location_id,nr_mobile)
values(7,'Demeter Orsolya',6,0341623878)
into clients(client_id,name,location_id,nr_mobile)
values(8,'Radu Adam',7,0715786435)
into clients(client_id,name,location_id,nr_mobile)
values(9,'Thomas Shelby Deep',2,0714890432)
into clients(client_id,name,location_id,nr_mobile)
values(10,'Gray Rosa',4,0715454678)
into clients(client_id,name,location_id,nr_mobile)
values(11,'Rozsa Tamas',8,0744327891)
into clients(client_id,name,location_id,nr_mobile)
values(12,'Siko Tamas',1,0712368912)
into clients(client_id,name,location_id,nr_mobile)
values(13,'Albert Klaudia',15,0714589674)
into clients(client_id,name,location_id,nr_mobile)
values(14,'Arthur Shelby',5,0247194125)
into clients(client_id,name,location_id,nr_mobile)
values(15,'Gabor Janos',11,0214589074)
select * from dual;

insert all
into locations(location_id,name,is_it_safe,is_in_range,city,country)
values(1,'Aleea Carpati','YES','YES','Tg.Mures','Romania')
into locations(location_id,name,is_it_safe,is_in_range,city,country)
values(2,'Pandurilor','YES','YES','Tg.Mures','Romania')
into locations(location_id,name,is_it_safe,is_in_range,city,country)
values(3,'Bolyai','YES','YES','Tg.Mures','Romania')
into locations(location_id,name,is_it_safe,is_in_range,city,country)
values(4,'Unirii Park Residence','YES','YES','Tg.Mures','Romania')
into locations(location_id,name,is_it_safe,is_in_range,city,country)
values(5,'Corunca','YES','NO','Tg.Mures','Romania')
into locations(location_id,name,is_it_safe,is_in_range,city,country)
values(6,'Budai Nagy Antal','YES','YES','Tg.Mures','Romania')
into locations(location_id,name,is_it_safe,is_in_range,city,country)
values(7,'Bulevardul 1848','YES','YES','Tg.Mures','Romania')
into locations(location_id,name,is_it_safe,is_in_range,city,country)
values(8,'Piata Garii','YES','YES','Tg.Mures','Romania')
into locations(location_id,name,is_it_safe,is_in_range,city,country)
values(9,'Gheorghe Doja','YES','YES','Tg.Mures','Romania')
into locations(location_id,name,is_it_safe,is_in_range,city,country)
values(10,'Rovinari','YES','YES','Tg.Mures','Romania')
into locations(location_id,name,is_it_safe,is_in_range,city,country)
values(11,'Remetea','NO','NO','Tg.Mures','Romania')
into locations(location_id,name,is_it_safe,is_in_range,city,country)
values(12,'Ady','NO','NO','Tg.Mures','Romania')
into locations(location_id,name,is_it_safe,is_in_range,city,country)
values(13,'Aleea Carpatii','YES','YES','Tg.Mures','Romania')
into locations(location_id,name,is_it_safe,is_in_range,city,country)
values(14,'Libertatii','YES','YES','Tg.Mures','Romania')
into locations(location_id,name,is_it_safe,is_in_range,city,country)
values(15,'Cutezantei','YES','YES','Tg.Mures','Romania')
select * from dual;

insert all
into batch(type,payment_transp,payment_hours)
values(1,7,9)
into batch(type,payment_transp,payment_hours)
values(2,6,8)
into batch(type,payment_transp,payment_hours)
values(3,5,8)
into batch(type,payment_transp,payment_hours)
values(4,4,7)
into batch(type,payment_transp,payment_hours)
values(5,0,0)
select * from dual;

insert all
into rented_vehicles(vehicle_id,courier_id,vehicle_type,is_it_rented,rent_duration,rent_fee)
values(1,3,'Bike','YES',30,60)
into rented_vehicles(vehicle_id,courier_id,vehicle_type,is_it_rented,rent_duration,rent_fee)
values(2,6,'Bike','YES',7,60)
into rented_vehicles(vehicle_id,courier_id,vehicle_type,is_it_rented,rent_duration,rent_fee)
values(3,13,'Bike','YES',14,60)
into rented_vehicles(vehicle_id,courier_id,vehicle_type,is_it_rented,rent_duration,rent_fee)
values(4,7,'E-Bike','YES',14,85)
into rented_vehicles(vehicle_id,courier_id,vehicle_type,is_it_rented,rent_duration,rent_fee)
values(5,9,'E-Bike','YES',7,85)
into rented_vehicles(vehicle_id,courier_id,vehicle_type,is_it_rented,rent_duration,rent_fee)
values(6,11,'E-Bike','YES',30,85)
into rented_vehicles(vehicle_id,courier_id,vehicle_type,is_it_rented,rent_duration,rent_fee)
values(7,4,'Scooter','YES',7,105)
into rented_vehicles(vehicle_id,courier_id,vehicle_type,is_it_rented,rent_duration,rent_fee)
values(8,8,'Scooter','YES',14,105)
into rented_vehicles(vehicle_id,courier_id,vehicle_type,is_it_rented,rent_duration,rent_fee)
values(9,12,'Scooter','YES',21,105)
into rented_vehicles(vehicle_id,courier_id,vehicle_type,is_it_rented,rent_duration,rent_fee)
values(10,10,'E-Scooter','YES',30,115)
select * from dual;

insert all
into couriers(courier_id,name,birth_date,hire_date,vehicle_type,is_it_rented,batch_type)
values(1,'Kovacs Robert',to_date('06/07/1998','DD/MM/YYYY'),to_date('28/03/2018','DD/MM/YYYY'),'Bike','NO',2)
into couriers(courier_id,name,birth_date,hire_date,vehicle_type,is_it_rented,batch_type)
values(2,'Razvan Ionut',to_date('08/08/1988','DD/MM/YYYY'),to_date('24/04/2017','DD/MM/YYYY'),'E-Bike','NO',1)
into couriers(courier_id,name,birth_date,hire_date,vehicle_type,is_it_rented,batch_type)
values(3,'Hajnal Gaspar',to_date('21/04/1999','DD/MM/YYYY'),to_date('21/12/2015','DD/MM/YYYY'),'Bike','YES',1)
into couriers(courier_id,name,birth_date,hire_date,vehicle_type,is_it_rented,batch_type)
values(4,'Nagy Adam',to_date('12/07/1978','DD/MM/YYYY'),to_date('12/06/2019','DD/MM/YYYY'),'Scooter','YES',5)
into couriers(courier_id,name,birth_date,hire_date,vehicle_type,is_it_rented,batch_type)
values(5,'Razvan Raul',to_date('16/09/2000','DD/MM/YYYY'),to_date('18/03/2018','DD/MM/YYYY'),'Bike','NO',1)
into couriers(courier_id,name,birth_date,hire_date,vehicle_type,is_it_rented,batch_type)
values(6,'Siko Denisz',to_date('08/07/2001','DD/MM/YYYY'),to_date('08/04/2020','DD/MM/YYYY'),'Bike','YES',4)
into couriers(courier_id,name,birth_date,hire_date,vehicle_type,is_it_rented,batch_type)
values(7,'Both Kristof',to_date('01/04/2002','DD/MM/YYYY'),to_date('28/03/2020','DD/MM/YYYY'),'E-Bike','YES',2)
into couriers(courier_id,name,birth_date,hire_date,vehicle_type,is_it_rented,batch_type)
values(8,'Moldovan Robert',to_date('06/12/1989','DD/MM/YYYY'),to_date('02/07/2019','DD/MM/YYYY'),'Scooter','YES',1)
into couriers(courier_id,name,birth_date,hire_date,vehicle_type,is_it_rented,batch_type)
values(9,'Csutka Gergely',to_date('16/09/1992','DD/MM/YYYY'),to_date('22/05/2018','DD/MM/YYYY'),'E-Bike','YES',2)
into couriers(courier_id,name,birth_date,hire_date,vehicle_type,is_it_rented,batch_type)
values(10,'Farkas Adam',to_date('26/08/1998','DD/MM/YYYY'),to_date('12/09/2018','DD/MM/YYYY'),'E-Scooter','YES',4)
into couriers(courier_id,name,birth_date,hire_date,vehicle_type,is_it_rented,batch_type)
values(11,'Szakacs Horatiu',to_date('21/01/1991','DD/MM/YYYY'),to_date('01/12/2016','DD/MM/YYYY'),'E-Bike','YES',2)
into couriers(courier_id,name,birth_date,hire_date,vehicle_type,is_it_rented,batch_type)
values(12,'Stefan David',to_date('19/07/1992','DD/MM/YYYY'),to_date('06/03/2015','DD/MM/YYYY'),'Scooter','YES',3)
into couriers(courier_id,name,birth_date,hire_date,vehicle_type,is_it_rented,batch_type)
values(13,'Deak Gergely',to_date('14/03/1993','DD/MM/YYYY'),to_date('27/02/2018','DD/MM/YYYY'),'Bike','YES',2)
into couriers(courier_id,name,birth_date,hire_date,vehicle_type,is_it_rented,batch_type)
values(14,'Deak Anita',to_date('24/12/1994','DD/MM/YYYY'),to_date('17/02/2018','DD/MM/YYYY'),'Scooter','NO',3)
into couriers(courier_id,name,birth_date,hire_date,vehicle_type,is_it_rented,batch_type)
values(15,'Szocs Kalman',to_date('14/03/2000','DD/MM/YYYY'),to_date('27/12/2020','DD/MM/YYYY'),'Bike','NO',4)
select * from dual;

insert into work(work_id,courier_id,worked_hours,nr_transp,batch_type,salary)
select 1,1,10,30,batch_type,10*payment_hours+30*payment_transp
    from couriers c join batch b
    on c.batch_type=b.type
    where courier_id=1;
insert into work(work_id,courier_id,worked_hours,nr_transp,batch_type,salary)
select 2,2,8,16,batch_type,8*payment_hours+16*payment_transp
    from couriers c join batch b
    on c.batch_type=b.type
    where courier_id=2;
insert into work(work_id,courier_id,worked_hours,nr_transp,batch_type,salary)
select 3,3,50,150,batch_type,50*payment_hours+150*payment_transp
    from couriers c join batch b
    on c.batch_type=b.type
    where courier_id=3;
insert into work(work_id,courier_id,worked_hours,nr_transp,batch_type,salary)
select 4,4,0,0,batch_type,0*payment_hours+0*payment_transp
    from couriers c join batch b
    on c.batch_type=b.type
    where courier_id=4;
insert into work(work_id,courier_id,worked_hours,nr_transp,batch_type,salary)
select 5,5,25,100,batch_type,25*payment_hours+100*payment_transp
    from couriers c join batch b
    on c.batch_type=b.type
    where courier_id=5;
insert into work(work_id,courier_id,worked_hours,nr_transp,batch_type,salary)
select 6,6,10,25,batch_type,10*payment_hours+25*payment_transp
    from couriers c join batch b
    on c.batch_type=b.type
    where courier_id=6;
insert into work(work_id,courier_id,worked_hours,nr_transp,batch_type,salary)
select 7,7,30,120,batch_type,30*payment_hours+120*payment_transp
    from couriers c join batch b
    on c.batch_type=b.type
    where courier_id=7;
insert into work(work_id,courier_id,worked_hours,nr_transp,batch_type,salary)
select 8,8,45,140,batch_type,45*payment_hours+140*payment_transp
    from couriers c join batch b
    on c.batch_type=b.type
    where courier_id=8;
insert into work(work_id,courier_id,worked_hours,nr_transp,batch_type,salary)
select 9,9,26,70,batch_type,26*payment_hours+70*payment_transp
    from couriers c join batch b
    on c.batch_type=b.type
    where courier_id=9;
insert into work(work_id,courier_id,worked_hours,nr_transp,batch_type,salary)
select 10,10,10,30,batch_type,10*payment_hours+30*payment_transp
    from couriers c join batch b
    on c.batch_type=b.type
    where courier_id=10;
insert into work(work_id,courier_id,worked_hours,nr_transp,batch_type,salary)
select 11,11,42,132,batch_type,42*payment_hours+132*payment_transp
    from couriers c join batch b
    on c.batch_type=b.type
    where courier_id=11;
insert into work(work_id,courier_id,worked_hours,nr_transp,batch_type,salary)
select 12,12,32,89,batch_type,32*payment_hours+89*payment_transp
    from couriers c join batch b
    on c.batch_type=b.type
    where courier_id=12;
insert into work(work_id,courier_id,worked_hours,nr_transp,batch_type,salary)
select 13,13,51,165,batch_type,51*payment_hours+165*payment_transp
    from couriers c join batch b
    on c.batch_type=b.type
    where courier_id=13;
insert into work(work_id,courier_id,worked_hours,nr_transp,batch_type,salary)
select 14,14,14,39,batch_type,14*payment_hours+39*payment_transp
    from couriers c join batch b
    on c.batch_type=b.type
    where courier_id=14;
insert into work(work_id,courier_id,worked_hours,nr_transp,batch_type,salary)
select 15,15,9,21,batch_type,9*payment_hours+21*payment_transp
    from couriers c join batch b
    on c.batch_type=b.type
    where courier_id=15;
    
    
insert into work_year(courier_id,salary_jan,salary_feb,salary_marc,salary_april,salary_may,salary_june,salary_july,salary_aug,salary_sep,salary_oct,salary_nov,salary_dec)
select 1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,w.salary
    from couriers c join work w
    on c.courier_id=w.courier_id
    where w.courier_id=1;
insert into work_year(courier_id,salary_jan,salary_feb,salary_marc,salary_april,salary_may,salary_june,salary_july,salary_aug,salary_sep,salary_oct,salary_nov,salary_dec)
select 2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,w.salary
    from couriers c join work w
    on c.courier_id=w.courier_id
    where w.courier_id=2;
insert into work_year(courier_id,salary_jan,salary_feb,salary_marc,salary_april,salary_may,salary_june,salary_july,salary_aug,salary_sep,salary_oct,salary_nov,salary_dec)
select 3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,w.salary
    from couriers c join work w
    on c.courier_id=w.courier_id
    where w.courier_id=3;
insert into work_year(courier_id,salary_jan,salary_feb,salary_marc,salary_april,salary_may,salary_june,salary_july,salary_aug,salary_sep,salary_oct,salary_nov,salary_dec)
select 4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,w.salary
    from couriers c join work w
    on c.courier_id=w.courier_id
    where w.courier_id=4;
insert into work_year(courier_id,salary_jan,salary_feb,salary_marc,salary_april,salary_may,salary_june,salary_july,salary_aug,salary_sep,salary_oct,salary_nov,salary_dec)
select 5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,w.salary
    from couriers c join work w
    on c.courier_id=w.courier_id
    where w.courier_id=5;
insert into work_year(courier_id,salary_jan,salary_feb,salary_marc,salary_april,salary_may,salary_june,salary_july,salary_aug,salary_sep,salary_oct,salary_nov,salary_dec)
select 6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,w.salary
    from couriers c join work w
    on c.courier_id=w.courier_id
    where w.courier_id=6;
insert into work_year(courier_id,salary_jan,salary_feb,salary_marc,salary_april,salary_may,salary_june,salary_july,salary_aug,salary_sep,salary_oct,salary_nov,salary_dec)
select 7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,w.salary
    from couriers c join work w
    on c.courier_id=w.courier_id
    where w.courier_id=7;
insert into work_year(courier_id,salary_jan,salary_feb,salary_marc,salary_april,salary_may,salary_june,salary_july,salary_aug,salary_sep,salary_oct,salary_nov,salary_dec)
select 8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,w.salary
    from couriers c join work w
    on c.courier_id=w.courier_id
    where w.courier_id=8;
insert into work_year(courier_id,salary_jan,salary_feb,salary_marc,salary_april,salary_may,salary_june,salary_july,salary_aug,salary_sep,salary_oct,salary_nov,salary_dec)
select 9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,w.salary
    from couriers c join work w
    on c.courier_id=w.courier_id
    where w.courier_id=9;
insert into work_year(courier_id,salary_jan,salary_feb,salary_marc,salary_april,salary_may,salary_june,salary_july,salary_aug,salary_sep,salary_oct,salary_nov,salary_dec)
select 10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,w.salary
    from couriers c join work w
    on c.courier_id=w.courier_id
    where w.courier_id=10;
insert into work_year(courier_id,salary_jan,salary_feb,salary_marc,salary_april,salary_may,salary_june,salary_july,salary_aug,salary_sep,salary_oct,salary_nov,salary_dec)
select 11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,w.salary
    from couriers c join work w
    on c.courier_id=w.courier_id
    where w.courier_id=11;
insert into work_year(courier_id,salary_jan,salary_feb,salary_marc,salary_april,salary_may,salary_june,salary_july,salary_aug,salary_sep,salary_oct,salary_nov,salary_dec)
select 12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,w.salary
    from couriers c join work w
    on c.courier_id=w.courier_id
    where w.courier_id=12;
insert into work_year(courier_id,salary_jan,salary_feb,salary_marc,salary_april,salary_may,salary_june,salary_july,salary_aug,salary_sep,salary_oct,salary_nov,salary_dec)
select 13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,w.salary
    from couriers c join work w
    on c.courier_id=w.courier_id
    where w.courier_id=13;
insert into work_year(courier_id,salary_jan,salary_feb,salary_marc,salary_april,salary_may,salary_june,salary_july,salary_aug,salary_sep,salary_oct,salary_nov,salary_dec)
select 14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,w.salary
    from couriers c join work w
    on c.courier_id=w.courier_id
    where w.courier_id=14;
insert into work_year(courier_id,salary_jan,salary_feb,salary_marc,salary_april,salary_may,salary_june,salary_july,salary_aug,salary_sep,salary_oct,salary_nov,salary_dec)
select 15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,w.salary
    from couriers c join work w
    on c.courier_id=w.courier_id
    where w.courier_id=15;


insert into delivery(delivery_id,rest_id,client_id,courier_id,amount,food_name,pick_up,drop_off)
select 1,2,4,3,final_price,name,to_timestamp('2000-12-30/ 20:20','YYYY-MM-DD HH24:MI'),to_timestamp('2000-12-30/ 20:39','YYYY-MM-DD HH24:MI')
    from foods f join rest_foods rf
    on f.rest_id=rf.rest_id
    where f.rest_id=2;
insert into delivery(delivery_id,rest_id,client_id,courier_id,amount,food_name,pick_up,drop_off)
select 2,3,5,1,final_price,name,to_timestamp('2000-12-30/ 10:10','YYYY-MM-DD HH24:MI'),to_timestamp('2000-12-30/ 10:25','YYYY-MM-DD HH24:MI')
    from foods f join rest_foods rf
    on f.rest_id=rf.rest_id
    where f.rest_id=3;
insert into delivery(delivery_id,rest_id,client_id,courier_id,amount,food_name,pick_up,drop_off)
select 3,1,2,2,final_price,name,to_timestamp('2000-12-29/ 14:40','YYYY-MM-DD HH24:MI'),to_timestamp('2000-12-29/ 15:09','YYYY-MM-DD HH24:MI')
    from foods f join rest_foods rf
    on f.rest_id=rf.rest_id
    where f.rest_id=1;
insert into delivery(delivery_id,rest_id,client_id,courier_id,amount,food_name,pick_up,drop_off)
select 4,6,7,6,final_price,name,to_timestamp('2000-12-30/ 20:20','YYYY-MM-DD HH24:MI'),to_timestamp('2000-12-30/ 20:39','YYYY-MM-DD HH24:MI')
    from foods f join rest_foods rf
    on f.rest_id=rf.rest_id
    where f.rest_id=6;
insert into delivery(delivery_id,rest_id,client_id,courier_id,amount,food_name,pick_up,drop_off)
select 5,7,13,9,final_price,name,to_timestamp('2000-12-31/ 14:00','YYYY-MM-DD HH24:MI'),to_timestamp('2000-12-31/ 14:39','YYYY-MM-DD HH24:MI')
    from foods f join rest_foods rf
    on f.rest_id=rf.rest_id
    where f.rest_id=7;
insert into delivery(delivery_id,rest_id,client_id,courier_id,amount,food_name,pick_up,drop_off)
select 6,2,12,12,final_price,name,to_timestamp('2000-12-30/ 19:33','YYYY-MM-DD HH24:MI'),to_timestamp('2000-12-30/ 19:59','YYYY-MM-DD HH24:MI')
    from foods f join rest_foods rf
    on f.rest_id=rf.rest_id
    where f.rest_id=2;
insert into delivery(delivery_id,rest_id,client_id,courier_id,amount,food_name,pick_up,drop_off)
select 7,5,3,15,final_price,name,to_timestamp('2000-12-30/ 20:20','YYYY-MM-DD HH24:MI'),to_timestamp('2000-12-30/ 20:39','YYYY-MM-DD HH24:MI')
    from foods f join rest_foods rf
    on f.rest_id=rf.rest_id
    where f.rest_id=5;
insert into delivery(delivery_id,rest_id,client_id,courier_id,amount,food_name,pick_up,drop_off)
select 8,12,9,14,final_price,name,to_timestamp('2000-12-30/ 20:20','YYYY-MM-DD HH24:MI'),to_timestamp('2000-12-30/ 20:39','YYYY-MM-DD HH24:MI')
    from foods f join rest_foods rf
    on f.rest_id=rf.rest_id
    where f.rest_id=12;
insert into delivery(delivery_id,rest_id,client_id,courier_id,amount,food_name,pick_up,drop_off)
select 9,11,2,8,final_price,name,to_timestamp('2000-12-30/ 20:50','YYYY-MM-DD HH24:MI'),to_timestamp('2000-12-30/ 21:17','YYYY-MM-DD HH24:MI')
    from foods f join rest_foods rf
    on f.rest_id=rf.rest_id
    where f.rest_id=11;
insert into delivery(delivery_id,rest_id,client_id,courier_id,amount,food_name,pick_up,drop_off)
select 10,13,4,13,final_price,name,to_timestamp('2000-12-30/ 12:10','YYYY-MM-DD HH24:MI'),to_timestamp('2000-12-30/ 12:22','YYYY-MM-DD HH24:MI')
    from foods f join rest_foods rf
    on f.rest_id=rf.rest_id
    where f.rest_id=13;
insert into delivery(delivery_id,rest_id,client_id,courier_id,amount,food_name,pick_up,drop_off)
select 11,15,11,5,final_price,name,to_timestamp('2000-12-30/ 20:20','YYYY-MM-DD HH24:MI'),to_timestamp('2000-12-30/ 20:39','YYYY-MM-DD HH24:MI')
    from foods f join rest_foods rf
    on f.rest_id=rf.rest_id
    where f.rest_id=5;
insert into delivery(delivery_id,rest_id,client_id,courier_id,amount,food_name,pick_up,drop_off)
select 12,12,14,13,final_price,name,to_timestamp('2000-12-30/ 21:05','YYYY-MM-DD HH24:MI'),to_timestamp('2000-12-30/ 21:32','YYYY-MM-DD HH24:MI')
    from foods f join rest_foods rf
    on f.rest_id=rf.rest_id
    where f.rest_id=12;
insert into delivery(delivery_id,rest_id,client_id,courier_id,amount,food_name,pick_up,drop_off)
select 13,1,1,2,final_price,name,to_timestamp('2000-12-30/ 20:01','YYYY-MM-DD HH24:MI'),to_timestamp('2000-12-30/ 20:19','YYYY-MM-DD HH24:MI')
    from foods f join rest_foods rf
    on f.rest_id=rf.rest_id
    where f.rest_id=1;
insert into delivery(delivery_id,rest_id,client_id,courier_id,amount,food_name,pick_up,drop_off)
select 14,6,6,7,final_price,name,to_timestamp('2000-12-30/ 16:20','YYYY-MM-DD HH24:MI'),to_timestamp('2000-12-30/ 16:48','YYYY-MM-DD HH24:MI')
    from foods f join rest_foods rf
    on f.rest_id=rf.rest_id
    where f.rest_id=6;
insert into delivery(delivery_id,rest_id,client_id,courier_id,amount,food_name,pick_up,drop_off)
select 15,8,8,6,final_price,name,to_timestamp('2000-12-30/ 12:00','YYYY-MM-DD HH24:MI'),to_timestamp('2000-12-30/ 13:00','YYYY-MM-DD HH24:MI')
    from foods f join rest_foods rf
    on f.rest_id=rf.rest_id
    where f.rest_id=8;


insert all
into dispatchers(disp_id,name)
values(1,'Bud Spancer')
into dispatchers(disp_id,name)
values(2,'Terence Hill')
into dispatchers(disp_id,name)
values(3,'Kalman Attila')
into dispatchers(disp_id,name)
values(4,'Keresztes Imola')
into dispatchers(disp_id,name)
values(5,'Andreea Lasel')
into dispatchers(disp_id,name)
values(6,'Erdelyi Nikoletta')
into dispatchers(disp_id,name)
values(7,'Kovacsi Kriszta')
into dispatchers(disp_id,name)
values(8,'Kedves Arpad')
into dispatchers(disp_id,name)
values(9,'Harkai Jennifer')
into dispatchers(disp_id,name)
values(10,'Isanu Linda')
into dispatchers(disp_id,name)
values(11,'Angelina Jolie')
into dispatchers(disp_id,name)
values(12,'Grace Tomson')
into dispatchers(disp_id,name)
values(13,'Margu Lucian')
into dispatchers(disp_id,name)
values(14,'Laurentiu Spancer')
into dispatchers(disp_id,name)
values(15,'Lakatos Eminem')
select * from dual;


insert into paybacks(anulated_delivery_id,delivery_id,disp_id,client_id,courier_id,client_problem,courier_problem,issue_description,amount)
select 1,2,3,5,1,'YES','NO','Wrong food',d.amount
    from couriers c join delivery d
    on c.courier_id=d.courier_id
    where d.courier_id=1;
insert into paybacks(anulated_delivery_id,delivery_id,disp_id,client_id,courier_id,client_problem,courier_problem,issue_description,amount)
select 2,6,8,12,12,'YES','NO','Wrong food',d.amount
    from couriers c join delivery d
    on c.courier_id=d.courier_id
    where d.courier_id=12;
insert into paybacks(anulated_delivery_id,delivery_id,disp_id,client_id,courier_id,client_problem,courier_problem,issue_description,amount)
select 3,8,9,9,14,'NO','YES','Accident with the courier ',d.amount
    from couriers c join delivery d
    on c.courier_id=d.courier_id
    where d.courier_id=14;
insert into paybacks(anulated_delivery_id,delivery_id,disp_id,client_id,courier_id,client_problem,courier_problem,issue_description,amount)
select 4,6,1,12,12,'YES','NO','The food is cold',d.amount
    from couriers c join delivery d
    on c.courier_id=d.courier_id
    where d.courier_id=12;
insert into paybacks(anulated_delivery_id,delivery_id,disp_id,client_id,courier_id,client_problem,courier_problem,issue_description,amount)
select 5,14,14,6,7,'YES','NO','The food is cold',d.amount
    from couriers c join delivery d
    on c.courier_id=d.courier_id
    where d.courier_id=7;
insert into paybacks(anulated_delivery_id,delivery_id,disp_id,client_id,courier_id,client_problem,courier_problem,issue_description,amount)
select 6,15,15,8,6,'YES','NO','The food is cold',d.amount
    from couriers c join delivery d
    on c.courier_id=d.courier_id
    where d.courier_id=6;

select * from paybacks;
select * from delivery;
select * from batch;
select * from clients;
select * from couriers;
select * from dispatchers;
select * from foods;
select * from locations;
select * from rented_vehicles;
select * from rest_foods;
select * from restaurants;
select * from work;

------GENEREATE RANDOM DATA------

insert /*+ append */ into restaurants
select level+(16-1) rest_id,
       dbms_random.string('L',trunc(dbms_random.value(10,50))),
       dbms_random.string('L',trunc(dbms_random.value(10,50))),
       trunc(dbms_random.value(1,7))
from   dual
connect by level <=35;
commit;

insert /*+ append */ into foods
select level+(17-1) food_id,
       trunc(dbms_random.value(16,50)),
       dbms_random.string('L',trunc(dbms_random.value(10,40))),
       dbms_random.string('L',trunc(dbms_random.value(10,25))),
       dbms_random.string('L',trunc(dbms_random.value(50,200))),
       trunc(dbms_random.value(25,80))
from   dual
connect by level <=34;

insert /*+ append */ into rest_foods
select level+(16-1) id,
       trunc(dbms_random.value(16,50)),
       trunc(dbms_random.value(16,50)),
       trunc(dbms_random.value(25,80))
from   dual
connect by level <=35;

insert /*+ append */ into clients
select level+(16-1) client_id,
       dbms_random.string('L',trunc(dbms_random.value(10,35))),
       trunc(dbms_random.value(1,15)),
       trunc(dbms_random.value(1000000000,9000000000))
from   dual
connect by level <=100;

insert /*+ append */ into couriers
select level+(16-1) id,
        dbms_random.string('L',trunc(dbms_random.value(15,40))),
        trunc(sysdate + dbms_random.value(0,366)),
        trunc(sysdate + dbms_random.value(0,366)),
        'Bike',
        'NO',
        trunc(dbms_random.value(1,5))
from   dual
connect by level <=35;

insert /*+ append */ into work
select level+(16-1) work_id,
        trunc(dbms_random.value(16,50)),
        trunc(dbms_random.value(8,80)),
        trunc(dbms_random.value(10,100)),
        trunc(dbms_random.value(1,5)),
        trunc(dbms_random.value(100,1000))
from   dual
connect by level <=35;
    
insert /*+ append */ into work_year
select level+(16-1) courier_id,
        trunc(dbms_random.value(300,1000)),
        trunc(dbms_random.value(300,1000)),
        trunc(dbms_random.value(300,1000)),
        trunc(dbms_random.value(300,1000)),
        trunc(dbms_random.value(300,1000)),
        trunc(dbms_random.value(300,1000)),
        trunc(dbms_random.value(300,1000)),
        trunc(dbms_random.value(300,1000)),
        trunc(dbms_random.value(300,1000)),
        trunc(dbms_random.value(300,1000)),
        trunc(dbms_random.value(300,1000)),
        trunc(dbms_random.value(300,1000))
from   dual
connect by level <=35;

insert /*+ append */ into rented_vehicles
select level+(11-1) vehicle_id,
       trunc(dbms_random.value(15,50)),
       dbms_random.string('L',trunc(dbms_random.value(10,20))),
       'YES',
       trunc(dbms_random.value(7,30)),
       trunc(dbms_random.value(60,120))
from   dual
connect by level <=25;

insert /*+ append */ into delivery
select level+(16-1) id,
       trunc(dbms_random.value(16,50)),
       trunc(dbms_random.value(16,50)),
       trunc(dbms_random.value(16,50)),
       trunc(dbms_random.value(25,80)),
       dbms_random.string('L',trunc(dbms_random.value(10,25))),
       trunc(sysdate + dbms_random.value(0,366)),
       trunc(sysdate + dbms_random.value(1,366))
from   dual
connect by level <=35;

insert /*+ append */ into dispatchers
select level+(16-1) disp_id,
       dbms_random.string('L',trunc(dbms_random.value(10,20)))
from   dual
connect by level <=100;

------QUERYS------
--1.irassuk ki azokat a futarokat akik havonta tobb mint 1000 lejt keresnek
--es akik legalabb 25 honapja dolgoznak futarkent
--rendezzuk a honapok szerint csokkeno sorrendbe a futarokat
select name,round(months_between(sysdate,hire_date)) as "Months works",salary
from couriers c join work w
on c.courier_id=w.courier_id
where w.salary > 1000 and round(months_between(sysdate,hire_date))>25
order by "Months works" desc;

--2.A vezetoseg elhatarozta hogy megemeli 20%al azoknak a futaroknak a fizeteset
--akik a sajat biciklijukkel szallitsak ki a rendeleseket 
select name ,round(salary+salary*20/100) AS "New Salary",is_it_rented,vehicle_type
from couriers c join work w
on c.courier_id=w.courier_id
where is_it_rented='NO' and vehicle_type='Bike';

--Explain Plan
--3.Irassuk ki a futarok neve melle az ertekelesuket a Batch osztalyzas alapjan
--Kivalo teljesitmenyu futar-Jo-Atlag-Friss-Inaktiv(decode fuggvenyt hasznalva)
--rendezzuk a type szerint novekvo sorrendbe
explain plan for
    select c.name,
        decode(type,    '1', 'Kivalo teljesitmenyu Futar',
                        '2','Jo teljesitmenyu futar',
                        '3','Atlag teljesitmenyu futar',
                        '4','Friss futar',
                        '5','Inaktiv futar') as "Grade"
    from batch b join couriers c
    on b.type=c.batch_type
    order by type asc;
    
select * from table (dbms_xplan.display());

--4.Irassuk ki hogy hany futar dolgozik jelenleg a Foodpandanal
--es irassuk ki hogy kozuluk hany szuletett 1998-ba,1999-be,2000-be,2001-be,2002-be
select count(courier_id) as "Total Couriers",
sum(decode(to_char(birth_date,'YYYY'),1998,1,0))"1998",
sum(decode(to_char(birth_date,'YYYY'),1999,1,0))"1999",
sum(decode(to_char(birth_date,'YYYY'),2000,1,0))"2000",
sum(decode(to_char(birth_date,'YYYY'),2001,1,0))"2001",
sum(decode(to_char(birth_date,'YYYY'),2002,1,0))"2002"
from couriers;
--JSON
--5. Irassuk ki azoknak a klienseknek a nevet akiknek a lakhely nevebe benne van a "ni"- szotag
-- es irassuk ki hogy milyen etelt rendeltek(vagyis az etel nevet)
select JSON_ARRAY(ROWNUM,
                    JSON_OBJECT(
                    'c.name'        value c.name,
                    'l.name'        value l.name,
                    'd.food_name'   value d.food_name)) as Json
                    from clients c join locations l
                    on c.location_id=l.location_id
                    join delivery d
                    on d.client_id=c.client_id
                    where l.name in
                        (select name
                        from locations
                        where name like '%ni%');
    
--6. Irasd ki azokat az ettermeket melyeknek 1-nel tobb eteluk van
-- irasd ki ezeket az eteleket is                                
select r.name,f.name as "Food Name"
from restaurants r join foods f
on r.rest_id=f.rest_id
where f.rest_id in(
                        select rest_id
                        from foods
                        group by rest_id
                        having count(*)>1);
                        
--7.Irassuk ki a masodik legolcsobb etelt es az arat
select name,price
from foods
where price= (select min(price)
                from foods
                where price > (select min(price)
                                    from foods));

--Explain for
--8.Irassuk ki azokat a futarokat akik tobbet keresnek mint Szakacs Horatiu
explain plan for
    select c.name,sum(salary)
    from couriers c join work w
    on c.courier_id=w.courier_id
    group by c.name
    having sum(salary)>= (select sum(salary)
                            from couriers c join work w
                            on c.courier_id=w.courier_id
                            where c.name='Szakacs Horatiu'
                            group by c.name);
                            
select * from table (dbms_xplan.display());

--Explain plan                        
--9.Listazzuk ki a legutolso rendelest es a legkorabbi rendelest(ami szerepel a tablazatban)
explain plan for
    (select c.name,d.food_name,d.pick_up
    from delivery d join clients c
    on d.client_id=c.client_id
    join restaurants r
    on d.rest_id=r.rest_id
    order by d.pick_up asc
    fetch first 1 rows only)
    
    union all
    
    (select c.name,d.food_name,d.pick_up
    from delivery d join clients c
    on d.client_id=c.client_id
    join restaurants r
    on d.rest_id=r.rest_id
    order by d.pick_up desc
    fetch first 1 rows only);

select * from table (dbms_xplan.display());

--10. Irassuk ki tipusonkent hogy hany darab jarmu(bicikli es kulonbozo tipus bicikli) van kiadva berbe
select c.vehicle_type,count(c.vehicle_type)
from rented_vehicles r join couriers c
on r.courier_id=c.courier_id
group by c.vehicle_type;

--11 Irassuk ki hogy batchenkent hany futar sorolhato be abba a tipusu batchbe 
select batch_type,count(batch_type)
from couriers
group by batch_type
order by batch_type;

--12.Atlagosan mennyi az ettermek szallitasi koltsege?
select avg(count(transport_fee))
from restaurants
group by transport_fee;

--13
--Irassuk azokat a klienseket akiknek van 2 darab s betu a nevukbe
--es anulaltak a rendeleseiket. Irassuk ki ennek az okat is
select name,issue_description
from clients c join paybacks p
on c.client_id=p.client_id
join delivery d
on c.client_id=d.client_id
where d.client_id=p.client_id and length(name)- length(replace(name, 'e',''))=2;

--14.Irassuk ki a legdragabb etelt
select max(final_price)
from (select final_price
        from rest_foods
        group by final_price);
        
--15 Listazzuk ki azokat a futarokat akik nem berelnek jarmut
select name
from couriers
where courier_id in
(select courier_id
from couriers
minus
select courier_id
from rented_vehicles);

--Modern Sql
--16 Listazzuk ki a futarok nevet,felveteli datuma szerint csoportrositva evenkent kulon sorba
explain plan for
    select extract(year from hire_date),
    listagg(name,' , ') within group (order by extract(year from hire_date))
    from couriers
    group by extract(year from hire_date);
    
select * from table (dbms_xplan.display());

--17Szamoljuk meg hogy a futarok neveiben a f,u,t,a,r karakterek hanyszor fordul elo,
--a neveikben levo spacet csereljuk le '-$-' karakterre,
select regexp_count(lower(name), '[futar]')  Elofordulas, 
regexp_replace(name, ' ', '-$-')
from couriers;

--18 Irasd ki az elso fizetest minden batch tipusba hasznalva a first_value-t
select batch_type,
first_value(salary) over (partition by batch_type)
from work;

--19 A 2es osztalyozasu futarok nevuket es fizeteset ird ki 
-- s melleje irasd ki a row_numbert,rankot es dense_rankot
select c.name,w.salary,
    row_number() over (order by w.salary) row_number,
    rank() over(order by w.salary) rank,
    dense_rank() over(order by w.salary) dense_rank
from work w join couriers c
on w.courier_id=c.courier_id
where w.batch_type=2;

--Explain Plan
--20Irjuk ki annak a futarnak a nevet aki legalabb mar 2 rendelest vitt ki
explain plan for
    select c.name
    from delivery d join couriers c
    on d.courier_id = c.courier_id
    where c.courier_id in (with
                            seged as
                                (select courier_id
                                 from delivery
                                 group by courier_id
                                 having count(*) > 2 )
                            select max(courier_id)
                            from seged);
                            
select * from table (dbms_xplan.display());

                



