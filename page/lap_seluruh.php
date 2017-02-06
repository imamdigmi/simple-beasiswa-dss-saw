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
								<?php
								$q = $connection->query("SELECT b.kd_beasiswa, b.nama, h.nilai, m.nama AS mahasiswa, m.nim, (SELECT MAX(nilai) FROM hasil WHERE nim=h.nim) AS nilai_max FROM mahasiswa m JOIN hasil h ON m.nim=h.nim JOIN beasiswa b ON b.kd_beasiswa=h.kd_beasiswa WHERE m.tahun_mengajukan='$_POST[tahun]'");
								$beasiswa = []; $data = [];
								while ($r = $q->fetch_assoc()) {
									$beasiswa[$r["kd_beasiswa"]] = $r["nama"];
									$data[$r["nim"]."-".$r["mahasiswa"]."-".$r["nilai_max"]][$r["kd_beasiswa"]] = $r["nilai"];
								}
								?>
								<hr>
								<table class="table table-condensed">
		                <thead>
		                    <tr>
													<th>NIM</th>
													<th>Nama</th>
													<?php foreach ($beasiswa as $val): ?>
			                        <th><?=$val?></th>
													<?php endforeach; ?>
													<th>Nilai Maksimal</th>
		                    </tr>
		                </thead>
		                <tbody>
                      <?php foreach($data as $key => $val): ?>
												<tr>
													<?php $x = explode("-", $key); ?>
													<td><?=$x[0]?></td>
													<td><?=$x[1]?></td>
													<?php foreach ($val as $v): ?>
														<td><?=number_format($v, 8)?></td>
													<?php endforeach; ?>
													<td><?=number_format($x[2], 8)?></td>
												</tr>
											<?php endforeach ?>
		                </tbody>
		            </table>
	            <?php endif; ?>
	        </div>
	    </div>
	</div>
</div>
