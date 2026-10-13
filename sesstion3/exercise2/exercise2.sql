CREATE TABLE books (
    bookID VARCHAR(20) PRIMARY KEY,
    bookName VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    releaseYear INT
);

CREATE TABLE readers (
    readerID VARCHAR(20) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(50)
);

CREATE TABLE borrowings (
    bookID VARCHAR(20),
    readerID VARCHAR(20),
    borrowDay DATE,
    returnDay DATE,
    PRIMARY KEY (bookID, readerID,borrowDay),
    FOREIGN KEY (bookID) REFERENCES books(bookID),
    FOREIGN KEY (readerID) REFERENCES readers(readerID)
);

ALTER TABLE borrowings
MODIFY borrowDay DATE NOT NULL;