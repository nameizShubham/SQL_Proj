use psyliq;
select * from paytm_data;

# 1.  What does the "Category_Grouped" column represent, and how many unique categories are there? 
select count(distinct Category_Grouped) from paytm_data;

# 2. List the top 5 shipping cities in terms of the number of orders.
select Shipping_city,count(*) as cnt from paytm_data group by Shipping_city order by cnt Desc limit 5;

# 3. Show me a table with all the data for products that belong to the "Electronics" category. 
select * from paytm_data where category='Electronics';

# 4. Filter the data to show only rows with a "Sale_Flag" of 'Yes'. 
select * from paytm_data where sale_flag='On Sale';

# 5. Sort the data by "Item_Price" in descending order. What is the most expensive item?
 select * from paytm_data order by Item_Price Desc limit 1;
 
 # 6. Apply conditional formatting to highlight all products with a "Special_Price_effective" value below $50 in red. 
 select * from paytm_data where Special_Price_effective<50 and Color='RED';
 
 # 9. Calculate the average "Quantity" sold for products in the "Clothing" category, grouped by "Product_Gender."
 select avg(Quantity) from paytm_data where category='Category' group by Product_Gender;
 
 # 10.  Find the top 5 products with the highest "Value_CM1" and "Value_CM2" ratios. 
select Item_NM from paytm_data order by Value_CM1/Value_CM2 desc limit 5;

# 11.  Identify the top 3 "Class" categories with the highest total sales.
select Class,sum(Quantity) sale from paytm_data group by Class  having class is not null order by sale desc limit 3 ;

# 12. Find the total sales for each "Brand" and display the top 3 brands in terms of sales. 
select Brand,sum(Quantity) sale from paytm_data group by Brand order by sale Desc limit 3;

# 13. Calculate the total revenue generated from "Electronics" category products with a "Sale_Flag" of 'Yes'. 
 select sum(Paid_pr) from paytm_data where category='Electronics' and Sale_Flag='On Sale';
 
# 14.  Identify the top 5 shipping cities based on the average order value (total sales 
# amount divided by the number of orders) and display their average order values.
select Shipping_city,sum(Paid_pr)/sum(Quantity) as Average_order_value from paytm_data group by Shipping_city 
order by Average_order_value Desc limit 5;

