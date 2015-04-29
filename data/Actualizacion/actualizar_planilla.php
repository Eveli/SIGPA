<?php
    include('conexion.php');
       
    $d = $_POST ['d'];
    $cc = $_POST ['cc'];
    $ci = $_POST ['ci'];
    $n1 = $_POST ['n1'];
    $n2 = $_POST ['n2'];
    $a1 = $_POST ['a1'];
    $a2 = $_POST ['a2'];
    $ce = $_POST ['ce'];
    $tf = $_POST ['tf'];
    $tm = $_POST ['tm'];
    $direccion = $_POST ['direccion'];
    $ded = $_POST ['ded'];
    $cat = $_POST ['cat'];
    $fecha_ingreso = $_POST ['fecha_ingreso'];
    $año_ascenso = $_POST ['año_ascenso'];
    $otro_pnf = $_POST ['otro_pnf'];
    $conocimiento_pnf = $_POST ['conocimiento_pnf'];
    $tutor_pnf = $_POST ['tutor_pnf'];
    $prouea = $_POST ['prouea'];
    $asignacion_prouea = $_POST ['asignacion_prouea'];
    $nombre_comu = $_POST ['nombre_comu'];
    $tenencia_cub = $_POST ['tenencia_cub'];
    $numero_cub = $_POST ['numero_cub'];
    $uso_cub = $_POST ['uso_cub'];
    $peii = $_POST ['peii'];
    $año_peii = $_POST ['año_peii'];
    $grupo_inv = $_POST ['grupo_inv'];
    $nombre_inv = $_POST ['nombre_inv'];
    $linea_inv = $_POST ['linea_inv'];
    $linea_indagar = $_POST ['linea_indagar'];
    $nomre_esup = $_POST ['nomre_esup'];
    $nombre_uni = $_POST ['nombre_uni'];
    $esup_realiza = $_POST ['esup_realiza'];
    $tipo_esup = $_POST ['tipo_esup']
    $esup_desea = $_POST ['esup_desea'];
   
  

  //$sql =   "UPDATE carrera SET d = '$d' WHERE cc='$cc'

    $sql = "UPDATE profesor SET ci = '$ci', n1 = '$n1', n2= '$n2', a1= '$a1', a2= '$a2', ce= '$ce', tf= '$tf', tm= '$tm', ded = $'ded', cat = $'cat'  WHERE ci = '$ci' cod";

  if(mysql_query($sql))
        {

    $sql = "UPDATE actualizacion_prof SET sexo = $'sexo', direccion= $'direccion', fecha_ingreso = $'fecha_ingreso', año_ascenso = $'año_ascenso', otro_pnf = $'otro_pnf', conocimiento_pnf = $'conocimiento_pnf', tutor_pnf = $'tutor_pnf', observacion = $'observacion', fecha_act ='fecha_act'  WHERE cod_act = $'cod_act'"

if(mysql_query($sql))

  $sql = "UPDATE comunidad_aprendizaje SET prouea = $'prouea', asignacion_prouea = $'asignacion_prouea', nombre_comu = $'nombre_comu', WHERE cod_act = $'cod_act'"

if(mysql_query($sql))

  $sql = "UPDATE cubiculo SET tenencia_cub = $'tenencia_cub',  numero_cub = $'numero_cub', uso_cub = $'uso_cub', WHERE cod_act = $'cod_act'"

if(mysql_query($sql))

  $sql = "UPDATE peii SET peii = $'peii', año_peii = $'año_peii,' WHERE cod_act = $'cod_act'"

if(mysql_query($sql))

  $sql = "UPDATE investigacion SET grupo_inv = $'grupo_inv', nombre_inv = $'nombre_inv,' linea_indagar = $'linea_indagar' WHERE cod_act = $'cod_act'"

if(mysql_query($sql))

  $sql = "UPDATE estudio_superior SET esup_realiza = $'esup_realiza', tipo_esup = $'tipo_esup,' esup_desea = $'esup_desea' WHERE cod_esup = $'cod_esup'"

if(mysql_query($sql))

  $sql = "UPDATE universidad SET nombre_uni = $'nombre_uni' WHERE cod_uni = $'cod_uni'"
