<?php

/**
 * Open a connection via PDO to create a
 * new database and table with structure.
 *
 */

require "config.php";

try {
    $connection = new PDO($dsn, $username, $password, $options);
    $sql = file_get_contents("data/inserts.sql");
    $connection->exec($sql);

    echo "Table populated successfully.";
?>
    <br>
    <a href="index.php">Back to Home</a>

<?php
} catch (PDOException $error) {
    echo $sql . "<br>" . $error->getMessage();
}

?>