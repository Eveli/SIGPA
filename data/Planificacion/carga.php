<?php
		// Invocacion de las conexiones
	require "../../lib/conexion.php";

	extract($_POST);

	$sql="select n1, a1 from profesor where ci='$ci'";
	$ejec=pg_query($sigpa, $sql);

	$prof=pg_fetch_object($ejec);

	$sql="select p from carga order by p desc limit 1";
	$ejec=pg_query($sigpa, $sql);

	$p=pg_fetch_object($ejec);
?>

<h3><?= "$prof->n1 $prof->a1" ?></h3>

<br/><table class="tab_index" style="margin: 0 auto;">
	<tr>
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
			Opciones
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
	$sql="
		select uc.cuc cuc, uc.d uc, uc.t t, uc.tr tr, c.s sec, c.ht ht, c.hp hp, uc.ht uht, uc.hp uhp, c.cm cm
		from carga c
			join uc
				on uc.cuc=c.cuc and uc.tr=c.tr and uc.cm=c.cm
		where c.ci='$ci'
	";
	$ejec=pg_query($sigpa, $sql);

	while($car=pg_fetch_object($ejec))
	{
?>

	<tr>
<?php
		echo "
			<td>
				$car->uc (T$car->t";

		if($car->t!="0")
		{
			echo "<span style=\"text-transform: lowercase;\">t</span>"."$car->tr";
		}

		echo ")
			</td>
		";
?>

		<td>
			<?= $car->sec; ?>
		</td>

		<td>
			<?= $car->uht; ?>
		</td>

		<td>
			<?= $car->uhp; ?>
		</td>

		<td>
			<?= $car->ht+$car->hp; ?>
		</td>

		<td style="text-align: center;">
			<img src='css/img/eliminar.png' class='bt_opc' title='Eliminar Carga' <?= "OnClick=\"eliminar(this, '$ci', '$car->cuc', '$p->p', ".($car->ht+$car->hp).")\""; ?>  />
		</td>
	</tr>

<?php
	}
?>

</table><br/>

<input type="button" value="Cerrar" OnClick="cerrar_carga()" class="boton" />