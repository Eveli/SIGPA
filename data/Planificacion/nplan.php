<?php
	session_start();
	require "../../lib/conexion.php";

	extract($_POST);

	$sql="select cc, s from coordinacion where ci='$_SESSION[ci]'";
	$ejec=pg_query($sigpa, $sql);

	$cord=pg_fetch_object($ejec);

	$sql="select d, ht, hp from uc where cuc='$cuc'";
	$ejec=pg_query($sigpa, $sql);

	$uc=pg_fetch_object($ejec);
?>

<form name="carga" OnSubmit="return cargar()">
	<h3><?= "$uc->d<br/>($cuc)" ?></h3>

<?php
	if(($uc->ht==0)&&($uc->hp==0))
	{
		echo "Esta unidad curricular esta incompleta, por favor comuniquelo a Vicerrectorado<br/><br/>";
	}

	else
	{
?>

	<label><input type="checkbox" name="todos" value="1" OnClick="mostrar_todos()" /> Mostrar todos los profesores</label><br/><br/>

	<label><input type="radio" name="con" value="1" <?= "OnChange=\"profesores.call(this, '$cuc')\""; ?> /> Ordinario </label>
	<label><input type="radio" name="con" value="3" <?= "OnChange=\"profesores.call(this, '$cuc')\""; ?> /> Contratado </label>

	<br /><br /><select name="prof" OnChange="if(this.value) getID('h').innerHTML=getID(this.value).dataset.h; else reiniciar();" required="required" title="Seleccione un profesor">
		<option value=""> Profesor </option>
	</select><br/><br/>

	<select name="sup" title="Seleccione un suplente si es necesario">
		<option value=""> Suplente </option>

<?php
		$sql="
			select pro.ci ci, pro.n1 n1, pro.a1 a1, d.h-pro.h h
			from profesor pro
				join dedicacion d
					on d.ded=pro.ded
				join pertenece per
					on per.ci=pro.ci and per.cc='$cord->cc'
			where pro.c='3' and pro.s='$cord->s' and pro.ci!='$_SESSION[ci]' and pro.h<d.h
			order by pro.a1, pro.n1
		";
		$ejec=pg_query($sigpa, $sql);

		while($prof=pg_fetch_object($ejec))
		{
			echo "<option value='$prof->ci' id='$prof->ci' data-h='$prof->h'> $prof->a1 $prof->n1 ($prof->ci) </option>";
		}
?>

	</select><br/><br/>
	
	Secciones:

	<span id="secciones">

<?php
		$sql="select * from seccion order by id";
		$ejec=pg_query($sigpa, $sql);

		while($sec=pg_fetch_object($ejec))
			echo "<label><input type='checkbox' name='sec[]' data-sec='$sec->id' OnChange='cuenta.call(this)' /> $sec->id </label>";
?>

	</span>

	<a title="Agregar una sección" onClick="document.carga.nsec.style.display='inline'">+</a>

	<input type="text" name="nsec" placeholder="Nueva sección" maxlength="1" style="display: none; width: 9em;" onChange="nSec(this.value)" />

	<input type="hidden" name="cuc" <?= "value='$cuc'"; ?> />
	<input type="hidden" name="uc_ht" <?= "value='$uc->ht'"; ?> />
	<input type="hidden" name="uc_hp" <?= "value='$uc->hp'"; ?> />
	<input type="hidden" name="ht" value="0" />
	<input type="hidden" name="hp" value="0" />

	<br /><br /> Horas Disponibles: 
	<span class="horas" id="h" title="Horas disponibles">0</span>
	
	<style>
		.horas
		{
			width: 30px;

			font-size: 18pt;
			background: #0000cb;
			color: white;
			padding: 10px;
			border-radius: 10px;
		}
	</style>

	<br/><br/><input type="submit" value="Guardar" class="boton" id="bt_carga" />&nbsp;&nbsp;&nbsp;

<?php
	}
?>

	<input type="button" value="Cancelar" OnClick="cerrar_asig()" class="boton" />
</form>