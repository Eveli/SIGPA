<?php
	include("../../../lib/conexion.php");

	$ci=$_POST["ci"];
	$c=$_POST["cat"];
	$d=$_POST["ded"];

	$sql="update profesor set c='$c', d='$d' where ci='$ci'";
	$ejec=pg_query($sigpa, $sql);

	$n=pg_affected_rows($ejec);

	if($n>0)
	{
		echo "
			<script language='javascript'>
				alert('Se guadaron satisfactoriamente todos los cambios');
			</script>
		";
	}

	else
	{
		echo "
			<script language='javascript'>
				alert('No se hizo ningun cambios');
			</script>
		";
	}

	echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/?r=data/Registro/Profesor/consultar.php&ci=$ci' />";
?>