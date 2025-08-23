<?= $this->extend('admin/layout/base_admin_template') ?>
<?= $this->section('content') ?>

<h3>Manajemen Admin BPD</h3>

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

<a href="<?= base_url('admin/bpw/adminbpd/create') ?>" class="btn btn-primary mb-3">Tambah BPD Admin</a>

<table class="table table-bordered">
    <thead>
    <tr>
        <th>No</th>
        <th>Nama</th>
        <th>Username</th>
        <th>Kota/Kabupaten</th>
        <th>Role</th>
        <th>Aksi</th>
    </tr>
</thead>
<tbody>
    <?php if (!empty($bpd_admins) && is_array($bpd_admins)): ?>
        <?php $no = 1; ?>
        <?php foreach ($bpd_admins as $bpd): ?>
        <tr>
            <td><?= $no++ ?></td>
            <td><?= esc($bpd['nama']) ?></td>
            <td><?= esc($bpd['username']) ?></td>
            <td><?= esc($bpd['nama_kota']) ?></td>
            <td><?= esc($bpd['role']) ?></td>
            <td>
                <a href="<?= base_url('admin/bpw/adminbpd/edit/' . $bpd['id']) ?>" class="btn btn-warning btn-sm">Edit</a>
                <a href="<?= base_url('admin/bpw/adminbpd/delete/' . $bpd['id']) ?>" class="btn btn-danger btn-sm" onclick="return confirm('Apakah Anda yakin ingin menghapus admin ini?')">Hapus</a>
            </td>
        </tr>
        <?php endforeach; ?>
    <?php else: ?>
        <tr>
            <td colspan="6" class="text-center">Belum ada admin BPD</td>
        </tr>
    <?php endif; ?>
</tbody>
</table>

<?= $this->endSection(); ?>
