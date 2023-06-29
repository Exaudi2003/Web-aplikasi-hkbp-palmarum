<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Session;

class transaksiController extends Controller
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

            return view('layouts.forms.tambahTransaksi')
                ->with('indukKategoriAnggarans', $indukKategoriAnggarans)
                ->with('kategoriMataAnggarans', $kategoriMataAnggarans)
                ->with('mataAnggarans', $mataAnggarans)
                ->with('jumlahSentralisasis', $jumlahSentralisasis);

        }

    public function index2()
    {
        return view('layouts.forms.detailTransaksiPemasukan');
    }
    
    // public function index3()
    // {
    //     return view('layouts.forms.headTransaksi');
    // }

    // public function index4()
    // {
    //     return view('layouts.forms.headTransaksiDetail');
    // }

    public function create(Request $req)    
    {
        // Send a POST request to create the sentralisasi
        $res = Http::post('http://127.0.0.1:8070/api/storePemasukan', [  
            'induk_kategori_anggaran' => $req->get('induk_kategori_anggaran'),
            'kategori_mata_anggaran' => $req->get('kategori_mata_anggaran'),
            'mata_anggaran' => $req->get('mata_anggaran'),
            'isSentralisasi' => $req->get('isSentralisasi'),
            'tanggal_transaksi' => $req->get('tanggal_transaksi'),
            'tanggal_warta' => $req->get('tanggal_warta'),
            'nama_transaksi' => $req->get('nama_transaksi'),
            'jenis_transaksi' => $req->get('jenis_transaksi'),
            'no_transaksi' => $req->get('no_transaksi'),
            'jumlah_uang' => $req->get('jumlah_uang'),
            'jumlah_sentralisasi' => $req->get('jumlah_sentralisasi'),
            'jumlah_gereja' => $req->get('jumlah_gereja'),
            'tahun_anggaran' => $req->get('tahun_anggaran'),
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
        $data = Http::delete('http://127.0.0.1:8070/api/mataAnggaran/'.$id);

        // dd($id);

        if($data['code'] == "400"){
            $failedMessage = Session::get('failed');
            return redirect()->route('detailMataAnggaran', compact('failedMessage'));
        }else{
            $successMessage = Session::get('success');
            return redirect()->route('detailKategoriMataAnggaran',compact('successMessage'));
        }
    }

    public function edit($id)
    {
    $kategoriMataAnggarans3 = Http::get('http://127.0.0.1:8070/api/kategoriMataAnggaran')->collect();

    // Get the mataAnggaran data from the API
    $mataAnggaran = Http::get('http://127.0.0.1:8070/api/mataAnggaran/'.$id)->collect();

    $data = json_decode($mataAnggaran)->data;

    return view('layouts.forms.editMataAnggaran', compact('kategoriMataAnggarans3', 'data'));
    }

    public function update(Request $req, $id)    
{
    // Send a PUT request to update the kategori mata anggaran
    $res = Http::put('http://127.0.0.1:8070/api/ubahMataAnggaran/'.$id, [
        'kategori_mata_anggaran' => $req->input('kategori_mata_anggaran'),
        'kode_mata_anggaran' => $req->input('kode_mata_anggaran'),
        'nama_mata_anggaran' => $req->input('nama_mata_anggaran'),
        'jenis_anggaran' => $req->input('jenis_anggaran'),
        'isSentralisasi' => $req->input('isSentralisasi'),
        'keterangan' => $req->input('keterangan')
    ]);

    // Check if the request was successful
    if ($res->failed()) {
        return back()->withErrors(['message' => 'Error when updating mata anggaran']);
    }

    return redirect('/admin/detailMataAnggaran');
}
}
