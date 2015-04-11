<?php
		// Verificar que no se accede al archivo directamente con el navegador
	@include "../../lib/verificar.php";

	switch($_SESSION["n"])
	{
		case 1:
			header("Location: /SIGPA/?r=data/Planificacion/planilla.php");
		break;

		case 2:
				// Verificar que haya un periodo de planificación activo
			$sql="select ff from periodo where t='p' order by ff desc limit 1";
			$ejec=pg_query($sigpa, $sql);

			$p=pg_fetch_object($ejec);
			$fa=date("Y-m-d");

				// Si existe el periodo de planificación activo
			if($p->ff>$fa)
			{
?>

<a href="/SIGPA/?r=data/Planificacion/planilla.php">Ver Planilla</a><br /><br />

<select id="trayecto" OnChange="(this.value==0) ? getID('trimestre').attr('disabled') : getID('trimestre').noattr('disabled'); plan();">
	<option value="">Trayecto</option>
	<option value="0" <?php if($_GET["t"]=='0') echo "selected='selected'"; ?> >Trayecto Inicial</option>
	<option value="1" <?php if($_GET["t"]==1) echo "selected='selected'"; ?> >Trayecto I</option>
	<option value="2" <?php if($_GET["t"]==2) echo "selected='selected'"; ?> >Trayecto II</option>
	<option value="3" <?php if($_GET["t"]==3) echo "selected='selected'"; ?> >Trayecto III</option>
	<option value="4" <?php if($_GET["t"]==4) echo "selected='selected'"; ?> >Trayecto IV</option>
</select>

<select id="trimestre" OnChange="plan()">
	<option value="">Trimestre</option>
	<option value="1" <?php if($_GET["tr"]==1) echo "selected='selected'"; ?> >Trimestre I</option>
	<option value="2" <?php if($_GET["tr"]==2) echo "selected='selected'"; ?> >Trimestre II</option>
	<option value="3" <?php if($_GET["tr"]==3) echo "selected='selected'"; ?> >Trimestre III</option>
</select><br /><br />

<select id="malla" OnChange="plan()">
	<option value="">Malla</option>

<?php
	$sql="select cc from coordinacion where ci='$_SESSION[ci]'";
	$ejec=pg_query($sigpa, $sql);

	$cord=pg_fetch_object($ejec);

	$sql="select cm, f from malla where cc='$cord->cc' and e='1' order by cm desc";
	$ejec=pg_query($sigpa, $sql);

	while($malla=pg_fetch_object($ejec))
	{
		echo "<option value='$malla->cm'";

		if($malla->cm==$_GET["cm"])
		{
			echo " selected=selected";
		}

		echo ">$malla->cm ($malla->f)</option>";
	}
?>

</select><br /><br />

<table class="tab_index" id="tabla_plan" style="display: none;">
	<tr>
		<th>
			Unidad Curricular
		</th>

		<th>
			Profesor
		</th>

		<th>
			Sección
		</th>

		<th>
			Opciones
		</th>
	</tr>

	<tbody id="plan"></tbody>
</table>

<?php
			}

			else
			{
				echo "No existe un período de planificación activo";
			}
		break;
	}
?>

