CREATE TABLE orders (
    orderID VARCHAR(20) PRIMARY KEY,
    orderDay DATE NOT NULL,
    status ENUM('NEW','PAID') DEFAULT 'NEW' NOT NULL
);

CREATE TABLE products (
    productID VARCHAR(20) PRIMARY KEY,
    productName NVARCHAR(255) NOT NULL,
    price DECIMAL(5,2) NOT NULL
);

CREATE TABLE order_items (
    orderID VARCHAR(20),
    productID VARCHAR(20),
    quantity INT NOT NULL,
    FOREIGN KEY (orderID) REFERENCES orders(orderID) ,
    FOREIGN KEY (productID) REFERENCES products(productID),
    PRIMARY KEY (orderID, productID)
);
