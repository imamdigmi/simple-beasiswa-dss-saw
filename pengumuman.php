<?php
session_start();
require_once "config.php";
if (empty($_SESSION)) {
  header('location: login.php');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Beasiswa</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <style>
        body {
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <div class="container">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">PENGUMUMAN BEASISWA AKAKOM</a>
                </div>
            </div><!-- /.container-fluid -->
        </nav>
        <div class="row">
            <div class="col-md-12">
							<div class="row">
								<div class="col-md-12">
									<table class="table table-condensed">
			                <thead>
			                    <tr>
			                        <th>No</th>
			                        <th>NIM</th>
															<th>Nama</th>
															<th>Beasiswa</th>
			                        <th>Nilai</th>
			                        <th>Tahun</th>
			                        <th></th>
			                    </tr>
			                </thead>
			                <tbody>
			                    <?php $no = 1; ?>
			                    <?php if ($query = $connection->query("SELECT b.nama AS beasiswa, * FROM hasil a JOIN beasiswa b ON a.kd_beasiswa=b.beasiswa")): ?>
			                        <?php while($row = $query->fetch_assoc()): ?>
			                        <tr>
			                            <td><?=$no++?></td>
																	<td><?=$row["nim"]?></td>
																	<td><?=$row["nama"]?></td>
			                            <td><?=$row["biasiswa"]?></td>
			                            <td><?=$row['nilai']?></td>
			                            <td><?=$row['tahun']?></td>
			                        </tr>
			                        <?php endwhile ?>
			                    <?php endif ?>
			                </tbody>
			            </table>
								</div>
							</div>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
</body>
</html>
