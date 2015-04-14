<?php
		// Invocacion de las conexiones
	require "../../lib/conexion.php";

	$p=$_POST["p"];

	$sql="
		select c.ci, string_agg(concat_ws('-', concat_ws(':', c.ht+c.hp, uc.cc), concat_ws('/', c.cuc, c.sup)), ',' order by c.sup, uc.d) uc 
		from carga c 
			join uc on uc.cuc=c.cuc and uc.tr=c.tr and uc.cm=c.cm
		where c.p='$p'
		group by c.ci order by c.ci
	";

	$ejec=pg_query($sigpa, $sql);

	while($prof=pg_fetch_object($ejec))
	{
		unset($hc);
		unset($cc);
		$ciAnt="";

		$d="";
		
		$uc=explode(",", $prof->uc);

		for($i=0; $i<count($uc); ++$i)
		{
			if(strpos($uc[$i], "/"))
			{
				$sup=explode("/", $uc[$i]);

				list($hc[$i], $sup[0])=explode("-", $sup[0]);

				$sql="select d from uc where cuc='$sup[0]'";
				$ejec2=pg_query($sigpa, $sql);

				$duc=pg_fetch_object($ejec2);

				$sql="select n1, a1 from profesor where ci='$sup[1]'";
				$ejec2=pg_query($sigpa, $sql);

				$nsup=pg_fetch_object($ejec2);

				if($sup[1]!=$ciAnt)
				{
					$d.="<br>";
					$d.="Suple Prof. $nsup->a1 $nsup->n1 en $duc->d";
					$ciAnt=$sup[1];
				}

				else
					$d.=", $duc->d";
			}

			else
			{
				list($hc[$i], $uc[$i])=explode("-", $uc[$i]);

				$sql="
					select c.ci ci, p.n1 n1, p.a1 a1, uc.d uc
					from carga c
						join profesor p on p.ci=c.ci
						join uc on uc.cuc=c.cuc
					where c.cuc='$uc[$i]' and c.sup='$prof->ci'
					order by c.ci, uc.d
				";
				$ejec2=pg_query($sigpa, $sql);

				if(pg_affected_rows($ejec2))
				{
					$sup=pg_fetch_object($ejec2);

					//$d.="Suplente de Prof. $sup->a1 $sup->n1 en $sup->uc<br>";

					if($sup->ci!=$ciAnt)
					{
						$d.="<br>";
						$d.="Suplente de Prof. $sup->a1 $sup->n1 en $sup->uc";
						$ciAnt=$sup->ci;
					}

					else
						$d.=", $sup->uc";
				}
			}

			list($h, $c)=explode(":", $hc[$i]);

			$cc[$c]+=$h;
		}

		$d.="<br>";

		if(count($cc)>1)
		{
			foreach($cc as $c => $h)
			{
				$sql="select d from carrera where cc='$c'";
				$ejec2=pg_query($sigpa, $sql);
				$dc=pg_fetch_object($ejec2);

				$d.="+$h $dc->d<br>";
			}
		}

		$sql="
			select p.h h, d.h hd
			from profesor p
				join dedicacion d
					on d.ded=p.ded
			where p.ci='$prof->ci'
		";
		$ejec2=pg_query($sigpa, $sql);

		$h=pg_fetch_object($ejec2);

		($h->h>$h->hd) ? $ht=$h->hd : $ht=$h->h;

		if(($h->hd-$h->h)>=0)
			$d.="<span style=\"font-size: 10pt; font-weight: bold;\">Total: ".$ht." horas</span><br>";

		else
		{
			$htv=($h->hd-$h->h)*-1;
			$d.="<span style=\"font-size: 10pt; font-weight: bold;\">Total: ".$ht." horas</span><br>(+$htv Horas de trabajo voluntario)<br>";
		}

		// $d.="<span></span>";

		$sql="select d from observacion where p='$p' and ci='$prof->ci'";
		$ejec2=pg_query($sigpa, $sql);
		
		if(!pg_affected_rows($ejec2))
		{
			//$d.="<br><br>";
			$sql="insert into observacion values('$p', '$prof->ci', '$d')";
		}

		else
		{
/*
			$obs=pg_fetch_object($ejec2);

			$obs=explode("<span></span>", $obs->d);

			if(count($obs)==2)
				$d.=$obs[1];

			else
				$d.=$obs[0];
*/
			$sql="update observacion set d='$d' where p='$p' and ci='$prof->ci'";
		}

		$ejec3=pg_query($sigpa, $sql);
	}
?>