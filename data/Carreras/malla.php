<h3> Nueva Malla </h3>

<form name="malla" OnSubmit="return guardar()">
	<input type="hidden" name="cc" <?= "value=\"$_GET[cc]\"" ?> />

	<span class="inputLength">
		<input type="text" name="cm" placeholder="Versión" maxlength=2 style="width: 5em;" title="Versión de la malla curricular" OnKeyUp="VAL.call(this, event, 'num'); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
	</span> <span class="requerido">*</span><br /><br />

	<input type="submit" value="Crear" class="boton" />&nbsp;&nbsp;&nbsp;<a <?= "href=\"?r=data/Carreras/consultar.php&cc=$_GET[cc]\"" ?>><input type="button" value="Cancelar" class="boton" /></a>

	<br /><br />
</form>

<script>
	function guardar()
	{
		var f=new FormData(document.malla);

		var malla=new ajax_req(function ()
		{
			if((this.statusText=="OK")&&(this.readyState==4))
			{
				if(this.responseText)
				{
					alert(this.responseText);
					window.location.href="?r=data/Carreras/uc.php&cc="+document.malla.cc.value+"&cm="+document.malla.cm.value;
				}

				else
				{
					alert("Ocurrio un error, vuelva a intentarlo");
				}
			}
		}, "data/Carreras/guardar_malla.php", "POST", f);

		return false;
	}
</script>