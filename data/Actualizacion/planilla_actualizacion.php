<?php
require ('conexion.php'); //Conexión
require ('cabecera.php');
require ('menu.php');


$sql="SELECT carrera.d, actualizacion_prof.ci, profesor.n1, profesor.n2, profesor.a1, profesor.a2, 
			profesor.ce,profesor.tf, profesor.tm,actualizacion_prof.direccion,profesor.ded, 
			profesor.cat,actualizacion_prof.fecha_ingreso, actualizacion_prof.año_ascenso, 
			actualizacion_prof.otro_pnf,actualizacion_prof.otro_pnf, actualizacion_prof.conocimiento_pnf, 
			actualizacion_prof.tutor_pnf,comunidad_aprendizaje.prouea, comunidad_aprendizaje.asignacion_prouea, 
			comunidad_aprendizaje.nombre_comu, peii.peii, peii.año_peii, investigacion.grupo_inv,investigacion.nombre_inv, 
			investigacion.linea_inv, investigacion.linea_indagar, estudio_superior.nombre_esup,
			universidad.nombre_uni, estudio_superior.esup_realiza, estudio_superior.tipo_esup,
			estudio_superior.esup_desea, vivienda.tenencia_viv, actualizacion_prof.observacion
   FROM carrera, carrera_actualizacion_prof, actualizacion_prof, profesor, comunidad_aprendizaje, peii, investigacion, estudio_superior,
   actualizacion_estudio, universidad, vivienda
	WHERE carrera.cc=carrera_actualizacion_prof.cc AND profesor.ci=actualizacion_prof.ci AND actualizacion_prof.ci='09499979' AND
	comunidad_aprendizaje.cod_act=actualizacion_prof.cod_act AND peii.cod_act=actualizacion_prof.cod_act AND 
	investigacion.cod_act=actualizacion_prof.cod_act AND estudio_superior.cod_esup=actualizacion_estudio.cod_esup AND 
	universidad.cod_uni=actualizacion_estudio.cod_uni AND actualizacion_estudio.cod_act=actualizacion_prof.cod_act AND vivienda.cod_act=actualizacion_prof.cod_act";

	$result = pg_query($sql);
    $row = pg_fetch_assoc($result);
