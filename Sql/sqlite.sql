CREATE TABLE Creditcard (
	num INT NOT NULL,
    fname VARCHAR(20) NOT NULL,
	lname VARCHAR(20) NOT NULL,
    PRIMARY KEY(num)
);

CREATE TABLE Book (
bid VARCHAR(20) NOT NULL,
title VARCHAR(60) NOT NULL,
price INT NOT NULL,
category VARCHAR(60) NOT NULL,
quan INT NOT NULL,
PRIMARY KEY(bid)
);

CREATE TABLE Address (
id INTEGER PRIMARY KEY,
street VARCHAR(100) NOT NULL,
province VARCHAR(20) NOT NULL,
country VARCHAR(20) NOT NULL,
zip VARCHAR(20) NOT NULL,
phone VARCHAR(20)
);

CREATE TABLE Account (
login VARCHAR(20) NOT NULL,
address INT NOT NULL,
fname VARCHAR(20) NOT NULL,
lname VARCHAR(20) NOT NULL,
pass VARCHAR(200) NOT NULL,
PRIMARY KEY(login),
FOREIGN KEY (address) REFERENCES Address (id) ON DELETE CASCADE
);

CREATE TABLE PO (
id INTEGER PRIMARY KEY,
month int NOT NULL,
lname VARCHAR(20) NOT NULL,
fname VARCHAR(20) NOT NULL,
status VARCHAR(20) NOT NULL,
address INT NOT NULL,
day TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (address) REFERENCES Address (id) ON DELETE CASCADE
);

CREATE TABLE POItem (
id INT NOT NULL,
bid VARCHAR(20) NOT NULL,
quan INT NOT NULL,
price INT NOT NULL,
PRIMARY KEY(id,bid),
FOREIGN KEY(id) REFERENCES PO(id) ON DELETE CASCADE,
FOREIGN KEY(bid) REFERENCES Book(bid) ON DELETE CASCADE
);

CREATE TABLE Review (
rid INTEGER PRIMARY KEY,
bid VARCHAR(20) NOT NULL,
login VARCHAR(20) NOT NULL,
rev VARCHAR(200) NOT NULL,
rating INTEGER CHECK (rating >= 0 and rating <= 5),
FOREIGN KEY(bid) REFERENCES Book(bid) ON DELETE CASCADE,
FOREIGN KEY(login) REFERENCES Account(login) ON DELETE CASCADE
);