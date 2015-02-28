<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	$cc=$_GET["cc"];

	$sql="select * from carrera where cc='$cc'";
	$ejec=pg_query($sigpa, $sql);
	
	$carrera=pg_fetch_object($ejec);
?>

<h3><?= $carrera->d; ?></h3>

<table class="tab_index">
	<tr>
		<th>Malla</th>
		<th>Fecha de Emisión</th>
		<th>Estado</th>
	</tr>

<?php
	
	$sql="select * from malla where cc='$cc' order by cm desc";
	$ejec=pg_query($sigpa, $sql);
	
	while($malla=pg_fetch_object($ejec))
	{
?>

	<tr <?= "OnClick=location=\"?r=data/Carreras/uc.php&cc=$cc&cm=$malla->cm\"" ?> title="Haga click para obtener mas información de esta malla" style="cursor: pointer;">
		<td><?= $malla->cm ?></td>
		<td><?= $malla->f ?></td>
		<td>

<?php
	if($malla->e)
	{
		echo "Activa";
	}

	else
	{
		echo "Inactiva";
	}
?>

		</td>
	</tr>

<?php
	}
?>

	<tr>
		<td colspan=3 style='text-align: center;' title='Agregar una nueva malla'>
			<a <?= "href='?r=data/Carreras/malla.php&cc=$_GET[cc]'" ?>><div>Nueva Malla Curricular</div></a>
		</td>
	</tr>
</table><br/>

<a <?= "href=\"?r=data/Carreras/index.php\"" ?>><input type="button" value="Regresar" class="boton" /></a>