?>
	<h2 style="text-align:center;">PLANILLA DOCENTE</h2>
	<form method="POST" action="actualizacion_registrar.php" enctype='multipart/form-data'>
		<div class="fieldset1">
			<fieldset class="fieldset2">
				<legend>Datos Personales</legend>
				<label>PNF o Especialidad</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>Cédula de Identidad</label><br />
				<input type="text" name="d" value="<?=$row['d']?>" placeholder="PNF o ESPECIALIDAD" disabled maxlength="50">
				&nbsp;
				<input type="text" name="ci" value="<?=$row['ci']?>" placeholder="C.I" disabled maxlength="9">
				<br><br>
				<label>Primer Nombre</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>Segundo Nombre</label><br />
				<input type="text" name="n1" value="<?=$row['n1']?>" placeholder="Primer Nombre" disabled maxlength="50" title="Primer Nombre" required="">
				&nbsp;
				<input type="text" name="n2" value="<?=$row['n2']?>" placeholder="Segundo Nombre" disabled maxlength="50" title="Segundo Nombre" required="">
				<br><br>
				<label>Primer Apellido</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>Segundo Apellido</label><br />
				<input type="text" name="a1" value="<?=$row['a1']?>" placeholder="Primer Apellido" disabled maxlength="50" title="Primer Apellido" required="">
				&nbsp;
				<input type="text" name="a2" value="<?=$row['a2']?>" placeholder="Segundo Apellido" disabled maxlength="50" title="Segundo Apellido" required="">
				<br><br>
				<label>Correo Electrónico</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>Sexo</label><br />
				<input type="text" name="ce" value="<?=$row['ce']?>" placeholder="ejemplo@mail.com" maxlength="6" title="Correo electronico" required="">
				&nbsp;
				Masculino<input type="radio" name="sexo" value="masculino" <?php if ($row['sexo'] == "masculino") { echo "checked=\"checked\"";} ?> onclick="selec()"/>
				Femenino<input type="radio" name="sexo" value="femenino" <?php if ($row['sexo'] == "femenino") { echo "checked=\"checked\"";} ?> onclick="selec()"/>
				<br><br>
				<label>Teléfono Fijo</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>Teléfono Móvil</label><br />
	        	<input type="text" name="tf" value="<?=$row['tf']?>" placeholder="0274-#######" maxlength="12" title="Introducir el Telf. de Hab." required="">
				&nbsp;
				<input type="text" name="tm" value="<?=$row['tm']?>" placeholder="04##-#######" maxlength="12" title="Introducir el  Telf. Celular" required="">
				<br><br>
	        	<label>Dirección de Habitación</label>
	        	<textarea name="direccion" placeholder="Dirección de Habitación" title="Dirección de habitación" cols="50" rows="5"><?=$row['direccion']?></textarea>
        	</fieldset>
		</div>
		<div class="fieldset1">
			<fieldset class="fieldset2">
				<legend>Datos Académicos</legend>
				Dedicación&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				Categoria<br /> 
		    	<input type="text" name="ded" value="<?=$row['ded']?>" placeholder="Dedicación" maxlength="5" title="Dedicación del Docente" required/>
				&nbsp;
				<input type="text" name="cat" value="<?=$row['cat']?>" placeholder="Categoria" maxlength="8" title="Categoria del Docente" required/>
				<br /><br />
				Fecha de Ingreso&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				Año de Ascenso<br />
				<input type="date" name="fecha_ingreso" value="<?=$row['fecha_ingreso']?>" placeholder="Fecha de Ingreso" title="Fecha de Ingreso a la Universidad" maxlength="6" required/>
				&nbsp;
				<input type="text" name="año_ascenso" value="<?=$row['año_ascenso']?>" placeholder="Año de Ascenso" maxlength="6" title="Año del Ultimo Ascenso" required/>
				<br /><br />
				<label>Labora en otro PNF o Especialidad </label>
				<textarea name="otro_pnf" placeholder="Indique en cual PNF y cuantas horas" cols="60" rows="2"><?=$row['otro_pnf']?></textarea>
				<br /><br />
	    		<label>En que unidades curriculares del PNF puede<br />aportar mejor sus conocimientos</label>
	    		<textarea name="conocimiento_pnf" placeholder="Indique" cols="60" rows="5"><?=$row['conocimiento_pnf']?></textarea>
	    		<br /><br />
	    		<label>En que áreas temáticas relacionadas a su PNF puede ayudar como tutor para los proyectos <br />  que se desarrollan en las comunidades</label>
			    <textarea name="tutor_pnf" value="<?=$row['tutor_pnf']?>" placeholder="Indique" cols="60" rows="5"></textarea>
			    <br /><br />
			    <label title="Indique si pertenece o no a una comunidad de aprendizaje">Labora Ud. en PROUEA</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    <label>Asignación</label><br />
			    SI <input type="radio" name="prouea" value="Si" <?php if ($row['prouea'] == "Si") { echo "checked=\"checked\"";} ?> onclick="asignacion_prouea.disabled=false;
			                                                             nombre_comu.disabled=false"/>
				NO <input type="radio" name="prouea" value="No" <?php if ($row['prouea'] == "No") { echo "checked=\"checked\"";} ?>onclick="asignacion_prouea.disabled=true; 
				                                                         nombre_comu.disabled=true"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name="asignacion_prouea" value="<?=$row['asignacion_prouea']?>" disabled title="Seleccione su Asignación en PROUEA">
				    <option value="">Seleccione</option>
			     	<option value="Responsable Comunidad de Aprendizaje">Responsable Comunidad de Aprendizaje</option>
			     	<option value="Colaborador">Colaborador</option>
		 		</select>
		 		<br /><br />
				<label>Nombre de la Comunidad de Aprendizaje</label>
				<textarea name="nombre_comu" placeholder="Indique" disabled title="Indique el nombre la de la Comunidad de Aprendizaje" cols="60" rows="2"><?=$row['nombre_comu']?></textarea>
				<br /><br />
			   	<label>Posee Cubículo</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   	<label>Nro. de Cubículo</label>
				<br />
				SI <input type="radio" name="tenencia_cub" value="Si" <?php if ($row['tenencia_cub'] == "Si") { echo "checked=\"checked\"";} ?> onclick="numero_cub.disabled=false; 
				                                                               uso_cub.disabled=false"/>
				NO <input type="radio" name="tenencia_cub" value="No" <?php if ($row['tenencia_cub'] == "Si") { echo "checked=\"checked\"";} ?> onclick="numero_cub.disabled=true;
				                                                               uso_cub.disabled=true"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name="numero_cub" value="<?=$row['nombre_cub']?>" disabled title="Indique el numero del cubiculo donde está asignado">
					<option value="">Seleccione</option>
					<option value="">1</option>
					<option value="">2</option>
					<option value="">3</option>
				</select>
				<br /><br />
				<label>El uso de Cubículo lo dedica a:</label>
				<textarea name="uso_cub" placeholder="Indique" disabled cols="60" rows="2"><?=$row['uso_cub']?></textarea>
				<br /><br />
			    <label title="Proyecto Educativo Institucional">Es PEII</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    <label>Año de Aplicación del PEII</label>
				<br />
				SI <input type="radio" name="peii" value="SI" <?php if ($row['peii'] == "Si") { echo "checked=\"checked\"";} ?> onclick="año_peii.disabled=false"/>
				NO <input type="radio" name="peii" value="No" <?php if ($row['peii'] == "No") { echo "checked=\"checked\"";} ?> onclick="año_peii.disabled=true"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" name="año_peii" placeholder="00-00-0000" disabled title="Introducir año del PEII"/>
			</fieldset>
		</div>		
		<div class="fieldset1">
			<fieldset class="fieldset2">
				<legend>Grupo de Investigación</legend>
				<label>Forma parte de un Grupo de investigación en la UPTMKR</label>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				SI <input type="radio" name="grupo_inv" value="Si" <?php if ($row['grupo_inv'] == "Si") { echo "checked=\"checked\"";} ?> onclick="nombre_inv.disabled=false
				                                                            linea_inv.disabled=false"/>
				NO <input type="radio" name="grupo_inv" value="No" <?php if ($row['grupo_inv'] == "No") { echo "checked=\"checked\"";} ?> onclick="nombre_inv.disabled=true
				                                                            linea_inv.disabled=true"/>
				<br /><br />
				<label>Nombre del Grupo de Investigación</label><br />
				<textarea name="nombre_inv" placeholder="Indique" cols="60" rows="2" disabled title="Indique el nombre del grupo de investigacion"><?=$row['nombre_inv']?></textarea>
				<br /><br />
				<label>Línea de Investigación</label><br />
				<textarea name="linea_inv" placeholder="Indique" cols="60" rows="2" disabled><?=$row['linea_inv']?></textarea>
				<br /><br />
				<label>En que linea de Investigación relacionada a su PNF <br />
				puede o desea indagar o trabajar</label>
			    <textarea name="linea_indagar" placeholder="Indique" cols="60" rows="5"><?=$row['linea_indagar']?></textarea>
			</fieldset>
		</div>
		<div class="fieldset1">
			<fieldset class="fieldset2">
				<legend>Estudios Superiores</legend>
				<label>Su Estudio de Pregrado es en:</label>
			    <textarea name="nombre_esup" placeholder="Indique" cols="60" rows="5" title="Indique "><?=$row['nombre_esup']?></textarea>
			    <br /><br />
			    <label>Su Estudio de Pregrado lo obtuvo en que Universidad</label><br />
		        <select name="nombre_uni">
		        	<option value="">Seleccione</option>
		        </select>
		        <br /><br />
		        <label>Realiza actualmente estudios de 4to Nivel</label>
		        <br />
		        SI<input type="radio" name="esup_realiza" value="Si" <?php if ($row['esup_realiza'] == "Si") { echo "checked=\"checked\"";} ?> onclick="tipo_esup.disabled=true" />
		        NO<input type="radio" name="esup_realiza" value="No" <?php if ($row['esup_realiza'] == "No") { echo "checked=\"checked\"";} ?> onclick="tipo_esup.disabled=false" />
		        <br/><br />
		        <label>Seleccione el estudio de 4to nivel que esta realizando</label><br />
		        <select name="tipo_esup" disabled>
		            <option value="">Seleccione</option>
			     	<option value="Doctorado">Doctorado</option>
			     	<option value="Maestria">Maestría</option>
			     	<option value="Especialista">Especialista</option>
			    </select>
			    <br /><br />
		        <label>Desea realizar un estudio de 4to nivel</label>
		        <br />
		        SI<input type="radio" name="esup_desea" value="Si" <?php if ($row['esup_desea'] == "Si") { echo "checked=\"checked\"";} ?>>
		        NO<input type="radio" name="esup_desea" value="No" <?php if ($row['esup_desea'] == "No") { echo "checked=\"checked\"";} ?>>
		        <br /><br />
		        <label>Seleccione el tipo de estudio de 4to nivel que desea realizar</label><br />
		        <select name="tipo_esup" disabled>
		            <option value="">Seleccione</option>
			     	<option value="Doctorado">Doctorado</option>
			     	<option value="Maestria">Maestría</option>
			     	<option value="Especialista">Especialista</option>
			    </select>
			    <br /><br />
				<label>Nombre de la Universidad en la que realiza o desea hacer el estudio de 4to Nivel</label>
				<br />
		        <select name="nombre_uni">
		        	<option value="">Seleccione</option>
		        </select>
		        <br /><br />
				<label>Nombre del Postgrado</label> ojoooooo
				<br />
				<textarea name="nombre_esup" placeholder="Indique" cols="60" rows="2"><?=$row['nombre_esup']?></textarea>
				<br /><br /><hr><br />
				<label>Tenencia de su vivienda</label><br/>
		        <select name="tenencia_viv">
		            <option value="">Seleccione</option>
			     	<option value="Propia">Propia</option>
			     	<option value="Alquilada">Alquilada</option>
			     	<option value="Hipotecada">Hipotecada</option>
			     	<option value="Comparte con un familiar">Comparte con un familiar</option>
			     	<option value="Otra">Otra</option>
		        </select>
			    <br /><br />
			    <label>Desea informar o preguntar algo al Vicerrectorado Académico</label><br />
				<textarea name="observacion" placeholder="Indique" cols="60" rows="5"><?=$row['observacion']?></textarea>
				<br /><br />
				<label>Fecha de la Actualización:</label>
				<strong><input type="text" name="fecha_act" readonly value="<?php echo (date('d-m-Y / h:i:s'))?>";?></strong>
			</fieldset>
		</div>
		<div align="center">
			<input type="submit" class="boton" value="Actualizar">
			<input type="reset" class="boton" value="Limpiar">
			<a href="#"><button class="boton">Atras</button></a>
		</div>
	</form>
<?php
require ('pie.php');
?>