<?php
		// Verificar que no se accede al archivo directamente con el navegador
	include "../../lib/verificar.php";

		// Si el nivel no es de Vicerrectorado no se permitira acceder al contenido
	if($_SESSION["n"]!=1)
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}
?>

<h3> Periodos </h3>

<table class="tab_index" align="center">
	<tr>
		<th colspan=2> Planificación </th>
		<th colspan=2> Académico </th>
	</tr>

	<tr>
		<th style="color: #0000cb;">
			Fecha de inicio
		</th>

		<th style="color: #0000cb;">
			Fecha de fín
		</th>

		<th style="color: #0000cb;">
			Fecha de inicio
		</th>

		<th style="color: #0000cb;">
			Fecha de fín
		</th>
	</tr>

<?php
	$sql="select * from periodo where t='p' order by ff desc";
	$ejec_p=pg_query($sigpa, $sql);

	$ra_p=pg_affected_rows($ejec_p);

	$sql="select * from periodo where t='a' order by ff desc";
	$ejec_a=pg_query($sigpa, $sql);

	$ra_a=pg_affected_rows($ejec_a);

	if($ra_p+$ra_a>1)
	{
		$fa=date("Y-m-d");

		$f_p=pg_fetch_object($ejec_p);
		$f_a=pg_fetch_object($ejec_a);

		if($f_p->ff<$fa)
		{
?>

	<tr>
		<td colspan=4 style="text-align: center; cursor: pointer; color: #0000cb;" OnClick="abrir_nperiodo()">
			Nuevo periodo
		</td>
	</tr>

<?php
		}

		do
		{
			$fi_p=explode("-", $f_p->fi);
			$ff_p=explode("-", $f_p->ff);
			$fi_a=explode("-", $f_a->fi);
			$ff_a=explode("-", $f_a->ff);
?>

	<tr>
		<td>
			<?= "$fi_p[2]/$fi_p[1]/$fi_p[0]" ?>
		</td>

		<td>
			<?= "$ff_p[2]/$ff_p[1]/$ff_p[0]" ?>
		</td>

		<td>
			<?= "$fi_a[2]/$fi_a[1]/$fi_a[0]" ?>
		</td>

		<td>
			<?= "$ff_a[2]/$ff_a[1]/$ff_a[0]" ?>
		</td>

<?php
			if(($f_p->ff>$fa)||($f_a->ff>$fa))
			{
?>

		<td>
			<img src="css/img/editar.png" class="bt_opc" title="Editar período" <?= "OnClick=\"abrir_editar('$fi_p[0]-$fi_p[1]-$fi_p[2]', '$ff_p[0]-$ff_p[1]-$ff_p[2]', '$fi_a[0]-$fi_a[1]-$fi_a[2]', '$ff_a[0]-$ff_a[1]-$ff_a[2]')\""; ?> />
		</td>

<?php
			}
?>

	</tr>

<?php
		}while(($f_p=pg_fetch_object($ejec_p))&&($f_a=pg_fetch_object($ejec_a)));
	}

	else
	{
?>

	<tr>
		<td colspan=4 style="text-align: center; cursor: pointer; color: #0000cb;" OnClick="abrir_nperiodo()">
			Nuevo periodo
		</td>
	</tr>

<?php
	}
?>

</table><br/>

<a href="?r=data/Planificacion/index.php"><input type="button" value="Regresar" class="boton" /></a>

<div class="falerta" id="nperiodo">
	<div class="cerrar_alerta" OnClick="cerrar_nperiodo()">
	</div>

	<div class="alerta">
		<h3> Nuevo periodo </h3>

		<form name="periodo" method="POST" action="data/Planificacion/nperiodos.php" OnSubmit="return verif_fechas()">
			<span class="inputLength">
				Planificación: <input type="text" name="d" placeholder="Dias" maxlength=2 title="Duracion del periodo de planificacion" OnKeyUp="VAL.call(this, event, 'num'); inputLength.call(this, true);" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" style="width: 50px; padding-right: 15px;" required="required" />
			</span> <span class="requerido">*</span><br /><br />

			Académico:<br /><br />

			Fecha de inicio: <input type="date" name="fi" required="required" /><br /><br />
			Fecha de fin: <input type="date" name="ff" required="required" />

			<br /><br />

			<input type="submit" value="Nuevo" class="boton" />&nbsp;&nbsp;&nbsp;<input type="button" value="Cancelar" OnClick="cerrar_nperiodo()" class="boton" />
		</form>
	</div>
</div>

<div class="falerta" id="eperiodo">
	<div class="cerrar_alerta" OnClick="cerrar_editar()">
	</div>

	<div class="alerta">
		<h3> Editar periodo </h3>

		<form name="eperiodo" method="POST" action="data/Planificacion/eperiodos.php" OnSubmit="return verif_fechas_e()">
			Planificación:<br /><br />
			Fecha de inicio: <input type="date" name="fip" required="required" /><br /><br />
			Fecha de fin: <input type="date" name="ffp" required="required" />

			<br /><br />

			Académico:<br /><br />
			Fecha de inicio: <input type="date" name="fia" required="required" /><br /><br />
			Fecha de fin: <input type="date" name="ffa" required="required" />

			<br /><br />

			<input type="submit" value="Guardar" class="boton" />&nbsp;&nbsp;&nbsp;<input type="button" value="Cancelar" OnClick="cerrar_editar()" class="boton" />
		</form>
	</div>
</div>

<script>
	function abrir_nperiodo()
	{
		getID("nperiodo").style.animation="abrir_sesion 0.5s forwards";
		getID("nperiodo").style.WebkitAnimation="abrir_sesion 0.5s forwards";
	}

	function cerrar_nperiodo()
	{
		getID("nperiodo").style.animation="cerrar_sesion 0.5s forwards";
		getID("nperiodo").style.WebkitAnimation="cerrar_sesion 0.5s forwards";
	}

	function verif_fechas()
	{
		if(document.periodo.ff.value<document.periodo.fi.value)
		{
			alert("La fecha final no debe ser menor a la fecha inicial");
			return false;
		}
	}

	function abrir_editar(fip, ffp, fia, ffa)
	{
		getID("eperiodo").style.animation="abrir_sesion 0.5s forwards";
		getID("eperiodo").style.WebkitAnimation="abrir_sesion 0.5s forwards";

		document.eperiodo.fip.value=fip;
		document.eperiodo.ffp.value=ffp;
		document.eperiodo.fia.value=fia;
		document.eperiodo.ffa.value=ffa;
	}

	function cerrar_editar()
	{
		getID("eperiodo").style.animation="cerrar_sesion 0.5s forwards";
		getID("eperiodo").style.WebkitAnimation="cerrar_sesion 0.5s forwards";
	}

	function verif_fechas_e()
	{
		if(document.eperiodo.ffp.value<document.eperiodo.fip.value)
		{
			alert("La fecha final del período de planificación no debe ser menor a la fecha inicial del mismo");
			return false;
		}

		if(document.eperiodo.ffa.value<document.eperiodo.fia.value)
		{
			alert("La fecha final del período académico no debe ser menor a la fecha inicial de mismo");
			return false;
		}
	}
</script>