<?php
$update = (isset($_GET['action']) AND $_GET['action'] == 'update') ? true : false;
if ($update) {
	$sql = $connection->query("SELECT * FROM nilai WHERE kd_nilai='$_GET[key]'");
	$row = $sql->fetch_assoc();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if ($update) {
		$sql = "UPDATE nilai SET kd_kriteria='$_POST[kd_kriteria]', nim='$_POST[nim]', nilai='$_POST[nilai]' WHERE kd_nilai='$_GET[key]'";
	} else {
		$sql = "INSERT INTO nilai VALUES ('$_POST[kd_nilai]', '$_POST[kd_kriteria]', '$_POST[nim]', '$_POST[nilai]')";
	}
  if ($connection->query($sql)) {
    echo alert("Berhasil!", "?page=nilai");
  } else {
		echo alert("Gagal!", "?page=nilai");
  }
}

if (isset($_GET['action']) AND $_GET['action'] == 'delete') {
  $connection->query("DELETE FROM nilai WHERE kd_nilai='$_GET[key]'");
	echo alert("Berhasil!", "?page=nilai");
}
?>
<div class="row">
	<div class="col-md-4">
	    <div class="panel panel-<?= ($update) ? "warning" : "info" ?>">
	        <div class="panel-heading"><h3 class="text-center"><?= ($update) ? "EDIT" : "TAMBAH" ?></h3></div>
	        <div class="panel-body">
	            <form action="<?=$_SERVER['REQUEST_URI']?>" method="POST">
	                <div class="form-group">
	                    <label for="kd_nilai">Kode</label>
	                    <input type="text" name="kd_nilai" class="form-control" <?= (!$update) ?: 'value="'.$row["kd_nilai"].'" disabled="on"' ?>>
	                </div>
									<div class="form-group">
	                  <label for="kd_kriteria">Kriteria</label>
										<select class="form-control" name="kd_kriteria">
											<option>---</option>
											<?php $sql = $connection->query("SELECT * FROM kriteria") ?>
											<?php while ($data = $sql->fetch_assoc()): ?>
												<option value="<?=$data["kd_kriteria"]?>" <?= (!$update) ?: (($row["kd_kriteria"] != $data["kd_kriteria"]) ?: 'selected="on"') ?>><?=$data["nama"]?></option>
											<?php endwhile; ?>
										</select>
									</div>
									<div class="form-group">
	                  <label for="nim">Mahasiswa</label>
										<select class="form-control" name="nim">
											<option>---</option>
											<?php $sql = $connection->query("SELECT * FROM mahasiswa") ?>
											<?php while ($data = $sql->fetch_assoc()): ?>
												<option value="<?=$data["nim"]?>" <?= (!$update) ?: (($row["nim"] != $data["nim"]) ?: 'selected="on"') ?>><?=$data["nim"]?> | <?=$data["nama"]?></option>
											<?php endwhile; ?>
										</select>
									</div>
	                <div class="form-group">
	                    <label for="nilai">Nilai</label>
	                    <input type="text" name="nilai" class="form-control" <?= (!$update) ?: 'value="'.$row["nilai"].'"' ?>>
	                </div>
	                <button type="submit" class="btn btn-<?= ($update) ? "warning" : "info" ?> btn-block">Simpan</button>
	                <?php if ($update): ?>
										<a href="?page=nilai" class="btn btn-info btn-block">Batal</a>
									<?php endif; ?>
	            </form>
	        </div>
	    </div>
	</div>
	<div class="col-md-8">
	    <div class="panel panel-info">
	        <div class="panel-heading"><h3 class="text-center">DAFTAR</h3></div>
	        <div class="panel-body">
	            <table class="table table-condensed">
	                <thead>
	                    <tr>
	                        <th>No</th>
	                        <th>Kode</th>
	                        <th>Kriteria</th>
	                        <th>Mahasiswa</th>
	                        <th>Nilai</th>
	                        <th></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <?php $no = 1; ?>
	                    <?php if ($query = $connection->query("SELECT * FROM nilai")): ?>
	                        <?php while($row = $query->fetch_assoc()): ?>
	                        <tr>
	                            <td><?=$no++?></td>
	                            <td><?=$row['kd_nilai']?></td>
	                            <td><?=$row['kd_kriteria']?></td>
	                            <td><?=$row['nim']?></td>
	                            <td><?=$row['nilai']?></td>
	                            <td>
	                                <div class="btn-group">
	                                    <a href="?page=nilai&action=update&key=<?=$row['kd_nilai']?>" class="btn btn-warning btn-xs">Edit</a>
	                                    <a href="?page=nilai&action=delete&key=<?=$row['kd_nilai']?>" class="btn btn-danger btn-xs">Hapus</a>
	                                </div>
	                            </td>
	                        </tr>
	                        <?php endwhile ?>
	                    <?php endif ?>
	                </tbody>
	            </table>
	        </div>
	    </div>
	</div>
</div>
