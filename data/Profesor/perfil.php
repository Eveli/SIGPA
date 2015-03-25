<h3> Perfil Académico </h3>

<?php
	$sql="select n1, n2, a1, a2 from profesor where ci='$_GET[ci]'";
	$ejec=pg_query($sigpa, $sql);

	$prof=pg_fetch_object($ejec);

	echo "$prof->n1 $prof->n2 $prof->a1 $prof->a2";
?>

<br/><br/>
<table class="tab_index">
	<tr>
		<th>
			Unidad Curricular
		</th>

		<th>
			Opciones
		</th>
	</tr>

<?php
	$sql="
		select p.cuc cuc, uc.d d
		from perfil p
			join uc
				on uc.cuc=p.cuc and uc.cc=(select cc from coordinacion where ci='$_SESSION[ci]')
		where p.ci='$_GET[ci]'
		group by p.cuc, uc.d
	";
	$ejec=pg_query($sigpa, $sql);

	$where="where cc=(select cc from coordinacion where ci='$_SESSION[ci]')";

	if(pg_affected_rows($ejec))
	{
		while($perf=pg_fetch_object($ejec))
		{
?>

	<tr>
		<td>
			<?= "$perf->d" ?>
		</td>

		<td style="text-align: center;">
			<img src="css/img/eliminar.png" class="bt_opc" title="Eliminar unidad curricular del perfil" <?= "OnClick=\"eliminar('$_GET[ci]', '$perf->cuc')\"" ?> />
		</td>
	</tr>

<?php
			$where.=" and cuc!='$perf->cuc'";
		}
	}

	else
	{
?>

	<tr>
		<td colspan=2 style="text-align: center; color:red;">
			No tiene un perfil definido
		</td>
	</tr>

<?php
	}
?>

</table>

<br /><br />
<input type="button" value="Agregar" title="Agregar una unidad curricular al perfil del profesor" class="boton" OnClick="abrir_nperfil()" />&nbsp;&nbsp;&nbsp;<input type="button" value="Regresar" OnClick=location="?r=data/Profesor/index.php" title="Volver a la lista de profesores" class="boton" />
<br />

<div class="falerta" id="nperfil">
	<div class="cerrar_alerta" OnClick="cerrar_nperfil()">
	</div>

	<div class="alerta">
		<h3> Nuevo perfil </h3>

		<form name="perfil">
			<select name="uc">
				<option value=""> Seleccione.. </option>

<?php
	$sql="select cuc, d from uc $where group by cuc, d, t order by d";
	$ejec=pg_query($sigpa, $sql);

	while($uc=pg_fetch_object($ejec))
	{
?>

				<option <?= "value=\"$uc->cuc\"" ?> > <?= "$uc->d" ?> </option>

<?php
	}
?>

			</select>

			<input type="hidden" name="ci" <?= "value=\"$_GET[ci]\"" ?> />

			<br /><br />

			<input type="button" value="Guardar" class="boton" OnClick="guardar()" />&nbsp;&nbsp;&nbsp;<input type="button" value="Cancelar" OnClick="cerrar_nperfil()" class="boton" />
		</form>
	</div>
</div>

<script>
	function abrir_nperfil()
	{
		getID("nperfil").style.animation="abrir_sesion 0.5s forwards";
		getID("nperfil").style.WebkitAnimation="abrir_sesion 0.5s forwards";
	}

	function cerrar_nperfil()
	{
		getID("nperfil").style.animation="cerrar_sesion 0.5s forwards";
		getID("nperfil").style.WebkitAnimation="cerrar_sesion 0.5s forwards";
	}

	function guardar()
	{
		if(document.perfil.uc.value=="")
		{
			alert("Debe seleccionar una unidad curricular");
			return false;
		}

		var f=new FormData(document.perfil);

		var perfil=new ajax_req(function ()
		{
			if((this.statusText=="OK")&&(this.readyState==4))
			{
				if(!this.responseText)
				{
					window.location.href=window.location.href;
				}

				else
				{
					alert(this.responseText);
				}
			}
		}, "data/Profesor/guardar_perfil.php", "POST", f);
	}

	function eliminar(ci, cuc)
	{
		var eliminar=new ajax_req(function ()
		{
			if((this.statusText=="OK")&&(this.readyState==4))
			{
				if(this.responseText==1)
				{
					window.location.href=window.location.href;
				}

				else
				{
					alert(this.responseText);
				}
			}
		}, "data/Profesor/eliminar.php", "POST", "ci="+ci+"&cuc="+cuc);
	}
</script>