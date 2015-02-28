<html>
<head>
</head>
<body style="background: url('../../css/img/cargando.gif') no-repeat center;">
<?php
	@session_start();

	if(!$_POST)
	{
			// META para redireccionar
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	require "../conexion.php";

	$ci=$_POST["ci"];
	$pw=$_POST["pw"];
	$r=$_POST["r"];

	if(($ci=="")||($pw==""))
	{
			// META para redireccionar
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		$_SESSION["error"]="Llene todos los campos";
		exit();
	}

		// Consulta SQL para validar el usuario y la contraseña
	$sql="select n from usuario where ci='$ci' and pw='$pw'";
	$ejec=pg_query($sigpa, $sql);

	$ra=pg_affected_rows($ejec);

		// Si los datos son correctos activa la sesión
	if($ra==1)
	{
		$usu=pg_fetch_object($ejec);

		$_SESSION["ci"]=$ci;
		$_SESSION["n"]=$usu->n;
		
		$d="El usuario $ci ha iniciado sesión";
		historial($sigpa, $_SESSION["ci"], $d);
	}

		// Si no son correctos se muestra un error
	else
		$_SESSION["error"]="La contraseña es incorrecta";

	echo "<meta http-equiv='Refresh' content='0; url=$r' />";
?>
</body>
</html>
