<?php

require "config.php";

try {
    $connection = new PDO($dsn, $username, $password, $options);
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("ERROR: Could not connect. " . $e->getMessage());
}

try {
    $sql = "INSERT INTO article (authorID, Author, majorTopic, minorTopic, summary, content, pubDate, active) VALUES (:authorID, :Author, :majorTopic, :minorTopic, :summary, :content,:pubDate, :active)";
    $statement = $connection->prepare($sql);

    $statement->bindParam(':authorID', $_REQUEST['authorID']);
    $statement->bindParam(':Author', $_REQUEST['Author']);
    $statement->bindParam(':majorTopic', $_REQUEST['majorTopic']);
    $statement->bindParam(':minorTopic', $_REQUEST['minorTopic']);
    $statement->bindParam(':summary', $_REQUEST['summary']);
    $statement->bindParam(':content', $_REQUEST['content']);
    $statement->bindParam(':pubDate', $_REQUEST['pubDate']);
    $statement->bindParam(':active', $_REQUEST['active']);

    $statement->execute();
    echo "Records Inserted Successfully";
?>
    <br>
    <a href="displayArticle.php">View articles</a>
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