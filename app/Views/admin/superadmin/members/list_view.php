<?= $this->extend('Views/admin/layout/base_admin_template') ?>
<?= $this->section('content') ?>

<div class="container my-5">
  <div class="text-center mb-4">
    <h2 class="fw-bold text-primary">📋 Data Member GESID</h2>
    <p class="text-muted">Berikut adalah daftar member yang telah terdaftar dalam sistem GESID.</p>
  </div>

  <?php if (!empty($members) && is_array($members)) : ?>
    <div class="table-responsive">
      <table class="table table-striped table-hover border shadow-sm rounded">
        <thead class="table-primary text-center">
          <tr>
            <th>No</th>
            <th>Nama</th>
            <th>Alamat</th>
            <th>Email</th>
            <th>Telepon</th>
            <th>Pekerjaan</th>
          </tr>
        </thead>
        <tbody>
          <?php $no = 1; foreach ($members as $member): ?>
            <tr>
              <td class="text-center"><?= $no++ ?></td>
              <td><?= esc($member['nama']) ?></td>
              <td><?= esc($member['alamat']) ?></td>
              <td><?= esc($member['email']) ?></td>
              <td><?= esc($member['telepon']) ?></td>
              <td><?= esc($member['pekerjaan']) ?></td>
            </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>
  <?php else : ?>
    <div class="alert alert-warning text-center">Belum ada data member yang terdaftar.</div>
  <?php endif; ?>
</div>

<?= $this->endSection() ?>
