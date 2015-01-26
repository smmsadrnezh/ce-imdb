<?php

include 'user.php';
include 'psql-part.php';
$db = connect();

$title='فیلم‌ها';
$body ='لیست فلیم‌ها : <br>';

$movies = get_all('movie');
while ($movie = pg_fetch_assoc($movies)) {
	$body .= '<a href="movie.php?title='.$movie['title'].'&year='.$movie['release_year'].'">'.$movie['title'].'('.$movie['release_year'].')</a> ';
	if (is_superuser())
		$body .= '<a href="show.php?title='.$movie['title'].'&year='.$movie['release_year'].'">'."اکران </a> ";
	$body.= '<br>';
}


disconnect($db);
include 'template.php';
?>

