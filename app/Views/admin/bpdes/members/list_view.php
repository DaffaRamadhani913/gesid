<?= $this->extend('admin/layout/base_admin_template') ?>
<?= $this->section('content') ?>

<?php
// Prefer the value passed from controller; fall back to session if missing
$namaDesa = $desa['nama_desa'] ?? session()->get('nama_desa') ?? '';
?>

<div class="member-container">
  <div class="mb-4 text-center">
    <h2 class="text-primary fw-bold">
      Data Member GESID - BPDes<?= $namaDesa ? ' (' . esc($namaDesa) . ')' : '' ?>
    </h2>
    <p class="text-muted">Berikut adalah daftar member yang terdaftar di wilayah desa Anda.</p>
  </div>

  <?php if (!empty($members) && is_array($members)) : ?>
    <div class="table-responsive">
      <table class="table table-bordered table-hover">
        <thead class="table-light">
          <tr>
            <th>No</th>
            <th>Nama</th>
            <th>Alamat</th>
            <th>Email</th>
            <th>Desa</th>
          </tr>
        </thead>
        <tbody>
          <?php $no = 1; foreach ($members as $member): ?>
            <tr>
              <td><?= $no++ ?></td>
              <td><?= esc($member['nama']) ?></td>
              <td><?= esc($member['alamat']) ?></td>
              <td><?= esc($member['email']) ?></td>
              <td><?= esc($member['nama_desa']) ?></td>
            </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>
  <?php else : ?>
    <div class="alert alert-warning text-center">Belum ada data member yang terdaftar di desa Anda.</div>
  <?php endif; ?>
</div>

<?= $this->endSection() ?>
