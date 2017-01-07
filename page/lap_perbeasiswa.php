<div class="row">
	<div class="col-md-12">
	    <div class="panel panel-info">
	        <div class="panel-heading"><h3 class="text-center">Pengumuman</h3></div>
	        <div class="panel-body">
							<form class="form-inline" action="<?=$_SERVER["REQUEST_URI"]?>" method="post">
								<label for="beasiswa">Beasiswa :</label>
								<select class="form-control" name="beasiswa">
									<option> --- </option>
									<?php $query = $connection->query("SELECT * FROM beasiswa"); while ($row = $query->fetch_assoc()): ?>
										<option value="<?=$row["kd_beasiswa"]?>"><?=$row["nama"]?></option>
									<?php endwhile; ?>
								</select>
							</form>
	            <?php if ($_SERVER["REQUEST_METHOD"] == "POST"): ?>
								<hr>
								<table class="table table-condensed">
		                <thead>
		                    <tr>
		                        <th>No</th>
		                        <th>NIM</th>
														<th>Nama</th>
														<th>Alamat</th>
		                        <th>Jenis Kelamin</th>
		                        <th>Tahun Mengajukan</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <?php $no = 1; ?>
		                    <?php if ($query = $connection->query("SELECT * FROM mahasiswa WHERE nim IN(SELECT nim FROM nilai)")): ?>
		                        <?php while($row = $query->fetch_assoc()): ?>
		                        <tr>
		                            <td><?=$no++?></td>
																<td><?=$row["nim"]?></td>
		                            <td><?=$row["nama"]?></td>
		                            <td><?=$row['alamat']?></td>
		                            <td><?=$row['jenis_kelamin']?></td>
		                            <td><?=$row['tahun_mengajukan']?></td>
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
