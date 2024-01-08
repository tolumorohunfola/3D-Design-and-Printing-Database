use design_and_3d_printing_company;

-- prepare an example query with group by and having to demonstrate how to extract data from your database for analysis.

-- we want to check the colours which are ordered the most in order to buy some more 
select *,
	plastic_used.plastic_weight_in_grams * orders.quantity as 'Total Plastic used'
from orders
inner join products
on orders.product_id = products.product_id
inner join plastic_used
on products.plastic_used_id = plastic_used.plastic_used_id;

-- version with all information and no having clause
select *,
	sum(plastic_used.plastic_weight_in_grams * orders.quantity) as 'Total Plastic used'
from orders
inner join products
on orders.product_id = products.product_id
inner join plastic_used
on products.plastic_used_id = plastic_used.plastic_used_id
group by orders.product_colour
order by sum(plastic_used.plastic_weight_in_grams * orders.quantity) desc;


-- final resultset
select orders.product_colour,
	sum(plastic_used.plastic_weight_in_grams * orders.quantity) as 'Total Plastic used'
from orders
inner join products
on orders.product_id = products.product_id
inner join plastic_used
on products.plastic_used_id = plastic_used.plastic_used_id
group by orders.product_colour
having sum(plastic_used.plastic_weight_in_grams * orders.quantity) > 30000
order by sum(plastic_used.plastic_weight_in_grams * orders.quantity) desc;

-- this should present the colours which are most used in this business which will give us a heads up about colours which need a bigger plastic order from the supplier next time.
