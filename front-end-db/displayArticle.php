<?php
require "config.php";

try {
    $connection = new PDO($dsn, $username, $password, $options);

    $sql = "select * from article";

    $d = $connection->query($sql);
} catch (PDOException $e) {
    die("ERROR: Could not able to execute $sql. " . $e->getMessage());
}


?>


<table border="3" cellpadding="5" cellspacirng="5" align="cente">
    <tr>
        <th>aID</th>
        <th>authorID</th>
        <th>Author</th>
        <th>majorTopic</th>
        <th>minorTopic</th>
        <th>summary</th>
        <th>content</th>
        <th>pubDate</th>
        <th>active</th>
    </tr>

    <?php foreach ($d as $datas) { ?>

        <tr>

            <td><?php echo $datas['aID']; ?></td>
            <td><?php echo $datas['authorID']; ?></td>
            <td><?php echo $datas['Author']; ?></td>
            <td><?php echo $datas['majorTopic']; ?></td>
            <td><?php echo $datas['minorTopic']; ?></td>
            <td><?php echo $datas['summary']; ?></td>
            <td><?php echo $datas['content']; ?></td>
            <td><?php echo $datas['pubDate']; ?></td>
            <td><?php echo $datas['active']; ?></td>
        </tr>
    <?php } ?>


</table>
<a href="index.php">Back to home</a>