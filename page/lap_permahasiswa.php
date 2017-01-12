<div class="row">
	<div class="col-md-12">
	    <div class="panel panel-info">
	        <div class="panel-heading"><h3 class="text-center">Laporan nilai Permahasiswa</h3></div>
	        <div class="panel-body">
							<form class="form-inline" action="<?=$_SERVER["REQUEST_URI"]?>" method="post">
								<label for="beasiswa">NIM :</label>
								<select class="form-control" name="beasiswa">
									<option> --- </option>
									<?php $query = $connection->query("SELECT nim FROM mahasiswa"); while ($row = $query->fetch_assoc()): ?>
										<option value="<?=$row["nim"]?>"><?=$row["nim"]?></option>
									<?php endwhile; ?>
								</select>
								<button type="submit" class="btn btn-primary">Tampilkan</button>
							</form>
	            <?php if ($_SERVER["REQUEST_METHOD"] == "POST"): ?>
								<hr>
								<h2 class="text-center"><?php $query = $connection->query("SELECT * FROM beasiswa WHERE kd_beasiswa=$_POST[beasiswa]"); echo $query->fetch_assoc()["nama"]; ?></h2>
								<hr>
								<table class="table table-condensed">
		                <thead>
		                    <tr>
		                        <th>No</th>
		                        <th>Kriteria</th>
				                    <?php if ($query = $connection->query("SELECT nama FROM beasiswa")): ?>
				                        <?php while($row = $query->fetch_assoc()): ?>
																	<th><?=$row["nama"]?></th>
				                        <?php endwhile ?>
				                    <?php endif ?>
		                    </tr>
		                </thead>
		                <tbody>
		                    <?php $no = 1;?>
		                    <?php if ($query = $connection->query("")): ?>
		                        <?php while($row = $query->fetch_assoc()): ?>
		                        <tr>
		                            <td><?=$no++?></td>
																<td><?=$row["kriteria"]?></td>
		                            <td><?=$row[""]?></td>
		                            <td><?=$row[""]?></td>
		                            <td><?=$row[""]?></td>
		                            <td><?=$row[""]?></td>
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