<script>
	function plan()
	{
		if(getID("malla").value=="")
		{
			getID('tabla_plan').style.display='none';
			return false;
		}

		var x=new ajax_req(function ()
		{
			if((this.statusText=="OK")&&(this.readyState==4))
			{
				if(this.responseText)
				{
					getID("plan").innerHTML=this.responseText;
					getID('tabla_plan').style.display='table';
				}

				else
					getID('tabla_plan').style.display='none';
			}
		}, "data/Planificacion/planificacion.php", "POST", "t="+getID("trayecto").value+"&tr="+getID("trimestre").value+"&cm="+getID("malla").value);
	}

	function abrir_asig(cuc, cm)
	{
			// Abrir el PopUp con animación
		getID("asig").style.animation="abrir_sesion 0.5s forwards";
		getID("asig").style.WebkitAnimation="abrir_sesion 0.5s forwards";

		var asig=new ajax_req(function ()
		{
			if((this.statusText=="OK")&&(this.readyState==4))
			{
				if(this.responseText)
					getID("cuerpo_asig").innerHTML=this.responseText;

				else
					alert("Ocurrio un error, vuelva a intentarlo");
			}
		}, "data/Planificacion/nplan.php", "POST", "cuc="+cuc+"&cm="+cm);
	}

	function cerrar_asig()
	{
		getID("asig").style.animation="cerrar_sesion 0.5s forwards";
		getID("asig").style.WebkitAnimation="cerrar_sesion 0.5s forwards";
	}

	function profesores(cuc)
	{
		reiniciar();

		var con=this.value;

		var x=new ajax_req(function ()
		{
			if((this.statusText=="OK")&&(this.readyState==4))
			{
				document.carga.prof.innerHTML=this.responseText;
			}
		}, "data/Planificacion/profesores.php", "POST", "cuc="+cuc+"&c="+con+"&todos="+document.carga.todos.checked+"&t="+getID("trayecto").value+"&tr="+getID("trimestre").value+"&cm="+getID("malla").value);
	}

	function cuenta()
	{
		var f=document.carga;

		if(!f.prof.value)
		{
			this.checked=0;
			alert("Seleccione un profesor");
			return false;
		}

		if(this.checked)
		{
			var ht=parseFloat(f.uc_ht.value);
			var hp=parseFloat(f.uc_hp.value);
			var sec="", id=this.dataset.sec;

			var t=getID("trayecto").value;

			if(t==0)
			{
				if(confirm("Esta es una sección de prosecución?"))
				{
					sec+="(Transición) ";
				}
			}

			else if((t=='III')||(t=='IV'))
			{
				if(confirm("Esta es una sección de prosecución?"))
				{
					sec+="(Prosecución) ";
				}
			}

			if(confirm("Esta es una sección nocturna o de fin de semana?"))
			{
				ht*=1.5;
				hp*=1.5;
				ht=Math.round(ht);
				hp=Math.round(hp);
				sec+="*";
			}

			if(hp>0)
			{
				if(confirm("Las horas prácticas se dividiran en grupos?"))
				{
					hp*=2;

					if(confirm("Las horas teóricas también se dividiran en grupos?"))
					{
						ht*=2;
						sec+=id+"1-"+id+"2 ";
					}

					else
						sec+=id+"("+id+"1-"+id+"2) ";
				}

				else
					sec+=id+" ";
			}

			else
			{
				sec+=id+" ";
			}

			this.value=sec+"/"+ht+"-"+hp;
			f.ht.value=parseFloat(f.ht.value)+ht;
			f.hp.value=parseFloat(f.hp.value)+hp;

			getID("h").innerHTML=parseFloat(getID("h").innerHTML)-(ht+hp);
		}

		else
		{
			var h=this.value.split("/");
			h=h[1].split("-");

			var ht=parseFloat(h[0]);
			var hp=parseFloat(h[1]);

			this.value="";
			f.ht.value-=ht;
			f.hp.value-=hp;

			getID("h").innerHTML=parseFloat(getID("h").innerHTML)+(ht+hp);
		}
	}

	function reiniciar()
	{
		var f=document.carga;

		var check=document.getElementsByName("sec[]");

		for(var i=0; i<check.length; ++i)
		{
			check[i].checked=0;
			check[i].value="";
		}

		f.ht.value="0";
		f.hp.value="0";

		getID("h").innerHTML=0;
	}

	function cargar()
	{
		var f=document.carga;

		if(f.prof.value=="")
		{
			alert("Seleccione un profesor");
			return false;
		}

		var check=document.getElementsByName("sec[]");
		var checked="";

		for(var i=0; i<check.length; ++i)
		{
			if(check[i].checked)
			{
				checked=true;
				break;
			}
		}

		if(!checked)
		{
			alert("Debe seleccionar al menos una sección");
			return false;
		}

		getID("bt_carga").attr("disabled");

		var aux=new Array();

		for(var i=0; i<check.length; ++i)
		{
			aux[i]=check[i].value;

			var v=check[i].value.split("/");
			check[i].value=v[0];
		}

		var f=new FormData(f);

		f.append("t", getID("trayecto").value);
		f.append("tr", getID("trimestre").value);
		f.append("cm", getID("malla").value);

		var carga=new ajax_req(function ()
			{
				if((this.statusText=="OK")&&(this.readyState==4))
				{
					var f=document.carga;

					if(this.responseText=="1")
						window.location.href="?r=data/Planificacion/index.php&t="+getID("trayecto").value+"&tr="+getID("trimestre").value+"&cm="+getID("malla").value;

					else
					{
						alert(this.responseText);

						for(var i=0; i<check.length; ++i)
						{
							check[i].value=aux[i];
						}
					}

					getID("bt_carga").attr("enabled");
				}
			}, "data/Planificacion/guardar.php", "POST", f);

		return false;
	}

	window.onLoad=plan();

	function eliminar(img, ci, cuc, p, h)
	{
		var x=new ajax_req(function ()
			{
				img.src="css/img/cargando.gif";
				img.title="Eliminando..";

				if((this.statusText=="OK")&&(this.readyState==4))
				{
					if(this.responseText==1)
						window.location.href="?r=data/Planificacion/index.php&t="+getID("trayecto").value+"&tr="+getID("trimestre").value+"&cm="+getID("malla").value;

					else
					{
						alert(this.responseText);
						img.src="css/img/eliminar.png";
						img.title="Eliminar Carga";
					}
				}
			}, "data/Planificacion/eliminar.php", "POST", "ci="+ci+"&cuc="+cuc+"&p="+p+"&h="+h+"&t="+getID('trayecto').value+"&tr="+getID('trimestre').value+"&cm="+getID('malla').value);
	}

	function abrir_carga(ci, cc)
	{
			// Abrir el PopUp con animación
		getID("carga").style.animation="abrir_sesion 0.5s forwards";
		getID("carga").style.WebkitAnimation="abrir_sesion 0.5s forwards";

		var carga=new ajax_req(function ()
		{
			if((this.statusText=="OK")&&(this.readyState==4))
			{
				if(this.responseText)
					getID("cuerpo_carga").innerHTML=this.responseText;

				else
					alert("Ocurrio un error, vuelva a intentarlo");
			}
		}, "data/Planificacion/carga.php", "POST", "ci="+ci+"&cc="+cc);
	}

	function cerrar_carga()
	{
		getID("carga").style.animation="cerrar_sesion 0.5s forwards";
		getID("carga").style.WebkitAnimation="cerrar_sesion 0.5s forwards";
	}

	function mostrar_todos()
	{
		var check=document.getElementsByName("con");

		for(var i=0; i<check.length; ++i)
			check[i].checked=0;

		document.carga.prof.innerHTML="<option value=\"\">Profesor</option>";

		reiniciar();
	}

	function nSec(v)
	{
		if(!v)
			return false;

		v=v.toUpperCase();

		if(confirm("Se agregara la sección "+v+", es correcto?"))
		{
			new ajax_req(function ()
			{
				if((this.statusText=="OK")&&(this.readyState==4))
				{
					if(this.responseText)
					{
						document.carga.nsec.style.display="none";
						getID("secciones").innerHTML+="<label><input type=\"checkbox\" name=\"sec[]\" data-sec=\""+v+"\" OnChange=\"cuenta.call(this)\" /> "+v+" </label>";
					}

					else
						alert("Ocurrio un error, vuelva a intentarlo");
				}
			}, "data/Planificacion/nsec.php", "POST", "id="+v);
		}
	}
</script>

<div class="falerta" id="asig">
	<div class="cerrar_alerta" OnClick="cerrar_asig()"></div>

	<div class="alerta" id="cuerpo_asig">
		
	</div>
</div>

<div class="falerta" id="carga">
	<div class="cerrar_alerta" OnClick="cerrar_carga()"></div>

	<div class="alerta" id="cuerpo_carga" style="width: 700px;">
		
	</div>
</div>