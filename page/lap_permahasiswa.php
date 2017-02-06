<div class="row">
	<div class="col-md-12">
	    <div class="panel panel-info">
	        <div class="panel-heading"><h3 class="text-center">Laporan Nilai Per Mahasiswa</h3></div>
	        <div class="panel-body">
							<form class="form-inline" action="<?=$_SERVER["REQUEST_URI"]?>" method="post">
								<label for="mhs">Mahasiswa :</label>
								<select class="form-control" name="mhs">
									<option> --- </option>
									<?php $q = $connection->query("SELECT * FROM mahasiswa WHERE nim IN(SELECT nim FROM hasil)"); while ($r = $q->fetch_assoc()): ?>
										<option value="<?=$r["nim"]?>"><?=$r["nim"]?> | <?=$r["nama"]?></option>
									<?php endwhile; ?>
								</select>
								<button type="submit" class="btn btn-primary">Tampilkan</button>
							</form>
	            <?php if ($_SERVER["REQUEST_METHOD"] == "POST"): ?>
								<?php
								$q = $connection->query("SELECT b.kd_beasiswa, b.nama, h.nilai, (SELECT MAX(nilai) FROM hasil WHERE nim=h.nim) AS nilai_max FROM mahasiswa m JOIN hasil h ON m.nim=h.nim JOIN beasiswa b ON b.kd_beasiswa=h.kd_beasiswa WHERE m.nim=$_POST[mhs]");
								$beasiswa = []; $data = [];
								while ($r = $q->fetch_assoc()) {
									$beasiswa[$r["kd_beasiswa"]] = $r["nama"];
									$data[$r["kd_beasiswa"]][] = $r["nilai"];
									$max = $r["nilai_max"];
								}
								?>
								<hr>
								<table class="table table-condensed">
									<tbody>
										<?php $query = $connection->query("SELECT DISTINCT(p.kd_beasiswa), k.nama, n.nilai FROM nilai n JOIN penilaian p USING(kd_kriteria) JOIN kriteria k USING(kd_kriteria) WHERE n.nim=$_POST[mhs] AND n.kd_beasiswa=1"); while ($r = $query->fetch_assoc()): ?>
											<tr>
												<th><?=$r["nama"]?></th>
												<td>: <?=number_format($r["nilai"], 8)?></td>
											</tr>
										<?php endwhile; ?>
									</tbody>
								</table>
								<hr>
								<table class="table table-condensed">
		                <thead>
		                    <tr>
													<?php foreach ($beasiswa as $key => $val): ?>
			                        <th><?=$val?></th>
													<?php endforeach; ?>
													<th>Nilai Maksimal</th>
		                    </tr>
		                </thead>
		                <tbody>
											<tr>
                        <?php foreach($beasiswa as $key => $val): ?>
	                        <?php foreach($data[$key] as $v): ?>
															<td><?=number_format($v, 8)?></td>
													<?php endforeach ?>
												<?php endforeach ?>
												<td><?=number_format($max, 8)?></td>
											</tr>
		                </tbody>
		            </table>
	            <?php endif; ?>
	        </div>
	    </div>
	</div>
</div>
