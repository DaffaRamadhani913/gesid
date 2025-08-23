<?= $this->extend('admin/layout/base_admin_template') ?>
<?= $this->section('content') ?>

<div class="container mt-4">
  <h4>Data Slider</h4>
  <a href="<?= base_url('admin/slider/create') ?>" class="btn btn-primary mb-3">Tambah Slider</a>

  <table class="table table-bordered table-hover">
    <thead>
      <tr>
        <th>No</th>
        <th>Gambar</th>
        <th>Judul</th>
        <th>Subjudul</th>
        <th>Status</th>
        <th>Opsi</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach($sliders as $index => $slider): ?>
        <tr>
          <td><?= $index + 1 ?></td>
          <td><img src="<?= base_url('assets/images/slider/' . $slider['image_filename']) ?>" width="100"></td>
          <td><?= esc($slider['title']) ?></td>
          <td><?= esc($slider['subtitle']) ?></td>
          <td>
            <?= $slider['is_active'] ? '<span class="badge bg-success">Aktif</span>' : '<span class="badge bg-secondary">Nonaktif</span>' ?>
          </td>
          <td>
            <a href="<?= base_url('admin/slider/edit/' . $slider['id']) ?>" class="btn btn-sm btn-warning">Edit</a>
            <a href="<?= base_url('admin/slider/delete/' . $slider['id']) ?>" class="btn btn-sm btn-danger" onclick="return confirm('Hapus slider ini?')">Hapus</a>
          </td>
        </tr>
      <?php endforeach ?>
    </tbody>
  </table>
</div>

<?= $this->endSection() ?>
