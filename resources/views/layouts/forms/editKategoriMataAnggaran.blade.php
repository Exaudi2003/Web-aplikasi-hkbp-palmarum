@include('layouts.formSearch.navbar')
@include('layouts.formSearch.header')
@include('layouts.formSearch.sidebar')
@include('layouts.formSearch.footer')

<div class="content-wrapper">
  <div class="col">
    <div class="card card-primary">
      <div class="card-header">
        <h2 style="font-weight: bold;">Edit Kategori Mata Anggaran</h2>
      </div>  

      <form action="{{ route('updateKategoriMataAnggaran', $data->id_kategori_anggaran) }}" method="POST" onsubmit="return validateForm()">
        @csrf
        @method('PUT')

        <div class="card-body">
          <!-- Date -->
          <div class="form-group">
            <input type="hidden" name="id_sentralisasi" class="form-control" value="{{ $data->id_kategori_anggaran}}">    
            <label>Induk Kategori  Anggaran :</label>
            <!-- <input type="text" name="induk_kategori_anggaran" class="form-control" value="{{ $data->induk_kategori_anggaran }}" placeholder="masukkan induk kategori anggaran"> -->
            <select name="induk_kategori_anggaran" class="form-control" value="{{ $data->induk_kategori_anggaran }}" id="induk_kategori_anggaran">
              <option value="PENERIMAAN HURIA">PENERIMAAN HURIA</option>
              <option value="PENERIMAAN TRANSITORI">PENERIMAAN TRANSITORI</option>
              <option value="PENGELUARAN TRANSITORI">PENGELUARAN TRANSITORI</option>
              <option value="PENGELUARAN HURIA">PENGELUARAN HURIA</option>
              <option value="SEKRETARIAT HURIA">SEKRETARIAT HURIA</option>
              <option value="PERBENDAHARAAN (PARARTAON)">PERBENDAHARAAN (PARARTAON)</option>
            </select>
            <label>Kode Kategori Anggaran :</label>
            <input type="number" name="kode_kategori_anggaran" class="form-control" value="{{ $data->kode_kategori_anggaran }}" placeholder="Masukkan kode kategori anggaran">
            <label>Nama Kategori Anggaran :</label>
            <input type="text" name="nama_kategori_anggaran" class="form-control" value="{{ $data->nama_kategori_anggaran }}" placeholder="Masukkan nama kategori anggaran">
            <label>Keterangan :</label>
            <input type="text" name="keterangan" class="form-control" value="{{ $data->keterangan }}" placeholder="Masukkan Keterangan">
          </div>
          <div class="row">
            <div class="col-12">      
              <a type="button" href="/admin/detailKategoriMataAnggaran" class="btn btn-default float-right">Batal</a>
              <button type="submit" class="btn btn-success float-right" style="margin-right: 5px;">Ubah</button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
  function validateForm() {
    var indukKategori = document.getElementsByName("induk_kategori_anggaran")[0].value;
    var kodeKategori = document.getElementsByName("kode_kategori_anggaran")[0].value;
    var namaKategori = document.getElementsByName("nama_kategori_anggaran")[0].value;

    if (indukKategori.trim() === "") {
      alert("Induk Kategori Anggaran harus diisi");
      return false;
    }

    if (kodeKategori.trim() === "") {
      alert("Kode Kategori Anggaran harus diisi");
      return false;
    }

    if (namaKategori.trim() === "") {
      alert("Nama Kategori Anggaran harus diisi");
      return false;
    }

    // Display success notification
    alert("Kategori Mata Anggaran berhasil diperbarui!");
    return true;
  }

  $(document).ready(function() {
  // Handle change event of the induk_kategori_anggaran select
  $('#induk_kategori_anggaran').change(function() {
    // Get the selected option value
    var selectedOption = $(this).val();
    // Update the value of the kode_kategori_anggaran input based on the selected option
    if (selectedOption === 'PENERIMAAN HURIA') {
      $('#kode_kategori_anggaran').val('400000');
    } else if (selectedOption === 'PENERIMAAN TRANSITORI') {
      $('#kode_kategori_anggaran').val('500000');
    } else if (selectedOption === 'PENGELUARAN TRANSITORI') {
      $('#kode_kategori_anggaran').val('600000');
    } else if (selectedOption === 'PENGELUARAN HURIA') {
      $('#kode_kategori_anggaran').val('700000');
    } else if (selectedOption === 'SEKRETARIAT HURIA') {
      $('#kode_kategori_anggaran').val('800000');
    } else if (selectedOption === 'PERBENDAHARAAN (PARARTAON)') {
      $('#kode_kategori_anggaran').val('900000');
    }
  }).change(); // Trigger the change event to set default values
});
</script>
