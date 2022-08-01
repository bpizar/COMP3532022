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
    DELETE FROM proStaTer WHERE cID = :cID;
    DELETE FROM country WHERE cID = :cID;
    ";
    $statement = $connection->prepare($sql);

    $statement->bindParam(':cID', $_REQUEST['cID']);

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