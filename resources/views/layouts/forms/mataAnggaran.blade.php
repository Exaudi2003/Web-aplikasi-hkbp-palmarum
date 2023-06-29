@include('layouts.formSearch.navbar')
@include('layouts.formSearch.header')
@include('layouts.formSearch.sidebar')
@include('layouts.formSearch.footer')

<div class="content-wrapper">
  <div class="col">
    <div class="card card-primary">
      <div class="card-header">
        <h2 style="font-weight: bold;">Tambah Mata Anggaran</h2>
      </div>
      <form action="{{ route('tambahMataAnggaran') }}" method="POST" onsubmit="return validateForm()">
        @csrf

        <div class="card-body">
          <div class="form-group">
            <label>Kategori Mata Anggaran:</label>
            <select name="kategori_mata_anggaran" class="form-control" id="kategori_mata_anggaran">
              @foreach($kategoriMataAnggarans2 as $kategori)
                <option value="{{ $kategori['nama_kategori_anggaran'] }}" data-kode="{{ $kategori['kode_kategori_anggaran'] }}">{{ $kategori['nama_kategori_anggaran'] }}</option>
              @endforeach
            </select>
            <label>Kode Mata Anggaran:</label>
            <input type="number" name="kode_mata_anggaran" id="kode_mata_anggaran" class="form-control" placeholder="Masukkan kode mata anggaran">
            <label>Nama Mata Anggaran:</label>
            <input type="text" name="nama_mata_anggaran" class="form-control" placeholder="Masukkan nama mata anggaran">
            <label>Jenis Anggaran:</label>
            <select name="jenis_anggaran" class="form-control" id="jenis_anggaran">
              <option value="Pemasukan">Pemasukan</option>
              <option value="Pengeluaran">Pengeluaran</option>
            </select>
            <label>Sentralisasi:</label>
            <select name="isSentralisasi" class="form-control" id="sentralisasi">
              <option value="Ya">Ya</option>
              <option value="Tidak">Tidak</option>
            </select>
            <label>Keterangan:</label>
            <input type="text" name="keterangan" class="form-control" placeholder="Masukkan keterangan">
          </div>
          <div class="row">
            <div class="col-12">
              <a type="button" href="/admin/detailMataAnggaran" class="btn btn-default float-right">Batal</a>
              <button type="submit" class="btn btn-success float-right" style="margin-right: 5px;">Buat</button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Include Sweet Alert CSS and JS files -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.5/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.5/dist/sweetalert2.min.js"></script>

<script>
  $(document).ready(function() {
    // Handle change event of the kategori_mata_anggaran select
    $('#kategori_mata_anggaran').change(function() {
      // Get the selected option data-kode attribute
      var selectedOptionDataKode = $(this).find(':selected').data('kode');
      // Update the value of the kode_mata_anggaran input
      $('#kode_mata_anggaran').val(selectedOptionDataKode);
    }).change(); // Trigger the change event to set default values

    // Handle change event of the kode_mata_anggaran input
    $('#kode_mata_anggaran').change(function() {
      // Get the selected option text
      var selectedOptionText = $('#kategori_mata_anggaran').find(':selected').text();
      // Update the value of the nama_mata_anggaran input
      $('#nama_mata_anggaran').val(selectedOptionText);
    }).change(); // Trigger the change event to set default values

    // Handle change event of the jenis_anggaran select
    $('#jenis_anggaran').change(function() {
      // Get the selected option value
      var selectedOptionValue = $(this).val();
      // Get the current value of the sentralisasi select
      var currentSentralisasiValue = $('#sentralisasi').val();

      // Set the value of the sentralisasi select based on the jenis_anggaran value
      if (selectedOptionValue === 'Pengeluaran') {
        $('#sentralisasi').val('Tidak');
      } else if (currentSentralisasiValue !== 'Tidak') {
        // Only update the sentralisasi value if it is not already 'Tidak'
        $('#sentralisasi').val('Ya');
      }
    }).change(); // Trigger the change event to set default values
  });

  function validateForm() {
    var kategoriMataAnggaran = $('#kategori_mata_anggaran').val();
    var kodeMataAnggaran = $('#kode_mata_anggaran').val();
    var namaMataAnggaran = $('#nama_mata_anggaran').val();

    if (kategoriMataAnggaran.trim() === '') {
      Swal.fire('Error', 'Kategori Mata Anggaran harus dipilih', 'error');
      return false;
    }

    if (kodeMataAnggaran.trim() === '') {
      Swal.fire('Error', 'Kode Mata Anggaran harus diisi', 'error');
      return false;
    }

    if (namaMataAnggaran.trim() === '') {
      Swal.fire('Error', 'Nama Mata Anggaran harus diisi', 'error');
      return false;
    }

    // Display success notification using Sweet Alert
    Swal.fire({
      title: 'Success',
      text: 'Mata Anggaran berhasil dibuat!',
      icon: 'success',
      confirmButtonColor: '#3085d6',
      confirmButtonText: 'OK'
    }).then((result) => {
      if (result.isConfirmed) {
        // You can perform any additional action here after the user clicks OK
        // For example, redirecting to another page
        window.location.href = '/admin/detailMataAnggaran';
      }
    });

    return true;
  }
</script>
