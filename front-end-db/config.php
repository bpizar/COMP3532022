<?php

/**
 * Configuration for database connection
 *
 */

$host       = "127.0.0.1";
$username   = "root";
$password   = "password"; //put your password
$dbname     = "ProjectC19Main"; // will use later
$dsn        = "mysql:host=$host;port=$port,dbname=$dbname"; // will use later
$options    = array(
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
);
