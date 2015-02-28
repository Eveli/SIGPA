<?php
	include "../conexion.php";

	$v=$_POST["v"];
	$t=$_POST["t"];

	$sql="select count(ci) ra from $t where ci='$v'";
	$ejec=pg_query($sigpa, $sql);

	$ra=pg_fetch_object($ejec);

	if($ra->ra==0)
		echo "ne_ci";

	else
		echo "ex_ci";
?>