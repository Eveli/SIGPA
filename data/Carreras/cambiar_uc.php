<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	extract($_POST);
	$d=strtoupper($d);

	$sql="delete from uc where cuc='$cuc_ant' and cc='$cc' and cm='$cm'";
	$ejec=pg_query($sigpa, $sql);

	if($ejec)
	{
		do
		{
			if($t==0)
			{	
				$tr=1;
				$nt=1;
			}

			$sql="insert into uc values('$cuc', '$d', '$t', '$tr', '$ht', '$hp', '$ce', '$cc', '$cm', '$lab')";
			$ejec=pg_query($sigpa, $sql);

			++$tr;
			--$nt;
		} while($nt>0);

		if($ejec)
		{
			echo "Se modificó con éxito";
			historial($sigpa, $_SESSION["ci"], "Se modificó la unidad curricular $d de la carrera $cc en la malla $cm");
		}
	}

	else
	{
		$sql="update carga set cuc='$cuc' where cuc='$cuc_ant'";
		$ejec=pg_query($sigpa, $sql);

		$sql="update perfil set cuc='$cuc' where cuc='$cuc_ant'";
		$ejec=pg_query($sigpa, $sql);

		$sql="update uc set cuc='$cuc', d='$d', ht='$ht', hp='$hp', ce='$ce', lab='$lab' where cuc='$cuc_ant' and cc='$cc' and cm='$cm'";
		$ejec=pg_query($sigpa, $sql);

		if($ejec)
		{
			echo "Se modificó con éxito";
			historial($sigpa, $_SESSION["ci"], "Se modificó la unidad curricular $d de la carrera $cc en la malla $cm");
		}
	}
?>