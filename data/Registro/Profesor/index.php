<?php
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
		order by ape1, ape2, nom1, nom2
	";
	$ejec=pg_query($poli, $sql);
?>

<table class="tab_index" align="center">
	<tr>
		<th> Cedula </th>
		<th> Nombre </th>
		<th> Profesion </th>
		<th> Categoria </th>
		<th> Condición </th>
		<th> Dedicación </th>
	</tr>

<?php
	while($p=pg_fetch_object($ejec))
	{
		$sql="
			select 
				c.d c, 
				d.d d 
			from profesor p 
				join categoria c 
					on c.cc=p.c 
				join dedicacion d 
					on d.cd=p.d 
			where p.ci='$p->ci'
		";
		$ejec2=pg_query($sigpa, $sql);

		$p2=pg_fetch_object($ejec2)
?>

	<tr <?php echo "OnDblClick=location='?r=data/Registro/Profesor/consultar.php&ci=$p->ci'"; ?> title="Haga doble clic para hacer una consulta detalla del profesor" >
		<td> <?php echo "$p->ci"; ?> </td>
		<td> <?php echo "<a href='?r=data/Registro/Profesor/consultar.php&ci=$p->ci' class='enlace_nd'>$p->ape1 $p->ape2 $p->nom1 $p->nom2</a>"; ?> </td>
		<td> <?php echo "$p->prof"; ?> </td>
		<td> <?php echo "$p2->c"; ?> </td>
		<td> <?php echo "$p->cond"; ?> </td>
		<td> <?php echo "$p2->d"; ?> </td>
	</tr>

<?php
	}
?>

</table>