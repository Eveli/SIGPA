<?php
	include("../../../lib/conexion.php");

	$ci=$_POST["ci"];

	$sql="insert into profesor values ('$ci')";
	$ejec=pg_query($sigpa, $sql);

	// Asignacion de categoria y dedicacion

	$c=$_POST["cat"];
	$d=$_POST["ded"];

	$sql="update profesor set c='$c', d='$d' where ci='$ci'";
	$ejec=pg_query($sigpa, $sql);

	$n=pg_affected_rows($ejec);

	// Asignacion de UC

	$cuc=$_POST["cuc"];

	$sql="select count(cuc) cuc from uc where cuc='$cuc'";
	$ejec=pg_query($sigpa, $sql);

	$uc=pg_fetch_object($ejec);

	if($uc->cuc==0)
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/?r=data/Registro/Profesor/completar_uc.php&ci=$ci&cuc=$cuc' />";
	}

	else
	{
		$sql="insert into dicta values ('$ci', '$cuc')";
		$ejec=pg_query($sigpa, $sql);

		if(($n!=0)&&($ejec==true))
		{
			echo "
				<script language='javascript'>
					alert('Se ha completado la carga satisfactoriamente');
				</script>
			";
		}

		else
		{
			echo "
				<script language='javascript'>
					alert('Ocurrio un error durante la carga');
				</script>
			";
		}

		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/?r=data/Registro/Profesor/consultar.php&ci=$ci' />";
	}
?>