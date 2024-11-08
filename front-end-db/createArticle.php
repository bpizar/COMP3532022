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

try {
    $trigger = $connection->prepare("SELECT email, users.uID FROM users INNER JOIN subscribed ON users.uID = subscribed.uID WHERE subscribed.authorID = :authorID");


    $trigger->bindParam(':authorID', $_REQUEST['authorID']);

    $trigger->execute();

    $data = $trigger->fetchAll();

    foreach ($data as $row) {
        $to = $row['email'];
        $subject = 'New Article from ' . $_REQUEST['Author'] . ' topics are ' . $_REQUEST['majorTopic'] . ' and ' . $_REQUEST['minorTopic'];
        $message = 'An Article you subscribed to as been published, here is the summary of the article' . $_REQUEST['summary'];
        $from = 'zuc353_1@encs.concordia.ca';

        $date = date('d-m-y h:i:s');
        $email = $connection->prepare("INSERT INTO emails(uID, authorID, dateTime, subject)  VALUES (:uID, :authorID, :dateTime, :subject)");

        $email->bindParam(':uID', $row['uID']);
        $email->bindParam(':authorID', $_REQUEST['authorID']);
        $email->bindParam(':dateTime', $date);
        $email->bindParam(':subject', $subject);

        $email->execute();

        // Sending email
        if (mail($to, $subject, $message)) {
            echo 'Your mail has been sent successfully.';
        } else {
            echo 'Unable to send email. Please try again.';
        }
    }
} catch (PDOException $e) {
    die("ERROR: Could not able to execute $sql. " . $e->getMessage());
}

// Close connection
unset($connection);


?>



<?php require "templates/footer.php"; ?>