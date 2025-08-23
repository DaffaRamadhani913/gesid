<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\MemberModel;
use App\Models\AduanModel;
use App\Models\ResponsModel;
use App\Models\KotaModel;

class Bpd extends BaseController
{
    protected $memberModel;
    protected $kotaModel;


    public function __construct()
    {
        $this->memberModel = new MemberModel();
        $this->kotaModel = new KotaModel();

    }

    public function dataMember()
    {
        $idKota = session()->get('id_kota');

        if (!$idKota) {
            return redirect()->to('/login')->with('error', 'Kota tidak ditemukan di session');
        }

        // Ambil nama kota berdasarkan session id_kota
        $kota = $this->kotaModel->find($idKota);

        // Ambil member yang hanya dari kota ini
        $members = $this->memberModel
            ->select('tb_members.*, tb_kota_kabupaten.nama_kota AS nama_kota')
            ->join('tb_kota_kabupaten', 'tb_kota_kabupaten.id_kota = tb_members.id_kota', 'left')
            ->where('tb_members.id_kota', $idKota)
            ->findAll();

        return view('admin/bpd/members/list_view', [
            'members' => $members,
            'kota' => $kota,  // mirip $provinsi di BPW
        ]);
    }

    public function index()
    {
        return view('admin/bpd/dashboard_view');
    }

    // public function verifikasiMember()
    // {
    //     $members = $this->memberModel
    //         ->select('tb_members.*, 
    //                     prov.nama_provinsi as nama_provinsi, 
    //                     kota.nama_kota as nama_kota, 
    //                     kec.nama_kecamatan as nama_kecamatan, 
    //                     desa.nama_desa as nama_desa')
    //         ->join('tb_provinsi prov', 'prov.id_provinsi = tb_members.id_provinsi', 'left')
    //         ->join('tb_kota_kabupaten kota', 'kota.id_kota = tb_members.id_kota', 'left')
    //         ->join('tb_kecamatan kec', 'kec.id_kecamatan = tb_members.id_kecamatan', 'left')
    //         ->join('tb_desa_kelurahan desa', 'desa.id_desa = tb_members.id_desa', 'left')
    //         ->findAll();

    //     return view('admin/bpd/verifikasi_member', ['members' => $members]);
    // }

    public function listAduan()
    {
        $aduanModel = new AduanModel();
        $data['aduan'] = $aduanModel->orderBy('created_at', 'DESC')->findAll();

        return view('admin/bpd/aduan/list_aduan', $data);
    }

    public function kirimRespons($id_aduan)
    {
        $responsModel = new ResponsModel();
        $aduanModel = new AduanModel();

        // Handle file upload if exists
        $lampiranFile = $this->request->getFile('lampiran');
        $lampiranName = null;

        if ($lampiranFile && $lampiranFile->isValid() && !$lampiranFile->hasMoved()) {
            $lampiranName = $lampiranFile->getRandomName();
            $lampiranFile->move(FCPATH . 'uploads/lampiran', $lampiranName);
        }

        // Save to tb_respons
        $responsModel->save([
            'id_aduan' => $id_aduan,
            'judul' => $this->request->getPost('judul'),
            'isi' => $this->request->getPost('isi'),
            'lampiran' => $lampiranName
        ]);

        // Update aduan status
        $aduanModel->update($id_aduan, ['status' => 'Selesai']);

        return redirect()->back()->with('success', 'Aduan telah direspons');
    }

    // public function kirimAduan()
    // {
    //     $aduanModel = new AduanModel();

    //     $aduanModel->save([
    //         'judul' => $this->request->getPost('judul'),
    //         'isi'   => $this->request->getPost('isi'),
    //         'created_at' => date('Y-m-d H:i:s')
    //     ]);

    //     return redirect()->back()->with('success', 'Umpan balik berhasil dikirim.');
    // }
}
