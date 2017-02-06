<div class="row">
	<div class="col-md-12">
	    <div class="panel panel-info">
	        <div class="panel-heading"><h3 class="text-center">DAFTAR</h3></div>
	        <div class="panel-body">
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
	        </div>
	    </div>
	</div>
</div>
