<!DOCTYPE html>
<html lang="es">
<head>
	<title> SIGPA </title>

		<!-- META para la codificación, hace que el documento muestre correctamente los caracteres especiales del idioma (ñ, á, é, etc...) -->
	<meta charset='utf-8'>

	<link rel="stylesheet" type="text/css" href="css/estilos.css" />
	<link rel="shortcut icon" href="css/img/logo.png" />
	<script src="lib/js/sigpa.js"></script>

		<!-- Llamado del Framework -->
	<script src="lib/MWork/mwork.js"></script>
	<link rel="stylesheet" type="text/css" href="lib/MWork/mwork.css" />
</head>
<body>

<?php
	@session_start();

	if(isset($_SESSION["error"]))
	{
?>

		<!-- Script para avisar de error si existe -->
	<script>
		setTimeout(function() {alert(<?= "\"$_SESSION[error]\""; ?>)}, 0);
	</script>

<?php
			// Se elimina la variable para evitar que se escriba el error cada vez que se recargue la pagina
		unset($_SESSION["error"]);
	}
?>

	<div id="cuerpo">
		<header><img src="css/img/banner.jpg" id="header"></header>

<?php
	require "lib/conexion.php"; // Conexión
	require "lib/sesion/barrasesion.php"; // Barra donde aparece información sobre el usuario
	require "lib/menu.php"; // Menú de navegación del sistema
?>

		<section id="contenido">

<?php
		// Si no se ha iniciado sesión se mostrará el formulario para iniciar
	if(empty($_SESSION["ci"]))
		require "lib/sesion/index.php";

		// Si ya se inicio sesión
	else
	{
			// y se seleccionó una opción del menú diferente a "Inicio", se mostrará la pantalla correspondiente a dicha opción
		if($_GET["r"])
			require $_GET["r"];

			// y no se ha seleccionado ninguna opción del menú (excepto "Inicio"), se mostrará la pantalla principal del sistema
		else
		{
			echo "Bienvenido!";
		}
	}
?>

		</section>

		<footer id="footer">
			Derechos Reservados
		</footer>
	</div>
</body>
</html>
