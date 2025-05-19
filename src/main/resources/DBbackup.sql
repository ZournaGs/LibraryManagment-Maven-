--Create the tables
CREATE TABLE USERS(
                      USRID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                      USERNAME VARCHAR(50) NOT NULL,
                      PASSWORD TEXT NOT NULL,
                      EMAIL VARCHAR(254) NOT NULL,
                      SALT TEXT NOT NULL,
                      ISADMIN BOOLEAN NOT NULL
);

CREATE TABLE BOOKS(
                      ISBN VARCHAR(13) PRIMARY KEY,
                      AUTHOR VARCHAR(50) NOT NULL,
                      TITLE VARCHAR(50) NOT NULL,
                      STOCK INT NOT NULL
);
--Adding enum type for transaction
CREATE TYPE TRANSACTION_TYPE AS ENUM('BORROW','BUY');
CREATE TABLE TRANSACTIONS(
                             TRANSID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
                             USERID INT NOT NULL,
                             ISBN VARCHAR(13) NOT NULL,
                             TYPE TRANSACTION_TYPE NOT NULL,
                             DATE DATE DEFAULT CURRENT_DATE,
                             COMPLETED BOOLEAN NOT NULL
);
--Adding the foreign keys constraints

ALTER TABLE TRANSACTIONS ADD CONSTRAINT FK_UT FOREIGN KEY (USERID) REFERENCES USERS(USRID);
ALTER TABLE TRANSACTIONS ADD CONSTRAINT FK_BT FOREIGN KEY (ISBN) REFERENCES BOOKS(ISBN);

--Create new user for transactions

CREATE USER LibraryUser WITH PASSWORD 'LibraryManagment2025!';

GRANT SELECT, INSERT, UPDATE, DELETE ON USERS TO LibraryUser;

GRANT SELECT, INSERT, UPDATE, DELETE ON TRANSACTIONS TO LibraryUser;

GRANT SELECT, INSERT, UPDATE, DELETE ON BOOKS TO LibraryUser;
