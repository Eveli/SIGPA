<h3> Malla <?= $_GET["cm"] ?>

<?php
	$sql="select * from carrera where cc='$_GET[cc]'";
	$ejec=pg_query($sigpa, $sql);
	
	$carrera=pg_fetch_object($ejec);

	echo "($carrera->d)";
?>

</h3>


<table class="tab_index">
	<tr>
		<th>Trayecto Inicial</th>
	</tr>

<?php
	$sql="
		select uc.cuc cuc, uc.d d, uc.ht ht, uc.hp hp, uc.lab lab
		from malla m
			join uc
				on uc.cm=m.cm and uc.cc=m.cc and uc.t='0' and uc.tr='1'
		where m.cm='$_GET[cm]' and m.cc='$_GET[cc]' order by d
	";
	$ejec=pg_query($sigpa, $sql);
	
	while($uc=pg_fetch_object($ejec))
	{
?>

	<tr>
		<td <?= "OnClick=\"abrir_editar_uc('$uc->cuc')\"" ?> style="cursor: pointer;" >
			<?= $uc->d; ?>
		</td>
	</tr>

<?php
	}
?>

	<tr>
		<td style="text-align: center; color: #0000cb;">
			<a href="javascript: abrir_nuc(0, 1)"><div title="Nueva unidad curricular">Nueva UC</div></a>
		</td>
	</tr>
</table><br />

<table class="tab_index">
	<tr>
		<th>Trayecto Transición</th>
	</tr>

<?php
	$sql="
		select uc.cuc cuc, uc.d d, uc.ht ht, uc.hp hp, uc.lab lab
		from malla m
			join uc
				on uc.cm=m.cm and uc.cc=m.cc and uc.t='0' and uc.tr='2'
		where m.cm='$_GET[cm]' and m.cc='$_GET[cc]' order by d
	";
	$ejec=pg_query($sigpa, $sql);
	
	while($uc=pg_fetch_object($ejec))
	{
?>

	<tr>
		<td <?= "OnClick=\"abrir_editar_uc('$uc->cuc')\"" ?> style="cursor: pointer;" >
			<?= $uc->d; ?>
		</td>
	</tr>

<?php
	}
?>

	<tr>
		<td style="text-align: center; color: #0000cb;">
			<a href="javascript: abrir_nuc(0, 2)"><div title="Nueva unidad curricular">Nueva UC</div></a>
		</td>
	</tr>
</table><br />

<?php
	$t=1;

	do
	{
?>

<div style="width: 50%; float: left; margin: 10px 0px;"><table class="tab_index">
	<tr>
		<th>Trayecto <?= $t ?></th>
	</tr>

<?php
		$tr=1;

		do
		{
?>

	<tr>
		<th>Trismestre <?= $tr ?></th>
	</tr>

<?php
	$sql="
		select uc.cuc cuc, uc.d d, uc.ht ht, uc.hp hp, uc.lab lab
		from malla m
			join uc
				on uc.cm=m.cm and uc.cc=m.cc and uc.t='$t' and uc.tr='$tr'
		where m.cm='$_GET[cm]' and m.cc='$_GET[cc]' order by d
	";
	$ejec=pg_query($sigpa, $sql);
	
	while($uc=pg_fetch_object($ejec))
	{
?>

	<tr>
		<td <?= "OnClick=\"abrir_editar_uc('$uc->cuc')\"" ?> style="cursor: pointer;">
			<?= $uc->d; ?>
		</td>
	</tr>

<?php
	}
?>

	<tr>
		<td style="text-align: center; color: #0000cb;">
			<a  <?= "href=\"javascript: abrir_nuc($t, $tr)\""; ?>><div title="Nueva unidad curricular">Nueva UC</div></a>
		</td>
	</tr>

<?php
			++$tr;
		} while($tr<=3);

		++$t;
?>

</table></div>

<?php
	} while($t<=4);
?>

<br style="clear: both;" /><br />

<input type="button" value="Reutilizar" title="Haga click aqui para crear una malla con este mismo esquema" class="boton" <?= "OnClick=\"reusar('$_GET[cc]', '$_GET[cm]')\"" ?> />
<a <?= "href=\"?r=data/Carreras/consultar.php&cc=$_GET[cc]\"" ?> ><input type="button" value="Regresar" class="boton" /></a>

<?php
	$sql="select e from malla where cc='$_GET[cc]' and cm='$_GET[cm]'";
	$ejec=pg_query($sigpa, $sql);

	$malla=pg_fetch_object($ejec);

	if($malla->e==1)
	{
?>	

<br /><br/><input type="button" value="Desactivar" title="Haga click aqui para desactivar esta malla" class="boton" <?= "OnClick=\"estado('$_GET[cc]', '$_GET[cm]', 0)\"" ?> />

<?php
	}

	else
	{
?>	

<br /><br/><input type="button" value="Activar" title="Haga click aqui para activar esta malla" class="boton" <?= "OnClick=\"estado('$_GET[cc]', '$_GET[cm]', 1)\"" ?> />

<?php
	}
?>

<br /><br />

