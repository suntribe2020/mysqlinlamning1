create database shoe_shop;
use shoe_shop;

create table category
(id int not null auto_increment,
name varchar(20) not null,
created timestamp default current_timestamp,
lastUpdated timestamp default current_timestamp on update current_timestamp,
primary key (id));

create table shoe
(id int not null auto_increment,
size int not null,
color varchar(20) not null,
price int not null,
categoryId int not null,
created timestamp default current_timestamp,
lastUpdated timestamp default current_timestamp on update current_timestamp,
primary key (id),
foreign key (categoryId) references category(id));

create table brand
(id int not null auto_increment,
name varchar(30) not null,
created timestamp default current_timestamp,
lastUpdated timestamp default current_timestamp on update current_timestamp,
primary key (id));

-- mappningstabell
create table manufacturedBy
(id int not null auto_increment,
shoeId int not null,
brandId int not null,
primary key (id),
foreign key (shoeId) references shoe(id),
foreign key (brandId) references brand(id));

-- mappningstabell
create table belongsTo
(id int not null auto_increment,
shoeId int not null,
categoryId int not null,
primary key (id),
foreign key (shoeId) references shoe(id),
foreign key (categoryId) references category(id));

create table customer
(id int not null auto_increment,
name varchar(30) not null,
address varchar(30) not null,
postalNumber int not null,
city varchar(30) not null,
created timestamp default current_timestamp,
lastUpdated timestamp default current_timestamp on update current_timestamp,
primary key(id));

create table orders
(id int not null auto_increment,
date varchar(20) not null,
customerId int not null,
created timestamp default current_timestamp,
lastUpdated timestamp default current_timestamp on update current_timestamp,
primary key(id),
foreign key(customerId) references customer(id));

-- mappningstabell 
create table orderDetails
(id int not null auto_increment,
quantity int not null,
priceEach int not null,
shoeId int not null,
orderId int not null,
primary key (id),
foreign key (shoeId) references shoe(id),
foreign key (orderId) references orders(id));

create table customerRatings
(id int not null auto_increment,
customerComment varchar(500) not null,
customerRating int not null,
customerId int not null,
orderId int not null,
primary key (id),
foreign key (customerId) references customer(id),
foreign key (orderId) references orders(id));

insert into brand(name) values ('Haglöfs');
insert into brand(name) values ('Adidas');
insert into brand(name) values ('Nike');
insert into brand(name) values ('Ecco');
insert into brand(name) values ('The North Face');

insert into category(name) values ('Hiking');
insert into category(name) values ('Sport');
insert into category(name) values ('Indoor');
insert into category(name) values ('Sandals');
insert into category(name) values ('Winter');

insert into shoe(size, color, price, categoryId) values
(35,'Red',399,3);
insert into shoe(size, color, price, categoryId) values
(36,'Blue',245,4);
insert into shoe(size, color, price, categoryId) values
(37,'Brown',598,1);
insert into shoe(size, color, price, categoryId) values
(38,'Black',1045,4);
insert into shoe(size, color, price, categoryId) values
(39,'White',899,2);
insert into shoe(size, color, price, categoryId) values
(40,'Brown',1995,1);
insert into shoe(size, color, price, categoryId) values
(41,'Black',1495,5);
insert into shoe(size, color, price, categoryId) values
(42,'Black',679,3);
insert into shoe(size, color, price, categoryId) values
(42,'Black',1745,1);
insert into shoe(size, color, price, categoryId) values
(43,'Black',849,4);

insert into belongsTo(shoeId, categoryId) values (1,3);
insert into belongsTo(shoeId, categoryId) values (2,4);
insert into belongsTo(shoeId, categoryId) values (3,1);
insert into belongsTo(shoeId, categoryId) values (4,4);
insert into belongsTo(shoeId, categoryId) values (5,2);
insert into belongsTo(shoeId, categoryId) values (6,1);
insert into belongsTo(shoeId, categoryId) values (7,5);
insert into belongsTo(shoeId, categoryId) values (8,3);
insert into belongsTo(shoeId, categoryId) values (9,1);
insert into belongsTo(shoeId, categoryId) values (10,4);

insert into manufacturedBy(shoeId, brandId) values (1,3);
insert into manufacturedBy(shoeId, brandId) values (2,4);
insert into manufacturedBy(shoeId, brandId) values (3,1);
insert into manufacturedBy(shoeId, brandId) values (4,4);
insert into manufacturedBy(shoeId, brandId) values (5,2);
insert into manufacturedBy(shoeId, brandId) values (6,1);
insert into manufacturedBy(shoeId, brandId) values (7,5);
insert into manufacturedBy(shoeId, brandId) values (8,3);
insert into manufacturedBy(shoeId, brandId) values (9,1);
insert into manufacturedBy(shoeId, brandId) values (10,4);

insert into customer(name, address, postalNumber, city) values
('Bodil Assarson','Björkvägen 10',98478,'Kiruna');
insert into customer(name, address, postalNumber, city) values
('Margareta Öhman','Snögatan 21',30220,'Halmstad');
insert into customer(name, address, postalNumber, city) values
('Ylva Jansson','Furuvägen 2',10054,'Stockholm');
insert into customer(name, address, postalNumber, city) values
('Erik Eriksson','Vinterstigen 4 A',90784,'Stockholm');
insert into customer(name, address, postalNumber, city) values
('Karin Forss','Sommarängen 13',95073,'Haparanda');
insert into customer(name, address, postalNumber, city) values
('Jens Josefsson','Grangatan 9 B',75460,'Uppsala');

SET SQL_SAFE_UPDATES = 0;
update customer set postalNumber = '11010' where name = 'Erik Eriksson';

insert into orders(date, customerId) values
('2020-07-19',1);
insert into orders(date, customerId) values
('2020-08-30',2);
insert into orders(date, customerId) values
('2020-09-02',3);
insert into orders(date, customerId) values
('2020-09-03',4);
insert into orders(date, customerId) values
('2020-10-13',5);
insert into orders(date, customerId) values
('2020-10-15',6);
insert into orders(date, customerId) values
('2020-10-21',6);
insert into orders(date, customerId) values
('2020-11-06',3);

insert into orderDetails(quantity, priceEach, shoeId, orderId) values (1,699,4,1);
insert into orderDetails(quantity, priceEach, shoeId, orderId) values (1,1495,7,2);
insert into orderDetails(quantity, priceEach, shoeId, orderId) values (3,899,5,3);
insert into orderDetails(quantity, priceEach, shoeId, orderId) values (1,699,4,4);
insert into orderDetails(quantity, priceEach, shoeId, orderId) values (2,849,10,5);
insert into orderDetails(quantity, priceEach, shoeId, orderId) values (1,1745,9,6);
insert into orderDetails(quantity, priceEach, shoeId, orderId) values (1,679,8,6);
insert into orderDetails(quantity, priceEach, shoeId, orderId) values (1,679,8,7);
insert into orderDetails(quantity, priceEach, shoeId, orderId) values (1,699,4,8);
