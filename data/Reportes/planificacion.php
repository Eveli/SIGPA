<?php
		// Verificar que no se accede al archivo directamente con el navegador
	include "../../lib/verificar.php";

	$p=$_GET["p"];

	$sql="
		select cord.cc cc, cord.s s, c.d d
		from coordinacion cord
			join carrera c
				on c.cc=cord.cc
		where ci='$_SESSION[ci]'
	";
	$ejec=pg_query($sigpa, $sql);

	$x=pg_fetch_object($ejec);

	$sql="
		select p.a1 a1, p.a2 a2, p.n1 n1, p.n2 n2, p.re re, p.h h, pr.d prof, p.ci ci, d.abrv ded, d.h dh, cat.d cat, string_agg(concat_ws(',', uc.d, uc.t, uc.tr, c.s, c.ht, c.hp, uc.ht, uc.hp, uc.cm), '/' order by uc.d, uc.t, uc.tr) uc
		from carga c
			join profesor p
				on p.ci=c.ci and p.s='$x->s'
			join pertenece per
				on per.ci=p.ci and per.cc='$x->cc'
			join estudios es
				on es.ci=p.ci
			join profesion pr
				on pr.cp=es.cp
			join dedicacion d
				on d.ded=p.ded
			join categoria cat
				on cat.cat=p.cat
			join uc
				on uc.cuc=c.cuc and uc.tr=c.tr and uc.cm=c.cm
		where c.p='$p' and p.c='1' and p.cat!='6'
		group by p.a1, p.a2, p.n1, p.n2, pr.d, p.ci, d.abrv, cat.d, d.h
		order by p.a1, p.n1
	";

	$sql2="
		select p.a1 a1, p.a2 a2, p.n1 n1, p.n2 n2, p.re re, p.h h, pr.d prof, p.ci ci, d.abrv ded, d.h dh, cat.d cat, string_agg(concat_ws(',', uc.d, uc.t, uc.tr, c.s, c.ht, c.hp, uc.ht, uc.hp, uc.cm), '/' order by uc.d, uc.t, uc.tr) uc
		from carga c
			join profesor p
				on p.ci=c.ci and p.s='$x->s'
			join pertenece per
				on per.ci=p.ci and per.cc='$x->cc'
			join estudios es
				on es.ci=p.ci
			join profesion pr
				on pr.cp=es.cp
			join dedicacion d
				on d.ded=p.ded
			join categoria cat
				on cat.cat=p.cat
			join uc
				on uc.cuc=c.cuc and uc.tr=c.tr and uc.cm=c.cm
		where c.p='$p' and p.c='1' and p.cat='6'
		group by p.a1, p.a2, p.n1, p.n2, pr.d, p.ci, d.abrv, cat.d, d.h
		order by p.a1, p.n1
	";

	$sql3="
		select p.a1 a1, p.a2 a2, p.n1 n1, p.n2 n2, p.re re, p.h h, pr.d prof, p.ci ci, d.abrv ded, d.h dh, cat.d cat, string_agg(concat_ws(',', uc.d, uc.t, uc.tr, c.s, c.ht, c.hp, uc.ht, uc.hp, uc.cm), '/' order by uc.d, uc.t, uc.tr) uc
		from carga c
			join profesor p
				on p.ci=c.ci and p.s='$x->s'
			join pertenece per
				on per.ci=p.ci and per.cc='$x->cc'
			join estudios es
				on es.ci=p.ci
			join profesion pr
				on pr.cp=es.cp
			join dedicacion d
				on d.ded=p.ded
			join categoria cat
				on cat.cat=p.cat
			join uc
				on uc.cuc=c.cuc and uc.tr=c.tr and uc.cm=c.cm
		where c.p='$p' and p.c='3'
		group by p.a1, p.a2, p.n1, p.n2, pr.d, p.ci, d.abrv, cat.d, d.h
		order by p.a1, p.n1
	";

	$ra=0;

	$ejec=pg_query($sigpa, $sql);

	if(pg_affected_rows($ejec)>0)
	{
		++$ra;
?>

<header style="width: 100%; position: relative; text-align: center;">
	<img src="../../css/img/reporte.jpg" style="position: absolute; height: 100%; width: 100%; top: 0px; left: 0px;" /><div/>

	<div style="font-size: 5pt; position: relative; z-index: 1;">
		Republica Bolivariana de Venezuela<br/>
		Ministerio del Poder Popular para la Educacion Universitaria, Ciencia y Tecnología<br/>
		<?= "$x->d"; ?><br/>
		Periodo Academico <?= "$p"; ?>
	</div>
</header><br/>

<table class="tab_index">
	<tr>
		<th colspan=10>PERSONAL DOCENTE ORDINARIO</th>
	</tr>
	<tr>
		<th rowspan=2 style="color: #0000cb;">
			Profesor
		</th>

		<th rowspan=2 style="color: #0000cb;">
			Ded.
		</th>

		<th rowspan=2 style="color: #0000cb;">
			Cat.
		</th>

		<th rowspan=2 style="color: #0000cb;">
			Unidad Curricular
		</th>

		<th rowspan=2 style="color: #0000cb;">
			Seccion
		</th>

		<th colspan=2 style="color: #0000cb;">
			Horas
		</th>

		<th rowspan=2 style="color: #0000cb;">
			Horas semanales
		</th>

		<th rowspan=2 style="color: #0000cb;">
			Total horas
		</th>

		<th rowspan=2 style="color: #0000cb;">
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
		while($car=pg_fetch_object($ejec))
		{
			$uc=explode("/", $car->uc);
			$cuc=count($uc);

			$th=0;

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
					";

					echo ucwords(strtolower($car->prof));

					echo ". $car->re<br/>
			C.I: $car->ci
		</td>

		<td rowspan=".$cuc." style=\"text-align: center;\">
			$car->ded
		</td>

		<td rowspan=".$cuc." style=\"text-align: center;\">
			".ucwords(strtolower($car->cat))."
		</td>
					";
				}

				$uc2=explode(",", $uc[$i]);

				echo "
		<td>
			$uc2[0]";

				if(($uc2[1]=="0")&&($uc2[2]=="2"))
				{
					echo " (Transición)";
				}

				else
				{
					echo " (T$uc2[1]";

					if($uc2[1]!="0")
					{
						echo "<span style=\"text-transform: lowercase;\">t</span>"."$uc2[2]";
					}

					echo ")";
				}

				echo "
		</td>

		<td style=\"text-align: center;\">
			$uc2[3]
		</td>

		<td style=\"text-align: center;\">
			$uc2[6]
		</td>

		<td style=\"text-align: center;\">
			$uc2[7]
		</td>

		<td style=\"text-align: center;\">
			".round($uc2[4]+$uc2[5])."
		</td>
				";

				if($i==0)
				{
					echo "<td rowspan=".$cuc." id=\"td$car->ci\" style=\"text-align: center;\"></td>";

					$sql="select d from observacion where ci='$car->ci' and p='$p'";
					$ejec2=pg_query($sigpa, $sql);

					$ob=pg_fetch_object($ejec2);

					echo "<td rowspan=\"$cuc\">$ob->d</td>";
?>

	</tr>

<?php

			}

			$th+=$uc2[4]+$uc2[5];
		}

		echo "<script> getID(\"td$car->ci\").innerHTML=\"$th\"; </script>";
	}
