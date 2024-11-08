<?php

require "config.php";

try {
    $connection = new PDO($dsn, $username, $password, $options);
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("ERROR: Could not connect. " . $e->getMessage());
}

try {
    $sql = "INSERT INTO users (fName, lName, email, phone, dob, username, pw) VALUES (:fName, :lName, :email, :phone, :dob, :username, :pw)";
    $statement = $connection->prepare($sql);

    $statement->bindParam(':fName', $_REQUEST['fName']);
    $statement->bindParam(':lName', $_REQUEST['lName']);
    $statement->bindParam(':email', $_REQUEST['email']);
    $statement->bindParam(':phone', $_REQUEST['phone']);
    $statement->bindParam(':dob', $_REQUEST['dob']);
    $statement->bindParam(':username', $_REQUEST['username']);
    $statement->bindParam(':pw', $_REQUEST['pw']);

    $statement->execute();
    echo "Records Inserted Successfully";
?>

    <br>
    <a href="displayUsers.php">View All Users</a>
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