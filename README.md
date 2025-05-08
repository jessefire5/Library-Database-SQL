This SQL script defines and populates a library management system with multiple related entities. It includes tables for Customer, Student, Faculty, Librarian, Book, Transaction, Reservation, and Fine, 
establishing relationships using foreign keys—especially linking Students and Faculty to the general Customer table (a supertype-subtype model). 
The system enforces data integrity through primary keys, uniqueness constraints, and checks.

After inserting sample data for each table, the script includes a series of queries to retrieve practical insights, such as: total reservations per customer, 
enrollment/graduation info for students, total transactions handled by librarians, reserved books per customer, paid fines, and top-performing librarians. 
These queries demonstrate the database’s ability to handle typical library operations involving borrowing, fine management, and staff/customer interactions.
