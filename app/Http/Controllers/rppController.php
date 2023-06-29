<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use app\Helpers\ApiFormatter;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Session;

class rppController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {

        $data['rpp'] = Http::get('http://127.0.0.1:8070/api/rpp');

        return view('layouts.formSearch.rpp', $data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function store()
    {
        return view('layouts.forms.daftarRpp');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function create(Request $request)
    {
            $request->validate([
                'id_jemaat' => 'required',
                'id_jenis_rpp' => 'required',
                'tgl_warta_rpp' => 'required',
                'keterangan' => 'required',
            ]);

            $id_jemaat = $request->input('id_jemaat');
            $id_jenis_rpp = $request->input('id_jenis_rpp');
            $tgl_warta_rpp = $request->input('tgl_warta_rpp');
            $keterangan = $request->input('keterangan');

            $response = Http::post('http://127.0.0.1:8070/api/storeRpp', [
                'id_jemaat' => $id_jemaat,
                'id_jenis_rpp' => $id_jenis_rpp,
                'tgl_warta_rpp' => $tgl_warta_rpp,
                'keterangan' => $keterangan
            ]);

            if (!$response) {
                return back()->withErrors(['message' => 'error when create RPP']);
            }
        return redirect()->route('rpp');
    }

    /**
     * Display the specified resource.
     */
    public function showDetails($id)
    {
        $data['rpp'] = Http::get('http://127.0.0.1:8070/api/rpp/'.$id);

        return view('layouts.forms.detailRpp', $data);


    }

    /**
     * Show the form for editing the specified resource.
     */
   

    // public function tampilkan(){
    //     return view('layouts.forms.daftarRpp');
    // }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $request->validate([
            'id_rpp' => 'required',
            'id_jemaat' => 'required',
            'id_jenis_rpp' => 'required',
            'tgl_warta_rpp' => 'required',
            'keterangan' => 'required',
        ]);
        $id_rpp = $request->input('id_rpp');
        $id_jemaat = $request->input('id_jemaat');
        $id_jenis_rpp = $request->input('id_jenis_rpp');
        $tgl_warta_rpp = $request->input('tgl_warta_rpp');
        $keterangan = $request->input('keterangan');

        $response = Http::put('http://127.0.0.1:8070/api/updateRpp', [
            'id_rpp' => $id_rpp,
            'id_jemaat' => $id_jemaat,
            'id_jenis_rpp' => $id_jenis_rpp,
            'tgl_warta_rpp' => $tgl_warta_rpp,
            'keterangan' => $keterangan
        ]);
        if (!$response) {
            return back()->withErrors(['message' => 'error when create RPP']);
        // return redirect()->route('rpp');
        }
        
        return redirect()->route('rpp');
    
    }


    public function edit($id)
    {
        $data['rpp']  = Http::get('http://127.0.0.1:8070/api/rppEdit/'.$id);
       
        return view('layouts.forms.updateRpp',$data);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id){
        // Session::flash('success', 'Your data has been successfully deleted.');
        // Session::flash('failed', 'Your data was failed to delete.');
        $data = Http::get('http://127.0.0.1:8070/api/deleteRpp/'.$id);

        if($data['code'] == "400"){
            $failedMessage = Session::get('failed');
            return redirect()->route('rpp', compact('failedMessage'));
        }else{
            $successMessage = Session::get('success');
            return redirect()->route('rpp',compact('successMessage'));
        }
    }
}
