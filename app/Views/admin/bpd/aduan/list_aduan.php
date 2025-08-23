<?= $this->extend('admin/layout/base_admin_template') ?>
<?= $this->section('content') ?>

<div class="container mt-4">
    <h2 class="mb-4">Daftar Aduan</h2>

    <div class="card shadow-sm">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>No</th>
                            <th>Judul</th>
                            <th>Isi</th>
                            <th>Lampiran</th>
                            <th>Status</th>
                            <th>Dibuat</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($aduan) && is_array($aduan)): ?>
                            <?php $no = 1;
                            foreach ($aduan as $row): ?>
                                <tr>
                                    <td><?= $no++ ?></td>
                                    <td><?= esc($row['judul']) ?></td>
                                    <td><?= esc($row['isi']) ?></td>
                                    <td>
                                        <?php if (!empty($row['lampiran'])): ?>
                                            <a href="<?= base_url('uploads/aduan/' . $row['lampiran']) ?>"
                                                target="_blank">Lihat</a>
                                        <?php else: ?>
                                            Tidak ada
                                        <?php endif; ?>
                                    </td>
                                    <td>
                                        <?php if ($row['status'] == 'Menunggu'): ?>
                                            <span class="badge bg-warning text-dark"><?= esc($row['status']) ?></span>
                                        <?php elseif ($row['status'] == 'Diterima'): ?>
                                            <span class="badge bg-success"><?= esc($row['status']) ?></span>
                                        <?php else: ?>
                                            <span class="badge bg-danger"><?= esc($row['status']) ?></span>
                                        <?php endif; ?>
                                    </td>
                                    <td><?= date('d-m-Y H:i', strtotime($row['created_at'])) ?></td>
                                    <td>
                                        <button class="btn btn-primary btn-sm" data-bs-toggle="modal"
                                            data-bs-target="#responsModal<?= $row['id_aduan'] ?>">
                                            Respons
                                        </button>
                                    </td>
                                </tr>

                                <!-- Modal -->
                                <div class="modal fade" id="responsModal<?= $row['id_aduan'] ?>" tabindex="-1"
                                    aria-hidden="true">
                                    <div class="modal-dialog">
                                        <form action="<?= base_url('admin/bpd/kirimRespons/' . $row['id_aduan']) ?>" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="id_aduan" value="<?= $row['id_aduan'] ?>">

                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Tambah Respons</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                </div>

                                                <div class="modal-body">
                                                    <div class="mb-3">
                                                        <label class="form-label">Judul</label>
                                                        <input type="text" name="judul" class="form-control" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Isi</label>
                                                        <textarea name="isi" class="form-control" rows="4" required></textarea>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Lampiran (Opsional)</label>
                                                        <input type="file" name="lampiran" class="form-control"
                                                            accept="image/*,application/pdf">
                                                    </div>
                                                </div>

                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-primary">Kirim</button>
                                                    <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">Batal</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            <?php endforeach; ?>
                        <?php else: ?>
                            <tr>
                                <td colspan="7" class="text-center">Tidak ada data aduan.</td>
                            </tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<?= $this->endSection() ?>