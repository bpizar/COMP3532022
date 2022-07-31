<?php
require "config.php";

try {
    $connection = new PDO($dsn, $username, $password, $options);

    $sql = "select * from users";

    $d = $connection->query($sql);
} catch (PDOException $e) {
    die("ERROR: Could not able to execute $sql. " . $e->getMessage());
}


?>


<table border="3" cellpadding="5" cellspacirng="5" align="cente">
    <tr>
        <th>uID</th>
        <th>cID</th>
        <th>first name</th>
        <th>last name</th>
        <th>phone</th>
        <th>email</th>
        <th>date of birth</th>
        <th>username</th>
        <th>password</th>
    </tr>

    <?php foreach ($d as $datas) { ?>

        <tr>

            <td><?php echo $datas['uID']; ?></td>
            <td><?php echo $datas['cID']; ?></td>
            <td><?php echo $datas['fName']; ?></td>
            <td><?php echo $datas['lName']; ?></td>
            <td><?php echo $datas['phone']; ?></td>
            <td><?php echo $datas['email']; ?></td>
            <td><?php echo $datas['dob']; ?></td>
            <td><?php echo $datas['username']; ?></td>
            <td><?php echo $datas['pw']; ?></td>
        </tr>
    <?php } ?>


</table>

<a href="index.php">Back to home</a>