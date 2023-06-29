@include('layouts.formSearch.navbar')
@include('layouts.formSearch.header')
@include('layouts.formSearch.sidebar')
@include('layouts.formSearch.footer')

<div class="content-wrapper">
    <div class="col">
        <div class="card card-primary">
            <div class="card-header">
                <h2 style="font-weight: bold;">Detail Sentralisasi</h2>
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
                                            <a type="button" href="/admin/setSentralisasi" class="btn btn-success float-right"  id="buttonHeader">Tambah Data</a>          
                                        </div><br>  
                                        <!-- /.card-header -->
                                        <div class="">
                                            <table id="example1" class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>Persentase Sentralisasi</th>
                                                        <th>Keterangan</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach($sentralisasis as $data)
                                                    <tr>
                                                        <td>{{$data['persentasi_sentralisasi']}}%</td>
                                                        <td>{{$data['keterangan']}}</td>
                                                        <td>
                                                            <a class="btn btn-warning" href="{{route('editSentralisasi', $data['id_sentralisasi'])}}"><i class="bi bi-pencil-square"></i></a>
                                                            <form action="{{route('deleteSentralisasi', $data['id_sentralisasi'])}}" method="POST" style="display: inline" onsubmit="return confirmDelete(event)">
                                                                @csrf
                                                                @method('DELETE')
                                                                <button type="submit" class="btn btn-danger delete-button"><i class="bi bi-trash3-fill"></i></button>
                                                            </form>
                                                        </td>
                                                    </tr>
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
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
  function confirmDelete(event) {
    event.preventDefault(); // Prevent the default form submission

    var form = event.target;
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
          url: form.action,
          type: 'POST',
          data: new FormData(form),
          processData: false,
          contentType: false,
          success: function(response) {
            console.log(response);
            $(form).closest('tr').remove();

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
  }
</script>
