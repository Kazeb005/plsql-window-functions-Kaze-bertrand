--  Creation of students
CREATE TABLE students (
    student_id   INT PRIMARY KEY,
    first_name   VARCHAR(50) NOT NULL,
    last_name    VARCHAR(50) NOT NULL,
    department   VARCHAR(100)
);

--  Creation of  books
CREATE TABLE books (
  book_id int PRIMARY KEY,
  title   VARCHAR(200),
  category VARCHAR(50)
);

-- Creation of borrowings
CREATE TABLE borrowings (
  borrow_id  int PRIMARY KEY,
  student_id int,
  book_id    int,
  borrow_date DATE,
  CONSTRAINT fk_b_student FOREIGN KEY (student_id) REFERENCES students(student_id),
  CONSTRAINT fk_b_book FOREIGN KEY (book_id) REFERENCES books(book_id)
);



-- inserting some data

-- student data

INSERT INTO students VALUES (101, 'Alice', 'Niyonzima', 'Computer Science');
INSERT INTO students VALUES (102, 'Bob', 'Uwimana', 'Engineering');
INSERT INTO students VALUES (103, 'Chloe', 'Nzabonimpa', 'Business');
INSERT INTO students VALUES (104, 'David', 'Kamanzi', 'Humanities');
INSERT INTO students VALUES (105, 'Emilia', 'Mutabazi', 'Medicine');
INSERT INTO students VALUES (106, 'Fiona', 'Uwase', 'Computer Science');
INSERT INTO students VALUES (107, 'George', 'Murenzi', 'Engineering');
INSERT INTO students VALUES (108, 'Hannah', 'Nkurunziza', 'Business');
INSERT INTO students VALUES (109, 'Isaac', 'Mukasonga', 'Humanities');
INSERT INTO students VALUES (110, 'Joyce', 'Ingabire', 'Computer Science');
INSERT INTO students VALUES (111, 'Kofi', 'Ndungutse', 'Business');
INSERT INTO students VALUES (112, 'Lina', 'Ndayishimiye', 'Medicine');


-- putting into books

INSERT INTO books VALUES (501, 'Database Systems', 'Technology');
INSERT INTO books VALUES (502, 'Intro to Algorithms', 'Technology');
INSERT INTO books VALUES (503, 'Corporate Finance', 'Business');
INSERT INTO books VALUES (504, 'Modern Poetry', 'Literature');
INSERT INTO books VALUES (505, 'Human Anatomy', 'Medicine');
INSERT INTO books VALUES (506, 'Electrical Circuits', 'Engineering');
INSERT INTO books VALUES (507, 'Operating Systems', 'Technology');
INSERT INTO books VALUES (508, 'Marketing 101', 'Business');
INSERT INTO books VALUES (509, 'Shakespeare Complete', 'Literature');
INSERT INTO books VALUES (510, 'Data Science Essentials', 'Technology');


--borrowings

