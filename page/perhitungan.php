<div class="row">
	<div class="col-md-12">
	<?php if (isset($_GET["beasiswa"])) {
		$sql = "SELECT
						(SELECT nama FROM mahasiswa WHERE nim=mhs.nim) AS nama,
						(SELECT nim FROM mahasiswa WHERE nim=mhs.nim) AS nim,
						(SELECT tahun_mengajukan FROM mahasiswa WHERE nim=mhs.nim) AS tahun,
					  SUM(
					  	IF (
					      	c.sifat = 'max',
					          nilai.nilai / c.normalization,
					          c.normalization / nilai.nilai
					      ) * c.bobot
					  ) AS rangking
					FROM
						nilai
					  JOIN mahasiswa mhs USING(nim)
					  JOIN (
					  	SELECT
					      	nilai.kd_kriteria AS kd_kriteria,
					      	kriteria.sifat AS sifat,
					      	(
										SELECT bobot FROM model WHERE kd_kriteria=kriteria.kd_kriteria
									) AS bobot,
					      	ROUND(
										IF(kriteria.sifat='max', MAX(nilai.nilai), MIN(nilai.nilai)), 1
									) AS normalization
					      FROM nilai
					      JOIN kriteria USING(kd_kriteria)
					  	GROUP BY nilai.kd_kriteria
					  ) c USING(kd_kriteria)
					WHERE kd_beasiswa=$_GET[beasiswa]
					GROUP BY nilai.nim
					ORDER BY rangking DESC"; ?>
	  <div class="panel panel-info">
	      <div class="panel-heading"><h3 class="text-center">DAFTAR</h3></div>
	      <div class="panel-body">
	          <table class="table table-condensed">
	              <thead>
	                  <tr>
	                      <th>No</th>
												<th>NIM</th>
												<th>Nama</th>
												<?php if ($query = $connection->query("SELECT nama FROM kriteria WHERE kd_beasiswa=$_POST[beasiswa]")): ?>
														<?php while($row = $query->fetch_assoc()): ?>
															<th><?=$row["nama"]?></th>
														<?php endwhile ?>
												<?php endif ?>
												<th>Nilai</th>
	                  </tr>
	              </thead>
	              <tbody>
	                  <?php $no = 1; ?>
	                  <?php $query = $connection->query($sql); while($row = $query->fetch_assoc()): ?>
										<?php $connection->query("INSERT INTO hasil VALUES(NULL, '$_GET[beasiswa]', '$row[nim]', '$row[rangking]', '$row[tahun]')") ?>
	                  <tr>
	                      <td><?=$no++?></td>
	                      <td><?=$row["nim"]?></td>
	                      <td><?=$row["nama"]?></td>
	                      <td><?=$row["rangking"]?></td>
	                  </tr>
										<?php endwhile; ?>
	              </tbody>
	          </table>
	      </div>
	  </div>
	<?php } else { ?>
		<h1>Beasiswa belum dipilih...</h1>
	<?php } ?>
	</div>
</div>
