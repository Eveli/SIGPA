<?php
	$ci=$_GET["ci"];
	$cuc=$_GET["cuc"];
?>

<form method="POST" action="/SIGPA/data/Registro/Profesor/gcompletar_uc.php" name="profesor">
	<fieldset>
		<legend> Unidad Curricular </legend>

		<br />

		Horas Teoricas: <input type="text" name="ht" /><br />
		Horas Practicas: <input type="text" name="hp" /><br />
		Trimestre en que inicia: <input type="text" name="ti" /><br />

		<br />
	</fieldset>

	<br /><br />

	<input type="hidden" name="ci" <?php echo "value=$ci"; ?> />
	<input type="hidden" name="cuc" <?php echo "value=$cuc"; ?> />

	<div align="center"><input type="submit" value="Completar" /> <a <?php echo "href='?r=data/Registro/Profesor/dicta.php&ci=$ci'" ?>><input type="button" value="Regresar" /></a></div>
</form>

<script language="javascript">
	alert("La unidad curricular no ha completado con su registro, para asignarla debe indicar los siguentes datos");
</script>