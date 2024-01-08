-- using the database
use design_and_3d_printing_company;

insert into contact_details
(email_address, phone_number, post_code, town, address)
values
('taemorohunfola@gmail.com', '07879545557', 'LU5 6GN', 'Luton', '31 Centurion Way'),
('adeolamor@yahoo.com', '07988492172', 'LU5 6GN', 'Luton', '391 Centurion Way'),
('davdelmor@yahoo.com', '07722485793', 'WD25 7DG', 'Watford', '7 Queenswood Crescent'),
('davidmoro@gmail.com', '07274889308', 'WD25 7DG', 'Watford', '8 Queenswood Crescent'),
('emiii@outlook.com', '07448593023', 'KH39 6EJ', 'Dreams', '88 Dreamies Road'),
('mehersloe@yahoo.com', '07959379672', 'KJ4 8KF', 'Computers', '3625 Computer Avenue');

insert into clients
(first_name, family_name, birthdate, sign_up_date, contact_id) 
values
('Tolu', 'Morohunfola', '2000-07-26', '2023-07-29', '1'),
('Adeola', 'Morohunfola', '1971-12-10', '2023-07-29', '2'),
('David', 'Morohunfola', '1971-04-22', '2023-07-29', '3'),
('David', 'Morohunfola', '2002-11-10', '2023-07-29', '4'),
('Emiri', 'Leong', '2000-07-28', '2023-07-29', '5'),
('Meher', 'Lota', '1999-11-16', '2023-07-29', '6');

insert into plastic_used
(plastic_cost, plastic_weight_in_grams)
values
('0.30', '300'),
('0.40', '400'),
('0.60', '600'),
('0.75', '750'),
('1.60', '1600'),
('1.80', '1800'),
('1.90', '1900'),
('2.00', '2000'),
('18.00', '18000'),
('19.00', '19000'),
('20.00', '20000'),
('30.00', '30000'),
('40.00', '40000');

insert into product_size
(mailer_title, length_in_cm, width_in_cm, height_in_cm, weight_in_grams, cost)
values
('Large Letters', '35', '25', '2', '750', '0.53'),
('Small Parcels', '45', '35', '16', '2000', '1.09'),
('Medium Parcels', '61', '46', '46', '20000', '2.59'),
('Large Collect', '100', '60', '60', '40000', '0.00');

insert into products
(product_name, product_price, product_description, product_size_id, plastic_used_id)
values
('Mini Rabbit', '10.00', 'A 2x20x30cm 400g small rabbit, useful as an flat ornament.', '1', '2'),
('Small Rabbit', '20.00', 'A 40x30x15cm 1.8kg rabbit useful as a car ornament.', '2', '6'),
('Medium Rabbit', '40.00', 'A 60x45x45cm 19kg rabbit useful as a home ornament', '3', '10'),
('Large Rabbit', '60.00', 'A 80x50x50cm 30kg rabbit useful as a home ornament. This item must be collected.', '4', '12'),
('Extra Large Rabbit', '100.00', 'A 100x60x60cm 40kg rabbit useful as a home ornament. This item must be collected.', '4', '13');

insert into orders
(client_id, product_id, product_colour, quantity, order_datetime)
values
('4', '2', 'red', '4', '2023-07-29'),
('4', '4', 'blue', '1', '2023-07-30'),
('5', '3', 'gold', '1', '2023-07-31'),
('2', '1', 'gold', '3', '2023-07-31'),
('1', '5', 'blue', '5', '2023-07-31'),
('6', '3', 'green', '2', '2023-08-03'),
('3', '4', 'grey', '1', '2023-08-04'),
('5', '2', 'purple', '1', '2023-08-04'),
('2', '1', 'purple', '1', '2023-08-05'),
('6', '2', 'red', '3', '2023-08-08'),
('3', '4', 'purple', '2', '2023-08-09'); 


select * from clients;
select * from contact_details;
select * from orders;
select * from plastic_used;
select * from product_size;
select * from products;