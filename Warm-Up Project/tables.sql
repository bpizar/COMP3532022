CREATE TABLE region (
    rID INT UNSIGNED NOT NULL PRIMARY KEY,
    rName VARCHAR(90) NOT NULL
);
CREATE TABLE country (
    rID INT UNSIGNED,
    FOREIGN KEY (rID)
        REFERENCES region (rID),
    cID INT UNSIGNED AUTO_INCREMENT,
    PRIMARY KEY (cID , rID),
    cName VARCHAR(90) NOT NULL,
    Population INT UNSIGNED NOT NULL
);
CREATE TABLE covid_19stat (
    statID INT UNSIGNED AUTO_INCREMENT,
    cID INT UNSIGNED,
    FOREIGN KEY (cID)
            REFERENCES  country(cID),
    rDate DATE NOT NULL,
    PRIMARY KEY(statID, cID),
    numInfections INT UNSIGNED DEFAULT 0 NOT NULL,
    numDeaths INT UNSIGNED DEFAULT 0 NOT NULL
);
CREATE TABLE vaccines(
    vID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR (90) NOT NULL  
);

CREATE TABLE vaccineStat (
    vID INT UNSIGNED,
    FOREIGN KEY (vID)
        REFERENCES vaccines (vID),
    statID INT UNSIGNED,
    FOREIGN KEY (statID)
        REFERENCES covid_19stat (statID),
    PRIMARY KEY(vID,statID),
    numVaccinations INT UNSIGNED DEFAULT 0 NOT NULL,
    numVacDeath INT UNSIGNED DEFAULT 0 NOT NULL,
    numVacInfections INT UNSIGNED DEFAULT 0 NOT NULL

);

CREATE TABLE users(
    uID INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    cID INT UNSIGNED,
    FOREIGN KEY (cID)
        REFERENCES country (cID),
    fName VARCHAR(60) DEFAULT 'N/A',
    lName VARCHAR(60) DEFAULT 'N/A',
    phone INT UNSIGNED,
    email VARCHAR(100) DEFAULT 'empty',
    dob DATE
);

CREATE TABLE researchers (
    reID INT UNSIGNED PRIMARY KEY,
    FOREIGN KEY (reID)
        REFERENCES users (uID),
    privilege VARCHAR(30) DEFAULT 'Researcher'

);

CREATE TABLE orgDel (
    orgdelID INT UNSIGNED PRIMARY KEY,
    FOREIGN KEY (orgdelID)
        REFERENCES users (uID),
    privilege VARCHAR(30) DEFAULT 'Organization Delegate'

);

CREATE TABLE regularUser (
    uID INT UNSIGNED PRIMARY KEY,
    FOREIGN KEY (uID) REFERENCES users (uID),
    privilege VARCHAR(30) DEFAULT 'Regular'
);

CREATE TABLE admin (
    adminID INT UNSIGNED PRIMARY KEY,
    FOREIGN KEY (adminID) REFERENCES users (uID),
    privilege VARCHAR(30) DEFAULT 'Administrator'
);

CREATE TABLE organizations (
    orgID INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    orgdelID INT UNSIGNED,
    FOREIGN KEY (orgdelID)
        REFERENCES orgDel (orgdelID),
    oName VARCHAR(60),
    otype ENUM('Government','Research Center','Company')
   
);

CREATE TABLE article (
    aID INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    reID INT UNSIGNED, 
    FOREIGN KEY (reID) REFERENCES researchers (reID),
    orgdelID INT UNSIGNED, 
    FOREIGN KEY (orgdelID) REFERENCES orgDel (orgdelID),
    Author VARCHAR(90) NOT NULL,
    majorTopic VARCHAR(90) DEFAULT 'N/A',
    minorTopic VARCHAR(90) DEFAULT 'N/A',
    summary CHAR(100) DEFAULT 'empty',
    content BLOB,
    pubDate DATE NOT NULL
);
show tables;

DROP TABLE admin, researchers, regularUser, orgdel,users,organizations, article, vaccines, vaccinestat, covid_19stat, country, region
DROP TABLE region
DROP TABLE country
