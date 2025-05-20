<?php
include 'koneksi.php';

$query = "
SELECT 
    m.nama_mahasiswa,
    mk.nama_matakuliah,
    n.grade
FROM 
    tmahasiswa m
JOIN 
    tnilai n ON m.nirm = n.nirm
JOIN 
    tmatakuliah mk ON n.kode_mk = mk.kode_mk
WHERE 
    TIMESTAMPDIFF(YEAR, m.tgl_lahir, CURDATE()) > 25
    AND n.grade < 60
";

$result = mysqli_query($conn, $query);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Data Mahasiswa & Grade</title>
    <style>
        table { border-collapse: collapse; width: 60%; }
        th, td { border: 1px solid #333; padding: 8px; text-align: left; }
        th { background: #eee; }
    </style>
</head>
<body>
    <h2>Daftar Mahasiswa (Usia > 25 & Grade < 60)</h2>
    <table>
        <tr>
            <th>Nama Mahasiswa</th>
            <th>Nama MataKuliah</th>
            <th>Grade</th>
        </tr>
        <?php while($row = mysqli_fetch_assoc($result)): ?>
        <tr>
            <td><?= htmlspecialchars($row['nama_mahasiswa']) ?></td>
            <td><?= htmlspecialchars($row['nama_matakuliah']) ?></td>
            <td><?= htmlspecialchars($row['grade']) ?></td>
        </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>