<?php

require "config.php";

try {
    $connection = new PDO($dsn, $username, $password, $options);
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("ERROR: Could not connect. " . $e->getMessage());
}

try {


    if ($_REQUEST['reID'] == null) {
        $sql = "INSERT INTO authors (orgdelID) VALUES (:orgdelID)";
        $statement = $connection->prepare($sql);

        $statement->bindParam(':orgdelID', $_REQUEST['orgdelID']);
    } else {
        $sql = "INSERT INTO authors (reID) VALUES (:reID)";
        $statement = $connection->prepare($sql);

        $statement->bindParam(':reID', $_REQUEST['reID']);
    }

    $statement->execute();
    echo "Records Inserted Successfully";
?>

    <br>
    <a href="displayAuthor.php">View All Authors</a>
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