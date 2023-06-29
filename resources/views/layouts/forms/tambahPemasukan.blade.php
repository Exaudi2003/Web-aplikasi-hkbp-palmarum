@include('layouts.formSearch.navbar')
@include('layouts.formSearch.header')
@include('layouts.formSearch.sidebar')
@include('layouts.formSearch.footer')

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
  .datepicker { z-index: 9999 !important; /* Increase the z-index to ensure the datepicker appears above other elements */}
  .ui-datepicker { font-size: 14px; /* Adjust the font size as desired */ width: 300px; /* Increase the width of the calendar */}
  .ui-datepicker-header { background-color: #f2f2f2; border-bottom: 1px solid #ddd; padding: 10px; /* Increase the padding around the header */}
  .ui-datepicker-title { color: #333; font-weight: bold;}
  .ui-datepicker-prev, .ui-datepicker-next { background-color: #f2f2f2; color: #333; font-weight: bold;}
  .ui-datepicker-calendar { width: 100%; /* Make the calendar occupy the full width */}
  .ui-datepicker th { background-color: #f2f2f2; color: #333;}
  .ui-datepicker td { padding: 0; }
  .ui-datepicker-calendar .ui-state-default { background-color: #fff; border: none; color: #333;}
  .ui-datepicker-calendar .ui-state-hover { background-color: #f2f2f2; color: #333; }
  .ui-datepicker-calendar .ui-state-active { background-color: #007bff; border: none; color: #fff;}
</style>

<div class="content-wrapper">
  <div class="col">
    <div class="card card-primary">
      <div class="card-header">
        <h2 style="font-weight: bold;">Tambah Transaksi Pemasukan</h2>
      </div>
      <form action="{{ route('buatPemasukan') }}" method="POST" onsubmit="return validateForm()">
        @csrf

      <div class="card-body">
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <label>Induk Kategori Anggaran:</label>
              <select name="induk_kategori_anggaran" class="form-control" id="induk_kategori_anggaran">
                @php
                $uniqueValues = $indukKategoriAnggarans->unique('induk_kategori_anggaran');
                @endphp
                @foreach($uniqueValues as $datainduk)
                <option value="{{ $datainduk['induk_kategori_anggaran'] }}">{{ $datainduk['induk_kategori_anggaran'] }}</option>
                @endforeach
              </select>
              <br>
              <label>Kategori Mata Anggaran:</label>
              <select name="kategori_mata_anggaran" class="form-control" id="kategori_mata_anggaran">
                <!-- Options will be dynamically populated based on the selected "Induk Kategori Anggaran" -->
              </select>
              <br>
              <label>Mata Anggaran:</label>
              <select name="mata_anggaran" class="form-control" id="mata_anggaran">
                <!-- Options will be dynamically populated based on the selected "Kategori Mata Anggaran" -->
              </select>
              <br>
              <label>Sentralisasi:</label>
              <select name="isSentralisasi" class="form-control" id="isSentralisasi">
                <!-- Options will be dynamically populated based on the selected "Mata Anggaran" -->
              </select>
              <br>
              <label>Tanggal Transaksi:</label>
              <input type="text" class="form-control datepicker" name="tanggal_transaksi" id="tanggal_transaksi" placeholder="Masukkan tanggal transaksi"><br>
              <label>Tanggal Warta:</label>
              <input type="text" class="form-control datepicker" name="tanggal_warta" id="tanggal_warta" placeholder="Masukkan tanggal warta"><br>
              <label>Nama Transaksi Pemasukan:</label>
              <input type="text" class="form-control" name="nama_transaksi" id="nama_transaksi" placeholder="Pilih nama transaksi (mata anggaran + tanggal)"><br>
              <label>Jenis Transaksi:</label>
              <select name="jenis_transaksi" class="form-control" id="jenis_transaksi">
                <option value="Tunai">Tunai</option>
                <option value="Transfer">Transfer</option>
              </select><br>
            </div>
          </div>
          <!-- SEPARATE -->
          <div class="col-md-6">
            <div class="form-group">
            <label>Nomor Transaksi:</label>
              <input type="number" class="form-control" name="nomor_transaksi" id="nomor_transaksi" placeholder="Masukkan nomor transaksi (tanggal + 4 digit unik)"><br>
              <label>Jumlah Uang:</label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">Rp.</span>
                </div>
                <input type="text" class="form-control" name="jumlah_uang" id="jumlah_uang" placeholder="Masukkan jumlah uang" id="jumlah_uang">
              </div>
              <br>
              <label>Jumlah Sentralisasi:</label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">Rp.</span>
                </div>
                <input type="text" class="form-control" name="jumlah_sentralisasi" placeholder="Jumlah Sentralisasi" id="jumlah_sentralisasi">
              </div>
              <br>
              <label>Jumlah Gereja:</label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">Rp.</span>
                </div>
                <input type="text" class="form-control" name="jumlah_gereja" placeholder="Jumlah Gereja" id="jumlah_gereja">
              </div>
              <br>
              <label for="persembahanTahun">Tahun Anggaran:</label>
              <select name="persembahanTahun" id="persembahanTahun" class="form-control"></select><br>
              <label>Bulan Awal:</label>
              <select name="bulan_awal" class="form-control" id="bulan_awal">
                <option value="Januari">Januari</option>
                <option value="Februari">Februari</option>
                <option value="Maret">Maret</option>
                <option value="April">April</option>
                <option value="Mei">Mei</option>
                <option value="Juni">Juni</option>
                <option value="Juli">Juli</option>
                <option value="Agustus">Agustus</option>
                <option value="September">September</option>
                <option value="Oktober">Oktober</option>
                <option value="November">November</option>
                <option value="Desember">Desember</option>
              </select><br>
              <label>Bulan Akhir:</label>
              <select name="bulan_akhir" class="form-control" id="bulan_akhir">
                <option value="Januari">Januari</option>
                <option value="Februari">Februari</option>
                <option value="Maret">Maret</option>
                <option value="April">April</option>
                <option value="Mei">Mei</option>
                <option value="Juni">Juni</option>
                <option value="Juli">Juli</option>
                <option value="Agustus">Agustus</option>
                <option value="September">September</option>
                <option value="Oktober">Oktober</option>
                <option value="November">November</option>
                <option value="Desember">Desember</option>
              </select><br>
              <label>Keterangan:</label>
              <input type="text" class="form-control" name="keterangan" placeholder="Masukkan Keterangan"><br>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <a type="button" href="/admin/detailTransaksiPemasukan" class="btn btn-default float-right">Batal</a>
            <button type="submit" class="btn btn-success float-right" style="margin-right: 5px;">Buat</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
  $(document).ready(function() {
    var indukKategoriAnggarans = {!! $indukKategoriAnggarans !!};
    var kategoriMataAnggarans = {!! $kategoriMataAnggarans !!};
    var mataAnggarans = {!! $mataAnggarans !!};
    var jumlahSentralisasis = {!! $jumlahSentralisasis !!};

    function updateKategoriMataAnggaranOptions(selectedInduk) {
      var $kategoriMataAnggaranSelect = $('#kategori_mata_anggaran');
      $kategoriMataAnggaranSelect.empty();

      var selectedOptions = kategoriMataAnggarans.filter(function(kategori) {
        return kategori.induk_kategori_anggaran === selectedInduk;
      });

      selectedOptions.forEach(function(kategori) {
        var option = $('<option>').text(kategori.nama_kategori_anggaran).val(kategori.nama_kategori_anggaran);
        $kategoriMataAnggaranSelect.append(option);
      });

      $kategoriMataAnggaranSelect.trigger('change');
    }

    function updateMataAnggaranOptions(selectedKategori) {
      var $mataAnggaranSelect = $('#mata_anggaran');
      $mataAnggaranSelect.empty();

      var selectedOptions = mataAnggarans.filter(function(mata) {
        return mata.kategori_mata_anggaran === selectedKategori;
      });

      selectedOptions.forEach(function(mata) {
        var option = $('<option>').text(mata.nama_mata_anggaran).val(mata.id_mata_anggaran).data('is-sentralisasi', 
        mata.isSentralisasi).data('persentasi-sentralisasi', mata.persentasi_sentralisasi);
        $mataAnggaranSelect.append(option);
      });

      $mataAnggaranSelect.trigger('change');
    }

    function updateIsSentralisasiOptions(selectedMataAnggaran) {
      var $isSentralisasiSelect = $('#isSentralisasi');
      $isSentralisasiSelect.empty();

      var selectedOption = mataAnggarans.find(function(mata) {
        return mata.id_mata_anggaran == selectedMataAnggaran;
      });

      if (selectedOption) {
        var option = $('<option>').text(selectedOption.isSentralisasi).val(selectedOption.isSentralisasi);
        $isSentralisasiSelect.append(option);
      }

      $isSentralisasiSelect.trigger('change');
    }

    $('#induk_kategori_anggaran').on('change', function() {
      var selectedInduk = $(this).val();
      updateKategoriMataAnggaranOptions(selectedInduk);
    });

    $('#kategori_mata_anggaran').on('change', function() {
      var selectedKategori = $(this).val();
      updateMataAnggaranOptions(selectedKategori);
    });

    $('#mata_anggaran').on('change', function() {
      var selectedMataAnggaran = $(this).val();
      updateIsSentralisasiOptions(selectedMataAnggaran);
    });

    var defaultInduk = $('#induk_kategori_anggaran').val();
    var defaultKategori = $('#kategori_mata_anggaran').val();
    var defaultMataAnggaran = $('#mata_anggaran').val();

    updateKategoriMataAnggaranOptions(defaultInduk);
    updateMataAnggaranOptions(defaultKategori);

    $('.datepicker').datepicker({
      dateFormat: 'dd/mm/yy',
      changeMonth: true,
      changeYear: true
    });

    function updateNomorTransaksi() {
      var tanggalTransaksi = $('[name="tanggal_transaksi"]').val();
      var nomorTransaksi = '';

      if (tanggalTransaksi) {
        var previousDate = localStorage.getItem('previousDate');
        var previousCode = localStorage.getItem('previousCode');

        if (tanggalTransaksi !== previousDate) {
          nomorTransaksi = tanggalTransaksi.replace(/[^0-9]/g, '') + '0001';
        } else {
          var code = parseInt(previousCode) + 1;
          nomorTransaksi = tanggalTransaksi.replace(/[^0-9]/g, '') + padCode(code);
        }

        localStorage.setItem('previousDate', tanggalTransaksi);
        localStorage.setItem('previousCode', nomorTransaksi.substr(-4));
      }

      $('#nomor_transaksi').val(nomorTransaksi);
    }

    $('[name="tanggal_transaksi"]').on('change', function() {
      updateNomorTransaksi();
    });

    function padCode(code) {
      var codeStr = String(code);
      return '0000'.substring(0, 4 - codeStr.length) + codeStr;
    }

    function updateNamaTransaksi() {
      var mataAnggaran = $('#mata_anggaran option:selected').text();
      var tanggalTransaksi = $('[name="tanggal_transaksi"]').val();
      var namaTransaksi = mataAnggaran;

      if (tanggalTransaksi) {
        namaTransaksi += ' tanggal ' + tanggalTransaksi;
      }

      $('[name="nama_transaksi"]').val(namaTransaksi);
    }

    $('#mata_anggaran, [name="tanggal_transaksi"]').on('change', function() {
      updateNamaTransaksi();
      updateNomorTransaksi();
      calculateJumlahSentralisasi();
    });

    updateNamaTransaksi();
    $('#induk_kategori_anggaran').trigger('change');

    // Helper function to remove Rupiah separator and convert to numeric value
    function removeSeparator(value) {
      return value.replace(/\./g, '');
    }

    // Helper function to add Rupiah separator
    function addSeparator(value) {
      return new Intl.NumberFormat('id-ID').format(value);
    }

    function calculate() {
      var jumlahUangInput = removeSeparator($('#jumlah_uang').val());

      var result = jumlahUangInput * 0.5;

      $('#jumlah_sentralisasi').val('Rp. ' + addSeparator(result));
      $('#jumlah_gereja').val('Rp. ' + addSeparator(result * 0.4));
      
    }

    $('#jumlah_uang').on('input', function() {
      calculate();
    });

    function calculateJumlahSentralisasi() {
      var isSentralisasi = $('#isSentralisasi').val();

      if (isSentralisasi === 'Ya') {
        var selectedMataAnggaran = $('#mata_anggaran').val();
        var selectedOption = jumlahSentralisasis.find(function(sent) {
          return sent.keterangan === 'Sentralisasi Pusat';
        });
        
        var persentasiSentralisasi = selectedOption ? selectedOption.persentasi_sentralisasi : 0;
        var jumlahUang = parseInt($('#jumlah_uang').val());
        var jumlahSentralisasi = (persentasiSentralisasi * jumlahUang) / 100;
        $('#jumlah_sentralisasi').val(addSeparator(jumlahSentralisasi));
        $('#jumlah_gereja').val(addSeparator(jumlahUang - jumlahSentralisasi));
      } else {
        var jumlahUang = parseInt($('#jumlah_uang').val());
        $('#jumlah_sentralisasi').val(0);
        $('#jumlah_gereja').val(addSeparator(jumlahUang));
      }
    }

    $('#isSentralisasi, #jumlah_uang').on('input', function() {
      calculateJumlahSentralisasi();
    });

    updateNamaTransaksi();
    $('#induk_kategori_anggaran').trigger('change');
    
    // BULAN TAHUN
    // Map month numbers to month names in Indonesian
    var monthNames = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];

    // Update selected month values in "Bulan Awal" and "Bulan Akhir" fields
    function updateBulanOptions() {
      var bulanAwal = parseInt($('#bulan_awal').val());
      var bulanAkhir = parseInt($('#bulan_akhir').val());

      var bulanAwalSelect = $('#bulan_awal');
      var bulanAkhirSelect = $('#bulan_akhir');

      bulanAwalSelect.empty();
      bulanAkhirSelect.empty();

      for (var i = 1; i <= 12; i++) {
        var option = $('<option>').text(monthNames[i - 1]).val(i);
        if (i === bulanAwal) {
          option.attr('selected', 'selected');
        }
        bulanAwalSelect.append(option.clone());
        if (i === bulanAkhir) {
          option.attr('selected', 'selected');
        }
        bulanAkhirSelect.append(option);
      }
    }

    // Update available years in "Persembahan Tahun" field based on selected month values
    function updatePersembahanTahunOptions() {
      var bulanAwal = parseInt($('#bulan_awal').val());
      var bulanAkhir = parseInt($('#bulan_akhir').val());

      var persembahanTahunSelect = $('#persembahanTahun');
      persembahanTahunSelect.empty();

      var selectedDate = $('[name="tanggal_transaksi"]').datepicker('getDate');
      var selectedYear = selectedDate !== null ? selectedDate.getFullYear() : new Date().getFullYear();

      var tahunAwal = selectedYear - 10;
      var tahunAkhir = selectedYear + 10;

      for (var tahun = tahunAwal; tahun <= tahunAkhir; tahun++) {
        var option = $('<option>').text(tahun).val(tahun);
        if (tahun === selectedYear) {
          option.attr('selected', 'selected');
        }
        persembahanTahunSelect.append(option);
      }
    }

    $('[name="tanggal_transaksi"]').on('change', function() {
      var selectedDate = $(this).datepicker('getDate');
      if (selectedDate !== null) {
        var selectedYear = selectedDate.getFullYear();
        $('#bulan_awal').val(selectedDate.getMonth() + 1);
        $('#bulan_akhir').val(selectedDate.getMonth() + 1);
        updateBulanOptions();
        updatePersembahanTahunOptions();
        $('#persembahanTahun').val(selectedYear);
      }
    });

    $('#bulan_awal, #bulan_akhir').on('change', function() {
      updatePersembahanTahunOptions();
    });

    $('#persembahanTahun').on('change', function() {
      updatePersembahanTahunOptions();
    });

    // Initial setup
    updateBulanOptions();
    updatePersembahanTahunOptions();

  });
</script>