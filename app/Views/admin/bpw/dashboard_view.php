<?= $this->extend('admin/layout/base_admin_template') ?>
<?= $this->section('content') ?>

<div class="member-container">
  <div class="mb-4 text-center">
    <h2 class="text-primary fw-bold">Data Member GESID - BPW</h2>
    <p class="text-muted">Berikut adalah daftar member yang telah terdaftar di wilayah BPW.</p>
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
            <th>Telepon</th>
            <th>Pekerjaan</th>
          </tr>
        </thead>
        <tbody>
          <?php $no = 1; foreach ($members as $member): ?>
            <tr>
              <td><?= $no++ ?></td>
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
