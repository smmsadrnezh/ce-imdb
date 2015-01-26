<?php

include 'user.php';
include 'psql-part.php';
$db = connect();

$CCC = $_GET['CCC'];
$SID = $_GET['SID'];
$date = $_GET['date'];
$stage = $_GET['stage'];
$row = $_GET['chair_row'];
$col = $_GET['chair_column'];
$email = $user['email'];

buy_ticket($CCC,$SID,$date,$stage,$row,$col,$email);

disconnect($db);

header( 'Location: my_tickets.php' ) ;

include 'template.php';
?>

