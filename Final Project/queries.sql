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
SELECT Author, majorTopic, minorTopic, summary, pubDate, cName



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
WHERE author = "givenAuthorName"        -- need to change to appropriate PHP syntax to search for author by name
ORDER BY pubDate ASC;

-- 15.


-- 16.


-- 17.


-- 18.


-- 19.


-- 20.


