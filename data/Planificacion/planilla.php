<?php
		// Verificar que no se accede al archivo directamente con el navegador
	include "../../lib/verificar.php";

	if($_GET["p"])
		$p=$_GET["p"];

	else
	{
		$sql="select p from carga order by p desc limit 1";
		$ejec=pg_query($sigpa, $sql);

		$p=pg_fetch_object($ejec);
		$p=$p->p;
	}
?>

<?php
	switch($_SESSION["n"])
	{
		case 1:
			$cc=$_GET["cc"];
			$s=$_GET["s"];
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

<?php
			$sql="select fi, ff from periodo where t='p' order by ff desc limit 1";
			$ejec=pg_query($sigpa, $sql);

			$f=pg_fetch_object($ejec);

			$fi=explode("-", $f->fi);
			$ff=explode("-", $f->ff);

			$fa=date("Y-m-d");

			if($f->ff>$fa)
			{
?>

<span id="estado" class="activo">Estado:</span>&nbsp;&nbsp;&nbsp;
<div style="font-size: 12px; padding: 10px;"><a href="?r=data/Planificacion/periodos.php">(Periodos de planificación)</a></div>
<div id="fecha"> <?= "Fecha de Inicio: $fi[2]/$fi[1]/$fi[0] - Fecha de Fin: $ff[2]/$ff[1]/$ff[0]" ?> </div><br/>

<form method="GET">
	<select name="p" OnChange="if(this.value!='') this.form.submit();" title="Selecione el periodo que desea consultar">
		<option value="">Periodo</option>

<?php
			$sql="select distinct p from carga order by p desc";
			$ejec=pg_query($sigpa, $sql);

			while($ps=pg_fetch_object($ejec))
			{
				echo "<option value='$ps->p'";

				if($ps->p==$p)
					echo " selected=\"selected\"";

				echo ">$ps->p</option>";
			}
?>

	</select><br/><br/>

	<select name="cc" OnChange="if(this.value!='') this.form.submit();" title="Seleccione la carrera a consultar">
		<option value="">Carrera</option>

<?php
				$sql="select * from carrera order by d";
				$ejec=pg_query($sigpa, $sql);

				while($c=pg_fetch_object($ejec))
				{
					echo "<option value='$c->cc'";

					if($c->cc==$cc)
						echo " selected=selected";

					echo ">$c->d</option>";
				}
?>

	</select><br/><br/>

	<select name="s" OnChange="if(this.value!='') this.form.submit();" title="Seleccione la sede a consultar">
		<option value="">Sede</option>

<?php
				$sql="select s, d from sede order by d";
				$ejec=pg_query($sigpa, $sql);

				while($sede=pg_fetch_object($ejec))
				{
					echo "<option value='$sede->s'";

					if($sede->s==$s)
						echo " selected=selected";

					echo ">$sede->d</option>";
				}
?>

	</select><br/><br/>

	<input type="hidden" name="r" value="data/Planificacion/planilla.php" />
</form>

<?php
			}

			else
			{
?>

<span id="estado" class="inactivo">Estado:</span>&nbsp;&nbsp;&nbsp;
<div style="font-size: 12px; padding: 10px;"><a href="?r=data/Planificacion/periodos.php">(Periodos de planificación)</a></div>

<?php
			}

			$sql="
				select p.a1 a1, p.a2 a2, p.n1 n1, p.n2 n2, p.re re, pr.d prof, p.ci ci, d.abrv ded, cat.d cat, string_agg(concat_ws(',', uc.d, uc.t, uc.tr, c.s, c.ht, c.hp, uc.ht, uc.hp, uc.cm), '/' order by uc.d, uc.t, uc.tr) uc
				from carga c
					join profesor p
						on p.ci=c.ci and p.s='$s'
					join pertenece per
						on per.ci=p.ci and per.cc='$cc'
					join estudios es
						on es.ci=p.ci
					join profesion pr
						on pr.cp=es.cp
					join dedicacion d
						on d.ded=p.ded
					join categoria cat
						on cat.cat=p.cat
					join uc
						on uc.cuc=c.cuc and uc.tr=c.tr and uc.cm=c.cm and uc.cc='$cc'
				where c.p='$p' and p.c='1' and p.cat!='6'
				group by p.a1, p.a2, p.n1, p.n2, pr.d, p.ci, d.abrv, cat.d
				order by p.a1, p.n1
			";

			$sql2="
				select p.a1 a1, p.a2 a2, p.n1 n1, p.n2 n2, p.re re, pr.d prof, p.ci ci, d.abrv ded, cat.d cat, string_agg(concat_ws(',', uc.d, uc.t, uc.tr, c.s, c.ht, c.hp, uc.ht, uc.hp, uc.cm), '/' order by uc.d, uc.t, uc.tr) uc
				from carga c
					join profesor p
						on p.ci=c.ci and p.s='$s'
					join pertenece per
						on per.ci=p.ci and per.cc='$cc'
					join estudios es
						on es.ci=p.ci
					join profesion pr
						on pr.cp=es.cp
					join dedicacion d
						on d.ded=p.ded
					join categoria cat
						on cat.cat=p.cat
					join uc
						on uc.cuc=c.cuc and uc.tr=c.tr and uc.cm=c.cm and uc.cc='$cc'
				where c.p='$p' and p.c='1' and p.cat='6'
				group by p.a1, p.a2, p.n1, p.n2, pr.d, p.ci, d.abrv, cat.d
				order by p.a1, p.n1
			";

			$sql3="
				select p.a1 a1, p.a2 a2, p.n1 n1, p.n2 n2, p.re re, pr.d prof, p.ci ci, d.abrv ded, cat.d cat, string_agg(concat_ws(',', uc.d, uc.t, uc.tr, c.s, c.ht, c.hp, uc.ht, uc.hp, uc.cm), '/' order by uc.d, uc.t, uc.tr) uc
				from carga c
					join profesor p
						on p.ci=c.ci and p.s='$s'
					join pertenece per
						on per.ci=p.ci and per.cc='$cc'
					join estudios es
						on es.ci=p.ci
					join profesion pr
						on pr.cp=es.cp
					join dedicacion d
						on d.ded=p.ded
					join categoria cat
						on cat.cat=p.cat
					join uc
						on uc.cuc=c.cuc and uc.tr=c.tr and uc.cm=c.cm and uc.cc='$cc'
				where c.p='$p' and p.c='3'
				group by p.a1, p.a2, p.n1, p.n2, pr.d, p.ci, d.abrv, cat.d
				order by p.a1, p.n1
			";
		break;

		case 2:
?>

<form method="GET">
	<select name="p" OnChange="if(this.value!='') this.form.submit();" title="Seleccione el periodo a consultar">
		<option value="">Periodo</option>

<?php
			$sql="select distinct p from carga order by p desc";
			$ejec=pg_query($sigpa, $sql);

			while($ps=pg_fetch_object($ejec))
			{
				echo "<option value='$ps->p'";

				if($ps->p==$p)
					echo " selected=\"selected\"";

				echo ">$ps->p</option>";
			}
?>

	</select><br/><br/>

	<input type="hidden" name="r" value="data/Planificacion/planilla.php" />
</form>

<?php
			$sql="select cc, s from coordinacion where ci='$_SESSION[ci]'";
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
						on uc.cuc=c.cuc and uc.tr=c.tr and uc.cm=c.cm and uc.cc='$x->cc'
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
						on uc.cuc=c.cuc and uc.tr=c.tr and uc.cm=c.cm and uc.cc='$x->cc'
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
						on uc.cuc=c.cuc and uc.tr=c.tr and uc.cm=c.cm and uc.cc='$x->cc'
				where c.p='$p' and p.c='3'
				group by p.a1, p.a2, p.n1, p.n2, pr.d, p.ci, d.abrv, cat.d, d.h
				order by p.a1, p.n1
			";
?>

<input type="hidden" id="p" <?= "value=\"$p\""; ?> />

<input type="button" value="Imprimir" class="boton" OnClick="imprimir()" />
<input type="button" value="Regresar" OnClick="window.history.back()" class="boton" /><br/>

<?php
			$sql4="select fi, ff from periodo where t='p' order by ff desc limit 1";
			$ejec=pg_query($sigpa, $sql4);

			$f2=pg_fetch_object($ejec);

			$fi2=explode("-", $f2->fi);
			$ff2=explode("-", $f2->ff);

			$fa2=date("Y-m-d");

			if($f2->ff>$fa2)
			{
?>

<input type="button" value="Generar Observaciones" OnClick="observ(getID('p').value)" style="margin-top: 5px; width: 200px;" class="boton" />
<div style="display: none;">
	<br/>
	<img class="bt_opc" src="css/img/cargando.gif" id="genObs" />
</div>

<?php
			}
?>

<br/><br/>

<?php
		break;
	}

	$ra=0;

	$ejec=pg_query($sigpa, $sql);

	if(pg_affected_rows($ejec)>0)
	{
		++$ra;
?>

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
			$car->prof. $car->re<br/>
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
			$uc2[6]
		</td>

		<td>
			$uc2[7]
		</td>

		<td>
			".round($uc2[4]+$uc2[5])."
		</td>
				";

				if($i==0)
				{
					echo "<td rowspan=".$cuc." id=\"td$car->ci\"></td>";

					$sql="select d from observacion where ci='$car->ci' and p='$p'";
					$ejec2=pg_query($sigpa, $sql);

					$ob=pg_fetch_object($ejec2);

					if($_SESSION["n"]==1)
						echo "<td rowspan=\"$cuc\">$ob->d</td>";

					else if($_SESSION["n"]==2)
					{
?>

		<td <?= "rowspan=\"$cuc\""; ?> style="text-align: center; position: relative; font-size: 8pt;" >
			
<?php
						$sql="
							select p.h, d.h
								from profesor p 
								join dedicacion d 
							on p.ded=d.ded and p.ci='$car->ci'
						";
						$ejec3=pg_query($sigpa, $sql);

						while($h=pg_fetch_object($ejec3))
						{
?>
		
				<div contenteditable="true" <?= "OnBlur=\"obs('$car->ci', this.innerHTML)\" id=\"Obs$car->ci\""; ?> maxlength=500 style="margin-bottom: 50px; min-height: 5em; font-size: 8pt;"><?= $ob->d; ?></div>
				<img class="bt_opc" src="css/img/rest.png" <?= "OnClick=\"restaurar('$car->ci')\""; ?> style="position: absolute; bottom: 5px; left: 40%" title="Restaurar valor actual" />
				<input type="hidden" <?= "id=\"dObs$car->ci\" value='$ob->d'"; ?> />
				<div style="display: none;">
					<br/>
					<img class="bt_opc" src="css/img/cargando.gif" <?= "id=\"$car->ci\""; ?> />
				</div>
		</td>

<?php
						}
					}
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
			$car->prof. $car->re<br/>
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
			$uc2[6]
		</td>

		<td>
			$uc2[7]
		</td>

		<td>
			".round($uc2[4]+$uc2[5])."
		</td>
				";

				if($i==0)
				{
					echo "<td rowspan=".$cuc." id=\"td$car->ci\"></td>";

					$sql="select d from observacion where ci='$car->ci' and p='$p'";
					$ejec2=pg_query($sigpa, $sql);

					$ob=pg_fetch_object($ejec2);

					if($_SESSION["n"]==1)
						echo "<td rowspan=\"$cuc\">$ob->d</td>";

					else if($_SESSION["n"]==2)
					{
?>

		<td <?= "rowspan=\"$cuc\""; ?> style="text-align: center; position: relative; position: relative; font-size: 8pt;" >
			
			<?php $sql="select p.h, d.h
						from profesor p 
						join dedicacion d 
							on p.ded=d.ded and p.ci='$car->ci'";
			
			$ejec3=pg_query($sigpa, $sql);
			
			while($h=pg_fetch_object($ejec3))
			{
				?>
		
				<div contenteditable="true" <?= "OnBlur=\"obs('$car->ci', this.innerHTML)\" id=\"Obs$car->ci\""; ?> maxlength=500 style="margin-bottom: 50px; min-height: 5em; position: relative; font-size: 8pt;"><?= $ob->d; ?></div>
				<img class="bt_opc" src="css/img/rest.png" <?= "OnClick=\"restaurar('$car->ci')\""; ?> style="position: absolute; bottom: 5px; left: 40%" title="Restaurar valor actual" />
				<input type="hidden" <?= "id=\"dObs$car->ci\" value='$ob->d'"; ?> />
				<div style="display: none;">
					<br/>
					<img class="bt_opc" src="css/img/cargando.gif" <?= "id=\"$car->ci\""; ?> />
				</div>
		</td>

<?php
					}
				}
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
			$car->prof. $car->re<br/>
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
			$uc2[6]
		</td>

		<td>
			$uc2[7]
		</td>

		<td>
			".round($uc2[4]+$uc2[5])."
		</td>
				";

				if($i==0)
				{
					echo "<td rowspan=".$cuc." id=\"td$car->ci\"></td>";

					$sql="select d from observacion where ci='$car->ci' and p='$p'";
					$ejec2=pg_query($sigpa, $sql);

					$ob=pg_fetch_object($ejec2);

					if($_SESSION["n"]==1)
						echo "<td rowspan=\"$cuc\">$ob->d</td>";

					else if($_SESSION["n"]==2)
					{
?>

		<td <?= "rowspan=\"$cuc\""; ?> style="text-align: center; position: relative; position: relative; font-size: 8pt;" >
			
			<?php $sql="select p.h, d.h
						from profesor p 
						join dedicacion d 
							on p.ded=d.ded and p.ci='$car->ci'";
			
			$ejec3=pg_query($sigpa, $sql);
			
			while($h=pg_fetch_object($ejec3))
			{
				?>
		
				<div contenteditable="true" <?= "OnBlur=\"obs('$car->ci', this.innerHTML)\" id=\"Obs$car->ci\""; ?> maxlength=500 style="margin-bottom: 50px; min-height: 5em; position: relative; font-size: 8pt;"><?= $ob->d; ?></div>
				<img class="bt_opc" src="css/img/rest.png" <?= "OnClick=\"restaurar('$car->ci')\""; ?> style="position: absolute; bottom: 5px; left: 40%" title="Restaurar valor actual" />
				<input type="hidden" <?= "id=\"dObs$car->ci\" value='$ob->d'"; ?> />
				<div style="display: none;">
					<br/>
					<img class="bt_opc" src="css/img/cargando.gif" <?= "id=\"$car->ci\""; ?> />
				</div>
		</td>

<?php
					}
				}
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
		}, "data/Planificacion/observacion.php", "POST", "p="+getID("p").value+"&ci="+ci+"&d="+encodeURIComponent(d));
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
					getID("genObs").title="Ocurrio un error generando las observaciones, vuelva a intentarlo";
				}
			}
		}, "data/Planificacion/gen_obs.php", "POST", "p="+p);
	}

	function restaurar(id)
	{
		getID("Obs"+id).innerHTML=getID("dObs"+id).value;
		getID("Obs"+id).focus();
	}

	function imprimir()
	{
		window.location.href="data/Reportes/index.php?t=p&p="+getID("p").value;
	}
</script>