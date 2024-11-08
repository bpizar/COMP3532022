<?php
require "config.php";

try {
    $connection = new PDO($dsn, $username, $password, $options);

    $sql = "select * from country";

    $d = $connection->query($sql);
} catch (PDOException $e) {
    die("ERROR: Could not able to execute $sql. " . $e->getMessage());
}


?>


<table border="3" cellpadding="5" cellspacirng="5" align="cente">
    <tr>
        <th>rID</th>
        <th>cID</th>
        <th>cName</th>


    </tr>

    <?php foreach ($d as $datas) { ?>

        <tr>

            <td><?php echo $datas['rID']; ?></td>
            <td><?php echo $datas['cID']; ?></td>
            <td><?php echo $datas['cName']; ?></td>


        </tr>
    <?php } ?>


</table>
<a href="index.php">Back to home</a>