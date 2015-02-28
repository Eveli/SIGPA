<?php
	$ci=$_GET["ci"];

	$sql="select c, d from profesor where ci='$ci'";
	$ejec=pg_query($sigpa, $sql);

	$p=pg_fetch_object($ejec);
?>

<form method="POST" action="/SIGPA/data/Registro/Profesor/cambiar.php" name="profesor">
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

	<input type="hidden" name="ci" <?php echo "value=$ci"; ?> />

	<div align="center"><input type="submit" value="Guardar" /> <a <?php echo "href='?r=data/Registro/Profesor/consultar.php&ci=$ci'" ?>><input type="button" value="Regresar" /></a></div>
</form>