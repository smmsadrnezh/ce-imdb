<?php
include 'user.php';
include 'psql-part.php';
$db = connect();

is_superuser() or die('hah');

if (isset($_POST['title'])) {
	new_show_and_ticket($_POST['title'], $_POST['year'], $_POST['CCC'], $_POST['SID'], $_POST['date'], $_POST['stage'], $_POST['price']);
	header( "Location: shows.php" );
	disconnect($db);
}

$title= $_GET['title'];
$year = $_GET['year'];
$body = "اکران فیلم $title ($year)<br>";

if (!isset($_GET['CCC'])) {
	$saloons = get_all_cinema_saloons();
	while ($saloon = pg_fetch_assoc($saloons)) {
		$body.= "<a href = 'show.php?title=$title&year=$year&CCC=".$saloon['container_cinema_code']."&SID=".$saloon['saloon_id']."'>".$saloon['title']." سالن شماره".$saloon['saloon_id']." (".$saloon['capacity'].")</a><br/>";
	}
} else {
	$CCC = $_GET['CCC'];
	$SID = $_GET['SID'];
	$body .= "<form action='show.php' method='post'>";
	$body .= "<input type='hidden' name='title' value='$title' />";
	$body .= "<input type='hidden' name='year' value='$year' />";
	$body .= "<input type='hidden' name='CCC' value='$CCC' />";
	$body .= "<input type='hidden' name='SID' value='$SID' />";
	$body .= "تاریخ میلادی : <input type='text' name='date' /> ";
	$body .= "سانس : <input type='text' name='stage' /> ";
	$body .= "قیمت : <input type='text' name='price' /> ";
	$body .= "<input type='submit' value='نمایش' /> ";
	$body .= "</form>";
}

include 'template.php';

disconnect($db);
?>

