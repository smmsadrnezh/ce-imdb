<?php

include 'user.php';
include 'psql-part.php';
$db = connect();

$title='بلیت‌های من';
$body ='لیست بلیت‌های من : <br>';

$tickets = get_user_tickets($user['email']);
while ($ticket = pg_fetch_assoc($tickets)) {
	$body .= $ticket['show_date'].'|'.' سانس  '.$ticket['stage'].'|'.$ticket['movie_title'].'('.$ticket['movie_release_year'].') ->'.$ticket['title'].'( سالن شماره '.$ticket['saloon_id'].') ردیف '.$ticket['chair_row'].' ستون '.$ticket['chair_column'].'</a> ';
	$body.= '<br>';
}


disconnect($db);
include 'template.php';
?>

