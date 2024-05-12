-- creating the database
create database Design_and_3D_Printing_Company;

-- using the database
use Design_and_3D_Printing_Company;

-- creating contact details table
create table contact_details (
contact_id int auto_increment, -- this is the pk
email_address varchar(70) unique, -- this is unique to have a way for the owner to differentiate between customers.
phone_number bigint,
post_code varchar(8),
town varchar(30),
address varchar(70), 
primary key (contact_id)
);

-- creating clients table
create table clients (
client_id int auto_increment, -- this is the pk
first_name varchar(40),
family_name varchar(60),
birthdate date,
sign_up_date date,
contact_id int unique, -- this is the fk related to the pk in contact details table,
primary key (client_id),
foreign key (contact_id) references contact_details(contact_id)
);

-- creating plastic used table
create table plastic_used (
plastic_used_id int auto_increment, -- this is the pk
plastic_cost decimal(6, 2), -- the cost can be a maximum of £----.--
plastic_weight_in_grams int,  -- the weight can be a maximum of 99,999?
primary key (plastic_used_id)
);

-- creating product size table
create table product_size (
product_size_id int auto_increment, -- this is the pk
mailer_title varchar(14),
length_in_cm int, 
width_in_cm int, 
height_in_cm int, 
weight_in_grams int, 
cost decimal(6, 2),
primary key (product_size_id)
);

-- creating products table
create table products (
product_id int auto_increment, -- this is the pk
product_name varchar(30) unique, -- this is unique so that customers can differentiate between products
product_price decimal(6, 2), -- the price can be a maximum of £----.--
product_description varchar(100),
product_size_id int, -- this is the fk linked to the product size table
plastic_used_id int, -- this is the fk linked to the plastic used table
primary key (product_id),
foreign key (product_size_id) references product_size(product_size_id),
foreign key (plastic_used_id) references plastic_used(plastic_used_id)
);

-- creating orders table
create table orders (
order_id int auto_increment, -- this is the pk
client_id int, -- this is the fk linked to the clients table
product_id int, -- this is the fk linked to the products table
product_colour varchar(20),
quantity int, 
order_datetime datetime default current_timestamp, -- default and on update allows automatic initialisation and updating to the current date and time
primary key (order_id),
foreign key (client_id) references clients(client_id),
foreign key (product_id) references products(product_id)
);
