<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>GESID - Admin Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Favicon -->
  <link rel="shortcut icon" href="<?= base_url('assets/img/favicon.png') ?>">

  <!-- Styles -->
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/7.2.96/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="<?= base_url('assets/admin/css/styles.min.css') ?>">
  <link rel="stylesheet" href="<?= base_url('assets/admin/libs/simplebar/dist/simplebar.css') ?>">
  <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
</head>
<body>

  <!-- Wrapper -->
  <div class="d-flex min-vh-100">
    
    <!-- Sidebar/Navbar kiri -->
    <?= $this->include('admin/' . session()->get('role') . '/navbar_' . session()->get('role')) ?>

    <!-- Page Content -->
    <div class="flex-grow-1 p-4">
      <?= $this->renderSection('content') ?>

      <!-- Footer -->
      <?= $this->include('admin/layout/footer') ?>
    </div>

  </div>

  <!-- JavaScript Libraries -->
  <script src="<?= base_url('assets/admin/libs/jquery/dist/jquery.min.js') ?>"></script>
  <script src="<?= base_url('assets/admin/libs/bootstrap/dist/js/bootstrap.bundle.min.js') ?>"></script>
  <script src="<?= base_url('assets/admin/libs/apexcharts/dist/apexcharts.min.js') ?>"></script>
  <script src="<?= base_url('assets/admin/libs/simplebar/dist/simplebar.min.js') ?>"></script>

   <!-- Summernote -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.js"></script>

  <!-- Custom Scripts -->
  <script src="<?= base_url('assets/admin/js/sidebarmenu.js') ?>"></script>
  <script src="<?= base_url('assets/admin/js/app.min.js') ?>"></script>
  <script src="<?= base_url('assets/admin/js/dashboard.js') ?>"></script>
  <!-- Iconify CDN (backup if needed) -->
  <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>

  <!-- Init Summernote -->
  <script>
    $(function() {
        $('#konten').summernote({
            placeholder: 'Tulis artikel di sini...',
            tabsize: 2,
            height: 300
        });
    });
  </script>
  
</body>
</html>
