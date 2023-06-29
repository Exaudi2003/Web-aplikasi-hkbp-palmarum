@include('layouts.formSearch.navbar')
@include('layouts.formSearch.header')
@include('layouts.formSearch.sidebar')
@include('layouts.formSearch.footer')

<div class="content-wrapper">

<div class="col">
<div class="card card-primary">
  <div class="card-header">
    <h2 style="font-weight: bold;">Daftar Transaksi Pengeluaran</h2>
  </div>
   
    <div class="card-body">
      <!-- Date -->
      <div class="form-group">
        <section class="content">
            <div class="container-fluid">
              <div class="row">
                <div class="col-12">
                  <div class="card card-primary">                   
                    <div class="col">
                      <div class="row">                   
                      </div>
                      <a type="button" href="/admin/tambahPengeluaran" class="btn btn-success float-right"  id="buttonHeader">Tambah Data</a>                  
                    </div>  
                    <!-- /.card-header -->
              
                    <div class="card-body">      
                        <!-- <label>Mata Anggaran</label> -->
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                              <tr>
                                <th>Tanggal Transaksi</th>
                                <th>Tanggal Warta</th>
                                <th>Nama Transaksi</th>
                                <th>Jumlah Uang Keluar</th>
                                <th>Tahun Anggaran</th>
                                <th>Keterangan</th>
                                <th>Aksi</th>
                              </tr>
                            </thead>
                            <tbody>
                            @foreach($detailPengeluarans as $data)
                            @if($data)
                              <tr>
                                <td>{{ $data['tanggal_transaksi'] }}</td>
                                <td>{{ $data['tanggal_warta'] }}</td>
                                <td>{{ $data['nama_transaksi'] }}</td>
                                <td>{{ $data['jumlah_gereja'] }}</td>
                                <td>{{ $data['persembahanTahun'] }}</td>
                                <td>{{ $data['keterangan'] }}</td>
                                <td>
                                  <!-- <button class="btn btn-primary"><i class="bi bi-search"></i></button>
                                  <button class="btn btn-warning"><i class="bi bi-pencil-square"></i></button>
                                  <button class="btn btn-danger"><i class="bi bi-trash3-fill"></i></button> -->
                                  <form action="{{ route('deletePengeluaran', $data['id_pengeluaran']) }}" method="POST" class="delete-form">
                                    @csrf
                                    @method('DELETE')
                                    <button class="btn btn-danger delete-button"><i class="bi bi-trash3-fill"></i></button>
                                  </form>
                                </td>
                              </tr>
                            @endif
                            @endforeach
                            <!-- Tambahkan baris lainnya sesuai kebutuhan -->
                            </tbody>
                          </table>
                    </div>
                    <!-- /.card-body -->
                  </div>
                <!-- /.card -->
                </div>
              <!-- /.col -->
              </div>
            <!-- /.row -->
            </div>
          <!-- /.container-fluid -->
          </section>
        </div>
        <div class="row">
          <div class="col-12">      
            <!-- <button type="button" class="btn btn-default float-right"> Edit</button> -->
            <!-- <a type="button" class="btn btn-success float-right" href="/admin/tambahPemasukan" style="margin-right: 5px;">Create</a> -->
          </div>
        </div>
    </div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<!-- NOTIFY USER FOR DELETE ACTION -->
<script>
  $(document).ready(function() {
    $(document).on('click', '.delete-button', function(event) {
      event.preventDefault(); // Prevent the default form submission

      var form = $(this).closest('form');
      var table = $('#example1');

      Swal.fire({
        title: 'Anda yakin ingin menghapus data ini?',
        text: "Aksi ini tidak dapat dibatalkan!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Batal',
        confirmButtonText: 'Ya, hapus!'
      }).then((result) => {
        if (result.isConfirmed) {
          $.ajax({
            url: form.attr('action'), // Use the form's action attribute
            type: 'POST',
            data: form.serialize(),
            success: function(response) {
              console.log(response);
              form.closest('tr').remove();

              Swal.fire(
                'Berhasil!',
                'Data telah dihapus.',
                'success'
              );
            },
            error: function(xhr) {
              console.log(xhr.responseText);
            }
          });
        }
      });
    });
  });
</script>
