CREATE TABLE orders (
    orderID VARCHAR(20) PRIMARY KEY,
    orderDay DATE NOT NULL,
    status ENUM('NEW','PAID') NOT NULL
);

CREATE TABLE products (
    productID VARCHAR(20) PRIMARY KEY,
    productName VARCHAR(255) NOT NULL,
    price INT NOT NULL
);

CREATE TABLE order_items (
    productID VARCHAR(20),
    orderID VARCHAR(20),
    quantity INT NOT NULL,
    PRIMARY KEY (productID, orderID),
    FOREIGN KEY (oderID) REFERENCES orders(orderID),
    FOREIGN KEY (productID) REFERENCES products(productID)
)