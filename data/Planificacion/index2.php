<?php
		// Verificar que no se accede al archivo directamente con el navegador
	include "../../lib/verificar.php";

	if($_SESSION["n"]==1)
	{
		//echo "<meta http-equiv='Refresh' content='0; url=../../' />";
		//exit();
	}

	$sql="select * from periodo order by id desc limit 1";
	$ejec=pg_query($sigpa, $sql);

	$f=pg_fetch_object($ejec);

	$fi=explode("-", $f->fi);
	$ff=explode("-", $f->ff);

	$fa=date("Y-m-d");
?>

<style type="text/css">
	#estado
	{
		position: relative;
	}

	#estado:after
	{
		content: "";

		height: 25px;
		width: 25px;

		border-radius: 12.5px;

		position: absolute;
		top: -30%;
		left: 110%;
	}

	.activo:after
	{
		background: limegreen;
	}

	.inactivo:after
	{
		background: red;
	}
</style>
<br/>
<?php
	if($f->ff>$fa)
	{
?>

<span id="estado" class="activo">Estado:</span>&nbsp;&nbsp;&nbsp;
<div style="font-size: 12px; padding: 10px;"><a href="?r=data/Planificacion/periodos.php">(Periodos de planificación)</a></div>
<div id="fecha"> <?= "Fecha de Inicio: $fi[2]/$fi[1]/$fi[0] - Fecha de Fin: $ff[2]/$ff[1]/$ff[0]" ?> </div>

<?php
	}

	else
	{
?>

<span id="estado" class="inactivo">Estado:</span>&nbsp;&nbsp;&nbsp;
<div style="font-size: 12px; padding: 10px;"><a href="?r=data/Planificacion/periodos.php">(Periodos de planificación)</a></div>

<?php
	}

?>

<br/><br/><table class="tab_index">
	<tr>
		<th rowspan=2>
			Profesor
		</th>

		<th rowspan=2>
			Ded.
		</th>

		<th rowspan=2>
			Cat.
		</th>

		<th rowspan=2>
			Unidad Curricular
		</th>

		<th rowspan=2>
			Seccion
		</th>

		<th colspan=2>
			Horas
		</th>

		<th rowspan=2>
			Total
		</th>

		<th rowspan=2>
			Observaciones
		</th>
	</tr>

	<tr>
		<th title="Horas Teoricas" style="color: #0000cb;">
			T
		</th>

		<th title="Horas Practicas" style="color: #0000cb;">
			P
		</th>
	</tr>

<?php
	$sql="select s, cord from profesor where ci='$_SESSION[ci]'";
	$ejec=pg_query($sigpa, $sql);

	$x=pg_fetch_object($ejec);

	$sql="
		select p.a1 a1, p.a2 a2, p.n1 n1, p.n2 n2, pr.d prof, p.ci ci, d.abrv ded, cat.abrv cat, string_agg(concat_ws(',', uc.nom, uc.t, uc.tr, c.s, c.ht, c.hp), '/') uc, c.ob ob
		from carga c
			join profesor p
				on p.ci=c.ci and p.s='$x->s'
			join pertenece per
				on per.ci=p.ci and per.cc='$x->cord'
			join p_obtenida po
				on po.ci=p.ci
			join profesion pr
				on pr.cp=po.cp
			join dedicacion d
				on d.ded=p.ded
			join categoria cat
				on cat.cat=p.cat
			join uc
				on uc.cuc=c.cuc
		group by p.a1, p.a2, p.n1, p.n2, pr.d, p.ci, d.abrv, cat.abrv, c.ob
	";
	$ejec=pg_query($sigpa, $sql);

	while($car=pg_fetch_object($ejec))
	{
		$uc=explode("/", $car->uc);
		$cuc=count($uc);

		for($i=0; $i<$cuc; ++$i)
		{
?>			

	<tr>

<?php
			if($i==0)
			{
				echo "
		<td rowspan=".$cuc.">
			$car->a1 $car->a2<br/>
			$car->n1 $car->n2<br/>
			$car->prof<br/>
			C.I: $car->ci
		</td>

		<td rowspan=".$cuc.">
			$car->ded
		</td>

		<td rowspan=".$cuc.">
			$car->cat
		</td>
				";
			}

			$uc2=explode(",", $uc[$i]);

			echo "
		<td>
			$uc2[0] (T$uc2[1]";

			if($uc2[1]!="0")
			{
				echo "<span style=\"text-transform: lowercase;\">t</span>"."$uc2[2]";
			}

			echo ")
		</td>

		<td>
			$uc2[3]
		</td>

		<td>
			$uc2[4]
		</td>

		<td>
			$cu2[5]
		</td>

		<td>
			".($uc2[4]+$uc2[5])."
		</td>
			";

			if($i==0)
			{
				echo "
		<td rowspan=".$cuc.">
			<textarea maxlength=500>$car->ob</textarea>
		</td>
				";
			}
?>

	</tr>

<?php

		}
	}
?>

</table>