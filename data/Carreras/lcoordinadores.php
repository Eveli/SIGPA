<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	$cc=$_POST["cc"];
	$s=$_POST["s"];

	$sql="
		select
			p.ci ci,
			p.n1 n,
			p.a1 a
		from pertenece per
			join profesor p
				on p.ci=per.ci and p.s='$s' and cord='no'
		where per.cc='$cc'
		order by n, a
	";
	$ejec=pg_query($sigpa, $sql);

	$ra=pg_affected_rows($ejec);

	if($ra==0)
	{
?>

	<option value=""> No hay Profesores </option>

<?php
	}

	else
	{
?>

	<option value=""> Seleccione un Profesor </option>

<?php
		while($p=pg_fetch_object($ejec))
		{
			echo "<option value='$p->ci'> $p->n $p->a ($p->ci) </option>";
		}
	}
?>