<?php

class Laporan extends CI_Controller{

    public function __construct()
    {
        parent:: __construct();
        $this->load->model('M_laporan');
    }

    public function pinjam()
{
    $tgl_awal = $this->input->post('tgl_awal');
    $tgl_akhir = $this->input->post('tgl_akhir');

    $this->session->set_userdata('tanggal_awal', $tgl_awal);
    $this->session->set_userdata('tanggal_akhir', $tgl_akhir);

    if (empty($tgl_awal) || empty($tgl_akhir)) {
        $isi['data'] = $this->M_laporan->getAllData();
    } else {
        $isi['data'] = $this->M_laporan->filterPinjam($tgl_awal, $tgl_akhir);
    }

    $isi['content'] = 'laporan/v_peminjaman';
    $isi['judul'] = 'Laporan Peminjaman';
    $this->load->view('v_dashboard', $isi);
}

public function kembali()
{
    $tgl_awal = $this->input->post('tgl_awal');
    $tgl_akhir = $this->input->post('tgl_akhir');

    $this->session->set_userdata('tanggal_awal', $tgl_awal);
    $this->session->set_userdata('tanggal_akhir', $tgl_akhir);

    if (empty($tgl_awal) || empty($tgl_akhir)) {
        $isi['data'] = $this->M_laporan->get_all_data();
    } else {
        $isi['data'] = $this->M_laporan->filterKembali($tgl_awal, $tgl_akhir);
    }

    $isi['content'] = 'laporan/v_pengembalian';
    $isi['judul'] = 'Laporan Pengembalian';
    $this->load->view('v_dashboard', $isi);
}
}
?>