-- Customer Table
CREATE TABLE Customer (
    Customer_ID NUMERIC(8) PRIMARY KEY,
    Name VARCHAR(15) NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Email VARCHAR(30) UNIQUE NOT NULL,
    Phone_Number VARCHAR(12),
    Address VARCHAR(50),
    Age NUMERIC(2)
);

-- Student Table (linked to Customer)
CREATE TABLE Student (
    Student_ID NUMERIC(8) PRIMARY KEY, 
    Enrollment_Date DATE,
    Graduation_Date DATE,
    FOREIGN KEY (Student_ID) REFERENCES Customer(Customer_ID)
);

-- Faculty Table (linked to Customer)
CREATE TABLE Faculty (
    Faculty_ID NUMERIC(8) PRIMARY KEY,
    Hiring_Date DATE,
    Department VARCHAR(10),
    FOREIGN KEY (Faculty_ID) REFERENCES Customer(Customer_ID)
);

-- Librarian Table
CREATE TABLE Librarian (
    Librarian_ID NUMERIC(8) PRIMARY KEY,
    Name VARCHAR(15) NOT NULL,
    Email VARCHAR(30) UNIQUE NOT NULL,
    Phone_Number VARCHAR(12),
    Address VARCHAR(50),
    Hire_Date DATE,
    Salary NUMERIC(10,2)
);

-- Book Table
CREATE TABLE Book (
    Book_ID NUMERIC(8) PRIMARY KEY,
    Book_title VARCHAR(20) NOT NULL,
    Book_Genre VARCHAR(15),
    Publication_year INT,
    Book_Author VARCHAR(10),
    Book_Publisher VARCHAR(10)
);

-- Transaction Table
CREATE TABLE Transaction (
    Transaction_ID NUMERIC(8) PRIMARY KEY,
    Amount NUMERIC(10,2),
    Transaction_Type VARCHAR(10),
    Transaction_Date DATE,
    Status VARCHAR(10),
    Due_Date DATE,
    Librarian_ID NUMERIC(8),
    Customer_ID NUMERIC(8),
    FOREIGN KEY (Librarian_ID) REFERENCES Librarian(Librarian_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- Reservation Table
CREATE TABLE Reservation (
    Reservation_ID NUMERIC(8) PRIMARY KEY,
    Reservation_Date DATE,
    Pick_up_Date DATE,
    Customer_ID NUMERIC(8),
    Book_ID NUMERIC(8),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);

-- Fine Table
CREATE TABLE Fine (
    Fine_ID NUMERIC(8) PRIMARY KEY,
    Amount NUMERIC(10,2),
    Paid_Status VARCHAR(10),
    Due_Date DATE,
    Customer_ID NUMERIC(8),
    Transaction_ID NUMERIC(8),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Transaction_ID) REFERENCES Transaction(Transaction_ID)
);