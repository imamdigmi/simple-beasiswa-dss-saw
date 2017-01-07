-- Normalisasi
SELECT
	nilai.kd_kriteria,
    kriteria.sifat,
    (SELECT bobot FROM model WHERE kd_kriteria=kriteria.kd_kriteria) AS bobot,
	ROUND(IF(kriteria.sifat='max', MAX(nilai.nilai), MIN(nilai.nilai)), 1) AS normalization
FROM nilai
JOIN kriteria USING(kd_kriteria)
GROUP BY nilai.kd_kriteria

-- Rangking
SELECT
	(SELECT nama FROM mahasiswa WHERE nim=mhs.nim) AS nama,
  SUM(
  	IF (
      	c.sifat = "max",
          nilai.nilai / c.normalization,
          c.normalization / nilai.nilai
      ) * c.bobot
  ) AS rangking
FROM
	nilai
  JOIN mahasiswa mhs USING(nim)
  JOIN (
  	SELECT
      	nilai.kd_kriteria AS kd_kriteria,
      	kriteria.sifat AS sifat,
      	(
					SELECT bobot FROM model WHERE kd_kriteria=kriteria.kd_kriteria
				) AS bobot,
      	ROUND(
					IF(kriteria.sifat='max', MAX(nilai.nilai), MIN(nilai.nilai)), 1
				) AS normalization
      FROM nilai
      JOIN kriteria USING(kd_kriteria)
  	GROUP BY nilai.kd_kriteria
  ) c USING(kd_kriteria)
GROUP BY nilai.nim
ORDER BY rangking DESC
