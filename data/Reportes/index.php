<?php
	session_start();
?>

<!DOCTYPE html>
<html lang="es">
<head>
	<title> Reportes </title>
	<meta charset='utf-8'>

	<link rel="shortcut icon" href="../../css/img/logo.png" />
	<script src="../../lib/js/sigpa.js"></script>

		<!-- Llamado del Framework -->
	<script src="/MWork/mwork.js"></script>
	<link rel="stylesheet" type="text/css" href="/MWork/mwork.css" />

	<style type="text/css">
		*
		{
			/*text-transform: uppercase;*/
			font-size: 6pt;
		}

		.tab_index
		{
			width: 100%;

			margin: 0 auto;
		}

		.tab_index td
		{
			text-align: left;
		}

		.tab_index td,
		.tab_index th
		{
			border: 1px solid;
			padding: 15px;
		}

		.tab_index tr:first-child th
		{
			color: #0000cb;
		}

		.tab_index th
		{
			font-size: 10pt;
			padding: 5px;
		}

		.tab_index tr:first-child th:first-child
		{
			border-top-left-radius: 15px;
		}

		.tab_index tr:first-child th:last-child
		{
			border-top-right-radius: 15px;
		}
	</style>
</head>
<body>
	<div id="bts">
		<input type="button" value="Imprimir" class="boton" OnClick="this.parentNode.style.display='none'; print(); this.parentNode.style.display='block'" />
		<input type="button" value="Regresar" OnClick="window.history.back()" class="boton" />
		<br/><br/>
	</div>

<?php
	require "../../lib/conexion.php";

	switch($_GET["t"])
	{
		case 'p':
			require "planificacion.php";
		break;
	}
?>

</body>
</html>