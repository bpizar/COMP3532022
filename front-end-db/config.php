<?php

/**
 * Configuration for database connection
 *
 */

$host       = "127.0.0.1";
$username   = "root";
$password   = "pw"; //put your password
$dbname     = "project"; // put the name of project
$port = "3306";
$dsn        = "mysql:host=$host;port=$port;dbname=$dbname";
$options    = array(
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
);
