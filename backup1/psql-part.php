<?php 

function connect() {
	$dbconn = pg_connect("host=localhost dbname=DBPROJ user=postgres password=pass")
	    or die('Could not connect: ' . pg_last_error());
	return $dbconn;
}

function disconnect($dbconn) {
	pg_close($dbconn);
	$dbconn = null;
}

function query($q) {
	//$result = pg_query($q) or header( 'Location: forbidden.php');
	$result = pg_query($q) or die('Query failed: ' . pg_last_error());
	return $result;
}

function free($result) {
	pg_free_result($result);
}

function get_all($table_name) {
	$table_name .= "_table";
	$q = "select * from $table_name;";
	return query($q);
}

function authorize($email, $pass) {
	$q = "select * from user_table where email='$email' and password='$pass';";
	$result = query($q);
	if (pg_num_rows($result) == 0)
		return -1;
	else
		return pg_fetch_assoc($result);
}


function get_all_cinema_saloons() {
	$q = "select *, (rows_num*columns_num) as capacity from (cinema_table join saloon_table on cinema_table.cinema_code = saloon_table.container_cinema_code);";
	return query($q);
}

function new_show_and_ticket($title, $year, $CCC, $SID, $date, $stage, $price) {
	$q = "insert into show_table(movie_title, movie_release_year, saloon_container_cinema_code, saloon_id, show_date, stage, price) values ('$title', '$year', '$CCC', '$SID', '$date', '$stage', '$price');";
	query($q);
	$q = "select rows_num,columns_num from saloon_table where container_cinema_code='$CCC' and saloon_id='$SID';";
	$saloon = pg_fetch_assoc(query($q));
	$q='insert into ticket_table(saloon_container_cinema_code,saloon_id,movie_title,movie_release_year,show_date,stage,chair_row,chair_column) values ';
	for ($i=1;$i<=$saloon['rows_num'];$i++)
		for ($j=1;$j<=$saloon['columns_num'];$j++)
			$q .= "('$CCC','$SID','$title','$year','$date','$stage','$i','$j'),";
	query(rtrim($q,',').';');
}

function get_all_shows($date_constraint) {
	$q = "select show_table.saloon_container_cinema_code, show_table.saloon_id, show_table.show_date, show_table.stage,show_table.movie_title, show_table.movie_release_year,cinema_table.title,count(*)-count(owner_email) as remain from (show_table left join ticket_table on show_table.saloon_container_cinema_code = ticket_table.saloon_container_cinema_code and show_table.saloon_id = ticket_table.saloon_id and show_table.show_date = ticket_table.show_date and show_table.stage = ticket_table.stage) join cinema_table on show_table.saloon_container_cinema_code = cinema_table.cinema_code where $date_constraint  group by show_table.saloon_container_cinema_code, show_table.saloon_id, show_table.show_date, show_table.stage,show_table.movie_title, show_table.movie_release_year,cinema_table.title ;";
	return query($q);
}

function get_show_tickets($CCC,$SID,$date,$stage,$condition) {
	$q = "select * from ticket_table where saloon_container_cinema_code ='$CCC' and saloon_id='$SID' and show_date='$date' and stage='$stage' and $condition;";
	return query($q);
}


function buy_ticket($CCC,$SID,$date,$stage,$row,$col,$email) {
	$q = "update ticket_table set owner_email='$email'  where saloon_container_cinema_code ='$CCC' and saloon_id='$SID' and show_date='$date' and stage='$stage' and chair_row='$row' and chair_column='$col';";
	return	query($q);
}

function get_user_tickets($email) {
	$q = "select * from ticket_table join cinema_table on  ticket_table.saloon_container_cinema_code = cinema_table.cinema_code where owner_email='$email' order by show_date,stage;";
	return query($q);
}

?>
