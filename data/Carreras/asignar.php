<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	$ci=$_POST["ci"];
	$cc=$_POST["cc"];

	if(isset($_POST["cord"]))
	{
		$cord=$_POST["cord"];

		$sql="update profesor set cord='no' where ci='$cord'";
		$ejec=pg_query($sigpa, $sql);

		$sql="update profesor set cord='$cc' where ci='$ci'";
		$ejec=pg_query($sigpa, $sql);

		$ra=pg_affected_rows($ejec);
		
		$d="Se ha modificado el coordinador de la carrera $cc";
		historial($sigpa, $_SESSION["ci"], $d);
	}

	else
	{
		$n1=strtoupper($_POST["n1"]);
		$n2=strtoupper($_POST["n2"]);
		$a1=strtoupper($_POST["a1"]);
		$a2=strtoupper($_POST["a2"]);
		$c=$_POST["c"];
		$cat=$_POST["cat"];
		$ded=$_POST["ded"];
		$cp=$_POST["cp"];
		$ce=strtoupper($_POST["ce"]);
		$tf=$_POST["tf"];
		$tm=$_POST["tm"];
		$s=$_POST["s"];

		$sql="insert into profesor values('$ci', '$n1', '$n2', '$a1', '$a2', '$c', '$cat', '$ded', '$s', '$cc', '$ce', '$tf', '$tm')";
		$ejec=pg_query($sigpa, $sql);

		if($ejec)
		{
			$ra=1;

			$sql="insert into p_obtenida values('$cp', '$ci')";
			$ejec=pg_query($sigpa, $sql);

			$sql="insert into pertenece values('$ci', '$cc')";
			$ejec=pg_query($sigpa, $sql);
		}

		else
			$ra=0;
	}

	if($ra==0)
		echo "0";

	else
		echo "1";
?>
