<?= $this->extend('admin/layout/base_admin_template') ?>
<?= $this->section('content') ?>

<h3>Data Selayang Pandang</h3>
<a href="<?= base_url('admin/selayang-pandang/create') ?>" class="btn btn-primary mb-2">Tambah</a>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Judul</th>
            <th>Pengantar</th>
            <th>Latar Belakang</th>
            <th>Tujuan</th>
            <th>Ruang Lingkup</th>
            <th>Gambar</th> <!-- Kolom tambahan -->
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($selayang as $row): ?>
        <tr>
            <td><?= esc($row['judul']) ?></td>
            <td><?= esc($row['pengantar']) ?></td>
            <td><?= esc($row['latar_belakang']) ?></td>
            <td><?= esc($row['tujuan']) ?></td>
            <td><?= esc($row['ruang_lingkup']) ?></td>
            <td>
                <?php if (!empty($row['gambar'])): ?>
                    <img src="<?= base_url('assets/images/' . $row['gambar']) ?>" alt="Gambar" width="100">
                <?php else: ?>
                    <span class="text-muted">Tidak ada gambar</span>
                <?php endif; ?>
            </td>
            <td>
                <a href="<?= base_url('admin/selayang-pandang/edit/' . $row['id']) ?>" class="btn btn-warning btn-sm">Edit</a>
                <a href="<?= base_url('admin/selayang-pandang/delete/' . $row['id']) ?>" class="btn btn-danger btn-sm" onclick="return confirm('Hapus data ini?')">Hapus</a>
            </td>
        </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<?= $this->endSection() ?>
