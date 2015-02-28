<?php
	session_start();

		// Invocacion de las conexiones
	require "../../lib/conexion.php";

	extract($_POST);

	if($t==0)
	{
		$tr=1;
	}

	$sql="select p from carga where order by p desc limit 1";
	$ejec=pg_query($sigpa, $sql);

	$p=pg_fetch_object($ejec);

	$sql="select cc, s from coordinacion where ci='$_SESSION[ci]'";
	$ejec=pg_query($sigpa, $sql);

	$cord=pg_fetch_object($ejec);

	$sql="select cuc, d from uc where t='$t' and tr='$tr' and cc='$cord->cc' and cm='$cm' order by d";
	$ejec=pg_query($sigpa, $sql);

	while($uc=pg_fetch_object($ejec))
	{
		$sql="
			select p.ci ci, p.a1 a1, p.n1 n1, c.ht+c.hp h, c.s s
			from carga c
				join profesor p
					on p.ci=c.ci
			where c.cuc='$uc->cuc' and c.cm='$cm' and c.tr='$tr' and c.sup is null
		";
		$ejec2=pg_query($sigpa, $sql);
		$ra=pg_affected_rows($ejec2);
		$ra+=2;
?>

<tr>
	<td <?= "rowspan=\"$ra\""; ?> > <?= $uc->d ?> </td>
</tr>

<?php
		

		while($prof=pg_fetch_object($ejec2))
		{
?>

<tr>
	<td>
		<a <?= "OnClick=\"abrir_carga('$prof->ci', '$cord->cc')\""; ?> title="Haga click aqui para ver toda la carga de este profesor"> <?= "$prof->n1 $prof->a1 </a>" ?>
	</td>

	<td>
		<?= $prof->s; ?>
	</td>

	<td style="text-align: center;">
		<?= "<img src=\"css/img/eliminar.png\" class=\"bt_opc\" title=\"Eliminar esta carga del profesor\" OnClick=\"eliminar(this, '$prof->ci', '$uc->cuc', '$p->p', '$prof->h')\" />"; ?>
	</td>
</tr>
 
<?php
		}
?>

<tr>
	<td colspan="3" style="text-align: center;">
		<a <?= "OnClick=\"abrir_asig('$uc->cuc', '$cm')\""; ?> title="Haga click aqui para asignar un profesor a esta unidad curricular">Asignar</a>
	</td>
</tr>

<?php
	}
?>