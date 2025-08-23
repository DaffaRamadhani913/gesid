<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\MemberModel;
use App\Models\ProvinsiModel;

class Bpw extends BaseController
{
    protected $memberModel;
    protected $provinsiModel;

    public function __construct()
    {
        $this->memberModel = new MemberModel();
        $this->provinsiModel = new ProvinsiModel();
    }

    public function index()
    { 

        return view('admin/bpw/dashboard_view');
    }

    public function dataMember()
    {
        $idProvinsi = session()->get('id_provinsi');

        if (!$idProvinsi) {
            return redirect()->to('/login')->with('error', 'Provinsi tidak ditemukan di session');
        }

        $provinsi = $this->provinsiModel->find($idProvinsi);

        $members = $this->memberModel
            ->select('tb_members.*, tb_provinsi.nama_provinsi AS nama_provinsi')
            ->join('tb_provinsi', 'tb_provinsi.id_provinsi = tb_members.id_provinsi', 'left')
            ->where('tb_members.id_provinsi', $idProvinsi)
            ->findAll();

        $data = [
            'provinsi' => $provinsi,
            'members' => $members
        ];

        return view('admin/bpw/members/list_view', [
            'members' => $members,
            'provinsi' => $provinsi,  // <-- this line
        ]);

    }
}



// public function verifikasiMember()
// {
//     $members = $this->memberModel
//         ->select('tb_members.*, 
//                   prov.nama as nama_provinsi, 
//                   kota.nama as nama_kota, 
//                   kec.nama as nama_kecamatan, 
//                   desa.nama as nama_desa')
//         ->join('tb_provinsi prov', 'prov.id_provinsi = tb_members.id_provinsi', 'left')
//         ->join('tb_kota_kabupaten kota', 'kota.id_kota = tb_members.id_kota', 'left')
//         ->join('tb_kecamatan kec', 'kec.id_kecamatan = tb_members.id_kecamatan', 'left')
//         ->join('tb_desa_kelurahan desa', 'desa.id_desa = tb_members.id_desa', 'left')
//         ->findAll();

//     return view('admin/bpw/verifikasi_member', ['members' => $members]);
// }

// public function listAduan()
// {
//     $aduanModel = new AduanModel();
//     $data['aduan'] = $aduanModel->orderBy('created_at', 'DESC')->findAll();

//     return view('admin/bpw/aduan/list_aduan', $data);
// }

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

