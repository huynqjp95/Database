-- create database exercise
-- use exercise
create table products (
	productID VARCHAR(20) PRIMARY KEY,
    productName NVARCHAR(255) NOT NULL,
    cost INT NOT NULL,
    stockQuantity INT
);