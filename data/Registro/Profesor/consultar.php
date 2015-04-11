<a href="?r=data/Registro/Profesor/index.php"><input type="button" value="Regresar" style="position: absolute; right: 60px;" /></a><br /><br /><br />

<?php
	$ci=$_GET["ci"];

	$sql="
		select 
			p.cedula ci, 
			p.primerapellido ape1, 
			p.segundoapellido ape2, 
			p.primernombre nom1, 
			p.segundonombre nom2, 
			prof.des_profesion prof, 
			p.condicion cond 
		from profesores p 
			join profesiones prof 
				on prof.cod_profesion=p.cod_profesion 
		where p.cedula='$ci'
	";
	$ejec=pg_query($poli, $sql);

	$p=pg_fetch_object($ejec);

	$sql="
		select 
			c.d c, 
			d.d d, 
			d.h hd, 
			p.h hp, 
			string_agg(dic.cuc, ',' order by dic.cuc) cuc
		from profesor p 
			join categoria c 
				on c.cc=p.c 
			join dedicacion d 
				on d.cd=p.d 
			join dicta dic
				on dic.ci='$ci'
		where p.ci='$ci' 
		group by c.d, d.d, d.h, p.h
	";
	$ejec=pg_query($sigpa, $sql);

	$p2=pg_fetch_object($ejec);

	if($p2->c!="")
	{
?>

<script language="javascript">
	function eliminar(ci, cuc)
	{
		if(confirm("Realmente desea eliminar la asigancion de esta unidad curricular?"))
		{
			window.location="/SIGPA?r=data/Registro/Profesor/eliminar.php&ci="+ci+"&cuc="+cuc;
		}
	}
</script>

<fieldset style="position: relative;">
	<legend> Datos Personales </legend>

	<b>CI:</b> <?php echo $p->ci; ?><br />
	<b>Nombre:</b> <?php echo "$p->nom1 $p->nom2 $p->ape1 $p->ape2"; ?><br />
	<b>Profesion:</b> <?php echo $p->prof; ?><br />
	<b>Condicion:</b> <?php echo $p->cond; ?><br />
	<b>Categoria:</b> <?php echo $p2->c; ?><br />
	<b>Dedicación:</b> <?php echo $p2->d; ?><br />

	<a <?php echo "href='?r=data/Registro/Profesor/editar.php&ci=$p->ci'"; ?>><img src='css/img/editar.png' style="height: 40px; width: 40px; cursor: pointer; position: absolute; top: 90px; right: 50px;" title='Modificar categoria y dedicación' /></a>
</fieldset>

<br /><br />

<fieldset>
	<legend> Datos Laborales </legend>

	<b>Horas Disponibles:</b> <?php echo $p2->hd-$p2->hp; ?> <br />

	<b>Carreras:</b> 

<?php
		$cuc=explode(",", $p2->cuc);

		$n=count($cuc);

		for($i=0; $i<$n; ++$i)
		{
			$sql="select cod_carrera cc from asignaturas where cod_asig='$cuc[$i]'";
			$ejec=pg_query($poli, $sql);

			$cc=pg_fetch_object($ejec);

			if($i==0)
			{
				$cc2[0]=$cc->cc;
			}

			else
			{
				$g=true;
				$n2=count($cc2);

				for($i2=0; $i2<$n2; ++$i2)
				{
					if($cc2[$i2]==$cc->cc)
					{
						$g=false;
						break;
					}
				}

				if($g)
				{
					$cc2[$n2]=$cc->cc;
				}
			}
		}

		$carreras="";
		$n=count($cc2);

		for($i=0; $i<$n; ++$i)
		{
			$sql="select des_carrera dc from carreras where cod_carrera='$cc2[$i]'";
			$ejec=pg_query($poli, $sql);

			$c=pg_fetch_object($ejec);

			$carreras=$carreras."<a href='?r=data/Registro/PNF/consultar.php&cc=$cc2[$i]' class='enlace_nd' title='Consultar $c->dc'>$c->dc</a>, ";
		}

		$carreras=substr($carreras, 0, -2);

		echo $carreras;
?>

	<br /><br />

	<b>Unidades Curriculares:</b><br /><br />

	<table class="tabla">
		<tr>
			<th> Carrera </th>
			<th> Nombre </th>
			<th> Opciones </th>
		</tr>

<?php
		$n=count($cuc);
		$c_ant="";

		for($i=0; $i<$n; ++$i)
		{
			$sql="
				select 
					uc.nom_asig na, 
					c.des_carrera dc, 
					c.cod_carrera cc
				from asignaturas uc 
					join carreras c on c.cod_carrera=uc.cod_carrera 
				where cod_asig='$cuc[$i]'
			";
			$ejec=pg_query($poli, $sql);

			$uc=pg_fetch_object($ejec);
?>

		<tr>
			<td>
				<?php
					if($c_ant!=$uc->cc)
					{
						echo "<a href='?r=data/Registro/Carreras/consultar.php&cc=$uc->cc' class='enlace_nd' title='Consultar $uc->dc'><div>$uc->dc</div></a>";
						$c_ant=$uc->cc;
					}
				?>
			</td>

			<td>
				<?php echo "<a href='?r=data/Registro/UC/consultar.php&cuc=$cuc[$i]' class='enlace_nd' title='Consultar $uc->na'><div>$uc->na</div></a>"; ?>
			</td>

			<td align="center">
				<?php echo "<img src='css/img/eliminar.png' class='boton' title='Eliminar' OnClick=".'"'."eliminar('$p->ci', '$cuc[$i]')".'"'." />"; ?>
			</td>
		</tr>

<?php
		}
?>

		<tr>
			<td align="center" colspan=3><a <?php echo "href='?r=data/Registro/Profesor/dicta.php&ci=$ci'"; ?> title="Asignar una Unidad Curricular" class="enlace_nd"><div>+</div></a></td>
		</tr>
	</table><br />
	<b>Carga Academica:</b><br /><br />

	<table class="tabla">
		<tr>
			<th title="Unidad Currricular"> UC </th>
			<th> Curso </th>
			<th> Opciones </th>
		</tr>
	</table>
</fieldset>

<?php
	}

	else
	{
?>

<fieldset style="position: relative;">
	<legend> Datos Personales </legend>

	<b>CI:</b> <?php echo $p->ci; ?><br />
	<b>Nombre:</b> <?php echo "$p->nom1 $p->nom2 $p->ape1 $p->ape2"; ?><br />
	<b>Profesion:</b> <?php echo $p->prof; ?><br />
	<b>Condicion:</b> <?php echo $p->cond; ?><br />

	<a <?php echo "href='?r=data/Registro/Profesor/completar.php&ci=$p->ci'"; ?>><img src='css/img/editar.png' style="height: 40px; width: 40px; cursor: pointer; position: absolute; top: 75px; right: 50px;" title='Completar registro del profesor' /></a>
</fieldset>

<?php
	}
?>

<br /><br /><a href="?r=data/Registro/Profesor/index.php"><input type="button" value="Regresar" style="position: absolute; right: 60px;" /></a><br /><br />