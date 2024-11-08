<?php

/**
 * Configuration for database connection
 *
 */

$host       = "zuc353.encs.concordia.ca";
$username   = "zuc353_1";
$password   = "samzach1"; //put your password
$dbname     = "zuc353_1"; // put the name of project
$port = "3306";
$dsn        = "mysql:host=$host;port=$port;dbname=$dbname";
$options    = array(
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
);
