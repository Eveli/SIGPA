	// Verificar que existan de los datos ingresados
function verificar(opc)
{
	var t;

		// Se guarda la referencia al campo
	ca=this;

		// Si el campo no esta vacio se verificará la existencia
	if(this.value!="")
	{
			// Según el formulario se hará la consulta en las tablas usuario o profesor
		switch(this.parentNode.parentNode.name)
		{
				// Si el formulario es ini o rec hace la consulta en la tabla usuario
			case 'ini':
			case 'rec':
				t="usuario";

					// Si el fomulario es "ini" se guarda la referencia de su submit
				if(this.parentNode.parentNode.name=="ini")
					sub=getID("subini");

					// Si no se guarda la referencia al submit del formulario "rec"
				else
					sub=getID("subrec");
			break;

				// Si el formulario es reg hace la consulta en la tabla profesor
			case 'reg':
				t="profesor";

					// Se guarda la referencia al submit del formulario
				sub=getID("subreg");
			break;

			case 'nprof':
			default:
				t="profesor";

					// Se guarda la referencia al submit del formulario
				sub=getID("subasig");
			break;
		}

			// Parametros que se enviarán al script PHP para ser procesados (Como los input de un formulario)
		var parametros="v="+this.value+"&t="+t;

		env=null;

		if(!opc)
			env=new ajax_req(pr_verificar, "lib/sesion/verificar.php", "POST", parametros);

		else
			env=new ajax_req(pr_verificar2, "lib/sesion/verificar.php", "POST", parametros);
	}

		// Si el campo esta vacio
	else
	{
		this.noattr("style");

		switch(this.parentNode.parentNode.name)
		{
			case 'ini':
				getID("subini").attr("disabled");
				getID("ex_ci_ini").style.display="none";
			break;

			case 'rec':
				getID("subrec").attr("disabled");
				getID("ex_ci_rec").style.display="none";
			break;

			case 'reg':
				getID("subreg").attr("disabled");
				getID("ex_ci_reg").style.display="none";
			break;

			case 'nprof':
				getID("subasig").attr("disabled");
				getID("ex_ci_nprof").style.display="none";
			break;
		}
	}
}

	// Función procesadora de los datos recibidos al realizar la consulta AJAX
function pr_verificar()
{
	if(!env.ajax_error())
	{
		switch(env.txt)
		{
			// Verificar

				// Si exite la información ingresada
			case 'ex_ci':
				ca.noattr("style");
				sub.attr("enabled");

				switch(ca.parentNode.parentNode.name)
				{
					case 'ini':
						getID("ex_ci_ini").style.display="none";
					break;

					case 'rec':
						getID("ex_ci_rec").style.display="none";
					break;

					case 'reg':
						getID("ex_ci_reg").style.display="none";
					break;
				}
			break;

				// Si no existe la información ingresada
			case 'ne_ci':
				ca.style.border="2px solid red";
				sub.attr("disabled");

				switch(ca.parentNode.parentNode.name)
				{
					case 'ini':
						getID("ex_ci_ini").style.display="block";
					break;

					case 'rec':
						getID("ex_ci_rec").style.display="block";
					break;

					case 'reg':
						getID("ex_ci_reg").style.display="block";
					break;
				}
			break;
		}

		delete ca;
		delete sub;
	}
}

	// Función procesadora de los datos recibidos al realizar la consulta AJAX
function pr_verificar2()
{
	if(!env.ajax_error())
	{
		switch(env.txt)
		{
			// Verificar

				// Si exite la información ingresada
			case 'ex_ci':
				ca.style.border="2px solid red";
				getID("ex_ci_nprof").style.display="block";
				sub.attr("disabled");
			break;

				// Si no existe la información ingresada
			case 'ne_ci':
				ca.noattr("style");
				getID("ex_ci_nprof").style.display="none";
				sub.attr("enabled");
			break;
		}

		delete ca;
		delete sub;
	}
}
