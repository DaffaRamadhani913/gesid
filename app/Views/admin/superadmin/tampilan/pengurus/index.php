<?= $this->extend('admin/layout/base_admin_template') ?>
<?= $this->section('content') ?>

<h3>Manajemen Admin BPN</h3>

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

<a href="<?= base_url('admin/superadmin/adminbpn/create') ?>" class="btn btn-primary mb-3">Tambah BPN Admin</a>

<table class="table table-bordered">
    <thead>
        <tr>
            <th>No</th>
            <th>Nama</th>
            <th>Username</th>
            <th>Role</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php if (!empty($bpn_admins) && is_array($bpn_admins)): ?>
            <?php $no = 1; ?>
            <?php foreach ($bpn_admins as $bpn): ?>
            <tr>
                <td><?= $no++ ?></td>
                <td><?= esc($bpn['nama']) ?></td>
                <td><?= esc($bpn['username']) ?></td>
                <td><?= esc($bpn['role']) ?></td>
                <td>
                    <a href="<?= base_url('admin/superadmin/adminbpn/edit/' . $bpn['id']) ?>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="<?= base_url('admin/superadmin/adminbpn/delete/' . $bpn['id']) ?>" class="btn btn-danger btn-sm" onclick="return confirm('Apakah Anda yakin ingin menghapus admin ini?')">Hapus</a>
                </td>
            </tr>
            <?php endforeach; ?>
        <?php else: ?>
            <tr>
                <td colspan="5" class="text-center">Belum ada admin BPN</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>

<?= $this->endSection(); ?>
