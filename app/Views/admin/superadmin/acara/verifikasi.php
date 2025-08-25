<?= $this->extend('admin/layout/base_admin_template') ?>
<?= $this->section('content') ?>

<div class="container-fluid">
    <h1 class="h3 mb-4 text-gray-800">Verifikasi Acara</h1>

    <?php if (session()->getFlashdata('success')): ?>
        <div class="alert alert-success"><?= session()->getFlashdata('success') ?></div>
    <?php endif; ?>

    <?php if (session()->getFlashdata('error')): ?>
        <div class="alert alert-danger"><?= session()->getFlashdata('error') ?></div>
    <?php endif; ?>

    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Judul</th>
                            <th>Deskripsi</th>
                            <th>Gambar</th>
                            <th>Created By</th>
                            <th>Status</th>
                            <th>Created At</th>
                            <th>Updated At</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($acaras)): ?>
                            <?php foreach ($acaras as $acara): ?>
                                <tr>
                                    <td><?= esc($acara['id']) ?></td>
                                    <td><?= esc($acara['judul']) ?></td>
                                    <td><?= esc($acara['deskripsi']) ?></td>
                                    <td>
                                        <?php if ($acara['gambar']): ?>
                                            <img src="<?= base_url('uploads/events/' . $acara['gambar']) ?>"
                                                alt="<?= esc($acara['judul']) ?>" width="100">
                                        <?php else: ?>
                                            -
                                        <?php endif; ?>
                                    </td>
                                    <td><?= esc($acara['created_label'] ?? '-') ?></td>
                                    <td>
                                        <?php
                                        switch ($acara['status']) {
                                            case 'approved':
                                                echo '<span class="badge bg-success">' . ucfirst($acara['status']) . '</span>';
                                                break;
                                            case 'rejected':
                                                echo '<span class="badge bg-danger">' . ucfirst($acara['status']) . '</span>';
                                                break;
                                            default:
                                                echo '<span class="badge bg-warning">' . ucfirst($acara['status']) . '</span>';
                                                break;
                                        }
                                        ?>
                                    </td>
                                    <td><?= esc($acara['created_at']) ?></td>
                                    <td><?= esc($acara['updated_at']) ?></td>
                                    <td>
                                        <a href="<?= base_url('admin/superadmin/verifikasi-acara/approve/' . $acara['id']) ?>"
                                            class="btn btn-success btn-sm">Terima</a>
                                        <a href="<?= base_url('admin/superadmin/verifikasi-acara/reject/' . $acara['id']) ?>"
                                            class="btn btn-danger btn-sm">Tolak</a>
                                    </td>

                                </tr>
                            <?php endforeach; ?>
                        <?php else: ?>
                            <tr>
                                <td colspan="9" class="text-center">Tidak ada acara untuk diverifikasi.</td>
                            </tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<?= $this->endSection() ?>