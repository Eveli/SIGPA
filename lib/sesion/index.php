<?php
		// Verificar que no se accede al archivo directamente con el navegador
	@include "../verificar.php";

	require "info.php";
?>

<style type="text/css">
	input,
	select
	{
		margin-top: 15px;
	}
</style>

	<!-- Formulario de Inicio de Sesión -->
<form method="POST" action="lib/sesion/ini.php" name="ini" style="display: none;">
	<h3> Iniciar Sesión </h3>

	<span class="inputLength">
		<input type="text" name="ci" placeholder="CI" maxlength=8 title="Ingrese su cédula" OnKeyUp="VAL.call(this, event, 'num'); inputLength.call(this, true); verificar.call(this);" OnChange="verificar.call(this);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
	</span><div id="ex_ci_ini" style="padding-top: 10px; color: red; display: none;">No existe ese usuario</div><br />

	<span class="inputLength">
		<input type="password" name="pw" placeholder="Contraseña" maxlength=15 title="Ingrese su contraseña" OnKeyUp="VAL.call(this, event, 'alf'); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
	</span><br />

	<input type="hidden" name="r" <?= "value='$_SERVER[REQUEST_URI]'" ?> />

	<input type="submit" id="subini" class="boton" value="Entrar" disabled="disabled" />&nbsp;&nbsp;&nbsp;<input type="button" class="boton" value="Cancelar" OnClick="document.ini.style.display='none'; getID('contenidoInfo').style.display='block'" />

	<br /><br />

	<a OnClick="mostrar_sesion(document.ini, document.rec)">Cambiar Constraseña</a>
</form>

	<!-- Formulario para el Cambio de Contraseña -->
<form method="POST" action="lib/sesion/rec.php" name="rec" style="display: none;">
	<h3> Cambiar Contraseña </h3>

	<span class="inputLength">
		<input type="text" name="ci" placeholder="CI" maxlength=8 title="Ingrese su cédula" OnKeyUp="VAL.call(this, event, 'num'); inputLength.call(this, true); verificar.call(this);" OnChange="verificar.call(this);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
	</span><div id="ex_ci_rec" style="padding-top: 10px; color: red; display: none;">No existe ese usuario</div><br />

	<span class="inputLength">
		<input type="text" name="r" placeholder="Texto de Recuperación" maxlength=50 title="Este texto le permitira cambiar su contraseña, por favor no lo olvide" OnKeyUp="VAL.call(this, event, 'alf', true); inputLength.call(this, true);" OnChange="comparar(this.parentNode.parentNode);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
	</span><br />

	<span class="inputLength">
		<input type="password" name="pw" placeholder="Contraseña" maxlength=15 title="Ingrese su contraseña" OnKeyUp="VAL.call(this, event, 'alf'); inputLength.call(this, true); comparar(this.parentNode.parentNode);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
	</span><br />

	<span class="inputLength">
		<input type="password" name="rpw" placeholder="Repetir Contraseña" maxlength=15 title="Repita su contraseña" OnKeyUp="VAL.call(this, event, 'alf'); inputLength.call(this, true); comparar(this.parentNode.parentNode);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
	</span><br /><br />

	<input type="submit" id="subrec" value="Cambiar" class="boton" disabled="disabled" />&nbsp;&nbsp;&nbsp;<input type="button" class="boton" value="Cancelar" OnClick="mostrar_sesion(document.rec, document.ini)" />

	<br />
</form>

<script>
		// Mostrar/Ocultar los formularios de inicio, registro y cambio de contraseña
	function mostrar_sesion(fo, fd)
	{
			// Ocultar el formulario de origen
		fo.style.display="none";

			// Mostrar el formulario al que se quiere acceder
		fd.style.display="block";
	}

		// Comparar contraseñas
	function comparar(f)
	{
		if(f.pw.value!=f.rpw.value)
			f.rpw.style.border="2px solid red";

		else
			f.rpw.noattr("style");
	}
</script>