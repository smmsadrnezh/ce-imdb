<?php
ini_set('display_errors', 'on');
session_start();

function is_authorized() {
	return (isset($_SESSION['IsAuthorized']) && $_SESSION['IsAuthorized']);
}

if (is_authorized())
        $GLOBALS['user'] = $_SESSION['user'];

function is_superuser() {
	if (! is_authorized())
		return false;
	return ($GLOBALS['user'] == true);
}

?>
