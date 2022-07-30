<?php

/**
 * Configuration for database connection
 *
 */

$host       = "127.0.0.1";
$username   = "root";
$password   = "putYourPW"; //put your password
$dbname     = "putProjectName"; // put the name of project
$port = "3306";
$dsn        = "mysql:host=$host;port=$port;dbname=$dbname";
$options    = array(
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
);
