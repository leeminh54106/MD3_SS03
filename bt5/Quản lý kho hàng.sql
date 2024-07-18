create database ERD;
use ERD;

create table accounts(
id int primary key auto_increment,
name varchar(100),
pass varchar(255),
address varchar(255),
status bit);

create table bill(
id int primary key auto_increment,
type bit,
acc_id int,
foreign key (acc_id) references accounts(id),
created datetime,
auth_date datetime);

create table product(
id int primary key auto_increment,
name varchar(255),
created date,
price double,
stock int,
status bit);

create table bill_detail(
id int primary key auto_increment,
bill_id int,
foreign key (bill_id) references bill(id),
product_id int,
foreign key (product_id) references product(id),
quantity int,
price double);

select *, case when status = 0 then 'true' else 'false' end as status from accounts;
insert into accounts values(1,'hùng','123456','hà nội',0),
(2,'cường','654321','hà nội',0),(3,'bách','135790','hưng yên',0);

select * from bill;
insert into bill values(1,0,1,'2022-02-11','2022-03-12'),(2,0,1,'2023-10-5','2023-10-10'),(3,1,2,'2024-05-15','2024-05-20'),(4,1,3,'2022-02-01','2022-02-10');

select *, case when status = 0 then 'true' else 'false' end as trang_thai from product;
insert into product values(1,'quần dài','2022-03-12',1200,5,0),(2,'áo dài','2023-03-15',1500,8,0),
(3,'mũ cối','1999-03-08',1600,10,0);

select * from bill_detail;
insert into bill_detail values(1,1,1,3,1200),(2,1,2,4,1500),(3,2,1,1,1200),(4,3,2,4,1500),(5,4,3,7,1600);

select * from accounts a order by name desc;
select * from bill where created between '2023-02-11' and '2023-05-15';

select bd.* from bill_detail bd where bd.bill_id = 1 ;

select * from product order by name desc;

select * from product where stock >= 10;

select * from product where status = 0;










