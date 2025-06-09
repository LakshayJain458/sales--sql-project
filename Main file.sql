create database if not exists ecommerce_sales_data;
show databases;

-- create table using miniconda 3 terminal . Steps to follow :-
-- open terminal -> use cd command to go to that folder where your excel file is present ->
-- use command - pip install csvkit -> 
-- then run command - csvsql --dialect mysql --snifflimit 10000 Sales_Dataset.csv > Result.sql ->
-- this makes a result.sql file in your folder , and when you open it in notepad , it will give you your table syntax.

CREATE TABLE Sales_Dataset (
	order_id VARCHAR(15) NOT NULL, 
	order_date DATE NOT NULL, 
	ship_date DATE NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 5) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	year DECIMAL(38, 0) NOT NULL
);
drop table sales_dataset;
desc Sales_Dataset;

-- import datas from file . 
load data infile 'C:/Users/Lakshay/Downloads/Project_sql/Sales_Dataset.csv'
into table Sales_Dataset
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from Sales_Dataset;

-- if not working use built in feature of mysql workbench. 

use ecommerce_sales_data;
SELECT * FROM sales_dataset;

select state, sum(shipping_cost) as sum_shipping_cost
from sales_dataset
group by state
order by sum_shipping_cost desc
limit 3;

-- using CTE
with states as (
select state, sum(shipping_cost) as sum_shipping_cost
from sales_dataset
group by state
order by sum_shipping_cost desc
limit 3
)select * from states;