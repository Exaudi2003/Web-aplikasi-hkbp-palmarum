@include('layouts.formSearch.navbar')
@include('layouts.formSearch.header')
@include('layouts.formSearch.sidebar')
@include('layouts.formSearch.footer')

<div class="content-wrapper">
  <div class="col">
    <div class="card card-primary">
      <div class="card-header">
        <h2 style="font-weight: bold;">Edit Mata Anggaran</h2>
      </div>
      <form action="{{ route('updateMataAnggaran', $data->id_mata_anggaran) }}" method="POST" onsubmit="return validateForm()">
        @csrf
        @method('PUT')
      
        <div class="card-body">
          <div class="form-group">
            <label>Kategori Mata Anggaran:</label>
            <select name="kategori_mata_anggaran" class="form-control" id="kategori_mata_anggaran">
              @foreach($kategoriMataAnggarans3 as $kategori)
                <option value="{{ $kategori['nama_kategori_anggaran'] }}" data-kode="{{ $kategori['kode_kategori_anggaran'] }}"
                  {{ $kategori['nama_kategori_anggaran'] == $data->kategori_mata_anggaran ? 'selected' : '' }}>
                  {{ $kategori['nama_kategori_anggaran'] }}
                </option>
              @endforeach
            </select>
            <label>Kode Mata Anggaran:</label>
            <input type="text" name="kode_mata_anggaran" id="kode_mata_anggaran" class="form-control" value="{{ $data->kode_mata_anggaran }}" placeholder="Masukkan kode mata anggaran">
            <label>Nama Mata Anggaran:</label>
            <input type="text" name="nama_mata_anggaran" id="nama_mata_anggaran" class="form-control" value="{{ $data->nama_mata_anggaran }}" placeholder="Masukkan nama mata anggaran">
            <label>Jenis Anggaran:</label>
            <select name="jenis_anggaran" class="form-control">
              <option value="Pemasukan" {{ $data->jenis_anggaran == 'Pemasukan' ? 'selected' : '' }}>Pemasukan</option>
              <option value="Pengeluaran" {{ $data->jenis_anggaran == 'Pengeluaran' ? 'selected' : '' }}>Pengeluaran</option>
            </select>
            <label>Sentralisasi:</label>
            <select name="isSentralisasi" class="form-control">
              <option value="Ya" {{ $data->isSentralisasi == 'Ya' ? 'selected' : '' }}>Ya</option>
              <option value="Tidak" {{ $data->isSentralisasi == 'Tidak' ? 'selected' : '' }}>Tidak</option>
            </select>
            <label>Keterangan:</label>
            <input type="text" name="keterangan" class="form-control" value="{{ $data->keterangan }}" placeholder="Masukkan keterangan">
          </div>
          <div class="row">
            <div class="col-12">      
              <a type="button" href="/admin/detailMataAnggaran" class="btn btn-default float-right">Batal</a>
              <button type="submit" class="btn btn-success float-right" style="margin-right: 5px;">Ubah</button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
  $(document).ready(function() {
    // Handle change event of the kategori_mata_anggaran select
    $('#kategori_mata_anggaran').change(function() {
      // Get the selected option data-kode attribute
      var selectedOptionDataKode = $(this).find(':selected').data('kode');
      // Update the value of the kode_mata_anggaran input only if it's not modified by the user
      if (!$('#kode_mata_anggaran').is(':focus')) {
        $('#kode_mata_anggaran').val(selectedOptionDataKode);
      }
    });

    // Handle change event of the kode_mata_anggaran input
    $('#kode_mata_anggaran').change(function() {
      // Get the selected option text
      var selectedOptionText = $('#kategori_mata_anggaran').find(':selected').text();
      // Update the value of the nama_mata_anggaran input only if it's not modified by the user
      if (!$('#nama_mata_anggaran').is(':focus')) {
        $('#nama_mata_anggaran').val(selectedOptionText);
      }
    });
  });
    
  function validateForm() {
    var kategoriMataAnggaran = document.getElementById("kategori_mata_anggaran").value;
    var kodeMataAnggaran = document.getElementById("kode_mata_anggaran").value;
    var namaMataAnggaran = document.getElementById("nama_mata_anggaran").value;

    if (kategoriMataAnggaran.trim() === "") {
      alert("Kategori Mata Anggaran harus dipilih");
      return false;
    }

    if (kodeMataAnggaran.trim() === "") {
      alert("Kode Mata Anggaran harus diisi");
      return false;
    }

    if (namaMataAnggaran.trim() === "") {
      alert("Nama Mata Anggaran harus diisi");
      return false;
    }

    // Display success notification
    alert("Mata Anggaran berhasil diperbarui!");
    return true;
  }
</script>
