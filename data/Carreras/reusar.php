<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	extract($_POST);

	$sql="insert into malla(cm, cc) values('$ncm', '$cc')";
	$ejec=pg_query($sigpa, $sql);

	if($ejec)
	{
		echo "Se creó una nueva malla";
		historial($sigpa, $_SESSION["ci"], "Se creó la malla $ncm en a carrera $cc");

		$sql="select * from uc where cm='$cm' and cc='$cc'";
		$ejec=pg_query($sigpa, $sql);

		while($uc=pg_fetch_object($ejec))
		{
			$sql="insert into uc values('$uc->cuc', '$uc->d', '$uc->t', '$uc->tr', '$uc->ht', '$uc->hp', '$uc->ce', '$uc->cc', '$ncm', '$uc->lab')";
			$ejec2=pg_query($sigpa, $sql);
		}
	}
?>