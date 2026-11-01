create table orders (
	order_id int auto_increment primary key,
    customer_id int,
    product_id int,
    quantity int not null check (quantity > 0),
    total_amount decimal(12,2) not null check (total_amount > 0),
    status enum('Pending','Success','Cancel') default('Pending')
    );
insert into orders (customer_id, product_id, quantity, total_amount, status) values
(1,  1,  2,  700000, 'Success'),  
(1,  4,  1, 4990000, 'Success'),  
(2,  2,  1, 1890000, 'Success'),   
(2,  3,  3,  360000, 'Pending'), 
(3,  7,  1, 1590000, 'Success'),   
(3,  9,  2,  380000, 'Cancel'),    
(4,  8,  1, 1790000, 'Success'),  
(4, 12,  2,  840000, 'Success'),  
(5, 16,  1, 2290000, 'Pending'),  
(5, 10,  4,  600000, 'Success'),   
(6, 14,  1, 1250000, 'Success'),  
(6, 13,  2,  260000, 'Cancel'),   
(7,  6,  1,  650000, 'Success'),   
(7, 15,  2,  780000, 'Pending'),  
(8, 18,  1,  550000, 'Success'),   
(8, 19,  3,  960000, 'Success'),   
(9, 20,  1, 3990000, 'Success'),  
(9,  5,  2,  560000, 'Pending'),   
(10, 11, 3,  540000, 'Success'),   
(10, 17, 5,  550000, 'Success');

-- create a view named view_customer_spending to show columns :
-- customer_id, customer_name, total_orders, total_spent
create view view_customer_spending as
select c.customer_id, c.customer_name,
	count(o.customer_id) as total_orders,
    sum(o.total_amount) as total_spent 
from customers c
left join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name;

select * from view_customer_spending;
