-- 1. Create the user
CREATE USER LibraryUser WITH PASSWORD 'LibraryManagment2025!';

-- 2. Grant read/write permissions on the USERS table
GRANT SELECT, INSERT, UPDATE, DELETE ON USERS TO LibraryUser;

-- 3. Grant read/write permissions on the TRANSACTIONS table
GRANT SELECT, INSERT, UPDATE, DELETE ON TRANSACTIONS TO LibraryUser;

-- 4. Grant read/write permissions on the BOOKS table
GRANT SELECT, INSERT, UPDATE, DELETE ON BOOKS TO LibraryUser;
