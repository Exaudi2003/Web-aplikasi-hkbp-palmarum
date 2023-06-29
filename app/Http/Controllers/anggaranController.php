<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Session;

class anggaranController extends Controller
{

    // CONTROLLER KATEGORI MATA ANGGARAN
    public function index()
    {
        return view('layouts.forms.kategoriMataAnggaran');
    }

    public function index2()
    {
        // Get the kategoriMataAnggarans data from the API
        $kategoriMataAnggaran['kategoriMataAnggarans'] = Http::get('http://127.0.0.1:8070/api/kategoriMataAnggaran')->collect();

        // dd($anggaran['anggarans']);
        $data = array_merge($kategoriMataAnggaran);

        return view('layouts.forms.detailKategoriMataAnggaran', $data);
    }

    public function index3()
    {
        return view('layouts.forms.mataAnggaran');
    }
    public function index4()
    {
        // Get the mataAnggarans data from the API
        $mataAnggaran['mataAnggarans'] = Http::get('http://127.0.0.1:8070/api/mataAnggaran')->collect();

        // dd($anggaran['anggarans']);
        $data2 = array_merge($mataAnggaran);

        return view('layouts.forms.detailMataAnggaran', $data2);
    }

    public function create(Request $req)    
    {
        // Send a POST request to create the sentralisasi
        $res = Http::post('http://127.0.0.1:8070/api/storeKategoriMataAnggaran', [  
            'induk_kategori_anggaran' => $req->get('induk_kategori_anggaran'),
            'kode_kategori_anggaran' => $req->get('kode_kategori_anggaran'),
            'nama_kategori_anggaran' => $req->get('nama_kategori_anggaran'),
            'keterangan' => $req->get('keterangan'),
        ]);

        // Check if the request was successful
        // if (!$res->failed()) {
        //     return back()->withErrors(['message' => 'Error when creating Kategori Mata Anggaran']);

        if ($res->failed()) {
            return back()->withErrors(['message' => 'Error when creating Kategori Mata Anggaran']);
        }
            
        // }

        // return $req;
        return redirect()->route('detailKategoriMataAnggaran');
    }

    public function destroy($id){
        // dd('Debug');
        // Send a DELETE request to delete the sentralisasi
        $data = Http::delete('http://127.0.0.1:8070/api/kategoriMataAnggaran/'.$id);

        // dd($id);

        if($data['code'] == "400"){
            $failedMessage = Session::get('failed');
            return redirect()->route('detailKategoriMataAnggaran', compact('failedMessage'));
        }else{
            $successMessage = Session::get('success');
            return redirect()->route('detailKategoriMataAnggaran',compact('successMessage'));
        }
    }

    public function edit($id)
    {
    // Get the kategoriAnggarans data from the API
    $kategoriMataAnggaran = Http::get('http://127.0.0.1:8070/api/kategoriMataAnggaran/'.$id)->collect();
    // dd();

    // return view('layouts.forms.editKategoriMataAnggaran', ['data' => json_decode($anggaran)->data[0] ]);
    return view('layouts.forms.editKategoriMataAnggaran', ['data' => json_decode($kategoriMataAnggaran)->data]);
    }

    public function update(Request $req, $id)    
    {
        // dd($req->all());
        // Send a PUT request to update the kategori mata anggaran
        $res = Http::put('http://127.0.0.1:8070/api/ubahKategoriMataAnggaran/'.$id, [
            'induk_kategori_anggaran' => $req->input('induk_kategori_anggaran'),
            'kode_kategori_anggaran' => $req->input('kode_kategori_anggaran'),
            'nama_kategori_anggaran' => $req->input('nama_kategori_anggaran'),
            'keterangan' => $req->input('keterangan')
        ]);

        // dd($res);
        
        // Check if the request was successful
        // if (!$res->failed()) {
        //     return back()->withErrors(['message' => 'Error when updating kategori mata anggaran']);
        // }

        // return redirect()->route('detailKategoriMataAnggaran');
        if ($res->failed()) {
            return back()->withErrors(['message' => 'Error when updating kategori mata anggaran']);
        }
    
        return redirect('/admin/detailKategoriMataAnggaran');
    }

}
