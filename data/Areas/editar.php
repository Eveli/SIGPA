<?php
		// Verificar que no se accede al archivo directamente con el navegador
	include "../../lib/verificar.php";

		// Si el nivel no es de Vicerrectorado no se permitira acceder al contenido
	if($_SESSION["n"]!=1)
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	$sql="select * from area where ca='$_GET[ca]'";
	$ejec=pg_query($sigpa, $sql);
	$a=pg_fetch_object($ejec);
?>

<form name="area" onSubmit="return guardar()">
	<h3>Editar Área</h3>

	<input type="hidden" name="ca_ant" value="<?= $a->ca; ?>" />

	<span class="inputLength">
		<input type="text" name="ca" value="<?= $a->ca; ?>" placeholder="Cod." maxlength=2 title="Código del área" style="width: 40px;" OnKeyUp="VAL.call(this, event, 'num', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
	</span> <span class="requerido">*</span><br /><br />

	<span class="inputLength">
		<input type="text" name="da" value="<?= $a->d; ?>" placeholder="Área" maxlength=50 title="Área" OnKeyUp="VAL.call(this, event, 'text', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
	</span> <span class="requerido">*</span><br /><br />

	<input type="submit" value="Guardar" class="boton" />&nbsp;&nbsp;&nbsp;<a href="?r=data/Areas/index.php"><input type="button" value="Cancelar" class="boton" /></a>
</form>

<script>
	function guardar()
	{
		var f=new FormData(document.area);

		var area=new ajax_req(function ()
		{
			if((this.statusText=="OK")&&(this.readyState==4))
			{
				if(this.responseText)
				{
					alert(this.responseText);
					window.location.href="?r=data/Areas/index.php";
				}

				else
				{
					alert("Ocurrio un error, vuelva a intentarlo");
				}
			}
		}, "data/Areas/modificar.php", "POST", f);

		return false;
	}
</script>