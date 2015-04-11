<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		exit();
	}

	include "../../lib/conexion.php";

	extract($_POST);

	$sql="select * from uc where cuc='$cuc' and cc='$cc' and cm='$cm'";
	$ejec=pg_query($sigpa, $sql);

	$uc=pg_fetch_object($ejec);
?>

<h3 id="tit_editar"> <?= "$uc->d" ?> </h3>

<form name="editar_uc" OnSubmit="return guardar_editar()">
	Código: <br/>
	<span class="inputLength">
		<input type="text" name="cuc" <?= "value=\"$uc->cuc\"" ?> placeholder="Código UC" maxlength=15 title="Código de la unidad curricular" OnKeyUp="VAL.call(this, event, 'alf'); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
	</span> <span class="requerido">*</span><br /><br />

	Nombre: <br/>
	<span class="inputLength">
		<input type="text" name="d" <?= "value=\"$uc->d\"" ?> placeholder="Nombre UC" maxlength=60 title="Nombre de la unidad curricular" OnKeyUp="VAL.call(this, event, 'text'); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
	</span> <span class="requerido">*</span><br /><br />

	Trayecto: <br/>
	<select name="t" required="required">
		<option value="0" <?php if($uc->t==0) echo "selected=\"selected\""; ?>>Trayecto Inicial</option>
		<option value="1" <?php if($uc->t==1) echo "selected=\"selected\""; ?>>Trayecto I</option>
		<option value="2" <?php if($uc->t==2) echo "selected=\"selected\""; ?>>Trayecto II</option>
		<option value="3" <?php if($uc->t==3) echo "selected=\"selected\""; ?>>Trayecto III</option>
		<option value="4" <?php if($uc->t==4) echo "selected=\"selected\""; ?>>Trayecto IV</option>
	</select> <span class="requerido">*</span><br /><br />

	Trimestre: <br/>
	<select name="tr" OnChange="getID('nt').max=4-this.value;" required="required">
		<option value="1" <?php if($uc->tr==1) echo "selected=\"selected\""; ?>>Trimestre I</option>
		<option value="2" <?php if($uc->tr==2) echo "selected=\"selected\""; ?>>Trimestre II</option>
		<option value="3" <?php if($uc->tr==3) echo "selected=\"selected\""; ?>>Trimestre III</option>
	</select> <span class="requerido">*</span><br /><br />

	Número de trimestres: <br/>
	<input type="number" name="nt" <?= "value=\"".pg_affected_rows($ejec)."\"" ?> min=1 max=3 placeholder="Número de trimestres" maxlength=1 title="Número de trimestres" OnKeyUp="VAL.call(this, event, 'num')" required="required" />
	<span class="requerido">*</span><br /><br />

	Horas teóricas: <br/>
	<span class="inputLength">
		<input type="text" name="ht" <?= "value=\"$uc->ht\"" ?> placeholder="Horas teoricas" maxlength=2 title="Horas teoricas" OnKeyUp="VAL.call(this, event, 'num'); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
	</span> <span class="requerido">*</span><br /><br />

	Horas practicas: <br/>
	<span class="inputLength">
		<input type="text" name="hp" <?= "value=\"$uc->hp\"" ?> placeholder="Horas practicas" maxlength=2 title="Horas practicas" OnKeyUp="VAL.call(this, event, 'num'); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
	</span> <span class="requerido">*</span><br /><br />

	Eje: <br/>
	<select name="ce" required="required">

<?php
	$sql="select * from eje order by d";
	$ejec=pg_query($sigpa, $sql);

	while($eje=pg_fetch_object($ejec))
	{
		echo "<option value='$eje->ce'";

		if($uc->ce==$eje->ce)
			echo " selected=\"selected\"";

		echo ">$eje->d</option>";
	}
?>

	</select> <span class="requerido">*</span><br /><br />

	Tipo: <br/>
	<select name="lab" required="required">
		<option value="0" <?php if($uc->lab==0) echo "selected=\"selected\""; ?>>Aula</option>
		<option value="1" <?php if($uc->lab==1) echo "selected=\"selected\""; ?>>Laboratorio</option>
	</select> <span class="requerido">*</span><br /><br />

	<input type="hidden" name="cm" <?= "value=\"$cm\"" ?> />
	<input type="hidden" name="cc" <?= "value=\"$cc\"" ?> />
	<input type="hidden" name="cuc_ant" <?= "value=\"$uc->cuc\"" ?> />

	<input type="submit" value="Guardar" class="boton" />&nbsp;&nbsp;&nbsp;<input type="button" value="Cancelar" OnClick="cerrar_editar_uc()" class="boton" /><br /><br />
	<input type="button" value="Eliminar" <?= "OnClick=\"eliminar_uc('$cuc', '$cc', '$cm')\"" ?> class="boton" />
</form>