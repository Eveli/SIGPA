<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	/*
		b -> Incluye los blobs pesados en el respaldo
		C -> Crea la base de datos si no existe y limpia el respaldo de sìntaxis que no sea para .sql
		i -> Ignora la version de Postgres para evitar errores
		Ox -> Evita errores de propietarios y permisos

		-F p -> F Formato en que sale el respaldo, p para texto plano
	*/

	$nombre=date("Y-m-d_H-i-s");

	system("pg_dump -bCiOx --no-tablespace -F p SIGPA > /var/www/SIGPA/data/Configuracion/Respaldo/Respaldos/$nombre.sql");

	require "../../../lib/conexion.php";
	historial($sigpa, $_SESSION["ci"], "Se creó el respaldo $nombre.sql");
?>