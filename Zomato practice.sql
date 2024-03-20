drop table if exists goldusers_signup;
Create table goldusers_signup(userid int,gold_signup_date date);
insert into goldusers_signup(userid,gold_signup_date) values (1,'2017-09-22'),(3,'2017-04-21');
drop table if exists users;
create table users(userid int,signup_date date);
insert into users(userid,signup_date) values (1,'2014-09-02'),(2,'2015-01-15'),(3,'2014-04-11');
drop table if exists sales;
create table sales(userid int,created_date date,product_id int);
insert into sales(userid,created_date,product_id) values  (1,'2017-04-19',2),
(3,'2019-12-18',1),
(2,'2020-07-20',3),
(1,'2019-10-23',2),
(1,'2018-03-19',3),
(3,'2016-12-20',2),
(1,'2016-11-09',1),
(1,'2016-05-20',3),
(2,'2017-09-24',1),
(1,'2017-03-11',2),
(1,'2016-03-11',1),
(3,'2016-11-10',1),
(3,'2017-12-07',2),
(3,'2016-12-15',2),
(2,'2017-11-08',2),
(2,'2018-09-10',3);
drop table if exists product;
create table product (product_id int,product_name text,price int);
insert into product(product_id,product_name,price) values (1,'p1',980),(2,'p2',870),(3,'p3',330);

select * from sales;
select * from product;
select * from goldusers_signup;
select * from users;





# 1. What is the total amount each customer spent on zomato?
select a.userid,sum(b.price) as total_amt_spent from sales a inner join product b on a.product_id=b.product_id group by a.userid;

# 2. How many days has each customer visited zomato?
select userid,count(distinct created_date) distinct_days from sales group by userid;

# 3. What was the first product purchased by each customer?
select * from (select *,rank() over (partition by userid order by created_date) rnk from sales) a where rnk=1;

# 4. What is the most purchased item on menu and how many times was it purchased by all customers?
select userid,count(product_id) cnt from sales where product_id=( select product_id from sales group by product_id order by count(product_id) desc limit 1) group by userid;

# 5. Which item was the most popular for each of the customer?
SELECT *
FROM (
  SELECT *, RANK() OVER (PARTITION BY userid ORDER BY cnt DESC) AS rnk
  FROM (
    SELECT userid, product_id, COUNT(product_id) AS cnt
    FROM sales
    GROUP BY userid, product_id
  ) a
) b
WHERE rnk = 1;

# 6. Which item was first purchased by the  customer after they became the member?
