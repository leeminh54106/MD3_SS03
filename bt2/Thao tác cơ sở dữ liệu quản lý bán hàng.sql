create database ss03_bt2;
use ss03_bt2;

create table customer(
id int primary key auto_increment,
name varchar(255),
age int);

create table orders(
id int primary key auto_increment,
customer_id int,
foreign key (customer_id) REFERENCES customer(id),
date datetime,
totalprice double);

create table product(
id int primary key auto_increment,
name varchar(255),
price double
);

create table orderdetail(
id int primary key auto_increment,
order_id int,
foreign key (order_id) references orders(id),
product_id int,
foreign key (product_id) references product(id),
quantity int);

select * from customer;
insert into customer(name,age) values('Minh quan',10),
('Hong oanh',20),
('Hong ha',50);

select * from orders;
insert into orders(customer_id,date,totalprice) values(1,'2006-3-21',15000),
(2,'2006-3-23',20000),
(1,'2006-3-16',17000);

select * from product;
insert into product (name,price) values('may giat', 300),
('tu lanh', 500),
('dieu hoa', 700),
('quat', 100),
('bep dien', 200),
('may hut bui', 500);

insert into orderdetail (order_id,product_id,quantity) values (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);
select * from orderdetail;


select c.*,p.*,od.quantity from customer c 
join orders o on o.customer_id = c.id
join orderdetail od on od.order_id = o.id
join product p on p.id = od.product_id;

select c.name,  p.name  from customer c 
join orders o on o.customer_id = c.id
join orderdetail od on od.order_id = o.id
join product p on p.id = od.product_id;

select * from customer c left join orders o on o.customer_id = c.id where o.customer_id is null;

-- select o.o_id,o.o_date,sum(od.odquantty * p.p_price) from orders o
-- join order_detail od on o.o_id =od.oid
-- join product p on o.p_id = od_pid
-- group by o.o_id;

select c. *  from customer c where c.id not in (select o.customer_id from orders o ); 

 
-- va dung de doi la nhung ngay cham cong. Mieng cuoi nhu nang ha con long thi long thi chom dong   
