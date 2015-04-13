<h3> Nuevo Profesor </h3>

	<form name="profesor" method="POST" OnSubmit="return submit_profesor()">
		<span class="inputLength">
			<input type="text" name="ci" placeholder="CI" maxlength=8 title="Ingrese su cédula" OnKeyUp="VAL.call(this, event, 'num'); inputLength.call(this, true); verificar.call(this, true)" OnChange="verificar.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
		</span> <span class="requerido">*</span><div id="ex_ci_nprof" style="padding-top: 10px; color: red; display: none;">Ya existe un profesor con esa cedula<br><a OnClick="agregar()">Haga click aqui si desea agregarlo a esta carrera</a><div id="carga"></div></div><br /><br />

		<span class="inputLength">
			<input type="text" name="n1" placeholder="Primer Nombre" maxlength=30 title="Primer Nombre" OnKeyUp="VAL.call(this, event, /[a-zA-Z\sáéíóúÁÉÍÓÚñÑ']/, 'Use solo letras, apostrofes o un espacio concecutivo', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
		</span> <span class="requerido">*</span><br /><br />

		<span class="inputLength">
			<input type="text" name="n2" placeholder="Segundo Nombre" maxlength=30 title="Segundo Nombre" OnKeyUp="VAL.call(this, event, /[a-zA-Z\sáéíóúÁÉÍÓÚñÑ']/, 'Use solo letras, apostrofes o un espacio concecutivo', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
		</span><br /><br />

		<span class="inputLength">
			<input type="text" name="a1" placeholder="Primer Apellido" maxlength=30 title="Primer Apellido" OnKeyUp="VAL.call(this, event, /[a-zA-Z\sáéíóúÁÉÍÓÚñÑ']/, 'Use solo letras, apostrofes o un espacio concecutivo', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
		</span> <span class="requerido">*</span><br /><br />

		<span class="inputLength">
			<input type="text" name="a2" placeholder="Segundo Apellido" maxlength=30 title="Segundo Apellido" OnKeyUp="VAL.call(this, event, /[a-zA-Z\sáéíóúÁÉÍÓÚñÑ']/, 'Use solo letras, apostrofes o un espacio concecutivo', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
		</span><br /><br />

		<select name="c" required="required">
			<option value="">Condición</option>

<?php
	$sql="select * from condicion order by d";
	$ejec=pg_query($sigpa, $sql);

	while($c=pg_fetch_object($ejec))
	{
		echo "<option value='$c->c'>$c->d</option>";
	}
?>

		</select> <span class="requerido">*</span><br /><br />

		<select name="cat" required="required">
			<option value="">Categoría</option>

<?php
	$sql="select cat, d from categoria order by d";
	$ejec=pg_query($sigpa, $sql);

	while($cat=pg_fetch_object($ejec))
	{
		echo "<option value='$cat->cat'>$cat->d</option>";
	}
?>
		</select> <span class="requerido">*</span><br /><br />

		<select name="ded" required="required">
			<option value="">Dedicación</option>

<?php
	$sql="select ded, d from dedicacion order by d";
	$ejec=pg_query($sigpa, $sql);

	while($ded=pg_fetch_object($ejec))
	{
		echo "<option value='$ded->ded'>$ded->d</option>";
	}
?>

		</select> <span class="requerido">*</span><br /><br />

		<select name="cp" required="required">
			<option value="">Profesión</option>

<?php
	$sql="select cp, d from profesion order by d";
	$ejec=pg_query($sigpa, $sql);

	while($cp=pg_fetch_object($ejec))
	{
		echo "<option value='$cp->cp'>$cp->d</option>";
	}
?>

		</select> <span class="requerido">*</span><br /><br />

		<label><input type="radio" name="re" value="Esp."> Esp.</label>
		<label><input type="radio" name="re" value="MSc."> MSc.</label>
		<label><input type="radio" name="re" value="PhD."> PhD.</label><br/><br/>

		<span class="inputLength">
			<input type="text" name="ce" placeholder="Correo" maxlength=80 title="Correo" OnKeyUp="VAL.call(this, event, /[a-zA-Z0-9@._-]/, 'Siga el esquema abc123@ejemplo.com', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
		</span><br /><br />

		<span class="inputLength">
			<input type="text" name="tf" placeholder="Teléfono Fijo" maxlength=30 title="Teléfono Fijo" OnKeyUp="VAL.call(this, event, 'num'); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
		</span><br /><br />

		<span class="inputLength">
			<input type="text" name="tm" placeholder="Teléfono Movil" maxlength=30 title="Teléfono Movil" OnKeyUp="VAL.call(this, event, 'num'); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
		</span>

		<br /><br />
		<input type="submit" value="Registrar" title="Agregar nuevo profesor" class="boton" />&nbsp;&nbsp;&nbsp;<input type="button" value="Cancelar" OnClick=location="?r=data/Profesor/index.php" title="Volver a la lista de profesores" class="boton" />
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
					if(this.responseText)
					{
						alert(this.responseText);
					}

					else
					{
						alert("Se agrego el profesor");
						window.location.href="?r=data/Profesor/index.php";
					}
				}
			}, "data/Profesor/agregar.php", "POST", f);

			return false;
		}

		function agregar()
		{
			getID("carga").innerHTML="Agregando..";
			var ci=document.profesor.ci.value;

			var npertenece=new ajax_req(function ()
			{
				if((this.statusText=="OK")&&(this.readyState==4))
				{
					if(!this.responseText)
					{
						alert("Se agrego satisfactoriamente");
						window.location.href="?r=data/Profesor/index.php";
					}

					else
						getID("carga").innerHTML="Ocurrio un error, es probable que ya exista en esta carrera y si no es así vuelva a intentarlo";
				}
			}, "data/Profesor/npertenece.php", "POST", "ci="+ci);
		}
	</script>