create database SQLHands
use SQLHands
create table salesman(
Salesman_id int primary key,
Salesman_name varchar(30),
city varchar(15),
commission float
)

select * from salesman

create table customer(
Customer_id int primary key,
Cust_name varchar(30),
city varchar(15),
grade int,
Salesman_id int 
)

select * from customer

create table orders(
Ord_no int primary key,
Purch_amt float,
Ord_date date,
customer_id int references customer(Customer_id),
salesman_id int references salesman(Salesman_id)
)

select * from orders


insert into salesman values(5003,'Lauson Hen','San Jose',0.12)
insert into customer values(3001,'Brad Guzan','London',null,5005)
delete from customer where Customer_id = 300
insert into orders values(70013,3045.6,'2012-04-25',3002,5001)
--1
select * from orders 
order by Ord_date,salesman_id,Ord_no,Purch_amt
--2
select distinct(Salesman_id) from salesman 
--3
select Salesman_name,city from salesman
where city='Paris'
--4
select Ord_no,Ord_date,Purch_amt from orders
where salesman_id=5001
--5
select * from customer where city='New York'and grade>100
--6
select * from salesman where commission between 0.10 and 0.12
--7
select sum(Purch_amt) as Total_amt from orders 
--8
select avg(Purch_amt) as Avg_amt from orders
--9
select count(distinct(Salesman_name)) as No_Salesman from salesman
--10
select Max(Purch_amt),customer_id from orders group by customer_id
--11
select Max(Purch_amt),Ord_date from orders group by Ord_date
--12
select Salesman_id,  Max(Purch_amt) from orders
where Ord_date='2012-08-17' 
group by salesman_id
------------------------------------------------------------------
------------------------------------------------------------------
--13
select Salesman_name as salesman,Cust_name, customer.city from salesman,customer 
where customer.city=salesman.city 
--14
select Ord_no, Purch_amt,cust_name,city from orders
inner join customer 
on orders.customer_id=customer.Customer_id
where Purch_amt between 500 and 2000 
and orders.customer_id=customer.Customer_id
--15
select Cust_name,customer.city,Salesman_name as salesman,commission 
from customer
inner join salesman on customer.Salesman_id=salesman.Salesman_id
where commission>.12;
--16
select Cust_name,c.city as CustCity,grade,Salesman_name,s.city as SmanCity
from customer as c 
inner join salesman as s on s.Salesman_id=c.Salesman_id
order by Customer_id; 