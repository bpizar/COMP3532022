<!DOCTYPE html>
<html lang="en">


<body>

    <?php include "templates/header.php"; ?>
    <ul>
        <li>
            <a href="html/createUser.html"><strong>Create a Regular User</strong></a>
        </li>

        <li>
            <a href="html/createAdmin.html"> <strong>Create an Admin User </strong></a>
        </li>

        <li>
            <a href="html/createResearcher.html"> <strong>Create a Researcher User </strong></a>
        </li>

        <li>
            <a href="html/createOrgDel.html"> <strong>Create an Organization Delegate User </strong></a>
        </li>

        <li>
            <a href="html/createOrg.html"> <strong>Create an Organization </strong></a>
        </li>

        <li>
            <a href="html/createAuthor.html"> <strong>Create an Author User </strong></a>
        </li>

        <li>
            <a href="html/createArticle.html"> <strong>Create an Article </strong></a>
        </li>

        <li>
            <a href="html/createCountry.html"> <strong>Create a Country </strong></a>
        </li>

        <li>
            <a href="html/createPST.html"> <strong>Create a ProStaTer </strong></a>
        </li>
    </ul>

    <br>
    <br>

    <ul>
        <li>
            <a href="displayUsers.php"> <strong>View All Users </strong></a>
        </li>

        <li>
            <a href="displayAdmin.php"> <strong>View All Admins </strong></a>
        </li>

        <li>
            <a href="displayRes.php"> <strong>View All Researchers </strong></a>
        </li>

        <li>
            <a href="displayOrgDel.php"> <strong>View All Organization Delegates </strong></a>
        </li>

        <li>
            <a href="displayOrg.php"> <strong>View All Organizations </strong></a>
        </li>

        <li>
            <a href="displayAuthor.php"> <strong>View All Authors </strong></a>
        </li>

        <li>
            <a href="displayArticle.php"> <strong>View All Articles </strong></a>
        </li>

        <li>
            <a href="displayCountry.php"> <strong>View All Countries </strong></a>
        </li>

        <li>
            <a href="displayPST.php"> <strong>View All ProStaTers </strong></a>
        </li>
    </ul>

    <br>
    <br>

    <ul>
        <li>
            <a href="html/deleteAdmin.html"> <strong>Delete an Admin </strong></a>
        </li>

        <li>
            <a href="html/deleteRes.html"> <strong>Delete a Researchers </strong></a>
        </li>

        <li>
            <a href="html/deleteOrgDel.html"> <strong>Delete an Organization Delegate </strong></a>
        </li>

        <li>
            <a href="html/deleteAuthor.html"> <strong>Delete and Author </strong></a>
        </li>

        <li>
            <a href="html/deleteOrg.html"> <strong>Delete an Organization </strong></a>
        </li>

        <li>
            <a href="html/deleteCountry.html"> <strong>Delete a Country (including all PSTs) </strong></a>
        </li>

        <li>
            <a href="html/deletePST.html"> <strong>Delete a ProStaTer </strong></a>
        </li>

        <li>
            <a href="html/deleteArticle.html"> <strong>Delete a Article </strong></a>
        </li>

        <li>
            <a href="html/suspendUser.html"> <strong>Suspend a User </strong></a>
        </li>
    </ul>


    <br>
    <br>

    <h2><strong>DO NOT CLICK ANY OF THESE UNLESS YOU KNOW WHAT YOU ARE DOING</strong></h2>
    <ul>
        <li>
            <a href="install.php"><strong>CREATE ALL TABLES</strong></a>
        </li>

        <li>
            <a href="drop.php"><strong>DROP ALL TABLES</strong></a>
        </li>

        <li>
            <a href="populateRegions.php"><strong>INSERT All Regions</strong></a>
        </li>
    </ul>

    <?php include "templates/footer.php"; ?>


</body>

</html>