@include('layouts.formSearch.navbar')
@include('layouts.formSearch.header')
@include('layouts.formSearch.sidebar')
@include('layouts.formSearch.footer')

<div class="content-wrapper">

<div class="col">
<div class="card card-primary">
  <div class="card-header">
    <h2 style="font-weight: bold;">Daftar Transaksi Pemasukan</h2>
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
                      <a type="button" href="/admin/tambahPemasukan" class="btn btn-success float-right" id="buttonHeader">Tambah Data</a>                  
                    </div>  
                    <!-- /.card-header -->
                    <!-- dd($request->all()) -->
                    <div class="card-body">      
                        <!-- <label>Mata Anggaran</label> -->
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                              <tr>
                                <th>Nomor Transaksi</th>
                                <th>Tanggal Transaksi</th>
                                <th>Nama Transaksi</th>
                                <th>Jumlah Sentralisasi</th>
                                <th>Jumlah Gereja</th>
                                <th>Bulan Awal</th>
                                <th>Bulan Akhir</th>
                                <th>Keterangan</th>
                                <th>Aksi</th>
                              </tr>
                            </thead>
                            <tbody>
                            @foreach($detailPemasukans as $data)
                            @if($data)
                              <tr>
                                <td>{{ $data['nomor_transaksi'] }}</td>
                                <td>{{ $data['tanggal_transaksi'] }}</td>
                                <td>{{ $data['nama_transaksi'] }}</td>
                                <td>{{ $data['jumlah_sentralisasi'] }}</td>
                                <td>{{ $data['jumlah_gereja'] }}</td>
                                <td>{{ $data['bulan_awal'] }}</td>
                                <td>{{ $data['bulan_akhir'] }}</td>
                                <td>{{ $data['keterangan'] }}</td>
                                <td>
                                  <form action="{{ route('deletePemasukan', $data['id_pemasukan']) }}" method="POST" class="delete-form">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-danger delete-button"><i class="bi bi-trash3-fill"></i></button>
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
