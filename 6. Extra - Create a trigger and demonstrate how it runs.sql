-- creating a trigger for when a new order is sent, a message asking the creator to check that the product colour is in stock

use design_and_3d_printing_company;

create table stock_check
(order_time datetime,
order_colour varchar(20),
order_quantity int,
product_id int)
;

DELIMITER $$
create 
	trigger stock_check before insert
    on orders
    for each row 
		begin
			insert into stock_check values(New.order_datetime, 
				New.product_colour, 
                New.quantity, 
                New.product_id);
		end$$
DELIMITER ;

insert into orders
values
('198', '2', '3', 'red', '4', '2023-08-17');

insert into orders
(order_id, client_id, product_id, product_colour, quantity)
values
('199', '2', '3', 'purple', '3');

select * 
from stock_check;