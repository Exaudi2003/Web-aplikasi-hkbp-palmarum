@include('layouts.formSearch.navbar')
@include('layouts.formSearch.header')
@include('layouts.formSearch.sidebar')
@include('layouts.formSearch.footer')

<div class="content-wrapper">

<div class="col">
<div class="card card-primary">
  <div class="card-header">
    <h2 style="font-weight: bold;">Detail Mata Anggaran</h2>
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
                      <a type="button" href="/admin/mataAnggaran" class="btn btn-success float-right"  id="buttonHeader">Tambah Data</a>                   
                    </div>  
                    <!-- /.card-header -->
                    <div class="card-body">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                              <tr>
                                <th>Kode Mata Anggaran</th>
                                <th>Kategori Mata Anggaran</th>
                                <th>Nama Mata Anggaran</th>
                                <th>Jenis Anggaran</th>
                                <th>Sentralisasi</th>
                                <th>Keterangan</th>
                                <th>Action</th>
                              </tr>
                            </thead>
                            <tbody>
                            @foreach($mataAnggarans as $data)
                            @if($data)
                              <tr>
                                <td>{{ $data['kode_mata_anggaran'] }}</td>
                                <td>{{ $data['kategori_mata_anggaran'] }}</td>
                                <td>{{ $data['nama_mata_anggaran'] }}</td>
                                <td>{{ $data['jenis_anggaran'] }}</td>
                                <td>{{ $data['isSentralisasi'] }}</td>
                                <td>{{ $data['keterangan'] }}</td>
                                <td>
                                <a class="btn btn-warning" href="{{ route('editMataAnggaran', $data['id_mata_anggaran']) }}"><i class="bi bi-pencil-square"></i></a>
                                  
                                  <form class="delete-form" data-action="{{ route('deleteMataAnggaran', $data['id_mata_anggaran']) }}" method="POST" style="display: inline">
                                    @csrf
                                    @method('DELETE')
                                    <button type="button" class="btn btn-danger delete-button"><i class="bi bi-trash3-fill"></i></button>
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
        <!-- <a type="button" href="/admin/mataAnggaran" class="btn btn-success float-right" style="margin-right: 5px;">Create</a> -->
      </div>
    </div>

</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<!-- NOTIFY USER FOR DELETE ACTION -->
<script>
  $(document).ready(function() {
    // Handle click event of the delete button
    // $('.delete-button').click(function() {
    //   // Get the form element associated with the delete button
    //   var form = $(this).closest('.delete-form');
    //   var table = $('#example1');

    //   // Display a confirmation dialog
    //   if (confirm('Are you sure you want to delete this item?')) {
    //     // Submit the form asynchronously
    //     $.ajax({
    //       url: form.data('action'),
    //       type: 'POST',
    //       data: form.serialize(),
    //       success: function(response) {
    //         // Handle the success response
    //         console.log(response);

    //         // Remove the deleted row from the table
    //         form.closest('tr').remove();
    //       },
    //       error: function(xhr) {
    //         // Handle the error response, if needed
    //         // For example, you can show an error message
    //         console.log(xhr.responseText);
    //       }
    //     });
    //   }
    // });

    // SWEET ALERT
    // Handle click event of the delete button
    // Delegate the click event handling to the document for dynamically added delete buttons
    $(document).on('click', '.delete-button', function() {
      // Get the form element associated with the delete button
      var form = $(this).closest('.delete-form');
      var table = $('#example1');

      // Display a confirmation dialog using Sweet Alert
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
        // If the user confirms the delete action
        if (result.isConfirmed) {
          // Submit the form asynchronously
          $.ajax({
            url: form.data('action'),
            type: 'POST',
            data: form.serialize(),
            success: function(response) {
              // Handle the success response
              console.log(response);

              // Remove the deleted row from the table
              form.closest('tr').remove();

              // Show a success message using Sweet Alert
              Swal.fire(
                'Berhasil!',
                'Data telah dihapus.',
                'success'
              );
            },
            error: function(xhr) {
              // Handle the error response, if needed
              // For example, you can show an error message
              console.log(xhr.responseText);
            }
          });
        }
      });
    });
  });
</script>