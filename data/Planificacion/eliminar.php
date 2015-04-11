<?php
	session_start();

		// Invocacion de las conexiones
	require "../../lib/conexion.php";

	extract($_POST);

	if($t==0)
		$tr=1;

	$sql="delete from carga where cuc='$cuc' and ci='$ci' and p='$p' and tr='$tr' and cm='$cm'";
	$ejec=pg_query($sigpa, $sql);

	if(pg_affected_rows($ejec))
	{
		historial($sigpa, $_SESSION["ci"], "Se eliminó la carga '$cuc' al profesor '$ci'");

		$sql="update profesor set h=((select h from profesor where ci='$ci')-$h) where ci='$ci'";
		$ejec=pg_query($sigpa, $sql);

		$sql="delete from carga where cuc='$cuc' and p='$p' and tr='$tr' and cm='$cm' and sup='$ci' returning ci";
		$ejec=pg_query($sigpa, $sql);

		while($prof=pg_fetch_object($ejec))
		{	
			$sql="update profesor set h=((select h from profesor where ci='$prof->ci')-$h) where ci='$prof->ci'";
			$ejec2=pg_query($sigpa, $sql);
			
			historial($sigpa, $_SESSION["ci"], "Se eliminó la carga '$cuc' al profesor '$prof->ci'");
		}

		echo 1;
	}

	else
		echo "Ocurrio un error, vuelva a intentarlo";
?>