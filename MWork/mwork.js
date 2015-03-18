//		.: AJAX :.

/*
	Parámetros:

		f -> function, Funsión que procesará la respuesta
		r -> string, Ruta
		m -> string, Método HTTP
		p -> string||FormData, Parámetros

	Uso:
		variable=new ajax_req(funsión procesadora||function (){ if((this.statusText=="OK")&&(this.readyState==4)) { this.responseText; this.responseXML; } }, "ruta/archivo.xxx", "METODO", 'p1='+encodeURIComponent(Valor1)+'&p2='+encodeURIComponent(Valor2)+...||variable del FormData||null (si no tiene parámetros));

		Metodos:
			GET
			POST

		Nota 1: La variable usada debe ser global si la la funsion procesadora es externa.
		Nota 2: Para evitar valores repetidos en las variables globales, puede vaciarse la variable igualandola a null antes de reinstanciar la petición.
		Nota 3: Se recomienda cancelar las peticiones que ya no son necesarias para evitar el mal uso de recursos del servidor (Ver "Cancelar una petición").
*/

function ajax_req(f, r, m, p)
{
	if(window.XMLHttpRequest)
		this.ajax=new XMLHttpRequest();

	else if(window.ActiveXObject)
		this.ajax=new ActiveXObject("Microsoft.XMLHTTP");

	this.ajax.onreadystatechange=f;

	this.ajax.open(m, r);

	if(p)
	{
		if(typeof(p)!="object")
		{
			this.ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			this.ajax.send(p+"&nocache="+Math.random());
		}

		else
			this.ajax.send(p);
	}

	else
		this.ajax.send("nocache="+Math.random());
}



//	Cancelar un peticion

/*
	Uso:
		variable.cancel();
*/

ajax_req.prototype.cancel=function ()
{
	this.ajax.abort();
}





// Verificar la existencia de errores y obtener la respuesta del servidor

/*
	Uso:
		if(!variable.ajax_error())
		{
			variable.txt;
			variable.xml;
		}

		Nota: Una vez obtenida la respuesta del servidor el objeto usado guarda el valor de los datos recibidos en sus atributos (txt para la respuesta en texto, xml para la respuesta en XML)
*/

ajax_req.prototype.ajax_error=function ()
{
	if((this.ajax.statusText=="OK")&&(this.ajax.readyState==4))
	{
		this.txt=this.ajax.responseText;
		this.xml=this.ajax.responseXML;

		return false;
	}

	else
		return true;
}

// --------------------------------





//		.: Cookies :.



//	Crear/Modificar

/*
	Parametros:
		n -> string, Nombre de la Cookie
		v -> string, Valor de la Cookie
		d -> string, Duracion de la Cookie

	Uso:
		Cookie("nombre", "valor", "duración");

		Duraciones:
			Años: 1a;
			Meses: 1M;
			Semanas: 1S;
			Dias: 1d;
			Horas: 1h;
			Minutos: 1m;
			Segundos: 1s;
*/

function Cookie(n, v, d)
{
	var opc=d.slice(-1);
	d=d.slice(0, d.length-1);

	if(!d)
		return false;

	switch(opc)
	{
		case 'a':
			d*=365*24*60*60*1000;
		break;

		case 'M':
			d*=30*24*60*60*1000;
		break;

		case 'S':
			d*=7*24*60*60*1000;
		break;

		case 'd':
			d*=24*60*60*1000;
		break;

		case 'h':
			d*=60*60*1000;
		break;

		case 'm':
			d*=60*1000;
		break;

		case 's':
			d*=1000;
		break;

		default:
			return false;
		break;
	}

	var exp=new Date();

	exp.setTime(exp.getTime()+d);

	document.cookie=n+"="+v+"; expires="+exp.toUTCString();

	alert(document.cookie);
}



// Eliminar

/*
	Parametros:
		n -> string, Nombre de la Cookie

	Uso:
		Cookie("nombre");
*/

function delCookie(n)
{
	var exp=new Date();

	exp.setTime(exp.getTime()-24*60*60*1000);

	document.cookie=n+"=; expires="+exp.toUTCString();
}

// --------------------------------





//		.: Elementos :.



//	Atributos



//		Añadir

/*
	Parametros:
		n -> string, Nombre del atributo
		v -> string, Valor del atributo

	Uso:
		elemento.attr("nombre"); // Asigna a ambos el mismo valor, Ej. nombre="nombre"
		elemento.attr("nombre", "valor");
*/

Object.prototype.attr=function (n, v)
{
	switch(n)
	{
		case 'enabled':
			this.noattr("disabled");
		break;

		case 'disabled':
			this.noattr("enabled");
		break;
	}

	if(v)
		this.setAttribute(n, v);

	else
		this.setAttribute(n, n);
}



//		Eliminar

/*
	Parámetros:
		n -> string, Nombre del atributo
		v -> string, Valor del atributo

	Uso:
		elemento.noattr("nombre"); // Elimina el atributo sin importar el valor
		elemento.attr("nombre", "valor"); // Elimina el atributo solo si el valor es igual al indicado
*/

