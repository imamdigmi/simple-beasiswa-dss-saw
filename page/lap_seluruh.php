<div class="row">
	<div class="col-md-12">
	    <div class="panel panel-info">
	        <div class="panel-heading"><h3 class="text-center">Laporan Nilai Seluruh Mahasiswa</h3></div>
	        <div class="panel-body">
							<form class="form-inline" action="<?=$_SERVER["REQUEST_URI"]?>" method="post">
								<label for="tahun">Tahun :</label>
								<select class="form-control" name="tahun">
									<option> --- </option>
									<option value="2017">2017</option>
								</select>
								<button type="submit" class="btn btn-primary">Tampilkan</button>
							</form>
	            <?php if ($_SERVER["REQUEST_METHOD"] == "POST"): ?>
								<hr>
								<h2 class="text-center">Laporan seluruh mahasiswa</h2>
								<hr>
								<table class="table table-condensed">
		                <thead>
		                    <tr>
		                        <th>No</th>
		                        <th>NIM</th>
														<th>Nama</th>
														<th>Beasiswa</th>
														<th>Nilai</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <?php $no = 1;?>
		                    <?php if ($query = $connection->query("SELECT DISTINCT(nim), a.nama, a.tahun_mengajukan, c.nama AS beasiswa, b.nilai FROM mahasiswa a JOIN hasil b USING(nim) JOIN beasiswa c USING(kd_beasiswa) WHERE a.tahun_mengajukan='$_POST[tahun]'")): ?>
		                        <?php while($row = $query->fetch_assoc()): ?>
		                        <tr>
		                            <td><?=$no++?></td>
																<td><?=$row["nim"]?></td>
		                            <td><?=$row["nama"]?></td>
		                            <td><?=$row['beasiswa']?></td>
		                            <td><?=$row['nilai']?></td>
		                        </tr>
		                        <?php endwhile ?>
		                    <?php endif ?>
		                </tbody>
		            </table>
	            <?php endif; ?>
	        </div>
	    </div>
	</div>
</div>
