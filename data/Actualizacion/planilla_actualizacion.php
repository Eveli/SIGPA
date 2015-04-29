<?php
session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	$ci=$_GET["ci"];
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
	WHERE carrera.cc=carrera_actualizacion_prof.cc AND profesor.ci=actualizacion_prof.ci AND actualizacion_prof.ci='$ci' AND
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
			<table>
				<tr>
					<td><label>PNF o Especialidad</label></td>
					<td><label>Cédula de Identidad</label></td>
				</tr>
				<tr>
					<td><input type="text" name="d" value="<?=$row['d']?>" placeholder="PNF o ESPECIALIDAD" disabled maxlength="50"></td>
					<td><input type="text" name="ci" value="<?=$row['ci']?>" placeholder="C.I" disabled maxlength="9"></td>
				</tr>
				<tr><td><br /></td></tr>
				<tr>
					<td><label>Primer Nombre</label></td>
					<td><label>Segundo Nombre</label></td>
				</tr>
				<tr>
					<td><input type="text" name="n1" value="<?=$row['n1']?>" placeholder="Primer Nombre" disabled maxlength="50" title="Primer Nombre" required=""></td>
					<td><input type="text" name="n2" value="<?=$row['n2']?>" placeholder="Segundo Nombre" disabled maxlength="50" title="Segundo Nombre" required=""></td>
				<tr>
				<tr><td><br /></td></tr>
				<tr>
					<td><label>Primer Apellido</label></td>
					<td><label>Segundo Apellido</label></td>
				</tr>
				<tr>
					<td><input type="text" name="a1" value="<?=$row['a1']?>" placeholder="Primer Apellido" disabled maxlength="50" title="Primer Apellido" required=""></td>
					<td><input type="text" name="a2" value="<?=$row['a2']?>" placeholder="Segundo Apellido" disabled maxlength="50" title="Segundo Apellido" required=""></td>
				</tr>
				<tr><td><br /></td></tr>
				<tr>
					<td><label>Correo Electrónico</label></td>
					<td><label>Sexo</label></td>
				</tr>
				<tr>
					<td><input type="text" name="ce" value="<?=$row['ce']?>" placeholder="ejemplo@mail.com" maxlength="6" title="Correo electronico" required=""></td>
					<td>
						M<input type="radio" name="sexo" title="Masculino" value="masculino" <?php if ($row['sexo'] == "masculino") { echo "checked=\"checked\"";} ?> onclick="selec()"/>
						F<input type="radio" name="sexo" title="Femenino"  value="femenino" <?php if ($row['sexo'] == "femenino") { echo "checked=\"checked\"";} ?> onclick="selec()"/>
					</td>
				</tr>
				<tr><td><br /></td></tr>
				<tr>
					<td><label>Teléfono Fijo</label></td>
					<td><label>Teléfono Móvil</label></td>
				</tr>
				<tr>
					<td><input type="text" name="tf" value="<?=$row['tf']?>" placeholder="0274-#######" maxlength="12" title="Introducir el Telf. de Hab." required=""></td>
					<td><input type="text" name="tm" value="<?=$row['tm']?>" placeholder="04##-#######" maxlength="12" title="Introducir el  Telf. Celular" required=""></td>
				</tr>
				<tr><td><br /></td></tr>
				<tr>
					<td colspan="2"><label>Dirección de Habitación</label></td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="direccion" placeholder="Dirección de Habitación" title="Dirección de habitación" cols="50" rows="5"><?=$row['direccion']?></textarea></td>
				</tr>
			</table>
		</fieldset>
	</div>
	<div class="fieldset1">
		<fieldset class="fieldset2">
			<legend>Datos Académicos</legend>
			<table>
				<tr>
					<td><label>Dedicación</label></td>
					<td><label>Categoría</label></td>
				</tr>
				<tr>
					<td><input type="text" name="ded" value="<?=$row['d']?>" placeholder="Dedicación" maxlength="5" title="Dedicación del Docente" required/></td>
					<td><input type="text" name="cat" value="<?=$row['categoria']?>" placeholder="Categoria" maxlength="8" title="Categoria del Docente" required/></td>
				</tr>
				<tr><td><br /></td></tr>
				<tr>
					<td><label>Fecha de Ingreso</label></td>
					<td><label>Año_Ascenso</label></td>
				</tr>
				<tr>
					<td><input type="date" name="fecha_ingreso" value="<?=$row['fecha_ingreso']?>" placeholder="Fecha de Ingreso" title="Fecha de Ingreso a la Universidad" maxlength="6" required/></td>
					<td><input type="text" name="año_ascenso" value="<?=$row['año_ascenso']?>" placeholder="Año de Ascenso" maxlength="6" title="Año del Ultimo Ascenso" required/></td>
				</tr>
				<tr><td><br /></td></tr>
				<tr>
					<td colspan="2"><label>Labora en otro PNF o Especialidad </label></td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="otro_pnf" placeholder="Indique en cual PNF y cuantas horas" cols="60" rows="2"><?=$row['otro_pnf']?></textarea></td>
				</tr>
				<tr><td><br /></td></tr>
				<tr>
					<td colspan="2"><label>En que unidades curriculares del PNF puede<br />aportar mejor sus conocimientos</label></td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="conocimiento_pnf" placeholder="Indique" cols="60" rows="5"><?=$row['conocimiento_pnf']?></textarea></td>
				</tr>
				<tr><td><br /></td></tr>
				<tr>
					<td colspan="2"><label>En que áreas temáticas relacionadas a su PNF puede ayudar como tutor para los proyectos <br />  que se desarrollan en las comunidades</label></td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="tutor_pnf" value="<?=$row['tutor_pnf']?>" placeholder="Indique" cols="60" rows="5"></textarea></td>
				</tr>
				<tr><td><br /></td></tr>
				<tr>
					<td><label title="Indique si pertenece o no a una comunidad de aprendizaje">Labora en PROUEA</label></td>
					<td><label>Asignación</label></td>
				</tr>
				<tr>
					<td>
						SI <input type="radio" name="prouea" value="Si" 
						<?php if ($row['prouea'] == "Si") { echo "checked=\"checked\"";} ?> 
						onclick="asignacion_prouea.disabled=false; nombre_comu.disabled=false"/>
						NO <input type="radio" name="prouea" value="No" 
						<?php if ($row['prouea'] == "No") { echo "checked=\"checked\"";} ?>
						onclick="asignacion_prouea.disabled=true; nombre_comu.disabled=true"/>
					</td>
					<td>
						<select name="asignacion_prouea" value="<?=$row['asignacion_prouea']?>" disabled title="Seleccione su Asignación en PROUEA">
						    <option value="">Seleccione</option>
					     	<option value="Responsable Comunidad de Aprendizaje">Responsable Comunidad de Aprendizaje</option>
					     	<option value="Colaborador">Colaborador</option>
				 		</select>
					</td>
				</tr>
				<tr><td><br /></td></tr>
				<tr>
					<td colspan="2"><label>Nombre de la Comunidad de Aprendizaje</label></td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="nombre_comu" placeholder="Indique" disabled title="Indique el nombre la de la Comunidad de Aprendizaje" cols="60" rows="2"><?=$row['nombre_comu']?></textarea></td>
				</tr>
				<tr><td><br /></td></tr>
				<tr>
					<td><label>Posee Cubículo</label></td>
					<td><label>Nro. de Cubículo</label></td>
				</tr>
				<tr>
					<td>
						SI <input type="radio" name="tenencia_cub" value="Si" 
						<?php if ($row['tenencia_cub'] == "Si") { echo "checked=\"checked\"";} ?> 
						onclick="numero_cub.disabled=false; uso_cub.disabled=false"/>
						NO <input type="radio" name="tenencia_cub" value="No" 
						<?php if ($row['tenencia_cub'] == "Si") { echo "checked=\"checked\"";} ?> 
						onclick="numero_cub.disabled=true; uso_cub.disabled=true"/>
					</td>
					<td>
						<select name="numero_cub" value="<?=$row['nombre_cub']?>" disabled title="Indique el numero del cubiculo donde está asignado">
							<option value="">Seleccione</option>
							<option value="">1</option>
							<option value="">2</option>
							<option value="">3</option>
						</select>
					</td>
				</tr>
				<tr><td><br /></td></tr>
				<tr>
					<td colspan="2"><label>El uso de Cubículo lo dedica a:</label></td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="uso_cub" placeholder="Indique" disabled cols="60" rows="2"><?=$row['uso_cub']?></textarea></td>
				</tr>
				<tr><td><br /></td></tr>
				<tr>
					<td><label title="Proyecto Educativo Institucional">Es PEII</label></td>
					<td><label title="Año de Aplicación del PEII">Año de Aplicación</label></td>
				</tr>
				<tr>
					<td>
						SI <input type="radio" name="peii" value="SI" 
						<?php if ($row['peii'] == "Si") { echo "checked=\"checked\"";} ?> 
						onclick="año_peii.disabled=false"/>
						NO <input type="radio" name="peii" value="No" 
						<?php if ($row['peii'] == "No") { echo "checked=\"checked\"";} ?> 
						onclick="año_peii.disabled=true"/>
					</td>
					<td><input type="text" name="año_peii" placeholder="00-00-0000" disabled title="Introducir año del PEII"/></td>
				</tr>
			</table>
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
