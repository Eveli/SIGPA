<?php
	$ci=$_GET["ci"];

	$sql="select c, d from profesor where ci='$ci'";
	$ejec=pg_query($sigpa, $sql);

	$p=pg_fetch_object($ejec);
?>

<form method="POST" action="/SIGPA/data/Registro/Profesor/gcompletar.php" name="profesor">
	<fieldset>
		<legend> Categoria y Dedicación </legend>

		<br />

		Categoria: 

		<select name="cat" required>
			<option value=""> Seleccione.. </option>

<?php
	$sql="select * from categoria order by d";
	$ejec=pg_query($sigpa, $sql);

	while($c=pg_fetch_object($ejec))
	{
?>

			<option <?php echo "value='$c->cc'"; if($p->c==$c->cc) echo "selected='selected'"; ?>> <?php echo $c->d; ?> </option>

<?php
	}
?>

		</select>

		<br /><br />

		Dedicación: 

		<select name="ded" required>
			<option value=""> Seleccione.. </option>

<?php
	$sql="select * from dedicacion order by d";
	$ejec=pg_query($sigpa, $sql);

	while($d=pg_fetch_object($ejec))
	{
?>

			<option <?php echo "value='$d->cd'"; if($p->d==$d->cd) echo "selected='selected'"; ?>> <?php echo $d->d; ?> </option>

<?php
	}
?>
		</select>

		<br /><br />
	</fieldset>

	<br /><br />
	
	<fieldset>
		<legend> Asignación </legend>

		<br /><b>Unidad Curricular:</b> 

		<select name="cuc" required>
			<option value=""> Seleccione.. </option>

<?php
	/* Creacion de la clausula */

	$sql="select cuc from dicta where ci='$ci'";
	$ejec=pg_query($sigpa, $sql);

	$n=pg_affected_rows($ejec);

	if($n>0)
	{
		$clausula=" and";

		while($uc=pg_fetch_object($ejec))
		{
			$clausula=$clausula." cod_asig!='$uc->cuc' and";
		}

		$clausula=substr($clausula, 0, -4);
	}

	/* ----------------------------------- */

	$sql="select cod_carrera cc, des_carrera dc from carreras order by dc";
	$ejec=pg_query($poli, $sql);

	while($c=pg_fetch_object($ejec))
	{
?>

			<option> </option>

			<optgroup <?php echo "label='$c->dc'"; ?>>

<?php
		$sql="select cod_asig cuc, nom_asig nuc from asignaturas where cod_carrera='$c->cc' $clausula order by nuc";
		$ejec2=pg_query($poli, $sql);

		while($uc=pg_fetch_object($ejec2))
		{
?>

				<option <?php echo "value=$uc->cuc"; ?>> <?php echo "$uc->cuc - $uc->nuc"; ?> </option>

<?php
		}
?>

			</optgroup>

<?php
	}
?>

		</select><br /><br />
	</fieldset><br /><br />

	<input type="hidden" name="ci" <?php echo "value=$ci"; ?> />

	<div align="center"><input type="submit" value="Completar" /> <a <?php echo "href='?r=data/Registro/Profesor/consultar.php&ci=$ci'" ?>><input type="button" value="Regresar" /></a></div>
</form>