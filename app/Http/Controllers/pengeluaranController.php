<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Session;

class pengeluaranController extends Controller
{
    public function index()
    {
        $detailPengeluaran['detailPengeluarans'] = Http::get('http://127.0.0.1:8070/api/detailPengeluaran')->collect();

        // dd($detailPemasukan['detailPemasukans']);
        $data = array_merge($detailPengeluaran);

        return view('layouts.forms.detailTransaksiPengeluaran', $data);
    }

    public function index2()
    {
        $sentralisasi['sentralisasis'] = Http::get('http://127.0.0.1:8070/api/setSentralisasi')->collect();

        $data = array_merge($sentralisasi);
        
        $indukKategoriAnggarans = Http::get('http://127.0.0.1:8070/api/kategoriMataAnggaran')->collect();
        $kategoriMataAnggarans = Http::get('http://127.0.0.1:8070/api/kategoriMataAnggaran')->collect();
        $mataAnggarans = Http::get('http://127.0.0.1:8070/api/mataAnggaran')->collect();
        $jumlahSentralisasis = Http::get('http://127.0.0.1:8070/api/setSentralisasi')->collect();
        // dd($jumlahSentralisasis);
        // dd($mataAnggarans);

        return view('layouts.forms.tambahPengeluaran')
            ->with('indukKategoriAnggarans', $indukKategoriAnggarans)
            ->with('kategoriMataAnggarans', $kategoriMataAnggarans)
            ->with('mataAnggarans', $mataAnggarans)
            ->with('jumlahSentralisasis', $jumlahSentralisasis);
    }

    public function index3()
    {
        return view('layouts.forms.pengeluaranOpsional');
    }

    public function index4()
    {
        return view('layouts.forms.pengeluaranPembangunan');
    }

    public function index5()
    {
        return view('layouts.forms.kategoriPengeluaran');
    }

    public function index6()
    {
        return view('layouts.forms.kategoriPengeluaran2');
    }


    public function create(Request $req)
    {
        // Send a POST request to create the transaksi pengeluaran
        $res = Http::post('http://127.0.0.1:8070/api/storePengeluaran', [  
            'induk_kategori_anggaran' => $req->get('induk_kategori_anggaran'),
            'kategori_mata_anggaran' => $req->get('kategori_mata_anggaran'),
            'mata_anggaran' => $req->get('mata_anggaran'),
            'nama_transaksi' => $req->get('nama_transaksi'),
            'jumlah_uang' => $req->get('jumlah_uang'),
            'jumlah_gereja' => $req->get('jumlah_gereja'),
            'tanggal_transaksi' => $req->get('tanggal_transaksi'),
            'tanggal_warta' => $req->get('tanggal_warta'),
            'persembahanTahun' => $req->get('persembahanTahun'),
            'keterangan' => $req->get('keterangan')
        ]);

        if ($res->failed()) {
            return back()->withErrors(['message' => 'Error when creating Transaksi Pengeluaran']);
        }

        return redirect()->route('detailTransaksiPengeluaran');
    }


    public function store(Request $request)
    {
        
    }


    public function show(string $id)
    {
        
    }

    public function edit(string $id)
    {
        
    }


    public function update(Request $request, string $id)
    {
    
    }

    public function destroy($id){
        // Send a DELETE request to delete the sentralisasi
        $data = Http::delete('http://127.0.0.1:8070/api/deletePengeluaran/'.$id);

        // dd($id);

        if($data['code'] == "400"){
            $failedMessage = Session::get('failed');
            return redirect()->route('detailTransaksiPengeluaran', compact('failedMessage'));
        }else{
            $successMessage = Session::get('success');
            return redirect()->route('detailTransaksiPengeluaran',compact('successMessage'));
        }
    }
}
