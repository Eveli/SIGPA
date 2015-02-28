<?php
	$sigpa=pg_connect("host=localhost dbname=SIGPA user=postgres password=root");

	function historial($sigpa, $ci, $d)
	{
		pg_query($sigpa, "insert into historial(ci, d) values('$ci', '".pg_escape_string($d)."')");
	}
?>
