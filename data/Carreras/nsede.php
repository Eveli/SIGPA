<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		exit();
	}

	include "../../lib/conexion.php";

	extract($_POST);

	if($s)
	{
?>

<form name="coord" OnSubmit="return guardar(true)">
	<h3> Cambiar Coordinador </h3>

	<select name="ci" required="required">

<?php
		$sql="
			select p.ci, p.n1, p.a1
			from profesor p
				join pertenece pe
					on pe.ci=p.ci and pe.cc='$cc'
			where p.ci!='$ci' and p.s='$s' order by a1, n1
		";
		$ejec=pg_query($sigpa, $sql);

		while($prof=pg_fetch_object($ejec))
		{
			echo "<option value='$prof->ci'>$prof->a1 $prof->n1 ($prof->ci)</option>";
		}
?>

	</select>

	<input type="hidden" name="cc" <?= "value=\"$cc\"" ?> />
	<input type="hidden" name="s" <?= "value=\"$s\"" ?> />
	<input type="hidden" name="ci_ant" <?= "value=\"$ci\"" ?> />
	<input type="hidden" name="mod" value="1" />

	<br /><br />

	<input type="submit" value="Cambiar" class="boton" />&nbsp;&nbsp;&nbsp;<input type="button" value="Cancelar" OnClick="cerrar_asig()" class="boton" />

	<br /><br />
</form>

<?php
	}

	else
	{
?>

<form name="nsede" OnSubmit="return guardar()">
	<h3> Sede </h3>

	<select name="s" required="required">
		<option value="">Sede</option>

<?php
		$sql="select s from coordinacion where cc='$cc'";
		$ejec=pg_query($sigpa, $sql);

		if(pg_affected_rows($ejec)>0)
		{
			$scord=pg_fetch_object($ejec);

			$where="where s!='$scord->s'";
		
			while($scord=pg_fetch_object($ejec))
			{
				$where.=" and s!='$scord->s'";
			}
		}

		$sql="select * from sede $where";
		$ejec=pg_query($sigpa, $sql);

		while($s=pg_fetch_object($ejec))
		{
			echo "<option value='$s->s'>$s->d</option>";
		}
?>

	</select> <span class="requerido">*</span><br /><br />

	<h3> Coordinador </h3>

	<span class="inputLength">
		<input type="text" name="ci" placeholder="CI" maxlength=8 required="required" title="Ingrese su cédula" OnKeyUp="VAL.call(this, event, 'num'); inputLength.call(this, true); verificar.call(this, true)" OnChange="verificar.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
	</span> <span class="requerido">*</span><div id="ex_ci_nprof" style="padding-top: 10px; color: red; display: none;">Ya existe un profesor con esa cedula</div><br /><br />

	<span class="inputLength">
		<input type="text" name="n1" placeholder="Primer Nombre" required="required" maxlength=30 title="Primer Nombre" OnKeyUp="VAL.call(this, event, /[a-zA-Z\sáéíóúÁÉÍÓÚñÑ']/, 'Use solo letras, apostrofes o un espacio concecutivo', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
	</span> <span class="requerido">*</span><br /><br />

	<span class="inputLength">
		<input type="text" name="n2" placeholder="Segundo Nombre" maxlength=30 title="Segundo Nombre" OnKeyUp="VAL.call(this, event, /[a-zA-Z\sáéíóúÁÉÍÓÚñÑ']/, 'Use solo letras, apostrofes o un espacio concecutivo', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
	</span><br /><br />

	<span class="inputLength">
		<input type="text" name="a1" placeholder="Primer Apellido" required="required" maxlength=30 title="Primer Apellido" OnKeyUp="VAL.call(this, event, /[a-zA-Z\sáéíóúÁÉÍÓÚñÑ']/, 'Use solo letras, apostrofes o un espacio concecutivo', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
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
		<option value="">Categoria</option>

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

	<span class="inputLength">
		<input type="text" name="ce" placeholder="Correo" maxlength=80 title="Correo" OnKeyUp="VAL.call(this, event, /[a-zA-Z0-9@._-]/, 'Siga el esquema abc123@ejemplo.com', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
	</span><br /><br />

	<span class="inputLength">
		<input type="text" name="tf" placeholder="Telefono Fijo" maxlength=30 title="Telefono Fijo" OnKeyUp="VAL.call(this, event, 'num'); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
	</span><br /><br />

	<span class="inputLength">
		<input type="text" name="tm" placeholder="Telefono Movil" maxlength=30 title="Telefono Movil" OnKeyUp="VAL.call(this, event, 'num'); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
	</span>

	<input type="hidden" name="cc" <?= "value=\"$cc\"" ?> />

	<br /><br />

	<input type="submit" value="Crear" class="boton" />&nbsp;&nbsp;&nbsp;<input type="button" value="Cancelar" OnClick="cerrar_asig()" class="boton" />

	<br /><br />
</form>

<?php
	}
?>