<?php
	$ci=$_GET["ci"];
?>
<form method="POST" action="/SIGPA/data/Registro/Profesor/gdicta.php" name="dicta">
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

<div align="center"><input type="submit" value="Asignar" /> <a <?php echo "href='?r=data/Registro/Profesor/consultar.php&ci=$ci'" ?>><input type="button" value="Regresar" /></a></div>
</form>