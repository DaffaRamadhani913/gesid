<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\MemberModel;
use App\Models\AduanModel;
use App\Models\ResponsModel;
use App\Models\DesaModel;


class Bpdes extends BaseController
{
    protected $memberModel;
    protected $desaModel;

    public function __construct()
    {
        $this->memberModel = new MemberModel();
        $this->desaModel   = new DesaModel();
    }

    public function dataMember()
    {
        $idDesa = session()->get('id_desa');

        if (!$idDesa) {
            return redirect()->to('/login')->with('error', 'Desa tidak ditemukan di session');
        }

        // Ambil nama desa berdasarkan session id_desa
        $desa = $this->desaModel->find($idDesa);

        // Ambil member yang hanya dari desa ini
        $members = $this->memberModel
            ->select('tb_members.*, tb_desa_kelurahan.nama_desa AS nama_desa')
            ->join('tb_desa_kelurahan', 'tb_desa_kelurahan.id_desa = tb_members.id_desa', 'left')
            ->where('tb_members.id_desa', $idDesa)
            ->findAll();

        return view('admin/bpdes/members/list_view', [
            'members' => $members,
            'desa'    => $desa,
        ]);
    }

    public function index()
    {
        return view('admin/bpdes/dashboard_view');
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

        return view('admin/bpdes/verifikasi_member', ['members' => $members]);
    }

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
}