?>

</table>

<?php

}

	$ejec=pg_query($sigpa, $sql2);

	if(pg_affected_rows($ejec)>0)
	{
		++$ra;
?>
<br/><br/>
<table class="tab_index">
	<tr>
		<th colspan=10>PERSONAL AUXILIAR DOCENTE ORDINARIO</th>
	</tr>
	<tr>
		<th rowspan=2 style="color: #0000cb;">
			Profesor
		</th>

		<th rowspan=2 style="color: #0000cb;">
			Ded.
		</th>

		<th rowspan=2 style="color: #0000cb;">
			Cat.
		</th>

		<th rowspan=2 style="color: #0000cb;">
			Unidad Curricular
		</th>

		<th rowspan=2 style="color: #0000cb;">
			Seccion
		</th>

		<th colspan=2 style="color: #0000cb;">
			Horas
		</th>

		<th rowspan=2 style="color: #0000cb;">
			Horas semanales
		</th>

		<th rowspan=2 style="color: #0000cb;">
			Total horas
		</th>

		<th rowspan=2 style="color: #0000cb;">
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
		while($car=pg_fetch_object($ejec))
		{
			$uc=explode("/", $car->uc);
			$cuc=count($uc);

			$th=0;

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
					";

					echo ucwords(strtolower($car->prof));

					echo ". $car->re<br/>
			C.I: $car->ci
		</td>

		<td rowspan=".$cuc." style=\"text-align: center;\">
			$car->ded
		</td>

		<td rowspan=".$cuc." style=\"text-align: center;\">
			".ucwords(strtolower($car->cat))."
		</td>
					";
				}

				$uc2=explode(",", $uc[$i]);

				echo "
		<td>
			$uc2[0]";

				if(($uc2[1]=="0")&&($uc2[2]=="2"))
				{
					echo " (Transición)";
				}

				else
				{
					echo " (T$uc2[1]";

					if($uc2[1]!="0")
					{
						echo "<span style=\"text-transform: lowercase;\">t</span>"."$uc2[2]";
					}

					echo ")";
				}

				echo "
		</td>

		<td style=\"text-align: center;\">
			$uc2[3]
		</td>

		<td style=\"text-align: center;\">
			$uc2[6]
		</td>

		<td style=\"text-align: center;\">
			$uc2[7]
		</td>

		<td style=\"text-align: center;\">
			".round($uc2[4]+$uc2[5])."
		</td>
				";

				if($i==0)
				{
					echo "<td rowspan=".$cuc." id=\"td$car->ci\" style=\"text-align: center;\"></td>";

					$sql="select d from observacion where ci='$car->ci' and p='$p'";
					$ejec2=pg_query($sigpa, $sql);

					$ob=pg_fetch_object($ejec2);

					echo "<td rowspan=\"$cuc\">$ob->d</td>";
?>

	</tr>

<?php

			}

			$th+=$uc2[4]+$uc2[5];
		}

		echo "<script> getID(\"td$car->ci\").innerHTML=\"$th\"; </script>";
	}
