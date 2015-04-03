<?php
	include "../../lib/conexion.php";

	// Obtener los profesores existentes dependiendo de la carrera a la que petenecen
	$sql="select ci, s, cc from coordinacion where ci='$_SESSION[ci]'";
	$ejec=pg_query($sigpa, $sql);

	$x=pg_fetch_object($ejec);

	$sql="
		select 
			pr.ci,
			pr.n1, 
			pr.a1
		from profesor pr
		join pertenece p 
		 	on p.ci=pr.ci and p.cc='$x->cc'
		where pr.s='$x->s'
		order by pr.ci
	";
	$ejec=pg_query($sigpa, $sql);
?>

<a title='Haga clic aqui para agregar un nuevo profesor' OnClick=location='?r=data/Profesor/nuevo.php'>Nuevo Profesor</a><br /><br />

<table class="tab_index">
	<tr>
		<th>
			CI
		</th>

		<th>
			Nombre
		</th>

		<th colspan=2>
			Opciones
		</th>
	</tr>

<?php
	
	while($c=pg_fetch_object($ejec))
	{
		echo "<tr>
				<td>$c->ci</td>
				<td>$c->a1 $c->n1</td>
				<td style='text-align: center;'>
					<img src='css/img/editar.png' class='bt_opc' title='Editar datos personales del Profesor' OnClick=location='?r=data/Profesor/editar.php&ci=$c->ci' />
				</td>
				<td style='text-align: center;'>
					<img src='css/img/perfil.png' class='bt_opc' title='Editar perfil académico del Profesor' OnClick=location='?r=data/Profesor/perfil.php&ci=$c->ci' />
				</td>
			 </tr>";
	}
	
	echo "</table>\n";
?>

	<tr <?= "OnDblClick=location='?r=data/Profesor/consultar.php&ci=$c->ci'"; ?> title="Haga dobleclick aqui para obtener informacion detalla del profesor">
</table>
