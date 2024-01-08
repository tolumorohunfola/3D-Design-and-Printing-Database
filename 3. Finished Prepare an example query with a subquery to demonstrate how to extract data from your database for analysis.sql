use design_and_3d_printing_company;

-- prepare an example query with a subquery to demonstrate how to extract data from your database for analysis

-- finding a query to find the number of orders made by clients who live in Luton
select * 
from contact_details;

select * 
from contact_details
where town = 'Luton';

select * 
from orders;

select client_id,
	sum(quantity) as 'Number of Items Ordered'
from orders
where client_id in (
	select contact_id
    from contact_details
    where town = 'Watford'
)
group by client_id;