?>

</table>

<?php

}

	$ejec=pg_query($sigpa, $sql3);

	if(pg_affected_rows($ejec)>0)
	{
		++$ra;
?>
<br/><br/>
<table class="tab_index">
	<tr>
		<th colspan=10>PERSONAL DOCENTE CONTRATADO</th>
	</tr>
	<tr>
		<th rowspan=2 style="color: #0000cb;">
			Profesor
		</th>

		<th rowspan=2 style="color: #0000cb;">
			Ded.
		</th>

		<th rowspan=2 style="color: #0000cb;">
			Cat.
		</th>

		<th rowspan=2 style="color: #0000cb;">
			Unidad Curricular
		</th>

		<th rowspan=2 style="color: #0000cb;">
			Seccion
		</th>

		<th colspan=2 style="color: #0000cb;">
			Horas
		</th>

		<th rowspan=2 style="color: #0000cb;">
			Horas semanales
		</th>

		<th rowspan=2 style="color: #0000cb;">
			Total horas
		</th>

		<th rowspan=2 style="color: #0000cb;">
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
		while($car=pg_fetch_object($ejec))
		{
			$uc=explode("/", $car->uc);
			$cuc=count($uc);

			$th=0;

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
					";

					echo ucwords(strtolower($car->prof));

					echo ". $car->re<br/>
			C.I: $car->ci
		</td>

		<td rowspan=".$cuc." style=\"text-align: center;\">
			$car->ded
		</td>

		<td rowspan=".$cuc." style=\"text-align: center;\">
			".ucwords(strtolower($car->cat))."
		</td>
					";
				}

				$uc2=explode(",", $uc[$i]);

				echo "
		<td>
			$uc2[0]";

				if(($uc2[1]=="0")&&($uc2[2]=="2"))
				{
					echo " (Transición)";
				}

				else
				{
					echo " (T$uc2[1]";

					if($uc2[1]!="0")
					{
						echo "<span style=\"text-transform: lowercase;\">t</span>"."$uc2[2]";
					}

					echo ")";
				}

				echo "
		</td>

		<td style=\"text-align: center;\">
			$uc2[3]
		</td>

		<td style=\"text-align: center;\">
			$uc2[6]
		</td>

		<td style=\"text-align: center;\">
			$uc2[7]
		</td>

		<td style=\"text-align: center;\">
			".round($uc2[4]+$uc2[5])."
		</td>
				";

				if($i==0)
				{
					echo "<td rowspan=".$cuc." id=\"td$car->ci\" style=\"text-align: center;\"></td>";

					$sql="select d from observacion where ci='$car->ci' and p='$p'";
					$ejec2=pg_query($sigpa, $sql);

					$ob=pg_fetch_object($ejec2);

					echo "<td rowspan=\"$cuc\">$ob->d</td>";
?>

	</tr>

<?php

			}

			$th+=$uc2[4]+$uc2[5];
		}

		echo "<script> getID(\"td$car->ci\").innerHTML=\"$th\"; </script>";
	}
?>

</table>

<?php

}


	if($ra==0)
	{
		echo "<span style='color: red;'>No se ha realizado ninguna carga </span>";
	}
?>

<script>
	function obs(ci, d)
	{
		getID(ci).src="css/img/cargando.gif";
		getID(ci).title="Guardando observaciones..";
		getID(ci).parentNode.style.display="inline-block";

		var observacion=new ajax_req(function ()
		{
			if((this.statusText=="OK")&&(this.readyState==4))
			{
				if(this.responseText)
					getID(ci).parentNode.style.display="none";

				else
				{
					getID(ci).src="css/img/eliminar.png";
					getID(ci).title="Ocurrio un error, haga click aqui para reintentar";
					getID(ci).attr("OnClick", "obs('"+ci+"', '"+d+"')");
				}
			}
		}, "data/Planificacion/observacion.php", "POST", "p="+getID("p").value+"&ci="+ci+"&d="+d);
	}

	function observ(p)
	{
		if(!confirm("Realmente desea que se autogeneren las observaciones? Recuerde que se sobrescribirán todas las observaciones que ya se hayan creado"))
			return false;

		getID("genObs").src="css/img/cargando.gif";
		getID("genObs").title="Generando observaciones..";
		getID("genObs").parentNode.style.display="block";

		var genObs=new ajax_req(function ()
		{
			if((this.statusText=="OK")&&(this.readyState==4))
			{
				if(!this.responseText)
					window.location.href=window.location.href;

				else
				{
					getID("genObs").src="css/img/eliminar.png";
					getID("genObs").title="Ocurrio un error, vuelva a intentarlo";
				}
			}
		}, "data/Planificacion/gen_obs.php", "POST", "p="+p);
	}

	function restaurar(id)
	{
		getID("Obs"+id).value=getID("dObs"+id).value;
		getID("Obs"+id).focus();
	}

	function imprimir()
	{
		window.location.href="data/Reportes/index.php?t=p&p="+getID("p").value;
	}
</script>