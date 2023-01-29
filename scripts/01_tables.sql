CREATE TABLE City (
  id NUMBER(6) PRIMARY KEY NOT NULL,
  name VARCHAR2(25) NOT NULL,
  latitude REAL,
  longitude REAL
);

CREATE TABLE Location (
  id NUMBER(6) PRIMARY KEY NOT NULL,
  name VARCHAR2(40) NOT NULL,
  city_id NUMBER(6)
);

CREATE TABLE Employee (
  id NUMBER(6) PRIMARY KEY NOT NULL,
  name VARCHAR2(40) NOT NULL,
  salary NUMBER(10),
  employed_at DATE,
  location_id NUMBER NOT NULL
);

CREATE TABLE Product_Category (
  id NUMBER(6) PRIMARY KEY NOT NULL,
  name VARCHAR2(25) UNIQUE NOT NULL
);

CREATE TABLE Author (
  id NUMBER(6) PRIMARY KEY NOT NULL,
  name VARCHAR2(40) NOT NULL
);

CREATE TABLE Book (
  id NUMBER(6) PRIMARY KEY NOT NULL,
  name VARCHAR2(60) NOT NULL,
  author_id NUMBER(6) NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE Product (
  id NUMBER(10) PRIMARY KEY NOT NULL,
  product_category NUMBER(10) NOT NULL,
  name VARCHAR2(40) NOT NULL,
  description VARCHAR2(200),
  price NUMBER(10) NOT NULL,
  book_id NUMBER(10)
);

ALTER TABLE Location ADD FOREIGN KEY (city_id) REFERENCES City (id);

ALTER TABLE Employee ADD FOREIGN KEY (location_id) REFERENCES Location (id);

ALTER TABLE Book ADD FOREIGN KEY (author_id) REFERENCES Author (id);

ALTER TABLE Product ADD FOREIGN KEY (product_category) REFERENCES Product_Category(id);

ALTER TABLE Product ADD FOREIGN KEY (book_id) REFERENCES Book(id);

INSERT INTO City VALUES(1, 'Bucuresti', 44.53, 26.08);
INSERT INTO City VALUES(2, 'Cluj', 42.53, 26.05);
INSERT INTO City VALUES(3, 'Iasi', 43.53, 26.07);

INSERT INTO Location VALUES(1, 'Magazin 1 Bucurest', 1);
INSERT INTO Location VALUES(2, 'Magazin 2 Bucurest', 1);
INSERT INTO Location VALUES(3, 'Orhideea Cluj', 2);
INSERT INTO Location VALUES(4, 'Nufarul Cluj', 2);
INSERT INTO Location VALUES(5, 'Magazin 1 Iasi', 3);
INSERT INTO Location VALUES(6, 'Magazin 2 Iasi', 3);
INSERT INTO Location VALUES(7, 'Magazin 3 Iasi', 3);

INSERT INTO Employee VALUES(1, 'Bogdan Tudorache', 2500, TO_DATE('13-01-2021', 'dd-MM-yyyy'), 1);
INSERT INTO Employee VALUES(2, 'Junior Horn', 3000, TO_DATE('25-01-2019', 'dd-MM-yyyy'), 2);
INSERT INTO Employee VALUES(3, 'Evie Thomas', 1800, TO_DATE('20-03-2019', 'dd-MM-yyyy'), 2);
INSERT INTO Employee VALUES(4, 'Miriam Boyd', 4000, TO_DATE('04-04-2019', 'dd-MM-yyyy'), 3);
INSERT INTO Employee VALUES(5, 'Oakley Stevens', 2500, TO_DATE('15-04-2019', 'dd-MM-yyyy'), 1);
INSERT INTO Employee VALUES(6, 'Vinny Dalton', 2600, TO_DATE('11-07-2019', 'dd-MM-yyyy'), 3);
INSERT INTO Employee VALUES(7, 'Deanna Riggs', 2400, TO_DATE('30-07-2019', 'dd-MM-yyyy'), 2);
INSERT INTO Employee VALUES(8, 'Harold Hudson', 1500, TO_DATE('25-09-2019', 'dd-MM-yyyy'), 2);
INSERT INTO Employee VALUES(9, 'Charis Velez', 4000, TO_DATE('24-10-2019', 'dd-MM-yyyy'), 4);
INSERT INTO Employee VALUES(10, 'Eleanor Davenport', 3600, TO_DATE('16-03-2020', 'dd-MM-yyyy'), 4);
INSERT INTO Employee VALUES(11, 'Archibald Ramirez', 1950, TO_DATE('24-03-2020', 'dd-MM-yyyy'), 4);
INSERT INTO Employee VALUES(12, 'Alexis Jones', 2100, TO_DATE('19-05-2020', 'dd-MM-yyyy'), 4);
INSERT INTO Employee VALUES(13, 'Matthew House', 1700, TO_DATE('27-08-2020', 'dd-MM-yyyy'), 4);
INSERT INTO Employee VALUES(14, 'Floyd Ferrell', 1900, TO_DATE('04-09-2020', 'dd-MM-yyyy'), 5);
INSERT INTO Employee VALUES(15, 'Dewi Parker', 2700, TO_DATE('22-09-2020', 'dd-MM-yyyy'), 5);
INSERT INTO Employee VALUES(16, 'Tammy Brady', 1400, TO_DATE('24-09-2020', 'dd-MM-yyyy'), 6);
INSERT INTO Employee VALUES(17, 'Louie Ruiz', 2200, TO_DATE('11-11-2020', 'dd-MM-yyyy'), 6);
INSERT INTO Employee VALUES(18, 'Kye Hess', 1900, TO_DATE('19-04-2021', 'dd-MM-yyyy'), 6);
INSERT INTO Employee VALUES(19, 'Henri Beasley', 1200, TO_DATE('19-04-2021', 'dd-MM-yyyy'), 6);
INSERT INTO Employee VALUES(20, 'Marc Whitaker', 4100, TO_DATE('22-04-2021', 'dd-MM-yyyy'), 7);
INSERT INTO Employee VALUES(21, 'Lena Meyer', 4100, TO_DATE('03-06-2021', 'dd-MM-yyyy'), 7);
INSERT INTO Employee VALUES(22, 'Jacques Bradley', 4200, TO_DATE('23-09-2021', 'dd-MM-yyyy'), 7);
INSERT INTO Employee VALUES(23, 'Hallie England', 4300, TO_DATE('18-05-2022', 'dd-MM-yyyy'), 7);

INSERT INTO Product_Category VALUES(1, 'Books');
INSERT INTO Product_Category VALUES(2, 'Manga');
INSERT INTO Product_Category VALUES(3, 'Movies');
INSERT INTO Product_Category VALUES(4, 'Music');
INSERT INTO Product_Category VALUES(5, 'Decoration');
INSERT INTO Product_Category VALUES(6, 'Supplies');

INSERT INTO Author VALUES(1, 'Cormac McCarthy');
INSERT INTO Author VALUES(2, 'James Joyce');
INSERT INTO Author VALUES(3, 'F. Scott Fitzgerald');
INSERT INTO Author VALUES(4, 'J.D. Salinger');
INSERT INTO Author VALUES(5, 'Joseph Conrad');
INSERT INTO Author VALUES(6, 'Aldous Huxley');
INSERT INTO Author VALUES(7, 'John Steinbeck');
INSERT INTO Author VALUES(8, 'Vladimir Nabokov');
INSERT INTO Author VALUES(9, 'Virginia Woolf');
INSERT INTO Author VALUES(10, 'Harper Lee');

INSERT INTO Book VALUES(1, 'Blood Meridian', 1, TO_DATE('13-04-1985', 'dd-MM-yyyy'));
INSERT INTO Book VALUES(2, 'The Road', 1, TO_DATE('15-04-2010', 'dd-MM-yyyy'));
INSERT INTO Book VALUES(3, 'No Country for Old Men', 1, TO_DATE('19-07-2005', 'dd-MM-yyyy'));
INSERT INTO Book VALUES(4, 'A Portrait of the Artist as a Young Man', 2, TO_DATE('29-12-1916', 'dd-MM-yyyy'));
INSERT INTO Book VALUES(5, 'The Great Gatsby', 3, TO_DATE('10-04-1925', 'dd-MM-yyyy'));
INSERT INTO Book VALUES(6, 'The Catcher in the Rye', 4, TO_DATE('16-07-1951', 'dd-MM-yyyy'));
INSERT INTO Book VALUES(7, 'Heart of Darkness', 5, TO_DATE('16-04-1899', 'dd-MM-yyyy'));
INSERT INTO Book VALUES(8, 'Brave New World', 6, TO_DATE('25-05-1932', 'dd-MM-yyyy'));
INSERT INTO Book VALUES(9, 'The Grapes of Wrath', 7, TO_DATE('14-04-1939', 'dd-MM-yyyy'));
INSERT INTO Book VALUES(10, 'Lolita', 8, TO_DATE('14-04-1939', 'dd-MM-yyyy'));
INSERT INTO Book VALUES(11, 'To the Lighthouse', 9, TO_DATE('05-05-1927', 'dd-MM-yyyy'));
INSERT INTO Book VALUES(12, 'To Kill a Mockingbird', 10, TO_DATE('11-07-1960', 'dd-MM-yyyy'));

INSERT INTO Product VALUES(1, 1, 'Blood Meridian', 'Pretty bloody book', 30, 1);
INSERT INTO Product VALUES(2, 1, 'The Road', 'Book by Cormac Mccarthy', 40, 2);
INSERT INTO Product VALUES(3, 1, 'No Country for Old Men', 'A good book', 40, 3);
INSERT INTO Product VALUES(4, 1, 'A Portrait of the Artist as a Young Man', 'A very good book', 35, 4);
INSERT INTO Product VALUES(5, 1, 'The Great Gatsby', 'A bad book', 15, 5);
INSERT INTO Product VALUES(6, 1, 'The Catcher in the Rye', 'An ok book', 20, 6);
INSERT INTO Product VALUES(7, 1, 'Heart of Darkness', 'An ok book', 20, 6);
INSERT INTO Product VALUES(8, 2, 'Chainsaw Man vol. 1', 'Best manga ever', 50, NULL);
INSERT INTO Product VALUES(9, 2, 'Chainsaw Man vol. 2', 'Best manga ever 2', 50, NULL);
INSERT INTO Product VALUES(10, 2, 'Berserk vol. 1', 'Actually the best manga', 50, NULL);
INSERT INTO Product VALUES(11, 2, 'Berserk vol. 2', 'Actually the best manga', 50, NULL);
INSERT INTO Product VALUES(12, 2, 'One Piece vol. 2', 'An adventure manga', 50, NULL);
INSERT INTO Product VALUES(13, 3, 'Whiplash', 'A good drama movie', 80, NULL);
INSERT INTO Product VALUES(14, 3, 'Star Wars ep. 1', 'Start of a saga', 80, NULL);
INSERT INTO Product VALUES(15, 3, 'Star Wars ep. 3', 'Start of an original saga', 80, NULL);
INSERT INTO Product VALUES(16, 3, 'Gone Girl', 'Good thriller', 70, NULL);
INSERT INTO Product VALUES(17, 4, 'Illmatic', 'Greatest album by Nas', 60, NULL);
INSERT INTO Product VALUES(18, 4, 'Yeezus', 'Good album by Kanye West', 50, NULL);
INSERT INTO Product VALUES(19, 4, 'To Pimp A Butterfly', 'Good album by Kendick Lamar', 60, NULL);
INSERT INTO Product VALUES(20, 5, 'Best Dad Cup', 'Good gift for dads', 40, NULL);
INSERT INTO Product VALUES(21, 5, 'Best Mom Cup', 'Good gift for moms', 40, NULL);
INSERT INTO Product VALUES(22, 5, 'Best Sister Cup', 'Good gift for sisters', 40, NULL);
INSERT INTO Product VALUES(23, 5, 'Best Brother Cup', 'Good gift for brothers', 40, NULL);
INSERT INTO Product VALUES(24, 6, '6 pack of pens', 'Good for school', 10, NULL);
INSERT INTO Product VALUES(25, 6, '12 pack of pens', 'Good for school', 20, NULL);
INSERT INTO Product VALUES(26, 6, '24 pack of pens', 'Good for school', 30, NULL);
INSERT INTO Product VALUES(27, 6, '60 pack of pens', 'Good for school', 40, NULL);
INSERT INTO Product VALUES(28, 6, '2 agendas', 'Good for work', 50, NULL);