<?php

require "config.php";

try {
    $connection = new PDO($dsn, $username, $password, $options);
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("ERROR: Could not connect. " . $e->getMessage());
}

try {
    $sql = "INSERT INTO administrator (adminID, privilege) VALUES (:adminID, :privilege)";
    $statement = $connection->prepare($sql);

    $statement->bindParam(':adminID', $_REQUEST['adminID']);
    $statement->bindParam(':privilege', $_REQUEST['privilege']);

    $statement->execute();
    echo "Records Inserted Successfully";
?>
    <br>
    <a href="displayAdmin.php">View All Admins</a>
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