<?= $this->extend('admin/layout/base_admin_template') ?>
<?= $this->section('content') ?>

<div class="container mt-4">
    <h2>Verifikasi Artikel</h2>

    <?php if (session()->getFlashdata('success')): ?>
        <div class="alert alert-success">
            <?= session()->getFlashdata('success') ?>
        </div>
    <?php endif; ?>

    <?php if (session()->getFlashdata('error')): ?>
        <div class="alert alert-danger">
            <?= session()->getFlashdata('error') ?>
        </div>
    <?php endif; ?>


    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Judul</th>
                <th>Konten</th>
                <th>Gambar</th>
                <th>Dibuat Oleh</th>
                <th>Tanggal</th>
                <th>Status</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php if (!empty($artikel)): ?>
                <?php $no = 1;
                foreach ($artikel as $a): ?>
                    <tr>
                        <td><?= $no++ ?></td>
                        <td><?= esc($a['judul']) ?></td>
                        <td>
                            <?= esc(substr(strip_tags($a['konten']), 0, 100)) ?>...
                            <br>
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-sm btn-info mt-1" data-bs-toggle="modal"
                                data-bs-target="#kontenModal<?= $a['id'] ?>">
                                Lihat
                            </button>
                        </td>
                        <td>
                            <?php if (!empty($a['gambar'])): ?>
                                <img src="<?= base_url($a['gambar']) ?>" alt="Gambar Artikel" width="80" class="img-thumbnail">
                            <?php else: ?>
                                <span class="text-muted">Tidak ada</span>
                            <?php endif; ?>
                        </td>
                        <td><?= esc($a['created_label'] ?? '-') ?></td>
                        <td><?= esc($a['created_at']) ?></td>
                        <td>
                            <?php if ($a['status'] == 'pending'): ?>
                                <span class="badge bg-warning text-dark">Menunggu</span>
                            <?php elseif ($a['status'] == 'approved'): ?>
                                <span class="badge bg-success">Diterima</span>
                            <?php elseif ($a['status'] == 'rejected'): ?>
                                <span class="badge bg-danger">Ditolak</span>
                            <?php endif; ?>
                        </td>

                        <td>
                            <a href="<?= base_url('admin/superadmin/verifikasi-artikel/approve/' . $a['id']) ?>"
                                class="btn btn-success btn-sm">Terima</a>
                            <a href="<?= base_url('admin/superadmin/verifikasi-artikel/reject/' . $a['id']) ?>"
                                class="btn btn-danger btn-sm">Tolak</a>
                        </td>
                    </tr>

                    <!-- Modal -->
                    <div class="modal fade" id="kontenModal<?= $a['id'] ?>" tabindex="-1"
                        aria-labelledby="kontenModalLabel<?= $a['id'] ?>" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="kontenModalLabel<?= $a['id'] ?>">Konten Artikel</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <?= $a['konten'] ?>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <tr>
                    <td colspan="7" class="text-center">Tidak ada artikel pending</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>
</div>

<?= $this->endSection() ?>