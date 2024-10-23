<?php

class Dashboard extends CI_Controller{

public function __construct()
    {
        parent:: __construct();
        $this->load->model('M_laporan');
        $this->load->model('M_barang');
    } 
    public function index()
    {
        $this->m_squirty->getSquirty();
        $isi['content'] = 'v_beranda';
        $isi['judul'] = 'Dashboard';
        $this->load->model('M_dashboard');
        $isi['anggota'] = $this->M_dashboard->countAnggota();
        $isi['barang'] = $this->M_dashboard->countBarang();
        $isi['pinjam'] = $this->M_dashboard->countPinjam();
        $isi['kembali'] = $this->M_dashboard->countKembali();
        $this->load->view('v_dashboard', $isi);
    }
    public function dashboard()
    {
        $data['pendapatan'] = $this->M_transaksi->getPendapatanBulanan(); // Ganti dengan method yang sesuai
        $this->load->view('v_dashboard', $data);
    }
    }
?>