<?php
require "config.php";

try {
    $connection = new PDO($dsn, $username, $password, $options);

    $sql = "select * from isSuspended";

    $d = $connection->query($sql);
} catch (PDOException $e) {
    die("ERROR: Could not able to execute $sql. " . $e->getMessage());
}


?>


<table border="3" cellpadding="5" cellspacirng="5" align="cente">
    <tr>
        <th>uID</th>
        <th>suspendDate</th>
    </tr>

    <?php foreach ($d as $datas) { ?>

        <tr>

            <td><?php echo $datas['uID']; ?></td>
            <td><?php echo $datas['suspendDate']; ?></td>

        </tr>
    <?php } ?>


</table>
<a href="index.php">Back to home</a>