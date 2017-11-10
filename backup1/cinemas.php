<?php

include 'user.php';
include 'psql-part.php';
$db = connect();

$title='سینما‌ها';
$body ='لیست سینما‌ها : <br>';

$cinemas = get_all('cinema');
while ($cinema = pg_fetch_assoc($cinemas)) {
	$body .= $cinema['title'] . ' ~~~ '. $cinema['address'] . '<br>';
}


disconnect($db);
include 'template.php';
?>

