
<?php
$db = new mysqli(
    getenv('DB_HOST'),
    getenv('DB_USER'),
    getenv('DB_PASSWORD'),
    getenv('DB_NAME')
);

if ($db->connect_error) {
    die("Database connection failed.");
}

$res = $db->query("SELECT name, course FROM students");

while ($r = $res->fetch_assoc()) {
    echo "<p>" .
         htmlspecialchars($r['name']) . " - " .
         htmlspecialchars($r['course']) .
         "</p>";
}

$db->close();
?>
