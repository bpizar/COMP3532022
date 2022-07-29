<?php include "templates/header.php"; ?><h2>Add a user</h2>

<form method="post">
    <label for="firstname">First Name</label>
    <input type="text" name="firstname" id="firstname">
    <br>
    <label for="lastname">Last Name</label>
    <input type="text" name="lastname" id="lastname">
    <br>
    <label for="email">Email Address</label>
    <input type="text" name="email" id="email">
    <br>
    <label for="phoneNb">Phone Number</label>
    <input type="text" name="phoneNb" id="phoneNb">
    <br>
    <label for="dob">Date of Birth</label>
    <input type="text" name="dob" id="dob">
    <br>
    <label for="location">Location</label>
    <input type="text" name="location" id="location">
    <br>
    <label for="username">Username</label>
    <input type="text" name="username" id="username">
    <br>
    <label for="password">Password</label>
    <input type="text" name="password" id="password">
    <br>
    <input type="submit" name="submit" value="Submit">
</form>

<a href="index.php">Back to home</a>

<?php include "templates/footer.php"; ?>