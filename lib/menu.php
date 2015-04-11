<nav id="barramenu">
	<ul id="menu">

<?php
		// Verificar que no se accede al archivo directamente con el navegador
	@include "verificar.php";

		// Determinar el menú según el nivel de usuario
	switch($_SESSION["n"])
	{
			// Vicerrectorado
		case '1':
?>

		<a href="?r=data/Carreras/index.php"><li> PNF/Carreras </li></a>
		<a href="?r=data/Planificacion/planilla.php"><li> Planificación </li></a>
		<li> Configuración 
			<ul>
				<a href="?r=data/Areas/index.php"><li> Areas </li></a>
				<a href="?r=data/Configuracion/Bitacora/index.php"><li> Bitácora </li></a>
				<a href="?r=data/Configuracion/Usuarios/index.php"><li> Usuarios </li></a>
				<a href="?r=data/Configuracion/Respaldo/index.php"><li> Repaldos </li></a>
			</ul>
		</li>
		<a href="?r=data/Ayuda/index.php"><li> Ayuda </li></a>

<?php
		break;

			// Coordinador
		case '2':
?>

		<a href="?r=data/Profesor/index.php"><li> Profesores </li></a>
		<a href="?r=data/Planificacion/index.php"><li> Planificación </li></a>
		<a href="?r=data/Ayuda/index.php"><li> Ayuda </li></a>

<?php
		break;
	}
?>

	</ul>
</nav>
