@include('layouts.formSearch.navbar')
@include('layouts.formSearch.header')
@include('layouts.formSearch.sidebar')
@include('layouts.formSearch.footer')

<div class="content-wrapper">
  <div class="col">
    <div class="card card-primary">
      <div class="card-header">
        <h2 style="font-weight: bold;">Tambah Kategori Mata Anggaran</h2>
      </div>

      <form action="{{ route('tambahKategoriMataAnggaran') }}" method="POST" onsubmit="return validateForm()">
        @csrf

        <div class="card-body">
          <!-- Date -->
          <div class="form-group">
            <label>Induk Kategori Anggaran:</label>
            <select name="induk_kategori_anggaran" class="form-control" id="induk_kategori_anggaran">
              <option value="PENERIMAAN HURIA">PENERIMAAN HURIA</option>
              <option value="PENERIMAAN TRANSITORI">PENERIMAAN TRANSITORI</option>
              <option value="PENGELUARAN TRANSITORI">PENGELUARAN TRANSITORI</option>
              <option value="PENGELUARAN HURIA">PENGELUARAN HURIA</option>
              <option value="SEKRETARIAT HURIA">SEKRETARIAT HURIA</option>
              <option value="PERBENDAHARAAN (PARARTAON)">PERBENDAHARAAN (PARARTAON)</option>
            </select>
            <label>Kode Kategori Anggaran:</label>
            <input type="number" name="kode_kategori_anggaran" id="kode_kategori_anggaran" class="form-control" placeholder="Masukkan kode kategori anggaran">
            <label>Nama Kategori Anggaran:</label>
            <input type="text" name="nama_kategori_anggaran" class="form-control" placeholder="Masukkan nama kategori anggaran">
            <label>Keterangan:</label>
            <input type="text" name="keterangan" class="form-control" placeholder="Masukkan Keterangan">
          </div>
          <div class="row">
            <div class="col-12">
              <a type="button" href="/admin/detailKategoriMataAnggaran" class="btn btn-default float-right">Batal</a>
              <button type="submit" class="btn btn-success float-right" style="margin-right: 5px;">Buat</button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
  function validateForm() {
    var indukKategori = document.getElementById("induk_kategori_anggaran").value;
    var kodeKategori = document.getElementById("kode_kategori_anggaran").value;
    var namaKategori = document.getElementsByName("nama_kategori_anggaran")[0].value;

    if (indukKategori.trim() === "") {
      alert("Induk Kategori Anggaran harus dipilih");
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
    alert("Kategori Mata Anggaran berhasil ditambahkan!");

    // Return true to allow form submission
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
