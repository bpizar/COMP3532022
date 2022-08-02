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



-- 18.



-- 19.



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
