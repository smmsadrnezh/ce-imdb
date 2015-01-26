<?php
include 'user.php';
include 'psql-part.php';
$db = connect();

$movie_title = $_GET['title'];
$year = $_GET['year'];

$title='فیلم ' . $movie_title . ' ' . $year;

$movie_query = get_movie($movie_title, $year);
$rate_query = get_movie_rate($movie_title, $year);
$pictures = get_movie_pictures($movie_title, $year);
$dialogues = get_movie_dialogues($movie_title, $year);
$comments = get_movie_comments($movie_title, $year);
$movie = pg_fetch_assoc($movie_query);
$rate = pg_fetch_assoc($rate_query);

$body ='نام: ' . $movie['title'] . '<br>';
$body .= 'سال پخش : ' . $movie['release_year'] . '<br>';
$body .= 'امتیاز کاربران: ' . $rate['avg'] . '<br>';
$body .= 'کشور سازنده: ' . $movie['country'] . '<br>';
$body .= 'زبان: ' . $movie['main_language'] . '<br>';
$body .= 'خلاصه: ' . $movie['story_line'] . '<br>';
$body .= 'زده سنی: ' . $movie['min_age'] . '<br>';

$body .= 'تصاویر: <br>'; 
while($pic = pg_fetch_assoc($pictures)) {
    $body .= '<img src="' . $pic['file_path'] . '"><br>';
}

$body.= 'دیالوگ‌های برتر: <br>';
while($dialogue = pg_fetch_assoc($dialogues)) {
    $body .= $dialogue['text'] . '<br>' . 'زمان: ' . $dialogue['second'] . '<br><br>';
}

$body .= 'نظرات کاربران: <br>';
while($comment = pg_fetch_assoc($comments)) {
    $body .= $comment['user_email'] . ': <br>';
    $body .= $comment['text'] . '<br><hr>';
}


disconnect($db);
include 'template.php';
?>

