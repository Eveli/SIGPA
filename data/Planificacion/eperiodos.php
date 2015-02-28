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

	$sql="select ff from periodo where t='p' order by ff desc limit 1";
	$ejec=pg_query($sigpa, $sql);

	$p=pg_fetch_object($ejec);

	$fip=$_POST["fip"];
	$ffp=$_POST["ffp"];

	$sql="update periodo set fi='$fip', ff='$ffp' where ff='$p->ff'";
	$ejec=pg_query($sigpa, $sql);

	if(pg_affected_rows($ejec)==0)
	{
		$_SESSION["error"]="Ocurrio un error durante la modificación del periodo";
	}

	else
	{
		$sql="select ff from periodo where t='a' order by ff desc limit 1";
		$ejec=pg_query($sigpa, $sql);

		$p=pg_fetch_object($ejec);

		$fia=$_POST["fia"];
		$ffa=$_POST["ffa"];

		$sql="update periodo set fi='$fia', ff='$ffa' where ff='$p->ff'";
		$ejec=pg_query($sigpa, $sql);
	}
?>

	<meta http-equiv="Refresh" content="0; url=/SIGPA/?r=data/Planificacion/periodos.php" />
</body>
</html>
