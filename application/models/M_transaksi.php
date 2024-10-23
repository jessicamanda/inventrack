<?php

class M_transaksi extends CI_Model{

    public function getPendapatanBulanan()
{
    $this->db->select('MONTH(tanggal) as bulan, SUM(jumlah) as total');
    $this->db->from('pendapatan');
    $this->db->group_by('MONTH(tanggal)');
    return $this->db->get()->result_array();
}

}