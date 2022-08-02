-- 10. 

(SELECT admin.privilege, cName AS Citizenship, fName, lName, email, phone, dob
FROM (users INNER JOIN admin ON users.uID = admin.adminID)
			INNER JOIN country on users.cID = country.cID)
UNION
(SELECT regularUser.privilege, cName AS Citizenship, fName, lName, email, phone, dob
FROM (users INNER JOIN regularUser ON users.uID = regularUser.uID)
			INNER JOIN country on users.cID = country.cID)
UNION
(SELECT researchers.privilege, cName AS Citizenship, fName, lName, email, phone, dob
FROM (users INNER JOIN researchers ON users.uID = researchers.reID)
			INNER JOIN country on users.cID = country.cID)
UNION
(SELECT orgDel.privilege, cName AS Citizenship, fName, lName, email, phone, dob
FROM (users INNER JOIN orgDel ON users.uID = orgDel.orgdelID)
			INNER JOIN country on users.cID = country.cID)
            
ORDER BY privilege ASC, Citizenship ASC;


-- 11.
SELECT Author, majorTopic, minorTopic, summary, pubDate, cName AS Citizenship
FROM ((article 
		INNER JOIN authors ON article.authorID = authors.authorID) 
		INNER JOIN users ON (authors.reID = users.uID OR authors.orgdelID = user.uID))
        INNER JOIN country ON users.cID = country.cID
ORDER BY Citizenship ASC, Author ASC, pubDate ASC;


-- 12.
SELECT Author, majorTopic, minorTopic, summary, pubDate, cName AS Citizenship
FROM ((article 
		INNER JOIN authors ON article.authorID = authors.authorID) 
		INNER JOIN users ON (authors.reID = users.uID OR authors.orgdelID = user.uID))
        INNER JOIN country ON users.cID = country.cID
WHERE active = 0
ORDER BY Citizenship ASC, Author ASC, pubDate ASC;

-- alternate version to account for new isRemoved relation for articles
SELECT Author, majorTopic, minorTopic, summary, pubDate, removalDate, cName AS Citizenship
FROM (((article 
		INNER JOIN authors ON article.authorID = authors.authorID) 
		INNER JOIN users ON (authors.reID = users.uID OR authors.orgdelID = user.uID))
        INNER JOIN country ON users.cID = country.cID)
        INNER JOIN isRemoved ON article.aID = isRemoved.aid
ORDER BY Citizenship ASC, removalDate ASC;


-- 13.
(SELECT admin.privilege, username, fName, lName, cName AS Citizenship, email, phone, dob, suspendDate
FROM ((users INNER JOIN admin ON users.uID = admin.adminID)
			INNER JOIN country on users.cID = country.cID)
            INNER JOIN isSuspended ON users.uID = isSuspended.uID)
UNION
(SELECT regularUser.privilege, username, fName, lName, cName AS Citizenship, email, phone, dob, suspendDate
FROM ((users INNER JOIN regularUser ON users.uID = regularUser.uID)
			INNER JOIN country on users.cID = country.cID)
            INNER JOIN isSuspended ON users.uID = isSuspended.uID)
UNION
(SELECT researchers.privilege, username, fName, lName, cName AS Citizenship, email, phone, dob, suspendDate
FROM ((users INNER JOIN researchers ON users.uID = researchers.reID)
			INNER JOIN country on users.cID = country.cID)
            INNER JOIN isSuspended ON users.uID = isSuspended.uID)
UNION
(SELECT orgDel.privilege, username, fName, lName, cName AS Citizenship, email, phone, dob, suspendDate
FROM ((users INNER JOIN orgDel ON users.uID = orgDel.orgdelID)
			INNER JOIN country on users.cID = country.cID)
            INNER JOIN isSuspended ON users.uID = isSuspended.uID)

ORDER BY suspendDate ASC;


-- 14.
SELECT pubDate, author, majorTopic, minorTopic, summary, content
FROM article
WHERE author = "givenAuthorName"  -- need to change to appropriate syntax to search for author by name
ORDER BY pubDate ASC;


