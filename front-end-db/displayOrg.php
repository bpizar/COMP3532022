<?php
require "config.php";

try {
    $connection = new PDO($dsn, $username, $password, $options);

    $sql = "select * from organizations";

    $d = $connection->query($sql);
} catch (PDOException $e) {
    die("ERROR: Could not able to execute $sql. " . $e->getMessage());
}


?>


<table border="3" cellpadding="5" cellspacirng="5" align="cente">
    <tr>
        <th>orgID</th>
        <th>orgdelID</th>
        <th>oName</th>
        <th>otype</th>

    </tr>

    <?php foreach ($d as $datas) { ?>

        <tr>

            <td><?php echo $datas['orgID']; ?></td>
            <td><?php echo $datas['orgdelID']; ?></td>
            <td><?php echo $datas['oName']; ?></td>
            <td><?php echo $datas['otype']; ?></td>

        </tr>
    <?php } ?>


</table>
<a href="index.php">Back to home</a>