<?php
	session_start();

	require "../../lib/conexion.php";

	$sql="select s, cc from coordinacion where ci='$_SESSION[ci]'";
	$ejec=pg_query($sigpa, $sql);

	$cord=pg_fetch_object($ejec);

	extract($_POST);

	if($t==0)
		$tr=1;

	else if($t==5)
	{
		$t=0;
		$tr=2;
	}

	$sql="select p from carga order by p desc limit 1";
	$ejec=pg_query($sigpa, $sql);

	$p=pg_fetch_object($ejec);

	if($todos=="true")
	{
		$sql="
			select pro.ci ci, pro.n1 n1, pro.a1 a1, d.h-pro.h h
			from profesor pro
				join dedicacion d
					on d.ded=pro.ded
				join pertenece per
					on per.ci=pro.ci and per.cc='$cord->cc'
			where pro.c='$c' and pro.s='$cord->s' and pro.ci!='$_SESSION[ci]' and pro.h<d.h
			order by pro.a1, pro.n1
		";
	}

	else
	{
		$sql="
			select pro.ci ci, pro.n1 n1, pro.a1 a1, d.h-pro.h h
			from perfil per
				join profesor pro
					on pro.ci=per.ci and pro.c='$c' and pro.s='$cord->s'
				join dedicacion d
					on d.ded=pro.ded
			where cuc='$cuc'
			order by pro.a1, pro.n1
		";
	}

	$ejec=pg_query($sigpa, $sql);
?>

	<option value="">Profesor</option>

<?php
	while($prof=pg_fetch_object($ejec))
	{
		$sql="select ci from carga where cuc='$cuc' and ci='$prof->ci' and p='$p->p' and tr='$tr' and cm='$cm'";
		$ejec2=pg_query($sigpa, $sql);

		if(pg_affected_rows($ejec2))
			continue;

		echo "<option value='$prof->ci' id='$prof->ci' data-h='$prof->h'> $prof->a1 $prof->n1 ($prof->ci) </option>";
	}
?>