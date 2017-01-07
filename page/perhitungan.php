<?php

if (isset($_GET["beasiswa"])) {
	$beasiswa = [];
	$sql_mahasiswa = $connection->query("SELECT nim FROM mahasiswa WHERE nim IN(SELECT nim FROM nilai)");
	$sql_kriteria = $connection->query("SELECT kd_kriteria FROM model WHERE kd_beasiswa=$_GET[beasiswa]");
	foreach ($sql_mahasiswa->fetch_assoc() as $nim) {
		echo $nim;
	}
}
