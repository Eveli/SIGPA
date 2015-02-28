<?php
	session_start();

		// Invocacion de las conexiones
	require "../../lib/conexion.php";

	$cuc=$_POST["cuc"];
	$ci=$_POST["prof"];
	$sup=$_POST["sup"];

	$sql="select ff from periodo where t='a' order by ff desc limit 1";
	$ejec=pg_query($sigpa, $sql);

	$p=pg_fetch_object($ejec);

	$p=explode("-", $p->ff);

	if($p[1]<=6)
	{
		$p="$p[0]-A";
	}

	else
	{
		$p="$p[0]-B";
	}

	$s="";

	for($i=0; $i<count($_POST["sec"]); ++$i)
	{
		$s.=$_POST["sec"][$i];
	}

	$ht=$_POST["ht"];
	$hp=$_POST["hp"];
	$t=$_POST["t"];

	if($t==0)
		$tr=1;

	else
		$tr=$_POST["tr"];

	$cm=$_POST["cm"];

	$sql="insert into perfil values('$cuc', '$ci')";
	$ejec=pg_query($sigpa, $sql);

	$sql="insert into carga values('$cuc', '$ci', '$p', '$s', $ht, $hp, $tr, $cm, '$sup')";
	$ejec=pg_query($sigpa, $sql);

	if($ejec)
	{
		historial($sigpa, $_SESSION["ci"], $sql);

		$h=$ht+$hp;

		$sql="update profesor set h=((select h from profesor where ci='$ci')+$h) where ci='$ci'";
		$ejec=pg_query($sigpa, $sql);

		if($sup)
		{
			$sql="insert into carga values('$cuc', '$sup', '$p', '$s', $ht, $hp, $tr, $cm)";
			$ejec=pg_query($sigpa, $sql);

			if($ejec)
			{
				$sql="update profesor set h=((select h from profesor where ci='$sup')+$h) where ci='$sup'";
				$ejec=pg_query($sigpa, $sql);
			}
		}

		echo 1;
	}

	else
		echo "Ocurrio un error, vuelva a intentarlo";
?>