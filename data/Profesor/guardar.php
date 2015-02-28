<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	$ci=$_POST["ci"];
	$ci_ant=$_POST["ci_ant"];
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

	$sql="select s from coordinacion where ci='$_SESSION[ci]'";
	$ejec=pg_query($sigpa, $sql);

	$cord=pg_fetch_object($ejec);

	$sql="update profesor set ci='$ci', n1='$n1', n2='$n2', a1='$a1', a2='$a2', c='$c', cat='$cat', ded='$ded', s='$cord->s', ce='$ce', tf='$tf', tm='$tm' where ci='$ci_ant'";
	$ejec=pg_query($sigpa, $sql);

	if($ejec)
	{
		$cp=$_POST["cp"];

		$sql="update estudios set cp='$cp', ci='$ci' where ci='$ci_ant'";
		$ejec=pg_query($sigpa, $sql);

		$sql="update pertenece set ci='$ci' where ci='$ci_ant'";
		$ejec=pg_query($sigpa, $sql);

		echo 1;
	}

	else
	{
		echo "Ocurrio un error durante la modificacion, vuelva a intentarlo";
	}
?>
