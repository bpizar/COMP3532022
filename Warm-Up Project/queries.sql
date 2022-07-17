
-- 3.i

SELECT 
    rName,
    SUM(DISTINCT Population),
    SUM(numVaccinations),
    SUM(numDeaths)
FROM
    ((vaccinestat
    INNER JOIN covid_19stat ON vaccinestat.statID = covid_19stat.statID)
    INNER JOIN vaccines ON vaccinestat.vID = vaccines.vID)
        INNER JOIN
    (country
    INNER JOIN region ON country.rID = region.rID) ON country.cID = covid_19stat.cID
GROUP BY region.rID;

-- 3.ii

SELECT 
    rName,cName,
    Population,
    SUM(numVaccinations),
    SUM(numDeaths)
FROM
    ((vaccinestat
    INNER JOIN covid_19stat ON vaccinestat.statID = covid_19stat.statID)
    INNER JOIN vaccines ON vaccinestat.vID = vaccines.vID)
        INNER JOIN
    (country
    INNER JOIN region ON country.rID = region.rID) ON country.cID = covid_19stat.cID
GROUP BY country.cID
ORDER BY rName,cName ASC;

-- 3.iii

SELECT 
    vaccines.name,rName,SUM(numVaccinations) ,SUM(numVacDeath) AS Deaths
FROM
    ((vaccines
    INNER JOIN vaccinestat ON vaccines.vID = vaccinestat.vID)
    INNER JOIN covid_19stat ON covid_19stat.statID = vaccinestat.statID)
        INNER JOIN
    (country
    INNER JOIN region ON country.rID = region.rID) ON country.cID = covid_19stat.cID
    WHERE rName = 'Americas'
    GROUP BY vaccines.name
    ORDER BY Deaths ASC;

-- 3.iv
SELECT 
    newBag.rName,
    SUM(DISTINCT newBag.Population) AS totalPopulation,
    COUNT(newBag.rID) AS totalResearchers,
    SUM(newBag.totalArticles) AS totalArticles,
    AVG(newBag.totalArticles) averageArticles,
    ((COUNT(newBag.rID) * 100) / Population) * 100 AS percentPopResearcher
FROM
    (SELECT 
            rName,
            region.rID,
            Population,
            COUNT(article.reID) AS totalArticles,
            email
    FROM
        ((region
    INNER JOIN country ON region.rID = country.rID)
    INNER JOIN users ON country.cID = users.cID)
    INNER JOIN researchers ON users.uID = researchers.reID
    LEFT JOIN article ON researchers.reID = article.reID
    GROUP BY article.reID) AS newBag
GROUP BY newBag.rName
ORDER BY percentPopResearcher ASC
;



-- 3.v

SELECT 
    cName,rDate,Population,numVaccinations,numInfections,numDeaths
FROM
    (covid_19stat
        INNER JOIN
    country ON covid_19stat.cID = country.cID)
        INNER JOIN vaccinestat ON vaccinestat.statID = covid_19stat.statID
WHERE
    cName =  'Canada'
    ORDER BY rDate DESC;



-- 3.vi

SELECT pubDate, author, majorTopic, minorTopic, summary
FROM article 
WHERE author = 'Joe Smith'
ORDER BY pubDate ASC;



-- 3.vii

SELECT MAX(pubDate), author, majorTopic, minorTopic, summary
FROM article
WHERE author = 'Joe Smith';


-- viii 
(SELECT admin.privilege, fName, lName, email, phone, dob
FROM (users INNER JOIN admin ON users.uID = admin.adminID))

UNION

(SELECT regularUser.privilege, fName, lName, email, phone, dob
FROM (users INNER JOIN regularUser ON users.uID = regularUser.uID))

UNION

(SELECT researchers.privilege, fName, lName, email, phone, dob
FROM (users INNER JOIN researchers ON users.uID = researchers.reID))

UNION 
(SELECT orgDel.privilege, fName, lName, email, phone, dob
FROM (users INNER JOIN orgDel ON users.uID = orgDel.orgdelID));

-- 3.ix


SELECT 
    newBag.fName,
    newBag.lName,
    newBag.email,
    newBag.phone,
    newBag.dob,
    newBag.cName,
    newBag.totalArticles,
    MAX(newBag.totalArticles) AS totNumArticles
FROM
    (SELECT 
        region.rID,
            fName,
            lName,
            email,
            phone,
            dob,
            cName,
            COUNT(users.uID) AS totalArticles
    FROM
        ((region
    INNER JOIN country ON region.rID = country.rID)
    INNER JOIN users ON country.cID = users.cID)
    INNER JOIN researchers ON users.uID = researchers.reID
    LEFT JOIN article ON researchers.reID = article.reID
    GROUP BY users.uID) AS newBag
GROUP BY newBag.rID;


-- 3.x
SELECT fName, lName, email, phone, dob, country.cName AS Citizenship
FROM ((users 
        INNER JOIN country ON users.cID = country.cID) 
        LEFT JOIN researchers ON researchers.reID = users.uID)
            LEFT JOIN 
                article ON researchers.reID = article.reID
WHERE researchers.reID IS NOT NULL 
        AND
      aID IS NULL
;



-- SELECT COUNT(*) FROM R

SELECT COUNT(*)
FROM country;

SELECT COUNT(*)
FROM covid_19stat;

SELECT COUNT(*)
FROM region;

SELECT COUNT(*)
FROM vaccines;

SELECT COUNT(*)
FROM vaccineStat;

SELECT COUNT(*)
FROM organizations;

SELECT COUNT(*)
FROM users;

SELECT COUNT(*)
FROM article;

