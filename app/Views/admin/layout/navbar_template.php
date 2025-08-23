<?php
// Pastikan variabel $role sudah ada sebelum include file ini
use CodeIgniter\Router\RouteCollection;

$menuConfig = include(APPPATH . 'Config/menu_config.php');
$menuItems = $menuConfig[$role] ?? [];
?>

<!-- Sidebar Start -->
<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark vh-100" style="width: 250px;">
  <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
    <img src="<?= base_url('assets/images/Logo GESID-01.jpg') ?>" alt="Logo GESID" width="32" height="32"
      class="me-2 rounded">
    <span class="fs-5 fw-bold">GESID | <?= strtoupper($role) ?></span>
  </a>
  <hr>
  <ul class="nav nav-pills flex-column mb-auto">
    <?php foreach ($menuItems as $item): ?>
      <?php if (isset($item['submenu'])): ?>
        <li class="nav-item dropdown">
          <a class="nav-link text-white dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button">
            <?= $item['label'] ?>
          </a>
          <ul class="dropdown-menu dropdown-menu-dark">
            <?php foreach ($item['submenu'] as $sub): ?>
              <li>
                <a class="dropdown-item" href="<?= base_url($sub['url']) ?>">
                  <i class="mdi <?= esc($sub['icon'] ?? '') ?> me-2"></i>
                  <?= esc($sub['label']) ?>
                </a>
              </li>

            <?php endforeach; ?>
          </ul>
        </li>
      <?php else: ?>
        <li>
          <a href="<?= base_url($item['url']) ?>" class="nav-link text-white">
            <i class="mdi <?= esc($item['icon']) ?> me-2"></i>
            <?= esc($item['label']) ?>
          </a>

        </li>
      <?php endif; ?>
    <?php endforeach; ?>
  </ul>
  <hr>
  <div class="mt-auto">
    <a href="<?= base_url('logout') ?>" class="btn btn-outline-light w-100">
      <i class="bi bi-box-arrow-right me-2"></i> Logout
    </a>
  </div>
</div>
<!-- Sidebar End -->