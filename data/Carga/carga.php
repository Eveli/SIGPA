<?php
include "../../lib/conexion.php"; //Conexión
include "../../lib/menu.php"; // Menú de navegación del sistema
	
	if (isset($_POST['cedula'])) $cedula= $_POST['cedula'];
    else $cedula = null;
	$sql1="SELECT profesor.n1, profesor.n2, profesor.a1, profesor.a2, profesor.ci
			FROM profesor
			WHERE profesor.ci='$cedula'";

	$sql="  SELECT carga.p, carrera.d, string_agg(concat_ws(',', uc.d, uc.t), '/') uc 
			from carga 
			join uc on uc.cuc=carga.cuc and uc.tr=carga.tr 
			join carrera on carrera.cc=uc.cc 
			where carga.ci='$cedula'
			group by carga.p, carrera.d 
			order by carga.p
		";

	$result = pg_query($sql1);
    if(pg_num_rows($result)!=0)
	{
     	$row = pg_fetch_assoc($result);
	}
	else
	{
	     echo "<script type='text/javascript'> alert('Cedula no Registrada en el Sistema'); window.location='consulta_carga.php';</script>";

	}
?>
	<h2 style="text-align:center;">CONSTANCIA</h2>
	<div class="principal">
		<p>Quien suscribre, Jefe del Departamento de Recursos Humanos de la 
		Universidad Politécnica Territorial del Estado Mérida "Kleber Ramírez,
		ubicada en Ejido Estado Mérida, hace constar que de acuerdo a revisión 
		efectuada al expediente del(la) ciudadano(a) <strong><?=$row['n1']?>
		<?=$row['n2']?> <?=$row['a1']?> <?=$row['a2']?></strong>, titular de 
		la cédula de identidad N° <strong>V-<?=$row['ci']?></strong>, se ha
		desempeñado como Docente en la Universidad de las Unidades Curriculares
		en los Periodos Académicos que acontinuación se especifican: 
		</p>
	</div><br />
	<table class="tab_index">
		<tr>
			<th>PERIODO ACADÉMICO</th>
			<th>UNIDAD CURRICULAR</th>
			<th>PROGRAMA</th>
		</tr>
		<?php
		$ejec=pg_query($sigpa, $sql);

		while($resul=pg_fetch_object($ejec))
		{
		$uc=explode("/", $resul->uc);
		$cuc=count($uc);

		for($i=0; $i<$cuc; ++$i)
		{
		?>
		<tr>
			<?php 
			if($i==0)
				echo "<td rowspan=\"$cuc\">$resul->p</td>";

			$uc2=explode(",", $uc[$i]);

			echo "<td>$uc2[0] T$uc2[1]</td>";

			if($i==0)
				echo "<td rowspan=\"$cuc\">$resul->d</td>";
		}
		echo "</tr>";
	}
	echo "</table>";

?>