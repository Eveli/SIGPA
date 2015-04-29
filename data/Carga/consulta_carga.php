<?php
include "../../lib/conexion.php"; //Conexión
include "../../lib/menu.php"; // Menú de navegación del sistema
?>
	<center>
		<form method="POST" action="?r=data/Carga/carga.php" enctype='multipart/form-data'>
			<span>Cédula</span> 
			<input name="cedula" type="text" placeholder="00000000" title="Por favor introduzca la cédula del profesor"><button class="boton" type="texto">Consultar</button>
		</form>
	</center>
