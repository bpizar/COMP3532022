<?php

require "config.php";

try {
    $connection = new PDO($dsn, $username, $password, $options);
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("ERROR: Could not connect. " . $e->getMessage());
}

try {
    $sql = "INSERT INTO isSuspended (uID, suspendDate) VALUES (:uID, :suspendDate)";
    $statement = $connection->prepare($sql);

    $statement->bindParam(':uID', $_REQUEST['uID']);
    $statement->bindParam(':suspendDate', $_REQUEST['suspendDate']);

    $statement->execute();
    echo "Records Inserted Successfully";
?>

    <br>
    <a href="displaySuspendedUsers.php">View All Suspended Users</a>
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