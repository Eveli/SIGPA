<section id="sesion">

<?php
		// Verificar que no se accede al archivo directamente con el navegador
	@include "../verificar.php";

		// Verificar si la cédula del usuario pertenece a algún profesor
	$sql="select n1, a1 from profesor where ci='$_SESSION[ci]'";
	$ejec=pg_query($sigpa, $sql);

	$ra=pg_affected_rows($ejec);

		// Si pertenece a un profesor muestra el primer nombre y el primer apellido del profesor
	if($ra==1)
	{
		$usu=pg_fetch_object($ejec);

		echo "<a href='' style='color: black' title='Haga clic aqui para modificar su información'>$usu->n1 $usu->a1</a> ";
	}

		// Si no pertenece a algún profesor solo escribe la cédula
	else
		echo "$_SESSION[ci] ";

	if(isset($_SESSION["ci"]))
	{
?>

	(<a href="lib/sesion/cerrar.php">Cerrar Sesión</a>)&nbsp;&nbsp;&nbsp;

<?php
	}

	else
	{
?>

	<a OnClick="document.ini.style.display='block'; getID('contenidoInfo').style.display='none'">Iniciar Sesión</a>&nbsp;&nbsp;&nbsp;

<?php
	}
?>

</section>