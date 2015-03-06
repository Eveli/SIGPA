<?php
		// Verificar que no se accede al archivo directamente con el navegador
	include "../../lib/verificar.php";

		// Si el nivel no es de Vicerrectorado no se permitira acceder al contenido
	if($_SESSION["n"]!=1)
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	$sql="select * from area order by d";
	$ejec=pg_query($sigpa, $sql);

	$ra=pg_affected_rows($ejec);
?>

<table class="tab_index">
	<tr>
		<th>
			Código
		</th>

		<th>
			Área
		</th>

		<th colspan="2">
			Acciones
		</th>
	</tr>

<?php
	if($ra==0)
	{
?>

	<tr>
		<td colspan="4">
			No hay áreas
		</td>
	</tr>

<?php
	}

	else
	{
		while($a=pg_fetch_object($ejec))
		{
?>

	<tr>
		<td>
			<?= $a->ca; ?>
		</td>

		<td>
			<?= $a->d; ?>
		</td>

		<td>
			<img src="css/img/editar.png" class="bt_opc" title="Editar" onClick="window.location.href='?r=data/Areas/editar.php&ca=<?= $a->ca; ?>'" />
		</td>

		<td>
			<img src="css/img/eliminar.png" class="bt_opc" title="Eliminar" onClick="eliminar(this, '<?= $a->ca; ?>')" />
		</td>
	</tr>

<?php
		}
	}
?>

	<tr>
		<td colspan="4" style="text-align: center;" title="Agregar un área">
			<a href="?r=data/Areas/agregar.php"><div>Nueva Área</div></a>
		</td>
	</tr>
</table>

<script>
	function eliminar(obj, ca)
	{
		if(!confirm("Realmente desea eliminar el área?"))
			return false;

		var area=new ajax_req(function ()
		{
			if((this.statusText=="OK")&&(this.readyState==4))
			{
				if(this.responseText)
				{
					obj.parentNode.parentNode.parentNode.removeChild(obj.parentNode.parentNode);
				}

				else
				{
					alert("Ocurrio un error, vuelva a intentarlo");
				}
			}
		}, "data/Areas/eliminar.php", "POST", "ca="+ca);
	}
</script>