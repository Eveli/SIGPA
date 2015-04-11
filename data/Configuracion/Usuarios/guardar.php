<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../../lib/conexion.php";

	extract($_POST);

	$sql="insert into usuario values('$ci', '$pw', '$r', $n)";
	$ejec=pg_query($sigpa, $sql);

	if($ejec)
	{
		echo "Se creó el usuario";
		historial($sigpa, $_SESSION["ci"], "Se creó el usuario $ci");
	}
?>