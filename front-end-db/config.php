<?php

/**
 * Configuration for database connection
 *
 */

$host       = "127.0.0.1";
$username   = "root";
$password   = "agnifyra42"; //put your password
$dbname     = "ProjectC19Main"; // will use later
$port = "3306";
$dsn        = "mysql:host=$host;port=$port;dbname=$dbname"; // will use later
$options    = array(
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
);
