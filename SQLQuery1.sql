select gender,sum(purchase_amount)total_revenue from my_analysis_data_table
group by gender;

select*from my_analysis_data_table;

select customer_id,purchase_amount from my_analysis_data_table where discount_applied='Yes'
and purchase_amount>=(select avg(purchase_amount) from my_analysis_data_table);

select top 5  item_purchased,round(avg(review_rating),2) from my_analysis_data_table
group by item_purchased order by avg(review_rating)desc;

select shipping_type, avg(purchase_amount) from my_analysis_data_table
where shipping_type in('Express','standard') group by shipping_type;

select subscription_status,sum(purchase_amount),avg(purchase_amount)
from my_analysis_data_table group by subscription_status;

select top 5 item_purchased,
100*sum(case when discount_applied='Yes' then 1 else 0 end)/count(*) as discount_rate
from my_analysis_data_table
group by item_purchased
order by discount_rate desc;

with customer_type as(
select customer_id,previous_purchases,
case 
when previous_purchases=1 then 'New'
when previous_purchases between 2 and 10 then 'Returning'
else 'Loyal'
end as customer_segment
from my_analysis_data_table);

select*from my_analysis_data_table;


with item_counts as(
select category,item_purchased,count(customer_id)as total_orders,
ROW_NUMBER() over(partition by category order by count(customer_id)desc)as item_rank
from my_analysis_data_table
group by category,item_purchased);

select item_rank,item_purchased,total_orders
from item_counts
where item_rank<=3;

select subscription_status,count(customer_id)as repeat_buyers
from my_analysis_data_table
where previous_purchases>5
group by subscription_status

select age_group ,sum(purchase_amount)as total_revenue
from my_analysis_data_table
group by age_group
order by total_revenue desc;


