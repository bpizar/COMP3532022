<?php

require "config.php";

try {
    $connection = new PDO($dsn, $username, $password, $options);
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("ERROR: Could not connect. " . $e->getMessage());
}

try {


    $sql = "INSERT INTO proStaTer (cID, pstName, Population) VALUES (:cID, :pstName, :Population)";



    $statement = $connection->prepare($sql);

    $statement->bindParam(':cID', $_REQUEST['cID']);
    $statement->bindParam(':pstName', $_REQUEST['pstName']);
    $statement->bindParam(':Population', $_REQUEST['Population']);



    $statement->execute();
    echo "Records Inserted Successfully";
?>

    <br>
    <a href="displayPST.php">View All ProStaTers</a>
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