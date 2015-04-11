<html>
<head>
</head>
<body style="background: url('../../css/img/cargando.gif') no-repeat center;">

<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

		// Fecha de inicio
	$fi=date("Y-m-d");

	$d=$_POST["d"]; // Duración de la planificación
	
	$ff=date("Y-m-d", date("U")+$d*24*60*60); // Fecha fin

	$sql="insert into periodo values('$fi', '$ff', 'p')";
	$ejec=pg_query($sigpa, $sql);

	if(!$ejec)
	{
		$_SESSION["error"]="Ocurrio un error durante la creación del periodo";
	}

	else
	{
		$d="Se creó un nuevo periodo de planificación";
		historial($sigpa, $_SESSION["ci"], $d);

			// Fecha de inicio
		$fi=$_POST["fi"];
			// Fecha fin
		$ff=$_POST["ff"];

		$sql="insert into periodo values('$fi', '$ff', 'a')";
		$ejec=pg_query($sigpa, $sql);

		$d="Se creó un nuevo periodo académico";
		historial($sigpa, $_SESSION["ci"], $d);
	}
?>

	<meta http-equiv="Refresh" content="0; url=/SIGPA/?r=data/Planificacion/periodos.php" />
</body>
</html>
