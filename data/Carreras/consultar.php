<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	$cc=$_GET["cc"];

	$sql="select * from carrera where cc='$cc'";
	$ejec=pg_query($sigpa, $sql);
	
	$carrera=pg_fetch_object($ejec);
?>

<h3><?= $carrera->d; ?></h3>

<form name="editar" OnSubmit="return guardar()">
	<input type="hidden" name="cc" <?= "value=\"$cc\"" ?> /><br/>

	<span class="inputLength">
		<input type="text" name="d" placeholder="Carrera" <?= "value=\"$carrera->d\"" ?> maxlength=50 title="Nombre de la carrera" OnKeyUp="VAL.call(this, event, 'text', true); inputLength.call(this, true); verificar_car.call(this);" OnChange="verificar_car.call(this);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
	</span> <span class="requerido">*</span><div id="ex_carrera" style="padding-top: 10px; color: red; display: none;">Ya existe una carrera con ese nombre</div><br /><br />

	<span id="areaS">
		<select name="ca" title="Seleccione el área al que pertenece la carrera">
			<option value="">ÁREA</option>

<?php
	$sql="select * from area order by d";
	$ejec=pg_query($sigpa, $sql);

	while($d=pg_fetch_object($ejec))
	{
		echo "<option value='$d->ca'";

		if($d->ca==$carrera->ca)
			echo " selected=\"selected\"";

		echo ">$d->d</option>";
	}
?>

		</select> <span class="requerido">*</span><br /><br />

		<a onClick="this.parentNode.style.display='none'; getID('areaT').style.display='block'; document.editar.ca.value='';" title="Haga click aqui si el area que quiere seleccionar no aparece entre las listadas">Agregar nueva Área</a>
	</span>

	<span id="areaT" style="display: none;">
		<span class="inputLength">
			<input type="text" name="caT" placeholder="Cod." maxlength=2 title="Código del área" style="width: 40px;" OnKeyUp="VAL.call(this, event, 'num', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
		</span> <span class="requerido">*</span><br /><br />

		<span class="inputLength">
			<input type="text" name="da" placeholder="Área" maxlength=50 title="Área" OnKeyUp="VAL.call(this, event, 'text', true); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
		</span> <span class="requerido">*</span><br /><br />

		<a onClick="this.parentNode.style.display='none'; getID('areaS').style.display='block'; document.editar.caT.value=''; document.editar.da.value='';" title="Haga click aqui si el area que quiere ingresar ya esta registrada">Volver</a>
	</span>

	<br /><br />

	<input type="image" src="css/img/editar.png" class="bt_opc" title="Modificar Datos" />

	<br /><br /><br/>
</form>

<table class="tab_index">
	<tr>
		<th>Malla</th>
		<th>Fecha de Emisión</th>
		<th>Estado</th>
	</tr>

<?php
	
	$sql="select * from malla where cc='$cc' order by cm desc";
	$ejec=pg_query($sigpa, $sql);
	
	while($malla=pg_fetch_object($ejec))
	{
?>

	<tr <?= "OnClick=location=\"?r=data/Carreras/uc.php&cc=$cc&cm=$malla->cm\"" ?> title="Haga click para obtener mas información de esta malla" style="cursor: pointer;">
		<td><?= $malla->cm ?></td>
		<td><?= $malla->f ?></td>
		<td>

<?php
	if($malla->e)
	{
		echo "Activa";
	}

	else
	{
		echo "Inactiva";
	}
?>

		</td>
	</tr>

<?php
	}
?>

	<tr>
		<td colspan=3 style='text-align: center;' title='Agregar una nueva malla'>
			<a <?= "href='?r=data/Carreras/malla.php&cc=$_GET[cc]'" ?>><div>Nueva Malla Curricular</div></a>
		</td>
	</tr>
</table><br/>

<?php
	if($_SESSION["n"]=="1")
	{
?>

<a <?= "href=\"?r=data/Carreras/index.php\"" ?>><input type="button" value="Regresar" class="boton" /></a>

<?php
	}
?>

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
						document.editar.d.style.border="2px solid red";
						getID("ex_carrera").style.display="block";
						getID("subcarr").attr("disabled");
					}

					else
					{
						document.editar.d.noattr("style");
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
		var f=new FormData(document.editar);

		var carrera=new ajax_req(function ()
		{
			if((this.statusText=="OK")&&(this.readyState==4))
			{
				if(this.responseText)
				{
					alert(this.responseText);
					window.location.href="?r=data/Carreras/consultar.php&cc="+document.editar.cc.value;
				}

				else
				{
					alert("Ocurrio un error, vuelva a intentarlo");
				}
			}
		}, "data/Carreras/modificar.php", "POST", f);

		return false;
	}
</script>