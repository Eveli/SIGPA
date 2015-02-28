<?php
	/*
		La variables $_SERVER almacena datos referentes al servidor, 
		para obtener la URL a la que intenta acceder el usuario se 
		debe consultar el indice "REQUEST_URI"
	*/

	$url=explode("/", $_SERVER["REQUEST_URI"]);

	if($url[1]!="SIGPA")
	{
		header("Location: /SIGPA/");
		exit();
	}
?>
