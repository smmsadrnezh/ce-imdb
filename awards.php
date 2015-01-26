<?php

include 'user.php';
include 'psql-part.php';
$db = connect();

$title='awards';
$body = '';

$awards = get_all('award_table');
while ($award = pg_fetch_assoc($awards)) {
	$body .='جایزه: ' .$award['award_title'] .'<br> جشنواره ' .$award['festival_title'] .' سال ' .$award['festival_year'];
	$body .= '<br>';
}

disconnect($db);
include 'template.php';

?>
