<?= $this->extend('admin/layout/base_admin_template') ?>
<?= $this->section('content') ?>

<h3>Manajemen Admin BPW</h3>

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

<a href="<?= base_url('admin/bpn/adminbpw/create') ?>" class="btn btn-primary mb-3">Tambah BPW Admin</a>

<table class="table table-bordered">
    <thead>
    <tr>
        <th>No</th>
        <th>Nama</th>
        <th>Username</th>
        <th>Admin Provinsi</th>
        <th>Role</th>
        <th>Aksi</th>
    </tr>
</thead>
<tbody>
    <?php if (!empty($bpw_admins) && is_array($bpw_admins)): ?>
        <?php $no = 1; ?>
        <?php foreach ($bpw_admins as $bpw): ?>
        <tr>
            <td><?= $no++ ?></td>
            <td><?= esc($bpw['nama']) ?></td>
            <td><?= esc($bpw['username']) ?></td>
            <td><?= esc($bpw['nama_provinsi']) ?></td>
            <td><?= esc($bpw['role']) ?></td>
            <td>
                <a href="<?= base_url('admin/bpn/adminbpw/edit/' . $bpw['id']) ?>" class="btn btn-warning btn-sm">Edit</a>
                <a href="<?= base_url('admin/bpn/adminbpw/delete/' . $bpw['id']) ?>" class="btn btn-danger btn-sm" onclick="return confirm('Apakah Anda yakin ingin menghapus admin ini?')">Hapus</a>
            </td>
        </tr>
        <?php endforeach; ?>
    <?php else: ?>
        <tr>
            <td colspan="6" class="text-center">Belum ada admin BPW</td>
        </tr>
    <?php endif; ?>
</tbody>
</table>

<?= $this->endSection(); ?>
