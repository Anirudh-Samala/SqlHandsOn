use SQLHands
--SqlHandsOn-2
--1
select * from orders
where salesman_id=(select Salesman_id from salesman 
where Salesman_name='Paul Adam');
--2
select * from orders 
where salesman_id=(select salesman_id from salesman
where city='London');
--3
select * from orders 
where salesman_id=(select distinct(salesman_id) from orders 
where customer_id=3007);
--4
select * from orders
where Purch_amt>(select avg(Purch_amt) from orders 
where Ord_date='2012-10-10');
--5(Multiple SubQuery)
select * from orders
where customer_id in (select distinct(Customer_id) from customer
where city='New York');
--or
select * from orders
where salesman_id in (select distinct(Salesman_id) from customer
where city='New York');

/*6. write a SQL query to find the salespeople who had more than one customer.
Return salesman_id and name*/

select Salesman_id,Salesman_name from salesman
where Salesman_id in (select Salesman_id from customer 
group by Salesman_id having count(*) > 1)

select Salesman_id,Salesman_name from salesman
where Salesman_id in (select Salesman_id from customer 
where Salesman_id=salesman.Salesman_id having count(*) > 1)
--group by means same will be added as one 

select Salesman_id,Salesman_name from salesman s 
where 1<(select count(Salesman_id) from customer
where Salesman_id=s.Salesman_id );
--we can use count(*) as it returns no of rows

/*7)write a SQL query to find those orders, which are higher than average amount of the orders.
Return ord_no, purch_amt, ord_date, customer_id and salesman_id*/

select * from orders a
where Purch_amt>(select avg(Purch_amt) from orders
where customer_id=a.customer_id);

/*8) Write a query to find the sums of the amounts from the orders table,
grouped by date, eliminating all those dates where the sum was not at least 
1000.00 above the maximum order amount for that date*/

select Ord_date,sum(Purch_amt) from orders a
group by Ord_date
having sum(Purch_amt)>(select max(Purch_amt) + 1000 
from orders b where a.Ord_date=b.Ord_date)

/*9. Write a query to extract all data from the customer table if and only 
if one or more of the customers in the customer table are located in London*/

select * from customer
where exists(SELECT *FROM customer WHERE city='London');

/*10) write a SQL query to find the salespeople who deal multiple customers.
Return salesman_id, name, city and commission*/

select * from salesman 
where Salesman_id in (select Salesman_id from customer group by Salesman_id
						having count(*)>1)

select * from salesman 
where Salesman_id IN (select distinct Salesman_id 
from customer a where exists (select * from customer b 
where a.Salesman_id=b.Salesman_id and a.Cust_name<>b.Cust_name));