<?php

include 'user.php';
include 'psql-part.php';
$db = connect();

$title='Top 10 Movies';
$body =
'
<br>
'
;

$movies = get_top_10_movies();
$i = 1;
while ($movie = pg_fetch_assoc($movies)) {
	$body .=$i.'. ' .$movie['movie_title'] .' (' .$movie['movie_release_year'] .') ';
	$body .= '<br>';
	$i++;
}

disconnect($db);
include 'template.php';

?>

