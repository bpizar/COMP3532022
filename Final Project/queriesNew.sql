--10. 

(SELECT admin.privilege, cName AS Citizenship, fName, lName, email, phone, dob
FROM (users INNER JOIN ADMIN ON users.uID = admin.adminID)
			INNER JOIN country ON users.cID = country.cID)
UNION
(SELECT regularUser.privilege, cName AS Citizenship, fName, lName, email, phone, dob
FROM (users INNER JOIN regularUser ON users.uID = regularUser.uID)
			INNER JOIN country ON users.cID = country.cID)
UNION
(SELECT researchers.privilege, cName AS Citizenship, fName, lName, email, phone, dob
FROM (users INNER JOIN researchers ON users.uID = researchers.reID)
			INNER JOIN country ON users.cID = country.cID)
UNION
(SELECT orgDel.privilege, cName AS Citizenship, fName, lName, email, phone, dob
FROM (users INNER JOIN orgDel ON users.uID = orgDel.orgdelID)
			INNER JOIN country ON users.cID = country.cID)
            
ORDER BY privilege ASC, Citizenship ASC;

--11.

SELECT Author, majorTopic, minorTopic, summary, pubDate, cName AS Citizenship
FROM ((article 
		INNER JOIN AUTHORS ON article.authorID = authors.authorID) 
		INNER JOIN users ON (authors.reID = users.uID OR authors.orgdelID = users.uID))
        INNER JOIN country ON users.cID = country.cID
ORDER BY Citizenship ASC, Author ASC, pubDate ASC;

--12.

SELECT cName AS Citizenship, dor, Author, majorTopic, minorTopic, summary, pubDate
FROM ((((article 
		INNER JOIN AUTHORS ON article.authorID = authors.authorID) 
		INNER JOIN users ON (authors.reID = users.uID OR authors.orgdelID = users.uID))
		INNER JOIN country ON users.cID = country.cID)
		INNER JOIN isRemoved ON article.aID = isRemoved.aID)
ORDER BY Citizenship ASC, dor ASC;

--13.

(SELECT admin.privilege, username, fName, lName, cName AS Citizenship, email, phone, dob, suspendDate
FROM ((users INNER JOIN ADMIN ON users.uID = admin.adminID)
			INNER JOIN country ON users.cID = country.cID)
            INNER JOIN isSuspended ON users.uID = isSuspended.uID)
UNION
(SELECT regularUser.privilege, username, fName, lName, cName AS Citizenship, email, phone, dob, suspendDate
FROM ((users INNER JOIN regularUser ON users.uID = regularUser.uID)
			INNER JOIN country ON users.cID = country.cID)
            INNER JOIN isSuspended ON users.uID = isSuspended.uID)
UNION
(SELECT researchers.privilege, username, fName, lName, cName AS Citizenship, email, phone, dob, suspendDate
FROM ((users INNER JOIN researchers ON users.uID = researchers.reID)
			INNER JOIN country ON users.cID = country.cID)
            INNER JOIN isSuspended ON users.uID = isSuspended.uID)
UNION
(SELECT orgDel.privilege, username, fName, lName, cName AS Citizenship, email, phone, dob, suspendDate
FROM ((users INNER JOIN orgDel ON users.uID = orgDel.orgdelID)
			INNER JOIN country ON users.cID = country.cID)
            INNER JOIN isSuspended ON users.uID = isSuspended.uID)

ORDER BY suspendDate ASC;

--14.

SELECT pubDate, author, majorTopic, minorTopic, summary, content
FROM article
WHERE author = "Kai Sagar" 
ORDER BY pubDate ASC;

--15.

SELECT Author, cName AS Citizenship, COUNT(article.authorID) AS NumPublications
FROM ((article 
		INNER JOIN AUTHORS ON article.authorID = authors.authorID) 
		INNER JOIN users ON (authors.reID = users.uID OR authors.orgdelID = users.uID))
        INNER JOIN country ON users.cID = country.cID
