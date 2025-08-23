<?= $this->extend('admin/layout/base_admin_template') ?>
<?= $this->section('content') ?>

<div class="container-fluid">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold">Daftar Artikel</h2>
        <a href="<?= base_url('admin/bpn/buat-artikel') ?>" class="btn btn-primary">
            <i class="bi bi-plus-circle"></i> Tambah Artikel
        </a>
    </div>

    <!-- ✅ Flash Success Message -->
    <?php if (session()->getFlashdata('success')): ?>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <?= session()->getFlashdata('success') ?>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <?php endif; ?>

    <div class="table-responsive">
        <table class="table table-striped align-middle">
            <thead class="table-dark">
                <tr>
                    <th>No</th>
                    <th>Judul</th>
                    <th>Kategori</th>
                    <th>Tanggal</th>
                    <th>Status</th>
                    <th>Gambar</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($artikels)): ?>
                    <?php foreach ($artikels as $i => $artikel): ?>
                        <tr>
                            <td><?= $i + 1 ?></td>
                            <td><?= esc($artikel['judul']) ?></td>
                            <td><?= esc($artikel['kategori']) ?></td>
                            <td><?= date('d M Y', strtotime($artikel['tanggal_publikasi'])) ?></td>
                            <td>
                                <?php if ($artikel['status'] == 'published'): ?>
                                    <span class="badge bg-success">Published</span>
                                <?php else: ?>
                                    <span class="badge bg-info">Pending</span>
                                <?php endif; ?>
                            </td>
                            <td>
                                <?php if (!empty($artikel['gambar'])): ?>
                                    <img src="<?= base_url($artikel['gambar']) ?>" alt="thumbnail"
                                         class="img-thumbnail" style="max-width: 80px;">
                                <?php else: ?>
                                    <span class="text-muted">-</span>
                                <?php endif; ?>
                            </td>
                            <td>
                                <a href="<?= base_url('admin/bpn/edit-artikel/' . $artikel['id']) ?>"
                                   class="btn btn-sm btn-warning">
                                    <i class="bi bi-pencil-square"></i> Edit
                                </a>
                                <form action="<?= base_url('admin/bpn/delete-artikel/' . $artikel['id']) ?>"
                                      method="post" class="d-inline"
                                      onsubmit="return confirm('Yakin ingin menghapus artikel ini?');">
                                    <?= csrf_field() ?>
                                    <button type="submit" class="btn btn-sm btn-danger">
                                        <i class="bi bi-trash"></i> Hapus
                                    </button>
                                </form>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="7" class="text-center text-muted">Belum ada artikel</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>

<?= $this->endSection() ?>
