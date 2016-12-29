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
                    <a class="navbar-brand" href="#">BEASISWA</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="?page=home">Beranda <span class="sr-only">(current)</span></a></li>
                        <?php if ($_SESSION["as"] == "puket"): ?>
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Laporan <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                              <li><a href="?page=pengumuman">Pengumuman</a></li>
                              <li><a href="?page=pendaftaran">Pendaftaran</a></li>
                            </ul>
                          </li>
                        <?php elseif ($_SESSION["as"] == "petugas"): ?>
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Input <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                              <li><a href="?page=data">Data Mahasiswa</a></li>
                              <li><a href="?page=persyaratan">Persyaratan Mahasiswa</a></li>
                            </ul>
                          </li>
                        <?php elseif ($_SESSION["as"] == "mahasiswa"): ?>
                          <li><a href="?page=pengumuman">Pengumuman</a></li>
                        <?php endif; ?>
                        <li><a href="logout.php">Logout</a></li>
                        <li><a href="#">|</a></li>
                        <li><a href="#" style="color: red; font-weight: bold;"><?= $_SESSION["username"] ?></a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        <div class="row">
            <div class="col-md-12">
              <?php include page($_PAGE); ?>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
</body>
</html>
