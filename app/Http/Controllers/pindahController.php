<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use app\Helpers\ApiFormatter;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;

class pindahController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data['pindah'] = Http::get('http://127.0.0.1:8070/api/jemaatPindah');

        return view('layouts.formSearch.pindah',$data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function details($id)
    {
        $data['pindah'] = Http::get('http://127.0.0.1:8070/api/jemaatPindah/'.$id);

        return view('layouts.forms.detailPindah', $data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store()
    {
        return view('layouts.forms.daftarPindah');
    }

    /**
     * Display the specified resource.
     */
    public function create(Request $request)
    {
        $response = Http::post('http://127.0.0.1:8070/api/storeJemaatPindah',[
            'id_registrasi'=> (int)$request->id_registrasi,
            'id_jemaat'=> (int)$request->id_jemaat, 
            'no_surat_pindah'=> $request->no_surat_pindah,
            'tgl_pindah'=> $request->tgl_pindah, 
            'tgl_warta'=> $request->tgl_warta,
            'id_gereja_tujuan'=> (int)$request->id_gereja_tujuan, 
            'nama_gereja'=> $request->nama_gereja,
            'keterangan'=> $request->keterangan,
        ]);

        if (!$response) {
            return back()->withErrors(['message' => 'error when create RPP']);
        // return redirect()->route('rpp');
        }
        
        return redirect()->route('pindah');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $data['pindah']  = Http::get('http://127.0.0.1:8070/api/jemaatPindahEdit/'.$id);

        return view('layouts.forms.updatePindah',$data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $response = Http::post('http://127.0.0.1:8070/api/updateJemaatPindah', [
            'id_head_reg_pindah' => $request->id_head_reg_pindah,
            'id_registrasi'=> (int)$request->id_registrasi,
                'id_jemaat'=> (int)$request->id_jemaat, 
                'no_surat_pindah'=> $request->no_surat_pindah,
                'tgl_pindah'=> $request->tgl_pindah, 
                'tgl_warta'=> $request->tgl_warta,
                'id_gereja_tujuan'=> (int)$request->id_gereja_tujuan, 
                'nama_gereja'=> $request->nama_gereja,
                'keterangan'=> $request->keterangan, 
        ]);
        if (!$response) {
            return back()->withErrors(['message' => 'error when create RPP']);
        // return redirect()->route('rpp');
        }
        
        return redirect()->route('pindah');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $data = Http::get('http://127.0.0.1:8070/api/deleteJemaatPindah/'.$id);

        if($data == null){
            $failedMessage = Session::get('failed');
            return redirect()->route('pindah', compact('failedMessage'));
        }else{
            $successMessage = Session::get('success');
            return redirect()->route('pindah',compact('successMessage'));
        }
    }
}
