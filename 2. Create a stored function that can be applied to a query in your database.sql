use design_and_3d_printing_company;

set DELIMITER //

create function f_total_postage_cost (
	individual_cost decimal(4, 2),
    order_amount int
) 
returns decimal(4, 2)

deterministic

begin
	declare total_postage_cost decimal(4, 2);
    if individual_cost <= 0.00 then
		set total_postage_cost = '0.00';
	elseif individual_cost > 0.00 then 
		set total_postage_cost = individual_cost * order_amount;
	end if;

return (total_postage_cost);
end //
DELIMITER ;