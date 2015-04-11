<html>
<head>
</head>
<body style="background: url('../../css/img/cargando.gif') no-repeat center;">
<?php
	session_start();

	if(!$_POST)
	{
			// META para redireccionar
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	require "../conexion.php";

	$ci=$_POST["ci"];
	$r=strtoupper($_POST["r"]);
	$pw=$_POST["pw"];
	$rpw=$_POST["rpw"];

	if(($ci=="")||($r=="")||($pw=="")||($rpw==""))
	{
			// META para redireccionar
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		$_SESSION["error"]="Llene todos los campos";
		exit();
	}

		// Consulta SQL para validar el usuario y el texto de recuperación
	$sql="select ci from usuario where ci='$ci' and r='$r'";
	$ejec=pg_query($sigpa, $sql);

	$ra=pg_affected_rows($ejec);

		// Si los datos son correctos activa la sesión
	if($ra==1)
	{
		if($pw==$rpw)
		{
			$sql="update usuario set pw='$pw' where ci='$ci'";
			$ejec=pg_query($sigpa, $sql);

			$_SESSION["error"]="Se guardaron satisfactoriamente los cambios";
		}

		else
			$_SESSION["error"]="Las contraseñas no coinciden";
	}

		// Si no son correctos se muestra un error
	else
		$_SESSION["error"]="El texto de recuperación no coincide con su usuario";

	echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
?>
</body>
</html>