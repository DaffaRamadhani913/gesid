<?= $this->extend('admin/layout/base_admin_template') ?>

<?= $this->section('content') ?>

<div class="container-fluid">
    <h1 class="h3 mb-4 text-gray-800">Acara Saya</h1>

    <a href="<?= base_url('/admin/bpd/buat-acara') ?>" class="btn btn-primary mb-3">Tambah Acara</a>

    <?php if (session()->getFlashdata('success')): ?>
        <div class="alert alert-success"><?= session()->getFlashdata('success') ?></div>
    <?php endif; ?>

    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Judul</th>
                            <th>Deskripsi</th> <!-- Added deskripsi column -->
                            <th>Gambar</th>
                            <th>Status</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($acaras as $i => $a): ?>
                            <tr>
                                <td><?= $i + 1 ?></td>
                                <td><?= esc($a['judul']) ?></td>
                                <td><?= esc($a['deskripsi']) ?></td> <!-- Display deskripsi -->
                                <td>
                                    <?php if (!empty($a['gambar'])): ?>
                                        <img src="<?= base_url('uploads/events/' . $a['gambar']) ?>"
                                            alt="<?= esc($a['judul']) ?>" width="80">
                                    <?php else: ?>
                                        -
                                    <?php endif; ?>
                                </td>
                                <td>
                                    <?php if ($a['status'] == 'pending'): ?>
                                        <span class="badge bg-warning">Pending</span>
                                    <?php elseif ($a['status'] == 'approved'): ?>
                                        <span class="badge bg-success">Approved</span>
                                    <?php else: ?>
                                        <span class="badge bg-danger">Rejected</span>
                                    <?php endif; ?>
                                </td>
                                <td>
                                    <a href="<?= base_url('/admin/bpd/edit-acara/' . $a['id']) ?>"
                                        class="btn btn-sm btn-warning">Edit</a>
                                    <form action="<?= base_url('/admin/bpd/delete-acara/' . $a['id']) ?>" method="post"
                                        style="display:inline;" onsubmit="return confirm('Hapus acara ini?')">
                                        <?= csrf_field() ?>
                                        <button type="submit" class="btn btn-sm btn-danger">Hapus</button>
                                    </form>

                                </td>
                            </tr>
                        <?php endforeach; ?>
                        <?php if (empty($acaras)): ?>
                            <tr>
                                <td colspan="6" class="text-center">Belum ada acara.</td>
                            </tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<?= $this->endSection() ?>