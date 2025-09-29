Kaze Ralph bertrand 
27410
Auca
Individual Assignment I: PL/SQL Window Functions Mastery Project

ON 29/09/2025
________________________________________
Problem Definition
Business Context
A university library tracks all student borrowings of books across departments. The Library Services Department needs insights to identify heavy users, popular books, borrowing trends, and how to segment readers.
Data Challenge
Currently, the system logs transactions but lacks analytical queries to compare borrowing habits between students and over time. Without insights, it’s difficult to guide acquisitions or design loyalty rewards.
Expected Outcome
Reveal top borrowed books per department, track running borrow counts, measure changes in borrowing patterns month-to-month, and classify students into usage groups.
________________________________________
Success Criteria
Top 5 borrowed books per department/semester → RANK()
Running total of borrowed books by month → SUM() OVER()
Month-over-month growth in borrowing → LAG()
Student usage quartiles → NTILE(4)
3-month moving average of borrowing → AVG() OVER()
________________________________________
Database Schema



Results Analysis
Descriptive:
Tech students borrow more programming/DB books; Humanities students borrow more literature.
Borrowing rise during midterms and final exams.
15% of students are responsible for over 60% of total borrows.
Diagnostic:
Course demands explain borrowing surges.
There are some users who borrow book on repeat, which suggesting strong reliance on the library.
Prescriptive:
Stock more IT related  books for students.
Extend loan durations near exams.

