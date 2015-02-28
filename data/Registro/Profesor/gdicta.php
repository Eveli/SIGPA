<?php
	include("../../../lib/conexion.php");

	$ci=$_POST["ci"];
	$cuc=$_POST["cuc"];

	$sql="insert into dicta values ('$ci', '$cuc')";
	$ejec=pg_query($sigpa, $sql);

	if($ejec==true)
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/?r=data/Registro/Profesor/consultar.php&ci=$ci' />";
	}

	else
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/?r=data/Registro/Profesor/completar_uc.php&ci=$ci&cuc=$cuc' />";
	}
?>