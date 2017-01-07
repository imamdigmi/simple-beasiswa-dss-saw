<?php
require_once "config.php";
if ($_GET["get"] == "kriteria") {
	$query = $connection->query("SELECT b.kd_kriteria, b.nama FROM model a JOIN kriteria b USING(kd_kriteria) JOIN beasiswa c USING(kd_beasiswa) WHERE kd_beasiswa=$_GET[beasiswa]");
	while ($row = $query->fetch_assoc()) {
		$kriteria[] = ["kd_kriteria" => $row["kd_kriteria"], "nama" => $row["nama"]];
	}
	echo json_encode($kriteria);
} else {
	$query = $connection->query("SELECT bobot, keterangan FROM penilaian WHERE kd_beasiswa=$_GET[beasiswa] AND kd_kriteria=$_GET[kriteria]");
	while ($row = $query->fetch_assoc()) {
		$nilai[] = ["bobot" => $row["bobot"], "keterangan" => $row["keterangan"]];
	}
	echo json_encode($nilai);
}
