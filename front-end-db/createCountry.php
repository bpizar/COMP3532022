<?php

require "config.php";

try {
    $connection = new PDO($dsn, $username, $password, $options);
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("ERROR: Could not connect. " . $e->getMessage());
}

try {


    $sql = "
    INSERT INTO country (rID, cName, Population) VALUES (:rID, :cName, :Population);
    INSERT INTO organizations (oName, otype) VALUES (:cName, :government);
    ";

    $government = 'government';

    $statement = $connection->prepare($sql);

    $statement->bindParam(':rID', $_REQUEST['rID']);
    $statement->bindParam(':cName', $_REQUEST['cName']);
    $statement->bindParam(':Population', $_REQUEST['Population']);
    $statement->bindParam(':government', $government);


    $statement->execute();
    echo "Records Inserted Successfully";
?>

    <br>
    <a href="displayCountry.php">View All Countries</a>
    <br>
    <a href="index.php">Back to home</a>

<?php
} catch (PDOException $e) {
    die("ERROR: Could not able to execute $sql. " . $e->getMessage());
}

// Close connection
unset($connection);


?>



<?php require "templates/footer.php"; ?>