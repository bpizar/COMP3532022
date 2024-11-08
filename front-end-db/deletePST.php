<?php

require "config.php";

try {
    $connection = new PDO($dsn, $username, $password, $options);
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("ERROR: Could not connect. " . $e->getMessage());
}

try {
    $sql = "DELETE FROM proStaTer WHERE pstID = :pstID";
    $statement = $connection->prepare($sql);

    $statement->bindParam(':pstID', $_REQUEST['pstID']);

    $statement->execute();
    echo "Records Inserted Successfully";
?>
    <br>
    <a href="displayPST.php">View All PSTs</a>
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