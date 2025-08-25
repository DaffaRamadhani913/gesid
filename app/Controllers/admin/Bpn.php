<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\MemberModel;
use App\Models\AduanModel;
use App\Models\ArtikelModel;

class Bpn extends BaseController
{
    protected $memberModel;
    protected $artikelModel;

    public function __construct()
    {
        $this->memberModel = new MemberModel();
        $this->artikelModel = new ArtikelModel();
    }

    public function verifikasiMember()
    {
        $members = $this->memberModel
            ->select('tb_members.*, 
                  prov.nama_provinsi as nama_provinsi, 
                  kota.nama_kota as nama_kota, 
                  kec.nama_kecamatan as nama_kecamatan, 
                  desa.nama_desa as nama_desa')
            ->join('tb_provinsi prov', 'prov.id_provinsi = tb_members.id_provinsi', 'left')
            ->join('tb_kota_kabupaten kota', 'kota.id_kota = tb_members.id_kota', 'left')
            ->join('tb_kecamatan kec', 'kec.id_kecamatan = tb_members.id_kecamatan', 'left')
            ->join('tb_desa_kelurahan desa', 'desa.id_desa = tb_members.id_desa', 'left')
            ->findAll();

        return view('admin/bpn/verifikasi_member', ['members' => $members]);
    }

    public function dataMember()
    {
        $members = $this->memberModel
            ->select('tb_members.*, 
                  prov.nama_provinsi as nama_provinsi, 
                  kota.nama_kota as nama_kota, 
                  kec.nama_kecamatan as nama_kecamatan, 
                  desa.nama_desa as nama_desa')
            ->join('tb_provinsi prov', 'prov.id_provinsi = tb_members.id_provinsi', 'left')
            ->join('tb_kota_kabupaten kota', 'kota.id_kota = tb_members.id_kota', 'left')
            ->join('tb_kecamatan kec', 'kec.id_kecamatan = tb_members.id_kecamatan', 'left')
            ->join('tb_desa_kelurahan desa', 'desa.id_desa = tb_members.id_desa', 'left')
            ->findAll();

        return view('admin/bpn/members/list_view', ['members' => $members]);
    }
    public function index()
    {
        return view('admin/bpn/dashboard_view'); // pastikan file view ini ada
    }



    public function listAduan()
    {
        $aduanModel = new AduanModel();
        $data['aduan'] = $aduanModel->orderBy('created_at', 'DESC')->findAll();

        return view('admin/bpn/aduan/list_aduan', $data);
    }

    public function kirimAduan()
    {
        $aduanModel = new AduanModel();

        $aduanModel->save([
            'judul' => $this->request->getPost('judul'),
            'isi' => $this->request->getPost('isi'),
            'created_at' => date('Y-m-d H:i:s')
        ]);

        return redirect()->back()->with('success', 'Umpan balik berhasil dikirim.');
    }

    public function indexArtikel()
    {
        $data['artikels'] = $this->artikelModel->orderBy('tanggal_publikasi', 'DESC')->findAll();
        return view('admin/bpn/artikel/index', $data);
    }

    public function buatArtikel()
    {
        return view('admin/bpn/artikel/buat', [
            'title' => 'Buat Artikel Baru'
        ]);
    }

    // Handle submission
    public function simpanArtikel()
    {
        $validation = \Config\Services::validation();

        // validasi + simpan artikel
        if (
            !$this->validate([
                'judul' => 'required|min_length[3]',
                'konten' => 'required',
                'gambar' => 'is_image[gambar]|max_size[gambar,100]', // 100 KB
            ])
        ) {
            return redirect()->back()->withInput()->with('errors', $validation->getErrors());
        }

        $file = $this->request->getFile('gambar');
        $gambarPath = null;

        if ($file && $file->isValid() && !$file->hasMoved()) {
            $newName = $file->getRandomName();
            $file->move('uploads/artikel', $newName);
            $gambarPath = 'uploads/artikel/' . $newName;
        }

        $this->artikelModel->insert([
            'judul' => $this->request->getPost('judul'),
            'konten' => $this->request->getPost('konten'),
            'gambar' => $gambarPath,
            'tanggal_publikasi' => date('Y-m-d H:i:s'),
            'kategori' => $this->request->getPost('kategori'),
            'status' => 'pending',                           // (or whatever default you use)
            'created_by' => session()->get('user_id'),           // keep INT id
            'created_label' => $this->resolvePublisherLabel(),      // 👈 human-friendly label
        ]);


        // ✅ flash success message
        return redirect()->to('/admin/bpn/artikel')->with('success', 'Artikel berhasil diupload!');
    }

    public function deleteArtikel($id)
    {
        $artikel = $this->artikelModel->find($id);
        if ($artikel) {
            // hapus file gambar jika ada
            if (!empty($artikel['gambar']) && file_exists($artikel['gambar'])) {
                unlink($artikel['gambar']);
            }
            $this->artikelModel->delete($id);
            return redirect()->to('/admin/bpn/artikel')->with('success', 'Artikel berhasil dihapus!');
        }
        return redirect()->to('/admin/bpn/artikel')->with('error', 'Artikel tidak ditemukan.');
    }

    public function editArtikel($id)
    {
        $data['artikel'] = $this->artikelModel->find($id);
        if (!$data['artikel']) {
            return redirect()->to('/admin/bpn')->with('error', 'Artikel tidak ditemukan.');
        }
        return view('admin/bpn/artikel/edit', $data);
    }

    public function updateArtikel($id)
    {
        $artikel = $this->artikelModel->find($id);

        if (!$artikel) {
            return redirect()->to('/admin/bpn/artikel')->with('error', 'Artikel tidak ditemukan.');
        }

        $validation = \Config\Services::validation();

        // ✅ Validasi input
        if (
            !$this->validate([
                'judul' => 'required|min_length[3]',
                'konten' => 'required',
                'kategori' => 'required',
                'gambar' => 'if_exist|is_image[gambar]|max_size[gambar,100]', // opsional, max 100KB
            ])
        ) {
            return redirect()->back()->withInput()->with('errors', $validation->getErrors());
        }

        $gambar = $this->request->getFile('gambar');
        $gambarPath = $artikel['gambar']; // default: gambar lama

        // ✅ Jika ada gambar baru
        if ($gambar && $gambar->isValid() && !$gambar->hasMoved()) {
            // hapus gambar lama jika ada
            if (!empty($artikel['gambar']) && file_exists($artikel['gambar'])) {
                unlink($artikel['gambar']);
            }

            // simpan gambar baru
            $newName = $gambar->getRandomName();
            $gambar->move('uploads/artikel', $newName);
            $gambarPath = 'uploads/artikel/' . $newName;
        }

        // ✅ Update data artikel
        $this->artikelModel->update($id, [
            'judul' => $this->request->getPost('judul'),
            'kategori' => $this->request->getPost('kategori'),
            'konten' => $this->request->getPost('konten'),
            'gambar' => $gambarPath
            // do NOT change created_label here
        ]);


        return redirect()->to('/admin/bpn/artikel')->with('success', 'Artikel berhasil diperbarui!');
    }

    private function lookup(string $table, string $pk, $id, string $col): ?string
    {
        if (empty($id))
            return null;
        $db = \Config\Database::connect();
        $row = $db->table($table)->select($col)->where($pk, $id)->get()->getRowArray();
        return $row[$col] ?? null;
    }

    private function resolvePublisherLabel(): string
    {
        $role = strtolower((string) session()->get('role'));

        switch ($role) {
            case 'bpn':
                return 'BPN';
            case 'bpw': {
                // expect session()->get('id_provinsi')
                $name = $this->lookup('tb_provinsi', 'id_provinsi', session()->get('id_provinsi'), 'nama_provinsi');
                return $name ?: 'BPW';
            }
            case 'bpd': {
                $name = $this->lookup('tb_kota_kabupaten', 'id_kota', session()->get('id_kota'), 'nama_kota');
                return $name ?: 'BPD';
            }
            case 'bpdes': {
                $name = $this->lookup('tb_desa_kelurahan', 'id_desa', session()->get('id_desa'), 'nama_desa');
                return $name ?: 'BPDes';
            }
            default:
                return strtoupper($role ?: 'BPN');
        }
    }



}
