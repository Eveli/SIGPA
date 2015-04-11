<h3> Nueva Carrera </h3>

<form name="carrera" OnSubmit="return guardar()">

<?php
	$r=1;

	while($r)
	{
		if(strlen($r)==1)
			$cc="0$r";

		else
			$cc=$r;
			
		$sql="select cc from carrera where cc='$cc'";
		$ejec=pg_query($sigpa, $sql);

		$ra=pg_affected_rows($ejec);

		if(($ra==0)||($r>=99))
			break;

		++$r;
	}
?>

	Código: <?= $cc ?> <input type="hidden" name="cc" <?= "value=\"$cc\"" ?> /><br /><br />

	<span class="inputLength">
		<input type="text" name="d" placeholder="Carrera" maxlength=50 title="Nombre de la carrera" OnKeyUp="VAL.call(this, event, 'text', true); inputLength.call(this, true); verificar_car.call(this);" OnChange="verificar_car.call(this);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
	</span> <span class="requerido">*</span><div id="ex_carrera" style="padding-top: 10px; color: red; display: none;">Ya existe una carrera con ese nombre</div><br /><br />

	<span id="areaS">
		<select name="ca" title="Seleccione el área al que pertenece la carrera">
			<option value="">ÁREA</option>

<?php
	$sql="select * from area order by d";
	$ejec=pg_query($sigpa, $sql);

	while($d=pg_fetch_object($ejec))
	{
		echo "<option value='$d->ca'>$d->d</option>";
	}
?>

		</select> <span class="requerido">*</span><br /><br />

		<a onClick="this.parentNode.style.display='none'; getID('areaT').style.display='block'; document.carrera.ca.value='';" title="Haga click aqui si el area que quiere seleccionar no aparece entre las listadas">Agregar nueva Área</a><br/><br/>
	</span>

	<span id="areaT" style="display: none;">
		<span class="inputLength">
			<input type="text" name="caT" placeholder="Cod." maxlength=2 title="Código del área" style="width: 40px;" OnKeyUp="VAL.call(this, event, 'num', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
		</span> <span class="requerido">*</span><br /><br />

		<span class="inputLength">
			<input type="text" name="da" placeholder="Área" maxlength=50 title="Área" OnKeyUp="VAL.call(this, event, 'text', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
		</span> <span class="requerido">*</span><br /><br />

		<a onClick="this.parentNode.style.display='none'; getID('areaS').style.display='block'; document.carrera.caT.value=''; document.carrera.da.value='';" title="Haga click aqui si el area que quiere ingresar ya esta registrada">Volver</a><br/><br/>
	</span>

	<input type="submit" id="subcarr" value="Crear" disabled="disabled" class="boton" />&nbsp;&nbsp;&nbsp;<a href="?r=data/Carreras/index.php"><input type="button" value="Cancelar" class="boton" /></a>

	<br /><br />
</form>

<script>
	function verificar_car()
	{
			// Si el campo no esta vacio se verificará la existencia
		if(this.value!="")
		{
			var verificar=new ajax_req(function ()
			{
				if((this.statusText=="OK")&&(this.readyState==4))
				{
					if(this.responseText)
					{
						document.carrera.d.style.border="2px solid red";
						getID("ex_carrera").style.display="block";
						getID("subcarr").attr("disabled");
					}

					else
					{
						document.carrera.d.noattr("style");
						getID("ex_carrera").style.display="none";
						getID("subcarr").noattr("disabled");
					}
				}
			}, "data/Carreras/verificar.php", "POST", "d="+this.value);
		}

			// Si el campo esta vacio
		else
		{
			this.noattr("style");
			getID("ex_carrera").style.display="none";
			getID("subcarr").attr("disabled");
		}
	}

	function guardar()
	{
		var f=new FormData(document.carrera);

		var carrera=new ajax_req(function ()
		{
			if((this.statusText=="OK")&&(this.readyState==4))
			{
				if(this.responseText)
				{
					alert(this.responseText);
					window.location.href="?r=data/Carreras/consultar.php&cc="+document.carrera.cc.value;
				}

				else
				{
					alert("Ocurrio un error, vuelva a intentarlo");
				}
			}
		}, "data/Carreras/guardar.php", "POST", f);

		return false;
	}
</script>