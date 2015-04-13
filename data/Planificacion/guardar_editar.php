<?php
	session_start();

		// Invocacion de las conexiones
	require "../../lib/conexion.php";

	extract($_POST);

	for($i=0; $i<count($_POST["sec"]); ++$i)
	{
		$s.=$_POST["sec"][$i];
	}

	$sql="select ht+hp h from carga where cuc='$cuc' and ci='$ci' and p='$p' and tr='$tr' and cm='$cm'";
	$ejec=pg_query($sigpa, $sql);

	$hAnt=pg_fetch_object($ejec);

	$sql="update carga set s='$s', ht=$ht, hp=$hp where cuc='$cuc' and ci='$ci' and p='$p' and tr='$tr' and cm='$cm'";
	$ejec=pg_query($sigpa, $sql);

	if(pg_affected_rows($ejec))
	{
		historial($sigpa, $_SESSION["ci"], $sql);

		$h=($ht+$hp)-$hAnt->h;

		$sql="update profesor set h=((select h from profesor where ci='$ci')+$h) where ci='$ci'";
		$ejec=pg_query($sigpa, $sql);

		$sql="update carga set s='$s', ht=$ht, hp=$hp where cuc='$cuc' and p='$p' and tr='$tr' and cm='$cm' and sup='$ci' returning ci";
		$ejec=pg_query($sigpa, $sql);

		while($prof=pg_fetch_object($ejec))
		{	
			$sql="update profesor set h=((select h from profesor where ci='$prof->ci')+$h) where ci='$prof->ci'";
			$ejec2=pg_query($sigpa, $sql);

			if($ejec2)
				historial($sigpa, $_SESSION["ci"], $sql);
		}

		echo 1;
	}

	else
		echo "Ocurrio un error, vuelva a intentarlo";
?>