<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	$ci=$_POST["ci"];
	$n1=strtoupper($_POST["n1"]);
	$n2=strtoupper($_POST["n2"]);
	$a1=strtoupper($_POST["a1"]);
	$a2=strtoupper($_POST["a2"]);
	$c=$_POST["c"];
	$cat=$_POST["cat"];
	$ded=$_POST["ded"];
	$ce=strtoupper($_POST["ce"]);
	$tf=$_POST["tf"];
	$tm=$_POST["tm"];

	$sql="select s, cc from coordinacion where ci='$_SESSION[ci]'";
	$ejec=pg_query($sigpa, $sql);

	$cord=pg_fetch_object($ejec);

	$sql="insert into profesor values('$ci', '$n1', '$n2', '$a1', '$a2', '$c', '$cat', '$ded', '$cord->s', '$ce', '$tf', '$tm')";
	$ejec=pg_query($sigpa, $sql);

	if($ejec)
	{
		$cp=$_POST["cp"];

		$sql="insert into estudios values('$cp', '$ci')";
		$ejec=pg_query($sigpa, $sql);

		$sql="insert into pertenece values('$ci', '$cord->cc')";
		$ejec=pg_query($sigpa, $sql);
	}

	else
	{
		echo "Ocurrio un error al intentar agregar al profesor";
	}
?>
