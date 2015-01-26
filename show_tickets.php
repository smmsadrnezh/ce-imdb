<?php

include 'user.php';
include 'psql-part.php';
$db = connect();

$title='بلیت‌های نمایش';
$body ='بلیت‌های نمایش  : <br>';

$CCC = $_GET['CCC'];
$SID = $_GET['SID'];
$date = $_GET['date'];
$stage = $_GET['stage'];

$tickets = get_show_tickets($CCC,$SID,$date,$stage,'owner_email is null');
while ($ticket = pg_fetch_assoc($tickets)) {
	$body .= '<a href="buy_ticket.php?CCC='.$ticket['saloon_container_cinema_code'].'&SID='.$ticket['saloon_id'].'&date='.$ticket['show_date'].'&stage='.$ticket['stage'].'&chair_row='.$ticket['chair_row'].'&chair_column='.$ticket['chair_column'].'">خرید بلیت  ردیف '.$ticket['chair_row'].' ستون '.$ticket['chair_column'].'</a> ';
	$body.= '<br>';
}


disconnect($db);
include 'template.php';
?>

