<?php
		// Verificar que no se accede al archivo directamente con el navegador
	@include "../../../lib/verificar.php";

	$sql="select * from usuario order by ci";
	$ejec=pg_query($sigpa, $sql);
?>

<table class="tab_index">
	<tr>
		<th>Usuario</th>
		<th>Nivel</th>
	</tr>

<?php
	while($usu=pg_fetch_object($ejec))
	{
?>

	<tr>
		<td><?= $usu->ci ?></td>
		<td>

<?php
		switch($usu->n)
		{
			case 1:
				echo "Vicerrectorado";
			break;

			case 2:
				echo "Coordinador";
			break;
		}
?>

		</td>
	</tr>

<?php
	}
?>

	<tr>
		<td colspan=2 style="text-align: center; color: #0000cb; cursor: pointer;" title="Crear un usuario" OnClick="abrir_usuario()">
			Nuevo Usuario
		</td>
	</tr>
</table>

<script>
	function abrir_usuario()
	{
		getID("usuario").style.animation="abrir_sesion 0.5s forwards";
		getID("usuario").style.WebkitAnimation="abrir_sesion 0.5s forwards";
	}

	function cerrar_usuario()
	{
		getID("usuario").style.animation="cerrar_sesion 0.5s forwards";
		getID("usuario").style.WebkitAnimation="cerrar_sesion 0.5s forwards";
	}

	function guardar()
	{
		var f=new FormData(document.usuario);

		var guardar=new ajax_req(function ()
		{
			if((this.statusText=="OK")&&(this.readyState==4))
			{
				if(this.responseText)
				{
					alert(this.responseText);
					window.location.href=window.location.href;
				}

				else
				{
					alert("Ocurrio un error, vuelva a intentarlo");
				}
			}
		}, "data/Configuracion/Usuarios/guardar.php", "POST", f);

		return false;
	}
</script>

<div class="falerta" id="usuario">
	<div class="cerrar_alerta" OnClick="cerrar_usuario()"></div>

	<div class="alerta" id="cuerpo_usuario">
		<form name="usuario" OnSubmit="return guardar()">
			<h3> Nuevo usuario </h3>

			<select name="n" required="required">
				<option value="">Nivel</option>
				<option value="1">Vicerrectorado</option>
			</select><br/><br/>

			<select name="ci" required="required">
				<option value="">Profesor</option>

<?php
		$sql="select ci, n1, a1 from profesor p order by a1, n1
		";
		$ejec=pg_query($sigpa, $sql);

		while($prof=pg_fetch_object($ejec))
		{
			echo "<option value='$prof->ci'>$prof->a1 $prof->n1 ($prof->ci)</option>";
		}
?>

			</select><br /><br />

			<span class="inputLength">
				<input type="password" name="pw" placeholder="Contraseña" maxlength=15 required="required" title="Ingrese su contraseña" OnKeyUp="VAL.call(this, event, 'alf'); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
			</span> <span class="requerido">*</span><br /><br />

			<span class="inputLength">
				<input type="text" name="r" placeholder="Recuperación" style="text-transform: none;" maxlength=50 required="required" title="Ingrese un texto de recuperacion" OnKeyUp="VAL.call(this, event, /[a-zA-Z0-9\s]/, 'Ingrese solo letras, números o un espacio consecutivo', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
			</span> <span class="requerido">*</span><br /><br />

			<input type="submit" value="Guardar" class="boton" />&nbsp;&nbsp;&nbsp;<input type="button" value="Cancelar" OnClick="cerrar_usuario()" class="boton" />

			<br /><br />
		</form>
	</div>
</div>