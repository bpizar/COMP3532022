INSERT INTO region VALUES 
(1,'Africa'),
(2,'Americas'),
(3,'Eastern Mediterranean'),
(4,'Europe'),
(5,'South-East Asia'),
(6,'Western Pacific');

INSERT INTO country (riD,cName) VALUES 
(1,'Djibouti'),
(1,'Seychelles'),
(1,'DR Congo'),
(1,'Sierra Leone'),
(1,'South Africa'),
(1,'Egypt'),
(2,'United States'),
(2,'Canada'),
(2,'Mexico'),
(2,'Bolivia'),
(2,'Colombia'),
(2,'Peru'),
(2,'Brazil'),
(2,'Argentina'),
(2,'Chile'),
(2,'Cuba'),
(2,'Suriname'),
(3,'Afghanistan'),
(3,'Iran '),
(3,'Jordan'),
(3,'Kuwait'),
(3,'UAE'),
(3,'Lebanon'),
(4,'Albania'),
(4,'Andorra'),
(4,'Armenia'),
(4,'Austria'),
(4,'Azerbaijan'),
(4,'Belarus'),
(4,'Belgium'),
(4,'Bosnia and Herzegovina'),
(4,'Bulgaria'),
(4,'Croatia'),
(4,'Cyprus'),
(4,'Czech Republic'),
(4,'Denmark'),
(4,'Estonia'),
(4,'Finland'),
(4,'France'),
(4,'Georgia'),
(4,'Germany'),
(4,'Greece'),
(4,'Hungary'),
(4,'Iceland'),
(4,'Ireland'),
(4,'Italy'),
(4,'Kosovo'),
(4,'Latvia'),
(4,'Liechtenstein'),
(4,'Lithuania'),
(4,'Luxembourg'),
(4,'Macedonia'),
(4,'Malta'),
(4,'Moldova'),
(4,'Monaco'),
(4,'Montenegro'),
(4,'The Netherlands'),
(4,'Norway'),
(4,'Poland'),
(4,'Portugal'),
(4,'Romania'),
(4,'Russia'),
(4,'San Marino'),
(4,'Serbia'),
(4,'Slovakia'),
(4,'Slovenia'),
(4,'Spain'),
(4,'Sweden'),
(4,'Switzerland'),
(4,'Turkey'),
(4,'Ukraine'),
(4,'United Kingdom'),
(4,'Vatican City'),
(4,'Vietnam'),
(4,'Myanmar'),
(4,'Thailand'),
(4,'Laos'),
(4,'Cambodia'),
(4,'Malaysia'),
(4,'Singapore'),
(4,'Philippines'),
(4,'Indonesia'),
(5,'Vietnam'),
(5,'Myanmar'),
(5,'Thailand'),
(5,'Laos'),
(5,'Cambodia'),
(5,'Malaysia'),
(5,'Singapore'),
(5,'Philippines'),
(5,'Indonesia'),
(6,'Australia'),
(6,'China'),
(6,'New Zealand'),
(6,'Japan');


INSERT INTO proStaTer (cID, pstName, Population) VALUES
(1,"pst11",123213),
(1,"pst12",1213),
(1,"pst13",126453),
(2,"pst21",123213),
(2,"pst22",1213),
(2,"pst23",126453),
(3,"pst31",123213),
(3,"pst32",1213),
(3,"pst33",126453),
(4,"pst41",123213),
(4,"pst42",1213),
(4,"pst43",126453),
(5,"pst51",123213),
(5,"pst52",1213),
(5,"pst53",126453),
(6,"pst61",123213),
(6,"pst62",1213),
(6,"pst63",126453),
(7,"Washington",123213),
(7,"New York",1213),
(7,"California",126453),
(8,"Quebec",123213),
(8,"Ontario",121243),
(8,"Manitoba",126453),
(9,"pst91",123213),
(9,"pst92",1213),
(9,"pst93",126453);

INSERT INTO covid_19stat(pstID,rDate,numInfections,numDeaths) VALUES 
(1, '2020-01-01', 10,1),
(2, '2020-01-01', 100,2),
(3, '2020-01-01', 100,3),
(4, '2020-01-01', 1000,4),
(5, '2020-01-01', 500,5),
(6, '2020-01-01', 5,6),
(7, '2020-01-01', 50,7),
(8, '2020-01-01', 20,8),
(9, '2020-01-01', 200,9);

INSERT INTO vaccines (name) VALUES 
('Pfizer'),
('Moderna'),
('AstraZeneca'),
('Johnson & Johnson'); 

INSERT INTO vaccinestat VALUES 
(1,1,100,DEFAULT,DEFAULT),
(1,2,100,1,DEFAULT),
(1,3,100,2, 20),
(1,4,100,2,10),
(1,5,200,DEFAULT,20),
(1,6,200,3,50),
(1,7,100,4,30),
(1,8,300,3,100),
(1,9,400,3,50),
(2,8,1000,200,400); 

INSERT INTO users (fName, lName, phone, email, dob, username, pw) VALUES
('Pepe','Lepieu',123,'plepieu@email.com','2000-01-10','some','password'),
('Kylian','Vail',99064,'KylianVail@gmail.com','2008-05-04','1234','helloword'),
('A','researcher',321,'rese@email.com','1998-09-19','researchUN','pasword'),
('A','User',321,'user@email.com','1994-03-03','userman','pw123'),
('Another','User',321,'nother@email.com','1654-09-03','uname','pword'),
('Waldo','Wheres',456,'here@email.com','1988-06-8','waldo2011','pwwaldo'),
('null','null',000,'null@email.com','1654-09-03','test','testpw'),
('Test','Admin',000,'admin@email.com','1654-09-03','testAdmin','testAdminpw');

INSERT INTO researchers VALUES
(1,DEFAULT),
(2,DEFAULT),
(3,DEFAULT),
(7,DEFAULT);

INSERT INTO orgdel VALUES
(4,DEFAULT),
(5,DEFAULT);

INSERT INTO regularUser VALUES
(6, DEFAULT);

INSERT INTO administrator VALUES 
(8, DEFAULT); 

INSERT INTO organizations VALUES
(1,4,'A','Government'),
(2,5,'B','Research Center');

INSERT INTO authors(reID,orgdelID) VALUES
(1,null),
(2,null),
(3,null),
(null,4),
(null,5);

INSERT INTO article (authorID,Author,majorTopic,minorTopic,summary,content,pubDate,active) VALUES
(1,'Pepe Lepieu','cases of covid among skunks','lack of smell in humans','aaaaaaaaaaaaaaaa','content of: cases of covid among skunks by Pepe Lepieu','2020-02-06',1),
(3,'A researcher','some research','xtra research','bbbbbbbbbbbbbbb','content of: cases of covid among skunks by Pepe Lepieu','2022-01-01',1),
(3,'A researcher','some other research','some other xtra research','cccccccccccc','content of: cases of covid among skunks by Pepe Lepieu','2021-02-06',1),
(2,'Kylian Vail','MajorTop','MinorTop','This is a summary','This is the content of the article','2022-10-28',1),
(1,'Pepe Lepieu','lack of smell in humans','loss of stink','ddddddddddddd','content of: lack of smell in humans by Pepe Lepieu','2019-12-31',1);