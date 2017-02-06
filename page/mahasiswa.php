<?php
$update = (isset($_GET['action']) AND $_GET['action'] == 'update') ? true : false;
if ($update) {
	$sql = $connection->query("SELECT * FROM mahasiswa WHERE nim='$_GET[key]'");
	$row = $sql->fetch_assoc();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	$validasi = false; $err = false;
	if ($update) {
		$sql = "UPDATE mahasiswa SET nim='$_POST[nim]', nama='$_POST[nama]', alamat='$_POST[alamat]', jenis_kelamin='$_POST[jenis_kelamin]', tahun_mengajukan='".date("Y")."' WHERE nim='$_GET[key]'";
	} else {
		$sql = "INSERT INTO mahasiswa VALUES ('$_POST[nim]', '$_POST[nama]', '$_POST[alamat]', '$_POST[jenis_kelamin]', '".date("Y")."')";
		$validasi = true;
	}

	if ($validasi) {
		$q = $connection->query("SELECT nim FROM mahasiswa WHERE nim=$_POST[nim]");
		if ($q->num_rows) {
			echo alert($_POST["nim"]." sudah terdaftar!", "?page=mahasiswa");
			$err = true;
		}
	}

  if (!$err AND $connection->query($sql)) {
    echo alert("Berhasil!", "?page=mahasiswa");
  } else {
		echo alert("Gagal!", "?page=mahasiswa");
  }
}

if (isset($_GET['action']) AND $_GET['action'] == 'delete') {
  $connection->query("DELETE FROM mahasiswa WHERE nim=$_GET[key]");
	echo alert("Berhasil!", "?page=mahasiswa");
}
?>
<div class="row">
	<div class="col-md-4">
	    <div class="panel panel-<?= ($update) ? "warning" : "info" ?>">
	        <div class="panel-heading"><h3 class="text-center"><?= ($update) ? "EDIT" : "TAMBAH" ?></h3></div>
	        <div class="panel-body">
	            <form action="<?=$_SERVER['REQUEST_URI']?>" method="POST">
	                <div class="form-group">
	                    <label for="nim">NIM</label>
	                    <input type="text" name="nim" class="form-control" <?= (!$update) ?: 'value="'.$row["nim"].'"' ?>>
	                </div>
	                <div class="form-group">
	                    <label for="nama">Nama Lengkap</label>
	                    <input type="text" name="nama" class="form-control" <?= (!$update) ?: 'value="'.$row["nama"].'"' ?>>
	                </div>
	                <div class="form-group">
	                    <label for="alamat">Alamat</label>
	                    <input type="text" name="alamat" class="form-control" <?= (!$update) ?: 'value="'.$row["alamat"].'"' ?>>
	                </div>
									<div class="form-group">
	                  <label for="jenis_kelamin">Jenis Kelamin</label>
										<select class="form-control" name="jenis_kelamin">
											<option>---</option>
											<option value="Laki-laki" <?= (!$update) ?: (($row["jenis_kelamin"] != "Laki-laki") ?: 'selected="on"') ?>>Laki-laki</option>
											<option value="Perempuan" <?= (!$update) ?: (($row["jenis_kelamin"] != "Perempuan") ?: 'selected="on"') ?>>Perempuan</option>
										</select>
									</div>
	                <button type="submit" class="btn btn-<?= ($update) ? "warning" : "info" ?> btn-block">Simpan</button>
	                <?php if ($update): ?>
										<a href="?page=mahasiswa" class="btn btn-info btn-block">Batal</a>
									<?php endif; ?>
	            </form>
	        </div>
	    </div>
	</div>
	<div class="col-md-8">
	    <div class="panel panel-info">
	        <div class="panel-heading"><h3 class="text-center">DAFTAR MAHASISWA</h3></div>
	        <div class="panel-body">
	            <table class="table table-condensed">
	                <thead>
	                    <tr>
	                        <th>No</th>
	                        <th>NIM</th>
	                        <th>Nama</th>
	                        <th>Alamat</th>
	                        <th>Jenis Kelamin</th>
	                        <th>Tahun</th>
	                        <th></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <?php $no = 1; ?>
	                    <?php if ($query = $connection->query("SELECT * FROM mahasiswa")): ?>
	                        <?php while($row = $query->fetch_assoc()): ?>
	                        <tr>
	                            <td><?=$no++?></td>
	                            <td><?=$row['nim']?></td>
	                            <td><?=$row['nama']?></td>
	                            <td><?=$row['alamat']?></td>
	                            <td><?=$row['jenis_kelamin']?></td>
	                            <td><?=$row['tahun_mengajukan']?></td>
	                            <td>
	                                <div class="btn-group">
	                                    <a href="?page=mahasiswa&action=update&key=<?=$row['nim']?>" class="btn btn-warning btn-xs">Edit</a>
	                                    <a href="?page=mahasiswa&action=delete&key=<?=$row['nim']?>" class="btn btn-danger btn-xs">Hapus</a>
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
