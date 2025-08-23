<?= $this->extend('admin/layout/base_admin_template') ?>
<?= $this->section('content') ?>

<h3>Manajemen Admin BPDes</h3>

<!-- Notifikasi -->
<?php if (session()->getFlashdata('success')): ?>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <?= session()->getFlashdata('success') ?>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<?php endif; ?>

<?php if (session()->getFlashdata('error')): ?>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <?= session()->getFlashdata('error') ?>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<?php endif; ?>

<a href="<?= base_url('admin/bpd/adminbpdes/create') ?>" class="btn btn-primary mb-3">Tambah BPDes Admin</a>

<table class="table table-bordered">
    <thead>
        <tr>
            <th>No</th>
            <th>Nama</th>
            <th>Username</th>
            <th>Kecamatan</th>
            <th>Desa/Kelurahan</th>
            <th>Role</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php if (!empty($bpdes_admins) && is_array($bpdes_admins)): ?>
            <?php $no = 1; ?>
            <?php foreach ($bpdes_admins as $bpdes): ?>
                <tr>
                    <td><?= $no++ ?></td>
                    <td><?= esc($bpdes['nama']) ?></td>
                    <td><?= esc($bpdes['username']) ?></td>
                    <td><?= esc($bpdes['nama_kecamatan']) ?></td>
                    <td><?= esc($bpdes['nama_desa']) ?></td>
                    <td><?= esc($bpdes['role']) ?></td>
                    <td>
                        <a href="<?= base_url('admin/bpd/adminbpdes/edit/' . $bpdes['id']) ?>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="<?= base_url('admin/bpd/adminbpdes/delete/' . $bpdes['id']) ?>" class="btn btn-danger btn-sm" onclick="return confirm('Apakah Anda yakin ingin menghapus admin ini?')">Hapus</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        <?php else: ?>
            <tr>
                <td colspan="7" class="text-center">Belum ada admin BPDes</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>

<?= $this->endSection(); ?>
