<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Session;


class pelayanController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data['pelayan'] = Http::get('http://127.0.0.1:8070/api/pelayanGereja'); 
        
        return view('layouts.formSearch.pelayan', $data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function showDetails($id)
    {
        $data['pelayan'] = Http::get('http://127.0.0.1:8070/api/pelayanGereja/'.$id);

        return view('layouts.forms.detailPelayan', $data);
    }

    public function create(Request $request)
    {

        $request->validate([
            'id_jemaat' => 'required',
            'tanggal_tahbisan' => 'required',
            'tanggal_akhir_jawatan' => 'required',
            'jabatan' => 'required',
            'keterangan' => 'required',
        ]);


            $id_jemaat = $request->input('id_jemaat');
            $tanggal_tahbisan = $request->input('tanggal_tahbisan');
            $tanggal_akhir_jawatan = $request->input('tanggal_akhir_jawatan');
            $jabatan = $request->input('jabatan');
            $keterangan = $request->input('keterangan');

            $response = Http::post('http://127.0.0.1:8070/api/storePelayanGereja', [
                'id_jemaat' => $id_jemaat,
                'tanggal_tahbisan' => $tanggal_tahbisan,
                'jabatan' => $jabatan,
                'tanggal_akhir_jawatan' => $tanggal_akhir_jawatan,
                'keterangan' => $keterangan,
            ]);


            if (!$response) {
                return back()->withErrors(['message' => 'error when create RPP']);
            }
        return redirect()->route('pelayan');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        return view('layouts.forms.daftarPelayan');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $data['pelayan'] = Http::get('http://127.0.0.1:8070/api/pelayanGereja/'.$id);

        return view('layouts.forms.updatePelayan',$data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $request->validate([
            'id_pelayan' => 'required',
            'id_jemaat' => 'required',
            'tanggal_tahbisan' => 'required',
            'tanggal_akhir_jawatan' => 'required',
            'jabatan' => 'required',
            'keterangan' => 'required',
        ]);

            $id_pelayan = $request->input('id_pelayan');
            $id_jemaat = $request->input('id_jemaat');
            $tanggal_tahbisan = $request->input('tanggal_tahbisan');
            $tanggal_akhir_jawatan = $request->input('tanggal_akhir_jawatan');
            $jabatan = $request->input('jabatan');
            $keterangan = $request->input('keterangan');

            $response = Http::put('http://127.0.0.1:8070/api/updatePelayanGereja',[
                'id_pelayan' => $id_pelayan,
                'id_jemaat' => $id_jemaat,
                'tanggal_tahbisan' => $tanggal_tahbisan,
                'tanggal_akhir_jawatan' => $tanggal_akhir_jawatan,
                'jabatan' => $jabatan,
                'keterangan' => $keterangan,
            ]);

            if (!$response) {
                return back()->withErrors(['message' => 'error when create RPP']);
            }
            
            return redirect()->route('pelayan');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $data['pelayan'] = Http::get('http://127.0.0.1:8070/api/deletePelayanGereja/'.$id);
        if($data == null){
            $failedMessage = Session::get('failed');
            return redirect()->route('pelayan', compact('failedMessage'));
        }else{
            $successMessage = Session::get('success');
            return redirect()->route('pelayan',compact('successMessage'));
        }

    }
}
