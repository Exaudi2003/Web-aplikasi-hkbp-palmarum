<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Session;

class mataAnggaranController extends Controller
{
    public function index3()
    {
        return view('layouts.forms.kategoriMataAnggaran');
    }

    public function index4()
    {
        // Get the kategoriMataAnggarans data from the API
        $kategoriMataAnggaran['kategoriMataAnggarans'] = Http::get('http://127.0.0.1:8070/api/kategoriMataAnggaran')->collect();

        // dd($anggaran['anggarans']);
        $data = array_merge($kategoriMataAnggaran);

        return view('layouts.forms.detailKategoriMataAnggaran', $data);
    }

    public function index()
    {

        // $kategoriMataAnggarans2 = Http::get('http://127.0.0.1:8070/api/kategoriMataAnggaran')->collect();

    // return view('layouts.forms.mataAnggaran')->with('kategoriMataAnggarans2', $kategoriMataAnggarans2);

    // return view('layouts.forms.mataAnggaran', compact('kategoriMataAnggarans2'));
        $kategoriMataAnggarans2 = Http::get('http://127.0.0.1:8070/api/kategoriMataAnggaran')->collect();
        return view('layouts.forms.mataAnggaran')->with('kategoriMataAnggarans2', $kategoriMataAnggarans2);

        return view('layouts.forms.mataAnggaran');
    }
    public function index2()
    {
        // Get the mataAnggarans data from the API
        $mataAnggaran['mataAnggarans'] = Http::get('http://127.0.0.1:8070/api/mataAnggaran')->collect();

        // dd($anggaran['anggarans']);
        $data = array_merge($mataAnggaran);

        return view('layouts.forms.detailMataAnggaran', $data);
    }

    public function create(Request $req)    
    {
        // Send a POST request to create the sentralisasi
        $res = Http::post('http://127.0.0.1:8070/api/storeMataAnggaran', [  
            'kategori_mata_anggaran' => $req->get('kategori_mata_anggaran'),
            'kode_mata_anggaran' => $req->get('kode_mata_anggaran'),
            'nama_mata_anggaran' => $req->get('nama_mata_anggaran'),
            'jenis_anggaran' => $req->get('jenis_anggaran'),
            'isSentralisasi' => $req->get('isSentralisasi'),
            'keterangan' => $req->get('keterangan')
        ]);

        if ($res->failed()) {
            return back()->withErrors(['message' => 'Error when creating Mata Anggaran']);
        }

        return redirect()->route('detailMataAnggaran');
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