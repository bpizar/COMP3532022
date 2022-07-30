<?php

require "config.php";

try {
    $connection = new PDO($dsn, $username, $password, $options);
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("ERROR: Could not connect. " . $e->getMessage());
}

try {
    $sql = "INSERT INTO researchers (reID, privilege) VALUES (:reID, :privilege)";
    $statement = $connection->prepare($sql);

    $statement->bindParam(':reID', $_REQUEST['reID']);
    $statement->bindParam(':privilege', $_REQUEST['privilege']);

    $statement->execute();
    echo "Records Inserted Successfully";
} catch (PDOException $e) {
    die("ERROR: Could not able to execute $sql. " . $e->getMessage());
}

// Close connection
unset($connection);


?>



<?php require "templates/footer.php"; ?>