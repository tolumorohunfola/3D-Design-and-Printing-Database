use design_and_3d_printing_company;

-- creating a stored procedures and demonstrating how it runs

-- first creating a view of all needed columns to overcome joins not being used in procs. This joins the products, orders and products_size tables.
create view vw_product_details
as 
	select orders.order_id,
		orders.product_id,
        orders.product_colour,
        orders.quantity,
        product_size.mailer_title,
        products.product_name
    from orders
    inner join products
    on orders.product_id = products.product_id
    inner join product_size
    on products.product_size_id = product_size.product_size_id;
    
    select * from vw_product_details;
    

-- creating a proc to see the product size and colours chosen for products which were ordered.
DELIMITER //
create procedure product_details()

begin
    select vw_product_details.product_colour,
		vw_product_details.product_name,
        vw_product_details.mailer_title
    from vw_product_details
    group by vw_product_details.product_colour;
end //
DELIMITER ;

-- calling proc
call product_details();

