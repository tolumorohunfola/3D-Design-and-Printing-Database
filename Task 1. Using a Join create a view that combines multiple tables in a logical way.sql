-- stating which database I'm using
use design_and_3d_printing_company;

-- This query will join tables to show use the delivery information for our orders.
select clients.first_name,
    clients.family_name,
    contact_details.phone_number,
    contact_details.post_code,
    contact_details.address,
    orders.order_id,
    products.product_price,
    orders.product_colour,
    orders.quantity,
    product_size.mailer_title,
    product_size.cost as 'Individual Posting Cost',
    f_total_postage_cost(product_size.cost, orders.quantity) as 'Total Posting Cost'
from clients
inner join contact_details -- joins the contact details table to the clients table
on clients.contact_id = contact_details.contact_id
inner join orders -- joins the orders table to the clients table
on clients.client_id = orders.client_id 
inner join products -- joins the products table to the orders table
on orders.product_id = products.product_id
inner join product_size -- joins the product_size table to the products table
on products.product_size_id = product_size.product_size_id
order by contact_details.phone_number;