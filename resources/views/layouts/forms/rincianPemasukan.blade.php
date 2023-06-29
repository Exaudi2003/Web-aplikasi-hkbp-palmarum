@include('layouts.formSearch.navbar')
@include('layouts.formSearch.header')
@include('layouts.formSearch.sidebar')
@include('layouts.formSearch.footer')

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<div class="content-wrapper">
  <div class="col">
    <div class="card card-primary">
      <div class="card-header">
        <h2 style="font-weight: bold;">Rincian Transaksi Pemasukan</h2>
      </div>
      <form action="{{ route('detailPemasukan') }}" method="GET">
        @csrf

      <div class="card-body">
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <label>Induk Kategori Anggaran:</label>
              <select name="induk_kategori_anggaran" class="form-control" id="induk_kategori_anggaran">
                <option value="{{ $data['induk_kategori_anggaran'] }}">{{ $data['induk_kategori_anggaran'] }}</option>
              </select>
              <br>
              <label>Kategori Mata Anggaran:</label>
              <select name="kategori_mata_anggaran" class="form-control" id="kategori_mata_anggaran">
                <option value="{{ $data['kategori_mata_anggaran'] }}">{{ $data['kategori_mata_anggaran'] }}</option>
              </select>
              <br>
              <label>Mata Anggaran:</label>
              <select name="mata_anggaran" class="form-control" id="mata_anggaran">
                <option value="{{ $data['mata_anggaran'] }}">{{ $data['mata_anggaran'] }}</option>
              </select>
              <br>
              <label>Sentralisasi:</label>
              <select name="isSentralisasi" class="form-control" id="isSentralisasi">
                <option value="{{ $data['isSentralisasi'] }}">{{ $data['isSentralisasi'] }}</option>
              </select>
              <br>
              <label>Tanggal Transaksi:</label>
              <input type="text" class="form-control datepicker" value="{{ $data['tanggal_transaksi'] }}" name="tanggal_transaksi" id="tanggal_transaksi" placeholder="Masukkan tanggal transaksi"><br>
              <label>Tanggal Warta:</label>
              <input type="text" class="form-control datepicker" value="{{ $data['tanggal_warta'] }}" name="tanggal_warta" id="tanggal_warta" placeholder="Masukkan tanggal warta"><br>
              <label>Nama Transaksi Pemasukan:</label>
              <input type="text" class="form-control" value="{{ $data['nama_transaksi'] }}" name="nama_transaksi" id="nama_transaksi" placeholder="Pilih nama transaksi (mata anggaran + tanggal)"><br>
              <label>Jenis Transaksi:</label>
              <select name="jenis_transaksi" class="form-control" id="jenis_transaksi">
                <option value="{{ $data['jenis_transaksi'] }}">{{ $data['jenis_transaksi'] }}</option>
              </select><br>
            </div>
          </div>
          <!-- SEPARATE -->
          <div class="col-md-6">
            <div class="form-group">
              <label>Nomor Transaksi:</label>
              <input type="number" class="form-control" value="{{ $data['nomor_transaksi'] }}" name="nomor_transaksi" id="nomor_transaksi" placeholder="Masukkan nomor transaksi (tanggal + 4 digit unik)"><br>
              <label>Jumlah Uang:</label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">Rp.</span>
                </div>
                <input type="text" class="form-control" value="{{ $data['jumlah_uang'] }}" name="jumlah_uang" id="jumlah_uang" placeholder="Masukkan jumlah uang" id="jumlah_uang">
              </div>
              <br>
              <label>Jumlah Sentralisasi:</label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">Rp.</span>
                </div>
                <input type="text" class="form-control" value="{{ $data['jumlah_sentralisasi'] }}" name="jumlah_sentralisasi" placeholder="Jumlah Sentralisasi" id="jumlah_sentralisasi">
              </div>
              <br>
              <label>Jumlah Gereja:</label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">Rp.</span>
                </div>
                <input type="text" class="form-control" value="{{ $data['jumlah_gereja'] }}" name="jumlah_gereja" placeholder="Jumlah Gereja" id="jumlah_gereja">
              </div>
              <br>
              <label for="persembahanTahun">Tahun Anggaran:</label>
              <select name="persembahanTahun" id="persembahanTahun" class="form-control">
                <option value="{{ $data['persembahanTahun'] }}">{{ $data['persembahanTahun'] }}</option>
              </select><br>
              <label>Bulan Awal:</label>
              <select name="bulan_awal" class="form-control" id="bulan_awal">
                <option value="{{ $data['bulan_awal'] }}">{{ $data['bulan_awal'] }}</option>
              </select><br>
              <label>Bulan Akhir:</label>
              <select name="bulan_akhir" class="form-control" id="bulan_akhir">
                <option value="{{ $data['bulan_akhir'] }}">{{ $data['bulan_akhir'] }}</option>
              </select><br>
              <label>Keterangan:</label>
              <input type="text" class="form-control" name="keterangan" value="{{ $data['keterangan'] }}" placeholder="Masukkan Keterangan"><br>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <a type="button" href="/admin/detailTransaksiPemasukan" class="btn btn-default float-right">Kembali</a>
            <!-- <button type="submit" class="btn btn-success float-right" style="margin-right: 5px;">Buat</button> -->
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
