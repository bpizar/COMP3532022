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





