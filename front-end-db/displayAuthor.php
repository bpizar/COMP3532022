<?php
require "config.php";

try {
    $connection = new PDO($dsn, $username, $password, $options);

    $sql = "select * from authors";

    $d = $connection->query($sql);
} catch (PDOException $e) {
    die("ERROR: Could not able to execute $sql. " . $e->getMessage());
}


?>


<table border="3" cellpadding="5" cellspacirng="5" align="cente">
    <tr>
        <th>authorID</th>
        <th>reID</th>
        <th>orgdelID</th>

    </tr>

    <?php foreach ($d as $datas) { ?>

        <tr>
            <td><?php echo $datas['authorID']; ?></td>
            <td><?php echo $datas['reID']; ?></td>
            <td><?php echo $datas['orgdelID']; ?></td>


        </tr>
    <?php } ?>


</table>
<a href="index.php">Back to home</a>