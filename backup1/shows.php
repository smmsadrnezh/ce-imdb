<?php

include 'user.php';
include 'psql-part.php';
$db = connect();

$title='نمایش‌ه';
$body ='لیست نمایش‌ها : <br>';

$shows = get_all_shows("1=1");
while ($show = pg_fetch_assoc($shows)) {
	$body .= '<a href="show_tickets.php?CCC='.$show['saloon_container_cinema_code'].'&SID='.$show['saloon_id'].'&date='.$show['show_date'].'&stage='.$show['stage'].'">'.$show['show_date'].'| سانس '.$show['stage'].' | '.$show['movie_title'].'('.$show['movie_release_year'].') ->'.$show['title'].'( سالن شماره '.$show['saloon_id'].'). تعدا بلیت باقیمانده:'.$show['remain'].'</a> ';
	$body.= '<br>';
}


disconnect($db);
include 'template.php';
?>