-- 15.
SELECT Author, cName AS Citizenship, COUNT(article.authorID) AS NumPublications
FROM ((article 
		INNER JOIN authors ON article.authorID = authors.authorID) 
		INNER JOIN users ON (authors.reID = users.uID OR authors.orgdelID = users.uID))
        INNER JOIN country ON users.cID = country.cID
GROUP BY article.authorID
ORDER BY NumPublications DESC;


-- 16.
SELECT rName, cName, COUNT(DISTINCT users.uID) AS NumAuthors, COUNT(aID) AS NumPublications
FROM (((authors
		INNER JOIN users ON (authors.reID = users.uID OR authors.orgdelID = users.uID))
        INNER JOIN article ON article.authorID = authors.authorID)
        INNER JOIN country ON users.cID = country.cID)
        INNER JOIN region ON country.rID = region.rID
GROUP BY country.cID
ORDER BY rName ASC, NumPublications DESC;    


-- 17.

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

-- 18.
SELECT DATE(dateTime), users.email AS Receiver, subject
FROM emails INNER JOIN users ON emails.uID = users.uID
WHERE dateTime BETWEEN date1 AND date2  -- user inputs start date and end date
ORDER BY dateTime ASC;


-- 19.

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
    cName = 'givencountryName'		-- user inputs country name
GROUP BY vaccines.name
ORDER BY rDate

-- 20.
-- not ideal because we've used orgdelID for the author when technically it should be the organization that is the author
-- so it still shows the org del name when it should only show the organization name
SELECT authors.authorID, CONCAT(fName, ' ', lName) AS AuthorName, oName AS Organization, cName AS Citizenship, COUNT(subscribed.uID) AS NumSubscribers
FROM (((authors 
		INNER JOIN subscribed ON subscribed.authorID = authors.authorID)
        INNER JOIN users ON (authors.reID = users.uID OR authors.orgdelID = users.uID))
        INNER JOIN country ON users.cID = country.cID)
        LEFT JOIN organizations ON authors.orgdelID = organizations.orgdelID 
GROUP BY subscribed.authorID
ORDER BY NumSubscribers DESC;

-- alternate version: if oName is Null (ie author is a researcher) shows first + last name of researcher as Author Name,
-- or if there is an oName (author is organization) shows organization Name as AuthorName
SELECT authors.authorID, IFNULL(oName, CONCAT(fName, ' ', lName)) AS AuthorName, cName AS Citizenship, COUNT(subscribed.uID) AS NumSubscribers
FROM (((authors 
		INNER JOIN subscribed ON subscribed.authorID = authors.authorID)
        INNER JOIN users ON (authors.reID = users.uID OR authors.orgdelID = users.uID))
        INNER JOIN country ON users.cID = country.cID)
        LEFT JOIN organizations ON authors.orgdelID = organizations.orgdelID 
GROUP BY subscribed.authorID
ORDER BY NumSubscribers DESC;


-- alternate version based on above
-- uses a union of select form reasearchers and select from orgdel to not display nulls
select
*
from
((SELECT 
    authors.authorID,
    CONCAT(fName, ' ', lName) AS AuthorName,
    cName AS Citizenship,
    COUNT(subscribed.uID) AS NumSubscribers
FROM
    (((authors
    INNER JOIN subscribed ON subscribed.authorID = authors.authorID)
    INNER JOIN users ON (authors.reID = users.uID
        OR authors.orgdelID = users.uID))
    INNER JOIN country ON users.cID = country.cID)
        LEFT JOIN
    organizations ON authors.orgdelID = organizations.orgdelID
WHERE
    oName IS NULL
GROUP BY subscribed.authorID)
union
(SELECT 
    authors.authorID,
    oName AS AuthorName,
    cName AS Citizenship,
    COUNT(subscribed.uID) AS NumSubscribers
FROM
    (((authors
    INNER JOIN subscribed ON subscribed.authorID = authors.authorID)
    INNER JOIN users ON (authors.reID = users.uID
        OR authors.orgdelID = users.uID))
    INNER JOIN country ON users.cID = country.cID)
        LEFT JOIN
    organizations ON authors.orgdelID = organizations.orgdelID
WHERE
    oName IS not NULL
GROUP BY subscribed.authorID)) as A
ORDER BY NumSubscribers DESC;
