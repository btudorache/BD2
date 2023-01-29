-- 1. Informatii despre locatiile din bucuresti si orasul cu cea mai mica latitudine
CREATE OR REPLACE PROCEDURE report1(P_RC OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN P_RC FOR SELECT *
    FROM City C 
    JOIN Location L ON C.id = L.city_id
    WHERE C.name = 'Bucuresti' OR C.latitude = (SELECT MIN(latitude)
                                                FROM CITY);
END;
/

-- 2. Numarul angajatilor din fiecare locatie care au salaru mai mare decat salariul mediu al angajatilor din Bucuresti (complex 8)
CREATE OR REPLACE PROCEDURE report2(P_RC OUT SYS_REFCURSOR)
AS 
BEGIN
    OPEN P_RC FOR SELECT L.name, COUNT(*)
    FROM City C 
    JOIN Location L ON C.id = L.city_id
    JOIN Employee E ON L.id = E.location_id
    WHERE E.salary > (SELECT AVG(salary)
                      FROM City C1
                      JOIN Location L1 ON C1.id = L1.city_id
                      JOIN Employee E1 ON L1.id = E1.location_id
                      WHERE C1.name = 'Bucuresti')
    GROUP BY L.name;
END;
/

-- 3. Numele autorului cu cele mai multe carti (complex 7)
CREATE OR REPLACE PROCEDURE report3(P_RC OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN P_RC FOR SELECT DISTINCT(A.name)
    FROM Author A
    JOIN Book B ON A.id = B.author_id
    JOIN Product P ON B.id = P.book_id
    WHERE A.id = (SELECT B1.author_id
                  FROM Book B1
                  GROUP BY B1.author_id
                  HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                                     FROM Book B2
                                     GROUP BY B2.author_id));
END; 
/

-- metoda de apelare a procedurii:
-- DECLARE P_RC SYS_REFCURSOR;
-- BEGIN
-- prodecure(P_RC);
-- DBMS_SQL.RETURN_RESULT(P_RC);
-- END;