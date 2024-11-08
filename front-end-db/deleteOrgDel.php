<?php

require "config.php";

try {
    $connection = new PDO($dsn, $username, $password, $options);
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("ERROR: Could not connect. " . $e->getMessage());
}

try {
    $sql = "DELETE FROM orgDel WHERE orgdelID = :orgdelID";
    $statement = $connection->prepare($sql);

    $statement->bindParam(':orgdelID', $_REQUEST['orgdelID']);

    $statement->execute();
    echo "Records Inserted Successfully";
?>
    <br>
    <a href="displayOrgdel.php">View All Organization Delegates</a>
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