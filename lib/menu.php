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
		<li> Carga 
			<ul>
				<a href="?r=data/Carga/registrar_carga.php"><li>Registrar Carga</li></a>
				<a href="?r=data/Carga/consulta_carga.php"><li>Consultar Carga</li></a>
			</ul>
		</li>
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
			$sql="select cc from coordinacion where ci='$_SESSION[ci]'";
			$ejec=pg_query($sigpa, $sql);

			$c=pg_fetch_object($ejec);
?>

		<a href="<?= "?r=data/Carreras/consultar.php&cc=$c->cc" ?>"><li> Malla </li></a>
		<a href="?r=data/Profesor/index.php"><li> Profesores </li></a>
		<a href="?r=data/Planificacion/index.php"><li> Planificación </li></a>
		<a href="?r=data/Ayuda/index.php"><li> Ayuda </li></a>

<?php
		break;

			// Profesor
		case '3':
			$sql="select ci from profesor where ci='$_SESSION[ci]'";
			$ejec=pg_query($sigpa, $sql);

			$ci=pg_fetch_object($ejec);
?>
		<a href="<?="?r=data/Actualizacion/planilla_actualizacion.php&ci=$ci->ci" ?>"><li> Actualizacion </li></a>
		<a href="?r=data/Ayuda/index.php"><li> Ayuda </li></a>

<?php
		break;
	}
?>
	</ul>
</nav>
