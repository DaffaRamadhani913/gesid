<?= $this->extend('admin/layout/base_admin_template') ?>
<?= $this->section('content') ?>

<div class="card">
    <div class="card-header">
        <h4 class="card-title">Visi dan Misi</h4>
    </div>
    <div class="card-body">
        <table class="table">
            <tr>
                <th>Visi</th>
                <td><?= esc($visimisi['visi'] ?? '-') ?></td>
            </tr>
            <tr>
                <th>Misi</th>
                <td>
                    <ul>
                        <?php foreach (explode("\n", $visimisi['misi'] ?? '') as $misi): ?>
                            <?php if (trim($misi) !== ''): ?>
                                <li><?= esc($misi) ?></li>
                            <?php endif; ?>
                        <?php endforeach; ?>
                    </ul>
                </td>
            </tr>
        </table>

        <a href="<?= base_url('/admin/visi-misi/edit') ?>" class="btn btn-primary mt-3">Edit</a>
    </div>
</div>

<?= $this->endSection() ?>
