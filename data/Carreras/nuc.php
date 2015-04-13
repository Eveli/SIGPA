<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	extract($_POST);
	$d=strtoupper($d);

	do
	{
		if($t==0)
			$nt=1;

		$sql="insert into uc values('$cuc', '$d', '$t', '$tr', '$ht', '$hp', '$ce', '$cc', '$cm', '$lab')";
		$ejec=pg_query($sigpa, $sql);

		++$tr;
		--$nt;
	} while($nt>0);

	if($ejec)
	{
		echo "Se creó la nueva unidad curricular";
		historial($sigpa, $_SESSION["ci"], "Se creó la unidad curricular $d de la carrera $cc en la malla $cm");
	}
?>