Object.prototype.noattr=function (n, v)
{
	if(v)
	{
		if(this.getAttribute(n)==v)
			this.removeAttribute(n);
	}

	else
		this.removeAttribute(n);
}



//	Obtener



//		CSS (Selector de CSS)

/*
	Parámetros:
		css -> string, Selector por el que se seleccionará el elemento
		all -> boolean, Seleccionar el grupo completo de elementos encontrados

	Uso:
		var variable=getCSS("css"[, true||false]);
*/

function getCSS(css, all)
{
	if(all)
		return document.querySelectorAll(css);

	else
		return document.querySelector(css);
}



//		Etiqueta

/*
	Parámetros:
		tag -> string, Nombre de etiqueta por el que se seleccionarán los elementos

	Uso:
		var variable=getTAG("tag");
*/

function getTAG(tag)
{
	return document.getElementsByTagName(tag);
}



//		ID

/*
	Parámetros:
		id -> string, ID por el que se seleccionará el elemento

	Uso:
		var variable=getID("id");
*/

function getID(id)
{
	return document.getElementById(id);
}



//		Name

/*
	Parámetros:
		name -> string, Name por el que se seleccionarán los elementos

	Uso:
		var variable=getNAME("name");
*/

function getNAME(name)
{
	return document.getElementsByName(name);
}

// --------------------------------





//		.: Formularios :.



//	Habilitar/Deshabilitar Formulario

//		Habilitar

/*
	Parámetros:
		f -> object, Formulario a habilitar

	Uso:
		form_ON(document.nombre_formulario);
*/

function formON(f)
{
	var f=f.elements;

	for(var i=0; i<f.length; ++i)
	{
		f[i].attr("enabled");
	}
}

//		Deshabilitar

/*
	Parámetros:
		f -> object, Formulario a deshabilitar

	Uso:
		form_OFF(document.nombre_formulario);
*/

function formOFF(f)
{
	var f=f.elements;

	for(var i=0; i<f.length; ++i)
	{
		f[i].attr("disabled");
	}
}



//	Campos



//		Cantidad de caracteres disponibles por escribir

/*
		Parámetros:
			opc -> boolean, Mostrar/Ocultar cantidad (true para mostrar, false para ocultar)

		Uso:
			HTML:
				<span class="inputLength">
					<input type="tipo" name="nombre" placeholder="Informacion" maxlength=MAX title="Tooltip" OnKeyUp="inputLength.call(this, true)" OnFocus="inputLength.call(this, true)" OnBlur="inputLength.call(this)" />
				</span>

			CSS:
				Ver "Cantidad de caracteres disponibles por escribir" de la categoría "Campos" en mwork.css
*/

function inputLength(opc)
{
	if(opc)
		this.parentNode.dataset.length=this.maxLength-this.value.length;

	else
		this.parentNode.dataset.length='';
}



//		Validar Campos

/*
		Parámetros:
			t -> string, Tipo
			msj -> string, Mensaje personalizado (Solo se especifica cuando se quiera cambiar el mensaje a mostrar)
			ns -> boolean, No espacios consecutivos

		Uso:
			OnKeyUp="VAL.call(this, event, 'alf'||'num'||'text'||'textc'||/[ExpresiónRegular]/ [, 'Mensaje personalizado'][, true])"

			Tipos:
				"alf" para letras y números, 
				"num" para números, 
				"text" para letras y espacios,
				"textc" para letras y espacios
				/["Expresión Regular"]/ para agregar expresiones regulares personalizadas
*/

function VAL(e, t, msj, ns)
{
	var er, car, cadena="", err=false;

	if(msj===true)
	{
		msj=false;
		ns=true;
	}

	switch(t)
	{
		case 'alf':
			er=/[a-zA-Z0-9]/;

			if(!msj)
				msj="Carácter inválido, solo se aceptan letras básicas y números";
		break;

		case 'num':
			er=/[0-9]/;

			if(!msj)
				msj="Carácter inválido, solo se aceptan números";
		break;

		case 'text':
			er=/[a-zA-Z\sñÑáÁéÉíÍóÓúÚ]/;

			if(!msj)
				msj="Carácter inválido, solo se aceptan letras y espacios";
		break;

		case 'textc':
			er=/[a-zA-Z0-9\sñÑáÁéÉíÍóÓúÚ,;.:'"_!?-]/;

			if(!msj)
				msj="Carácter inválido, solo se aceptan caracteres usadas en textos (letras, numeros, espacios y algunos caracteres especiales (.,:;'\"-_))";
		break;

		default:
			er=t;

			if(!msj)
				msj="Carácter inválido";
		break;
	}

	if((e.keyCode==16)||(e.keyCode==37)||(e.keyCode==38)||(e.keyCode==39)||(e.keyCode==40))
		return true;

	for(var i=0; i<this.value.length; ++i)
	{
		car=this.value.charAt(i);

		if(ns)
		{
			if(car==" ")
			{
				if(this.value.charAt(i-1)==" ")
				{
					err=true;

					continue;
				}
			}
		}

		if(!er.test(car))
		{
			err=true;

			continue;
		}

		cadena+=car;
	}

	if(err)
	{
		this.value=cadena;

		alert(msj);

		return false;
	}

	else
		return true;
}

// --------------------------------
