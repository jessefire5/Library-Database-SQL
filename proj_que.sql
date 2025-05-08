-- List all Customers and their Reservations
SELECT c.Name, c.Email, COUNT(r.Reservation_ID) AS Total_Reservations
FROM Customer c
JOIN Reservation r ON c.Customer_ID = r.Customer_ID
GROUP BY c.Name, c.Email;


-- Find all Students with their Enrollment and Graduation Dates
SELECT c.Name, s.Enrollment_Date, s.Graduation_Date
FROM Customer c
JOIN Student s ON c.Customer_ID = s.Student_ID
GROUP BY c.Name, s.Enrollment_Date, s.Graduation_Date;


-- List all Transactions handled by Librarians
SELECT l.Name AS Librarian_Name, COUNT(t.Transaction_ID) AS Total_Transactions, SUM(t.Amount) AS Total_Amount
FROM Transaction t
JOIN Librarian l ON t.Librarian_ID = l.Librarian_ID
GROUP BY l.Name;

-- Find all Books Reserved by Customers
SELECT c.Name, COUNT(b.Book_ID) AS Books_Reserved
FROM Reservation r
JOIN Customer c ON r.Customer_ID = c.Customer_ID
JOIN Book b ON r.Book_ID = b.Book_ID
GROUP BY c.Name;


-- List Customers who Paid Fines
SELECT c.Name, SUM(f.Amount) AS Total_Paid, COUNT(f.Fine_ID) AS Payments_Made
FROM Fine f
JOIN Customer c ON f.Customer_ID = c.Customer_ID
WHERE f.Paid_Status = 'Paid'
GROUP BY c.Name;


-- List all customers and their email who have both reserved a book and paid a fine
SELECT c.Name, c.Email, COUNT(DISTINCT r.Reservation_ID) AS Total_Reservations, COUNT(DISTINCT f.Fine_ID) AS Paid_Fines
FROM Customer c
JOIN Reservation r ON c.Customer_ID = r.Customer_ID
JOIN Fine f ON c.Customer_ID = f.Customer_ID
WHERE f.Paid_Status = 'Paid'
GROUP BY c.Name, c.Email;


-- Find the total amount of fines collected by each librarian
SELECT l.Name AS Librarian_Name, SUM(f.Amount) AS Total_Fines_Collected
FROM Fine f JOIN Transaction t ON f.Transaction_ID = t.Transaction_ID
JOIN Librarian l ON t.Librarian_ID = l.Librarian_ID
WHERE f.Paid_Status = 'Paid' GROUP BY l.Name;


-- List all faculty members who have reserved at least one book
SELECT c.Name, f.Department, COUNT(r.Reservation_ID) AS Total_Reservations
FROM Faculty f
JOIN Customer c ON f.Faculty_ID = c.Customer_ID
JOIN Reservation r ON c.Customer_ID = r.Customer_ID
GROUP BY c.Name, f.Department;



-- Number of books reserved by each customer
SELECT c.Name, COUNT(r.Reservation_ID) AS Total_Reservations
FROM Reservation r
JOIN Customer c ON r.Customer_ID = c.Customer_ID
GROUP BY c.Name;


-- Show which librarian processed the most transactions
SELECT l.Name, COUNT(t.Transaction_ID) AS Num_Transactions
FROM Librarian l JOIN Transaction t ON l.Librarian_ID = t.Librarian_ID
GROUP BY l.Name ORDER BY Num_Transactions DESC LIMIT 1;

