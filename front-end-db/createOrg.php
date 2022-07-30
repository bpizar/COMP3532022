<?php

require "config.php";

try {
    $connection = new PDO($dsn, $username, $password, $options);
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("ERROR: Could not connect. " . $e->getMessage());
}

try {
    $sql = "INSERT INTO organizations (orgdelID, oName, otype) VALUES (:orgdelID, :oName, :otype)";
    $statement = $connection->prepare($sql);

    $statement->bindParam(':orgdelID', $_REQUEST['orgdelID']);
    $statement->bindParam(':oName', $_REQUEST['oName']);
    $statement->bindParam(':otype', $_REQUEST['otype']);

    $statement->execute();
    echo "Records Inserted Successfully";
} catch (PDOException $e) {
    die("ERROR: Could not able to execute $sql. " . $e->getMessage());
}

// Close connection
unset($connection);


?>



<?php require "templates/footer.php"; ?>