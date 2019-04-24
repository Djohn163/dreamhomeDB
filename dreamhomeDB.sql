CREATE DATABASE IF NOT EXISTS dreamhome;
USE dreamhome;

CREATE TABLE IF NOT EXISTS Branch(
branchNo VARCHAR(4) NOT NULL,
street VARCHAR(10) NOT NULL,
city TEXT(25) NOT NULL,
postcode VARCHAR(10) NOT NULL,
PRIMARY KEY (branchNo)
);

CREATE TABLE IF NOT EXISTS Clients(
clientNo VARCHAR(6) NOT NULL,
fName VARCHAR(20) NULL,
lName VARCHAR(20) NULL,
telNo VARCHAR(22) NULL,
prefType CHAR(6),
MaxRent INT(10),
eMail VARCHAR(30) NULL,
PRIMARY KEY (clientNo),
CHECK (maxRent>=350),
PRIMARY KEY (clientNo)
);

CREATE TABLE IF NOT EXISTS Privateowner(
ownerNo VARCHAR(6) NOT NULL,
fName VARCHAR(20) NOT NULL,
lName VARCHAR(20) NOT NULL,
address VARCHAR(40) DEFAULT NULL,
telNo VARCHAR(22) NULL,
eMail VARCHAR(30) NULL,
pass_word VARCHAR(30),
PRIMARY KEY (ownerNo)
); 

CREATE TABLE IF NOT EXISTS PropertyForRent(
propertyNo VARCHAR(10) NOT NULL,
street VARCHAR(10) NOT NULL,
city TEXT(25) NOT NULL,
postcode VARCHAR(10) NOT NULL,
room_type TEXT(10) NOT NULL,
rooms INT NOT NULL DEFAULT 4,
rent INT NOT NULL DEFAULT 600,
ownerNo VARCHAR(4) NOT NULL,
staffNo VARCHAR(4) NULL,
branchNo VARCHAR(4),
PRIMARY KEY (propertyNo),
foreign key (staffNo) REFERENCES Staff (staffNo),
foreign key (branchNo) REFERENCES Branch (branchNo),
CHECK (rent>=300)
);

CREATE TABLE IF NOT EXISTS Registration(
clientNo VARCHAR(6) NOT NULL,
branchNo VARCHAR(4) NOT NULL,
staffNo VARCHAR(4) NOT NULL,
dateJoined VARCHAR(20) NOT NULL,
foreign key (clientNo) REFERENCES Clients (clientNo),
foreign key (branchNo) REFERENCES Branch (branchNo),
foreign key (staffNo) REFERENCES Staff (staffNo)
);

CREATE TABLE IF NOT EXISTS Staff(
staffNo VARCHAR(4) NOT NULL,
fName VARCHAR(20) NOT NULL,
lName VARCHAR(20) NOT NULL,
position VARCHAR(10) NULL,
sex ENUM('M','F') NULL,
DOB VARCHAR(20) NOT NULL,
salary INT(20) DEFAULT 9000,
branchNo VARCHAR(4)
CHECK (salary>=9000),
PRIMARY KEY (staffNo),
foreign key (branchNo) REFERENCES Branch(branchNo)
);

CREATE TABLE IF NOT EXISTS Viewing(
clientNo VARCHAR(6) NOT NULL,
propertyNo VARCHAR(10) NOT NULL,
viewDate VARCHAR(12) NOT NULL,
comments VARCHAR(20) NULL,
PRIMARY KEY (viewDate),
FOREIGN KEY (propertyNo) REFERENCES PropertyForRent (propertyNo),
FOREIGN KEY (clientNo) REFERENCES Clients (clientNo)
);


