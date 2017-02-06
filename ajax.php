<?php
require_once "config.php";

if ($_GET["get"] == "kriteria") {
	$data = [];
	$query = $connection->query("SELECT b.kd_kriteria, b.nama FROM kriteria b JOIN beasiswa c USING(kd_beasiswa) WHERE b.kd_beasiswa=$_GET[beasiswa]");
	while ($row = $query->fetch_assoc()) {
		$data[] = ["kd_kriteria" => $row["kd_kriteria"], "nama" => $row["nama"]];
	}
	echo json_encode($data);
}

if ($_GET["get"] == "nilai") {
	$data = [];
	$query = $connection->query("SELECT bobot, keterangan FROM penilaian WHERE kd_beasiswa=$_GET[beasiswa] AND kd_kriteria=$_GET[kriteria]");
	while ($row = $query->fetch_assoc()) {
		$data[] = ["bobot" => $row["bobot"], "keterangan" => $row["keterangan"]];
	}
	echo json_encode($data);
}
