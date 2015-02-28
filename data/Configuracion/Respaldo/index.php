<?php
		// Verificar que no se accede al archivo directamente con el navegador
	@include "../../../lib/verificar.php";
?>

<table class="tab_index">
	<tr>
		<th colspan=3>RESPALDOS</th>
	</tr>
	<tr>
		<th> Fecha </th>
		<th colspan=2> Opciones </th>
	</tr>

	<tr>
		<td colspan=3 id="tr" style="text-align: center; cursor: pointer;" title="Haga click aqui para realizar un respaldo" OnClick="respaldar(this)">
			Respaldar
		</td>
	</tr>

<?php
	$carpeta=opendir("data/Configuracion/Respaldo/Respaldos/");

	while($archivo=readdir($carpeta))
	{
		if($archivo[0]!=".")
		{
?>

	<tr>
		<td><?= "$archivo" ?></td>
		<td><img src="css/img/carga.png" class="bt_opc" style="transform: rotate(180deg); -webkit-transform: rotate(180deg);" title="Restaurar" <?= "OnClick=\"restaurar(this, '$archivo')\"" ?> /></td>
		<td><img src="css/img/eliminar.png" class="bt_opc" title="Eliminar" <?= "OnClick=\"eliminar(this, '$archivo')\"" ?> /></td>
	</tr>

<?php
		}
	}
?>
</table>

<script>
	function respaldar(tr)
	{
		tr.innerHTML="<img src='css/img/cargando.gif' class='bt_opc' title='Respaldando..' />";
		
		var respaldo=new ajax_req(function ()
			{
				if((this.statusText=="OK")&&(this.readyState==4))
				{
					window.location.href=window.location.href;
				}
			}, "data/Configuracion/Respaldo/respaldar.php", "GET");
	}

	function restaurar(img, archivo)
	{
		if(!confirm("Realmente desea restaurar este respaldo?"))
			return false;

		img.src="css/img/cargando.gif";
		img.title="Restaurando..";

		var restaurar=new ajax_req(function ()
			{
				if((this.statusText=="OK")&&(this.readyState==4))
				{
					if((this.responseText[0]=='S')&&(this.responseText[1]=='E')&&(this.responseText[2]=='T'))
					{
						alert("Se restauró la base de datos con éxito");
						window.location.href=window.location.href;
					}
				}
			}, "data/Configuracion/Respaldo/restaurar.php", "POST", "archivo="+archivo);
	}

	function eliminar(img, archivo)
	{
		if(!confirm("Realmente desea eliminar este respaldo?"))
			return false;

		img.src="css/img/cargando.gif";
		img.title="Eliminando..";

		var tr=img.parentNode.parentNode;

		var eliminar=new ajax_req(function ()
			{
				if((this.statusText=="OK")&&(this.readyState==4))
				{
					tr.parentNode.removeChild(tr);
				}
			}, "data/Configuracion/Respaldo/eliminar.php", "POST", "archivo="+archivo);
	}
</script>