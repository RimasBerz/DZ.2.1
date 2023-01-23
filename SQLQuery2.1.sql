--CREATE PROCEDURE BOOKS_BOOKS @name nvarchar(25) AS
SELECT TOP(10) c.id_librarian,c.id_teacher,b.id AS id_b,t.id AS id_t,t.firstname,COUNT(b.id)
FROM ((Book b 
JOIN T_Cards c
ON c.id_book = b.id)
JOIN Teacher t
ON c.id_teacher = t.id)
GROUP BY c.id_librarian,c.id_teacher,b.id,t.id,t.firstname
HAVING COUNT(b.id) > 0
ORDER BY COUNT(b.id) DESC
--2
--CREATE PROCEDURE BOOKS_BOOKS_STUDENT @name nvarchar(25) AS
SELECT TOP(10) c.id_student,b.id AS id_b,t.id AS id_s,t.firstname,COUNT(b.id)
FROM ((Book b 
JOIN S_Cards c
ON c.id_book = b.id)
JOIN Student t
ON c.id_student = t.id)
GROUP BY c.id_student,b.id,t.id,t.firstname
HAVING COUNT(b.id) > 0
ORDER BY COUNT(b.id) DESC
--3
--CREATE PROCEDURE BOOKS_BOOKS_STUDENT @name nvarchar(25) AS
SELECT TOP(10) c.id_teacher,b.id AS id_b,t.id AS id_s,t.firstname,ss.id_student,COUNT(SUM(ss.date_out + c.date_out))
FROM ((((Book b 
JOIN T_Cards c
ON c.id_book = b.id)
JOIN Teacher t
ON c.id_teacher = t.id)
JOIN S_Cards ss
ON c.id = ss.id)
JOIN Student s
ON ss.id_student = s.id)
GROUP BY ss.id_student,b.id,t.id,t.firstname
HAVING COUNT(SUM(ss.date_out + c.date_out)) > 0
ORDER BY c.id_teacher DESC
