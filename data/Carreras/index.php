<?php
		// Verificar que no se accede al archivo directamente con el navegador
	include "../../lib/verificar.php";

		// Si el nivel no es de Vicerrectorado no se permitira acceder al contenido
	/*if($_SESSION["n"]!=1)
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}*/

		// Obtener las carreras existentes y el departamento al que petenecen
	$sql="
		select 
			c.cc, 
			c.d dc, 
			a.d dd 
		from carrera c 
			join area a
				on a.ca=c.ca
		order by dc
	";
	$ejec=pg_query($sigpa, $sql);

	$ra=pg_affected_rows($ejec);
?>

<table class="tab_index">
	<tr>
		<th>
			Carrera
		</th>

		<th>
			Área
		</th>

		<th>
			Coordinadores
		</th>
	</tr>

<?php
		// Si no existen carreras
	if($ra==0)
	{
?>

	<tr>
		<td colspan=3>
			No hay carreras
		</td>
	</tr>

<?php
	}

		// Si existen carreras
	else
	{
		while($c=pg_fetch_object($ejec))
		{
?>

	<tr <?= "OnDblClick=location='?r=data/Carreras/consultar.php&cc=$c->cc'"; ?> title="Haga dobleclick aqui para obtener información detallada de esta carrera">
		<td>
				<!-- Carrera -->
			<?= "<a href='?r=data/Carreras/consultar.php&cc=$c->cc' title='Haga click aqui para obtener información detallada de esta carrera'>$c->dc</a>"; ?>
		</td>

		<td>
				<!-- Departamento -->
			<?= $c->dd; ?>
		</td>

		<td width=300px>
				<!-- Coordinadores -->
<?php
	
	echo "<div style='text-align: center;'><a title='Haga clic aqui para agregar esta carrera a una nueva sede' OnClick='abrir_asig(\"$c->cc\", \"$p->s\")'>Agregar sede</a></div><br />";
	
	$sql="
		select co.ci ci, co.s s, p.a1 a1, p.n1 n1, s.d ds
		from coordinacion co
			join profesor p
				on p.ci=co.ci
			join sede s
				on s.s=co.s
		where co.cc='$c->cc'
	";
	$ejec3=pg_query($sigpa, $sql);

	while($p=pg_fetch_object($ejec3))
	{
		echo "$p->ds: <a title='Haga click aqui para cambiar el coordinador de esta sede' OnClick='abrir_asig(\"$c->cc\", \"$p->s\", \"$p->ci\")'>$p->n1 $p->a1</a><br />";
		//echo $s[$i]["d"].": <a title='Haga clic aqui para asignar un coodinador a la carrera de esta sede' OnClick='abrir_asig(\"$c->cc\", \"".$s[$i]["s"]."\")'>Sin Asignar</a><br />";
	}
?>

		</td>
	</tr>

<?php
		}
	}
?>

	<tr>
		<td colspan=3 style="text-align: center;" title="Agregar una carrera">
			<a href="?r=data/Carreras/agregar.php"><div>Nueva Carrera</div></a>
		</td>
	</tr>
</table>

<script>
	function abrir_asig(cc, s, ci)
	{
			// Abrir el PopUp con animación
		getID("asig").style.animation="abrir_sesion 0.5s forwards";
		getID("asig").style.WebkitAnimation="abrir_sesion 0.5s forwards";

			// Si ya tiene un coordinador asignado se mostrara la lista de profesores para cambiarlo
		if(s)
		{
			var parametros="cc="+cc+"&s="+s+"&ci="+ci;
		}

			// Si no, se mostrara un formulario para registrar un coordinador
		else
		{
			var parametros="cc="+cc;
		}

		var sede=new ajax_req(function ()
		{
			if((this.statusText=="OK")&&(this.readyState==4))
			{
				if(this.responseText)
				{
					getID("cuerpo_asig").innerHTML=this.responseText;
				}

				else
				{
					alert("Ocurrio un error, vuelva a intentarlo");
				}
			}
		}, "data/Carreras/nsede.php", "POST", parametros);
	}

	function cerrar_asig()
	{
		getID("asig").style.animation="cerrar_sesion 0.5s forwards";
		getID("asig").style.WebkitAnimation="cerrar_sesion 0.5s forwards";
	}

	function guardar(mod)
	{
		if(mod)
			var f=new FormData(document.coord);

		else
			var f=new FormData(document.nsede);

		var guardar=new ajax_req(function ()
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
		}, "data/Carreras/guardar_sede.php", "POST", f);

		return false;
	}
</script>

<div class="falerta" id="asig">
	<div class="cerrar_alerta" OnClick="cerrar_asig()"></div>

	<div class="alerta" id="cuerpo_asig">
		
	</div>
</div>
