<?php
	session_start();
	require "../../lib/conexion.php";

	extract($_POST);

	$sql="select cc, s from coordinacion where ci='$_SESSION[ci]'";
	$ejec=pg_query($sigpa, $sql);

	$cord=pg_fetch_object($ejec);

	$sql="select d, ht, hp from uc where cuc='$cuc'";
	$ejec=pg_query($sigpa, $sql);

	$uc=pg_fetch_object($ejec);
?>

<form name="carga" OnSubmit="return editar_carga()">
	<h3><?= "$uc->d<br/>($cuc)" ?></h3>

<?php
	$sql="
		select pro.n1 n1, pro.a1 a1, d.h-pro.h h
		from profesor pro
			join dedicacion d
				on d.ded=pro.ded
		where pro.ci='$ci'
	";
	$ejec=pg_query($sigpa, $sql);

	$prof=pg_fetch_object($ejec);
?>

	Profesor: <?= "$prof->n1 $prof->a1 ($ci)" ?><br/><br/>

	Secciones:

	<span id="secciones">

<?php
	$sql="select s, ht, hp from carga where cuc='$cuc' and ci='$ci' and p='$p' and tr='$tr' and cm='$cm'";
	$ejec=pg_query($sigpa, $sql);

	$carga=pg_fetch_object($ejec);

	$secC=explode("&nbsp;", $carga->s);

	for($i=0; $i<(count($secC)-1); ++$i)
	{
		$l=strlen($secC[$i]);
		$id=substr($secC[$i], $l-1, 1);
		$ht=$uc->ht;
		$hp=$uc->hp;

		if(strpos($secC[$i], "*"))
		{
			$ht*=1.5;
			$hp*=1.5;
			$ht=round($ht);
			$hp=round($hp);
		}

		if($id=="2")
		{
			$id=substr($secC[$i], $l-2, 1);
			$ht*=2;
			$hp*=2;
		}

		else if($id==")")
		{
			$id=substr($secC[$i], $l-3, 1);
			$hp*=2;
		}

		$secC[$id]="$secC[$i]/$ht-$hp";
	}

	$sql="select * from seccion order by id";
	$ejec=pg_query($sigpa, $sql);

	while($sec=pg_fetch_object($ejec))
	{
?>

		<label><input type="checkbox" name="sec[]" data-sec="<?= $sec->id; ?>" value="<?= $secC[$sec->id]; ?>" <?php if($secC[$sec->id]) echo "checked=\"checked\""; ?> OnChange="cuenta_editar.call(this)" /> <?= $sec->id; ?> </label>

<?php
	}
?>

	</span>

	<a title="Agregar una sección" onClick="document.carga.nsec.style.display='inline'">+</a>

	<input type="text" name="nsec" placeholder="Nueva sección" maxlength="1" style="display: none; width: 9em;" onChange="nSec(this.value)" />

	<input type="hidden" name="cuc" <?= "value='$cuc'"; ?> />
	<input type="hidden" name="ci" <?= "value='$ci'"; ?> />
	<input type="hidden" name="p" <?= "value='$p'"; ?> />
	<input type="hidden" name="uc_ht" <?= "value='$uc->ht'"; ?> />
	<input type="hidden" name="uc_hp" <?= "value='$uc->hp'"; ?> />
	<input type="hidden" name="ht" value="<?= $carga->ht ?>" />
	<input type="hidden" name="hp" value="<?= $carga->hp ?>" />

	<br /><br /><br/> Horas Disponibles: 
	<span class="horas" id="h" title="Horas disponibles"><?= $prof->h ?></span><br/>
	
	<style>
		.horas
		{
			width: 30px;

			font-size: 18pt;
			background: #0000cb;
			color: white;
			padding: 10px;
			border-radius: 10px;
		}
	</style>

	<br/><br/><input type="submit" value="Guardar" class="boton" id="bt_carga" />&nbsp;&nbsp;&nbsp;

	<input type="button" value="Cancelar" OnClick="cerrar_editar_carga()" class="boton" />
</form>