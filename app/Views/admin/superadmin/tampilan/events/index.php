<?= $this->extend('admin/layout/base_admin_template') ?>
<?= $this->section('content') ?>

<div class="container mt-4">
    <h2 class="mb-4">Daftar Event</h2>

    <!-- Notifikasi Sukses -->
    <?php if (session()->getFlashdata('success')): ?>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <?= session()->getFlashdata('success') ?>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <?php endif; ?>

    <!-- Tombol Tambah Event -->
    <div class="mb-3 text-end">
        <a href="<?= base_url('admin/events/create') ?>" class="btn btn-primary">
            <i class="fas fa-plus me-1"></i> Tambah Event
        </a>
    </div>

    <!-- Tabel Event -->
    <div class="table-responsive">
        <table class="table table-bordered table-striped align-middle">
            <thead class="table-dark text-center">
                <tr>
                    <th>Judul</th>
                    <th>Gambar</th>
                    <th style="width: 150px;">Aksi</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($events as $event): ?>
                    <tr>
                        <td><?= esc($event['title']) ?></td>
                        <td class="text-center">
                            <img src="<?= base_url('assets/images/events/' . $event['image']) ?>"
                                alt="Gambar Event"
                                class="img-thumbnail"
                                style="width: 100px; height: 100px; object-fit: cover;">
                        </td>
                        <td class="text-center">
                            <a href="<?= base_url('admin/events/edit/' . $event['id']) ?>"
                                class="btn btn-sm btn-warning mb-1">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <form action="<?= base_url('admin/events/delete/' . $event['id']) ?>" method="post" style="display:inline-block;" onsubmit="return confirm('Yakin ingin menghapus?')">
                                <?= csrf_field() ?>
                                <button type="submit" class="btn btn-danger btn-sm">
                                    <i class="fas fa-trash"></i> Hapus
                                </button>
                            </form>

                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>

<?= $this->endSection(); ?>