INSERT INTO borrowings VALUES (9001,101,501,STR_TO_DATE('2024-01-10', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9002,106,502,STR_TO_DATE('2024-01-11', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9003,110,501,STR_TO_DATE('2024-01-12', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9004,103,503,STR_TO_DATE('2024-02-05', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9005,108,508,STR_TO_DATE('2024-02-06', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9006,111,503,STR_TO_DATE('2024-02-10', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9007,101,507,STR_TO_DATE('2024-03-02', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9008,101,510,STR_TO_DATE('2024-03-03', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9009,106,501,STR_TO_DATE('2024-03-05', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9010,107,506,STR_TO_DATE('2024-03-06', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9011,104,504,STR_TO_DATE('2024-04-10', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9012,109,509,STR_TO_DATE('2024-04-12', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9013,105,505,STR_TO_DATE('2024-04-15', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9014,101,501,STR_TO_DATE('2024-05-01', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9015,110,507,STR_TO_DATE('2024-05-02', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9016,106,502,STR_TO_DATE('2024-05-03', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9017,103,508,STR_TO_DATE('2024-06-10', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9018,111,503,STR_TO_DATE('2024-06-11', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9019,108,508,STR_TO_DATE('2024-06-12', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9020,101,501,STR_TO_DATE('2024-07-05', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9021,106,510,STR_TO_DATE('2024-07-06', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9022,110,507,STR_TO_DATE('2024-07-07', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9023,103,503,STR_TO_DATE('2024-08-01', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9024,111,508,STR_TO_DATE('2024-08-02', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9025,105,505,STR_TO_DATE('2024-08-10', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9026,109,509,STR_TO_DATE('2024-09-03', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9027,104,504,STR_TO_DATE('2024-09-04', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9028,101,501,STR_TO_DATE('2024-10-10', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9029,106,502,STR_TO_DATE('2024-10-11', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9030,107,506,STR_TO_DATE('2024-10-12', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9031,110,510,STR_TO_DATE('2024-11-01', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9032,101,507,STR_TO_DATE('2024-11-02', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9033,103,503,STR_TO_DATE('2024-12-05', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9034,111,508,STR_TO_DATE('2024-12-06', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9035,108,508,STR_TO_DATE('2024-12-07', '%Y-%m-%d'));
INSERT INTO borrowings VALUES (9036,112,505,STR_TO_DATE('2024-12-08', '%Y-%m-%d'));

-- Top 5 borrowed books per department/semester → RANK()


WITH BorrowedBooks AS (
    SELECT 
        b.book_id,
        b.title,
        s.department,
        EXTRACT(YEAR FROM borrow_date) AS year,
        EXTRACT(MONTH FROM borrow_date) AS month,
        COUNT(borrow_id) AS borrow_count
    FROM borrowings br
    JOIN books b ON br.book_id = b.book_id
    JOIN students s ON br.student_id = s.student_id
    GROUP BY b.book_id, b.title, s.department, EXTRACT(YEAR FROM borrow_date), EXTRACT(MONTH FROM borrow_date)
)
, RankedBooks AS (
    SELECT 
        book_id,
        title,
        department,
        year,
        month,
        borrow_count,
        RANK() OVER (PARTITION BY department, year, month ORDER BY borrow_count DESC) AS book_rank
    FROM BorrowedBooks
)
SELECT 
    book_id,
    title,
    department,
    year,
    month,
    borrow_count
FROM RankedBooks
WHERE book_rank <= 5
ORDER BY department, year, month, book_rank;



-- Running total of borrowed books by month → SUM() OVER()
WITH MonthlyBorrowings AS (
    SELECT 
        EXTRACT(YEAR FROM borrow_date) AS year,
        EXTRACT(MONTH FROM borrow_date) AS month,
        COUNT(borrow_id) AS borrow_count
    FROM borrowings
    GROUP BY EXTRACT(YEAR FROM borrow_date), EXTRACT(MONTH FROM borrow_date)
)
SELECT 
    year,
    month,
    borrow_count,
    SUM(borrow_count) OVER (ORDER BY year, month) AS running_total
FROM MonthlyBorrowings
ORDER BY year, month;



-- Month-over-month growth in borrowing → LAG()
WITH MonthlyBorrowings AS (
    SELECT 
        EXTRACT(YEAR FROM borrow_date) AS year,
        EXTRACT(MONTH FROM borrow_date) AS month,
        COUNT(borrow_id) AS borrow_count
    FROM borrowings
    GROUP BY EXTRACT(YEAR FROM borrow_date), EXTRACT(MONTH FROM borrow_date)
)
SELECT 
    year,
    month,
    borrow_count,
    LAG(borrow_count) OVER (ORDER BY year, month) AS previous_month_borrow_count,
    borrow_count - LAG(borrow_count) OVER (ORDER BY year, month) AS month_over_month_growth
FROM MonthlyBorrowings
ORDER BY year, month;

