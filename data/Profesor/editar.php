<h3> Editar Profesor </h3>

<?php
	$sql="select * from profesor where ci='$_GET[ci]'";
	$ejec=pg_query($sigpa, $sql);

	$prof=pg_fetch_object($ejec);
?>	

	<form name="profesor" method="POST" OnSubmit="return submit_profesor()">
		Cedula:<br/>
		<span class="inputLength">
			<input type="text" name="ci" placeholder="CI" maxlength=8 title="Ingrese su cédula" OnKeyUp="VAL.call(this, event, 'num'); inputLength.call(this, true); verificar.call(this, true)" OnChange="verificar.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" <?= "value=\"$prof->ci\"" ?> required="required" />
		</span> <span class="requerido">*</span><div id="ex_ci_nprof" style="padding-top: 10px; color: red; display: none;">Ya existe un profesor con esa cedula</div><br /><br />
		
		<input type="hidden" name="ci_ant" placeholder="CI" <?= "value=\"$prof->ci\"" ?> />

		Primer Nombre:<br/>
		<span class="inputLength">
			<input type="text" name="n1" <?= "value=\"$prof->n1\"" ?> placeholder="Primer Nombre" maxlength=30 title="Primer Nombre" OnKeyUp="VAL.call(this, event, /[a-zA-Z\sáéíóúÁÉÍÓÚñÑ']/, 'Use solo letras, apostrofes o un espacio concecutivo', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
		</span> <span class="requerido">*</span><br /><br />

		Segundo nombre:<br/>
		<span class="inputLength">
			<input type="text" name="n2" <?= "value=\"$prof->n2\"" ?> placeholder="Segundo Nombre" maxlength=30 title="Segundo Nombre" OnKeyUp="VAL.call(this, event, /[a-zA-Z\sáéíóúÁÉÍÓÚñÑ']/, 'Use solo letras, apostrofes o un espacio concecutivo', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
		</span><br /><br />

		Primer apellido<br/>
		<span class="inputLength">
			<input type="text" name="a1" <?= "value=\"$prof->a1\"" ?> placeholder="Primer Apellido" maxlength=30 title="Primer Apellido" OnKeyUp="VAL.call(this, event, /[a-zA-Z\sáéíóúÁÉÍÓÚñÑ']/, 'Use solo letras, apostrofes o un espacio concecutivo', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
		</span> <span class="requerido">*</span><br /><br />

		Segundo apellido<br/>
		<span class="inputLength">
			<input type="text" name="a2" <?= "value=\"$prof->a2\"" ?> placeholder="Segundo Apellido" maxlength=30 title="Segundo Apellido" OnKeyUp="VAL.call(this, event, /[a-zA-Z\sáéíóúÁÉÍÓÚñÑ']/, 'Use solo letras, apostrofes o un espacio concecutivo', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
		</span><br /><br />

		Condición:<br/>
		<select name="c" required="required">

<?php
	$sql="select * from condicion order by d";
	$ejec=pg_query($sigpa, $sql);

	while($c=pg_fetch_object($ejec))
	{
		echo "<option value='$c->c'";

		if($c->c==$prof->c)
		{
			echo " selected=selected";
		}

		echo ">$c->d</option>";
	}
?>

		</select> <span class="requerido">*</span><br /><br />

		Categoría:<br/>
		<select name="cat" required="required">

<?php
	$sql="select cat, d from categoria order by d";
	$ejec=pg_query($sigpa, $sql);

	while($cat=pg_fetch_object($ejec))
	{
		echo "<option value='$cat->cat'";

		if($cat->cat==$prof->cat)
		{
			echo " selected=selected";
		}

		echo ">$cat->d</option>";
	}
?>
		</select> <span class="requerido">*</span><br /><br />

		Dedicación:<br/>
		<select name="ded" required="required">

<?php
	$sql="select ded, d from dedicacion order by d";
	$ejec=pg_query($sigpa, $sql);

	while($ded=pg_fetch_object($ejec))
	{
		echo "<option value='$ded->ded'";

		if($ded->ded==$prof->ded)
		{
			echo " selected=selected";
		}

		echo ">$ded->d</option>";
	}
?>

		</select> <span class="requerido">*</span><br /><br />

		Profesión:<br/>
		<select name="cp" required="required">

<?php
	$sql="select cp, d from profesion order by d";
	$ejec=pg_query($sigpa, $sql);

	$sql="select cp from estudios where ci='$prof->ci'";
	$ejec2=pg_query($sigpa, $sql);

	$profesion=pg_fetch_object($ejec2);

	while($cp=pg_fetch_object($ejec))
	{
		echo "<option value='$cp->cp'";

		if($cp->cp==$profesion->cp)
		{
			echo " selected=selected";
		}

		echo ">$cp->d</option>";
	}
?>

		</select> <span class="requerido">*</span><br /><br />

		Correo electrónico:<br/>
		<span class="inputLength">
			<input type="text" name="ce" <?= "value=\"$prof->ce\"" ?> placeholder="Correo" maxlength=80 title="Correo" OnKeyUp="VAL.call(this, event, /[a-zA-Z0-9@._-]/, 'Siga el esquema abc123@ejemplo.com', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
		</span><br /><br />

		Teléfono fijo:<br/>
		<span class="inputLength">
			<input type="text" name="tf" <?= "value=\"$prof->tf\"" ?> placeholder="Teléfono Fijo" maxlength=30 title="Teléfono Fijo" OnKeyUp="VAL.call(this, event, 'num'); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
		</span><br /><br />

		Teléfono movil:<br/>
		<span class="inputLength">
			<input type="text" name="tm" <?= "value=\"$prof->tm\"" ?> placeholder="Teléfono Movil" maxlength=30 title="Teléfono Movil" OnKeyUp="VAL.call(this, event, 'num'); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
		</span>

		<br /><br />
		<input type="submit" value="Guardar" title="Guardar cambios" class="boton" />&nbsp;&nbsp;&nbsp;<input type="button" value="Regresar" OnClick=location="?r=data/Profesor/index.php" title="Volver a la lista de profesores" class="boton" />
		<br /><br />
	</form>

	<script>
		function submit_profesor()
		{
			var f=new FormData(document.profesor);

			var profesor=new ajax_req(function ()
			{
				if((this.statusText=="OK")&&(this.readyState==4))
				{
					if(this.responseText==1)
					{
						alert("Se modificó el profesor");
						window.location.href="?r=data/Profesor/index.php";
					}

					else
					{
						alert(this.responseText);
					}
				}
			}, "data/Profesor/guardar.php", "POST", f);

			return false;
		}
	</script>