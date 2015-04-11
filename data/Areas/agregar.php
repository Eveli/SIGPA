<form name="area" onSubmit="return guardar()">
	<h3>Agregar área</h3>

	<span class="inputLength">
		<input type="text" name="ca" placeholder="Cod." maxlength=2 title="Código del área" style="width: 40px;" OnKeyUp="VAL.call(this, event, 'num', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
	</span> <span class="requerido">*</span><br /><br />

	<span class="inputLength">
		<input type="text" name="da" placeholder="Área" maxlength=50 title="Área" OnKeyUp="VAL.call(this, event, 'text', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
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
		}, "data/Areas/guardar.php", "POST", f);

		return false;
	}
</script>