<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Session;

class pemasukanController extends Controller
{
    public function index()
        {
            // $indukKategoriAnggarans = Http::get('http://127.0.0.1:8070/api/kategoriMataAnggaran')->collect();
            // return view('layouts.forms.tambahTransaksi')->with('indukKategoriAnggarans', $indukKategoriAnggarans);

            // $kategoriMataAnggarans = Http::get('http://127.0.0.1:8070/api/kategoriMataAnggaran')->collect();
            // return view('layouts.forms.tambahTransaksi')->with('kategoriMataAnggarans', $kategoriMataAnggarans);

            // return view('layouts.forms.tambahTransaksi');
            $sentralisasi['sentralisasis'] = Http::get('http://127.0.0.1:8070/api/setSentralisasi')->collect();

            $data = array_merge($sentralisasi);
            
            $indukKategoriAnggarans = Http::get('http://127.0.0.1:8070/api/kategoriMataAnggaran')->collect();
            $kategoriMataAnggarans = Http::get('http://127.0.0.1:8070/api/kategoriMataAnggaran')->collect();
            $mataAnggarans = Http::get('http://127.0.0.1:8070/api/mataAnggaran')->collect();
            $jumlahSentralisasis = Http::get('http://127.0.0.1:8070/api/setSentralisasi')->collect();
            // dd($jumlahSentralisasis);
            // dd($mataAnggarans);

            return view('layouts.forms.tambahPemasukan')
                ->with('indukKategoriAnggarans', $indukKategoriAnggarans)
                ->with('kategoriMataAnggarans', $kategoriMataAnggarans)
                ->with('mataAnggarans', $mataAnggarans)
                ->with('jumlahSentralisasis', $jumlahSentralisasis);

        }

    public function index2()
    {
        
        // Get the mataAnggarans data from the API
        $detailPemasukan['detailPemasukans'] = Http::get('http://127.0.0.1:8070/api/detailPemasukan')->collect();

        // dd($detailPemasukan['detailPemasukans']);
        $data = array_merge($detailPemasukan);

        return view('layouts.forms.detailTransaksiPemasukan', $data);
    }
    
    public function index3($id)
{
    $response = Http::get('http://127.0.0.1:8070/api/detailPemasukan/'.$id);
    $data = $response->json(); // Assuming the API response is in JSON format

    return view('layouts.forms.rincianPemasukan', compact('data'));
}

    // public function index4()
    // {
    //     return view('layouts.forms.headTransaksiDetail');
    // }

    public function create(Request $req)    
    {
        // Send a POST request to create the transaksi pemasukan
        $res = Http::post('http://127.0.0.1:8070/api/storePemasukan', [  
            'induk_kategori_anggaran' => $req->get('induk_kategori_anggaran'),
            'kategori_mata_anggaran' => $req->get('kategori_mata_anggaran'),
            'mata_anggaran' => $req->get('mata_anggaran'),
            'isSentralisasi' => $req->get('isSentralisasi'),
            'tanggal_transaksi' => $req->get('tanggal_transaksi'),
            'tanggal_warta' => $req->get('tanggal_warta'),
            'nama_transaksi' => $req->get('nama_transaksi'),
            'jenis_transaksi' => $req->get('jenis_transaksi'),
            'nomor_transaksi' => $req->get('nomor_transaksi'),
            'jumlah_uang' => $req->get('jumlah_uang'),
            'jumlah_sentralisasi' => $req->get('jumlah_sentralisasi'),
            'jumlah_gereja' => $req->get('jumlah_gereja'),
            'persembahanTahun' => $req->get('persembahanTahun'),
            'bulan_awal' => $req->get('bulan_awal'),
            'bulan_akhir' => $req->get('bulan_akhir'),
            'keterangan' => $req->get('keterangan')
        ]);

        if ($res->failed()) {
            return back()->withErrors(['message' => 'Error when creating Transaksi Pemasukan']);
        }

        return redirect()->route('detailTransaksiPemasukan');
    }

    public function destroy($id){
        // Send a DELETE request to delete the sentralisasi
        $data = Http::delete('http://127.0.0.1:8070/api/deletePemasukan/'.$id);

        // dd($id);

        if($data['code'] == "400"){
            $failedMessage = Session::get('failed');
            return redirect()->route('detailTransaksiPemasukan', compact('failedMessage'));
        }else{
            $successMessage = Session::get('success');
            return redirect()->route('detailTransaksiPemasukan',compact('successMessage'));
        }
    }

    public function edit($id)
{
    $sentralisasi = Http::get('http://127.0.0.1:8070/api/setSentralisasi')->json();
    $indukKategoriAnggarans = Http::get('http://127.0.0.1:8070/api/kategoriMataAnggaran')->json();
    $kategoriMataAnggarans = Http::get('http://127.0.0.1:8070/api/kategoriMataAnggaran')->json();
    $mataAnggarans = Http::get('http://127.0.0.1:8070/api/mataAnggaran')->json();
    $jumlahSentralisasis = Http::get('http://127.0.0.1:8070/api/setSentralisasi')->json();
    
    // $detailPemasukans = Http::get('http://127.0.0.1:8070/api/detailPemasukan/'.$id)->json();

    // $data = isset($detailPemasukan['data']) ? $detailPemasukan['data'] : null;

    // dd($detailPemasukans);
    return view('layouts.forms.editPemasukan', [
        // 'data' => $data,
        'indukKategoriAnggarans' => $indukKategoriAnggarans,
        'kategoriMataAnggarans' => $kategoriMataAnggarans,
        'mataAnggarans' => $mataAnggarans
        // 'detailPemasukans' => $detailPemasukans
    ]);
}


    public function update(Request $req, $id)    
{
    // Send a PUT request to update the kategori mata anggaran
    $res = Http::put('http://127.0.0.1:8070/api/ubahPemasukan/'.$id, [
        'induk_kategori_anggaran' => $req->input('induk_kategori_anggaran'),
        'kategori_mata_anggaran' => $req->input('kategori_mata_anggaran'),
        'mata_anggaran' => $req->input('mata_anggaran'),
        'isSentralisasi' => $req->input('isSentralisasi'),
        'tanggal_transaksi' => $req->input('tanggal_transaksi'),
        'tanggal_warta' => $req->input('tanggal_warta'),
        'nama_transaksi' => $req->input('nama_transaksi'),
        'jenis_transaksi' => $req->input('jenis_transaksi'),
        'nomor_transaksi' => $req->input('nomor_transaksi'),
        'jumlah_uang' => $req->input('jumlah_uang'),
        'jumlah_sentralisasi' => $req->input('jumlah_sentralisasi'),
        'jumlah_gereja' => $req->input('jumlah_gereja'),
        'persembahanTahun' => $req->input('persembahanTahun'), // Make sure to retrieve the correct input name
        'bulan_awal' => $req->input('bulan_awal'),
        'bulan_akhir' => $req->input('bulan_akhir'),
        'keterangan' => $req->input('keterangan')
    ]);

    // Check if the request was successful
    if ($res->failed()) {
        return back()->withErrors(['message' => 'Error when updating transaksi pemasukan']);
    }

    return redirect('/admin/detailTransaksiPemasukan');
}

    public function index12()
    {
        return view('layouts.forms.pemasukanPembangunan2');
    }

    public function index13()
    {
        return view('layouts.forms.pemasukanUcapanSyukur');
    }

    public function index14()
    {
        return view('layouts.forms.pemasukanUcapanSyukur2');
    }
    public function index9()
    {
        return view('layouts.forms.pemasukanPersembahanKeluarga2');
    }
}