GROUP BY article.authorID
ORDER BY NumPublications DESC;

--16.

SELECT rName, cName, COUNT(DISTINCT users.uID) AS NumAuthors, COUNT(aID) AS NumPublications
FROM (((AUTHORS
		INNER JOIN users ON (authors.reID = users.uID OR authors.orgdelID = users.uID))
        INNER JOIN article ON article.authorID = authors.authorID)
        INNER JOIN country ON users.cID = country.cID)
        INNER JOIN region ON country.rID = region.rID
GROUP BY country.cID
ORDER BY rName ASC, NumPublications DESC;    

--17.

SELECT 
    rName,
    cName,
    SUM(DISTINCT A.population),
    SUM(totVaccines),
    SUM(totVacDead)
FROM
    (SELECT 
        rName,
            cName,
            Population,
            SUM(numVaccinations) AS totVaccines,
            SUM(numVacDeath) AS totVacDead
    FROM
        region
    INNER JOIN country ON country.rID = region.rID
    INNER JOIN prostater ON prostater.cID = country.cID
    INNER JOIN covid_19stat ON covid_19stat.pstID = prostater.pstID
    INNER JOIN vaccinestat ON vaccinestat.statID = covid_19stat.statID
    GROUP BY covid_19stat.statID) AS A
GROUP BY cName;

--18.

SELECT DATE(date_time), users.email AS Receiver, SUBJECT
FROM emails INNER JOIN users ON emails.uID = users.uID
WHERE date_time BETWEEN '2020-01-01' AND '2023-01-01'  
ORDER BY date_time ASC;

--19.

SELECT 
    totalPopulation,
    rDate,
    SUM(numVaccinations),
    SUM(numInfections),
    SUM(numVaccinations),
    SUM(numVacDeath),
    vaccines.name
FROM
    country
        INNER JOIN
    prostater ON country.cID = prostater.cID
        INNER JOIN
    covid_19stat ON covid_19stat.pstID = prostater.pstID
        INNER JOIN
    vaccinestat ON vaccinestat.statID = covid_19stat.statID
        INNER JOIN
    vaccines ON vaccinestat.vID = vaccines.vID
        INNER JOIN
    (SELECT 
        prostater.cID AS cID, SUM(Population) AS totalPopulation
    FROM
        country
    INNER JOIN prostater ON country.cID = prostater.cID
    GROUP BY prostater.cID) AS A ON A.cID = prostater.cID
WHERE
    cName = 'Brazil'		-- user inputs country name
GROUP BY vaccines.name
ORDER BY rDate;


--20.

SELECT
*
FROM
((SELECT 
    authors.authorID,
    CONCAT(fName, ' ', lName) AS AuthorName,
    cName AS Citizenship,
    COUNT(subscribed.uID) AS NumSubscribers
FROM
    (((AUTHORS
    INNER JOIN subscribed ON subscribed.authorID = authors.authorID)
    INNER JOIN users ON (authors.reID = users.uID
        OR authors.orgdelID = users.uID))
    INNER JOIN country ON users.cID = country.cID)
        LEFT JOIN
    organizations ON authors.orgdelID = organizations.orgdelID
WHERE
    oName IS NULL
GROUP BY subscribed.authorID)
UNION
(SELECT 
    authors.authorID,
    oName AS AuthorName,
    cName AS Citizenship,
    COUNT(subscribed.uID) AS NumSubscribers
FROM
    (((AUTHORS
    INNER JOIN subscribed ON subscribed.authorID = authors.authorID)
    INNER JOIN users ON (authors.reID = users.uID
        OR authors.orgdelID = users.uID))
    INNER JOIN country ON users.cID = country.cID)
        LEFT JOIN
    organizations ON authors.orgdelID = organizations.orgdelID
WHERE
    oName IS NOT NULL
GROUP BY subscribed.authorID)) AS A
ORDER BY NumSubscribers DESC;