<script>
	function guardar()
	{
		var f=new FormData(document.uc);

		var uc=new ajax_req(function ()
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
		}, "data/Carreras/nuc.php", "POST", f);

		return false;
	}

	function abrir_nuc(t, tr)
	{
		document.uc.t.value=t;
		document.uc.tr.value=tr;
		document.uc.nt.max=4-tr;

		if(t==0)
		{
			document.uc.nt.value=1;
			document.uc.nt.parentNode.style.display="none";
		}

		else
		{
			document.uc.nt.value="";
			document.uc.nt.parentNode.style.display="block";
		}

		getID("nuc").style.animation="abrir_sesion 0.5s forwards";
		getID("nuc").style.WebkitAnimation="abrir_sesion 0.5s forwards";
	}

	function cerrar_nuc()
	{
		document.uc.nt.value="";
		getID("nuc").style.animation="cerrar_sesion 0.5s forwards";
		getID("nuc").style.WebkitAnimation="cerrar_sesion 0.5s forwards";
	}

	function abrir_editar_uc(cuc, rep)
	{
		if(!rep)
		{
			getID("editar_uc").style.animation="abrir_sesion 0.5s forwards";
			getID("editar_uc").style.WebkitAnimation="abrir_sesion 0.5s forwards";
		}

		var uc=new ajax_req(function ()
		{
			if((this.statusText=="OK")&&(this.readyState==4))
			{
				if(this.responseText)
				{
					getID("cuerpo_editar").className="alerta";
					getID("cuerpo_editar").innerHTML=this.responseText;
					document.editar_uc.nt.max=4-document.editar_uc.tr.value;
				}

				else
				{
					abrir_editar_uc(cuc, true);
				}
			}
		}, "data/Carreras/editar_uc.php", "POST", "cuc="+cuc+"&cm="+document.uc.cm.value+"&cc="+document.uc.cc.value);
	}

	function cerrar_editar_uc()
	{
		getID("editar_uc").style.animation="cerrar_sesion 0.5s forwards";
		getID("editar_uc").style.WebkitAnimation="cerrar_sesion 0.5s forwards";
	}

	function guardar_editar()
	{
		var f=new FormData(document.editar_uc);

		var uc=new ajax_req(function ()
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
		}, "data/Carreras/cambiar_uc.php", "POST", f);

		return false;
	}

	function eliminar_uc(cuc, cc, cm)
	{
		if(!confirm("Realmente desea eliminar la unidad curricular?"))
			return false;

		var eliminar_uc=new ajax_req(function ()
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
		}, "data/Carreras/eliminar_uc.php", "POST", "cuc="+cuc+"&cm="+cm+"&cc="+cc);
	}

	function reusar(cc, cm)
	{
		var ncm=prompt("Indique el número de la version de la nueva malla: ");

		if(!ncm)
		{
			alert("Debe indicar un número de malla")
			return false;
		}

		var reusar=new ajax_req(function ()
		{
			if((this.statusText=="OK")&&(this.readyState==4))
			{
				if(this.responseText)
				{
					alert(this.responseText);
					window.location.href="?r=data/Carreras/uc.php&cc="+cc+"&cm="+ncm;
				}

				else
				{
					alert("Ocurrio un error, vuelva a intentarlo");
				}
			}
		}, "data/Carreras/reusar.php", "POST", "cm="+cm+"&cc="+cc+"&ncm="+ncm);
	}

	function estado(cc, cm, e)
	{
		var reusar=new ajax_req(function ()
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
		}, "data/Carreras/estado.php", "POST", "cm="+cm+"&cc="+cc+"&e="+e);
	}
</script>

<div class="falerta" id="nuc">
	<div class="cerrar_alerta" OnClick="cerrar_nuc()">
	</div>

	<div class="alerta">
		<h3> Nueva Unidad Curricular </h3>

		<form name="uc" OnSubmit="return guardar()">
			<span class="inputLength">
				<input type="text" name="cuc" placeholder="Código UC" maxlength=15 title="Código de la unidad curricular" OnKeyUp="VAL.call(this, event, 'alf'); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
			</span> <span class="requerido">*</span><br /><br />

			<span class="inputLength">
				<input type="text" name="d" placeholder="Nombre UC" maxlength=60 title="Nombre de la unidad curricular" OnKeyUp="VAL.call(this, event, 'text'); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
			</span> <span class="requerido">*</span><br /><br />

			<span><input type="number" name="nt" min=1 max=3 placeholder="Número de trimestres" maxlength=1 title="Número de trimestres" OnKeyUp="VAL.call(this, event, 'num')" required="required" />
			<span class="requerido">*</span><br /><br /></span>

			<span class="inputLength">
				<input type="text" name="ht" placeholder="Horas teoricas" maxlength=2 title="Horas teoricas" OnKeyUp="VAL.call(this, event, 'num'); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
			</span> <span class="requerido">*</span><br /><br />

			<span class="inputLength">
				<input type="text" name="hp" placeholder="Horas practicas" maxlength=2 title="Horas practicas" OnKeyUp="VAL.call(this, event, 'num'); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" required="required" />
			</span> <span class="requerido">*</span><br /><br />

			<select name="ce" required="required">
				<option value="">Eje</option>

<?php
	$sql="select * from eje order by d";
	$ejec=pg_query($sigpa, $sql);

	while($eje=pg_fetch_object($ejec))
	{
		echo "<option value='$eje->ce'>$eje->d</option>";
	}
?>

			</select> <span class="requerido">*</span><br /><br />

			<select name="lab" required="required">
				<option value="">Tipo</option>
				<option value="0">Aula</option>
				<option value="1">Laboratorio</option>
			</select> <span class="requerido">*</span><br /><br />

			<input type="hidden" name="t" />
			<input type="hidden" name="tr" />
			<input type="hidden" name="cm" <?= "value=\"$_GET[cm]\"" ?> />
			<input type="hidden" name="cc" <?= "value=\"$_GET[cc]\"" ?> />

			<input type="submit" value="Guardar" class="boton" />&nbsp;&nbsp;&nbsp;<input type="button" value="Cancelar" OnClick="cerrar_nuc()" class="boton" />
		</form>
	</div>
</div>

<div class="falerta" id="editar_uc">
	<div class="cerrar_alerta" OnClick="cerrar_editar_uc()"></div>

	<div class="alerta cargando" id="cuerpo_editar" style="min-height: 300px;">Cargando..</div>
</div>