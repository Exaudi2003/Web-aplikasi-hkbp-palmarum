@include('layouts.formSearch.navbar')
@include('layouts.formSearch.header')
@include('layouts.formSearch.sidebar')
@include('layouts.formSearch.footer')

<div class="content-wrapper">
  <div class="col">
    <div class="card card-primary">
      <div class="card-header">
        <h2 style="font-weight: bold;">Detail Kategori Mata Anggaran</h2>
      </div>

      <div class="card-body">
        <div class="form-group">
          <section class="content">
            <div class="container-fluid">
              <div class="row">
                <div class="col-12">
                  <div class="card card-primary">
                    <div class="col">
                      <div class="row">
                      </div>
                      <a type="button" href="/admin/kategoriMataAnggaran" class="btn btn-success float-right" id="buttonHeader">Tambah Data</a>
                    </div>

                    <div class="card-body">
                      <table id="example1" class="table table-bordered table-striped">
                        <thead>
                          <tr>
                            <th>Induk Kategori Anggaran</th>
                            <th>Kode Kategori Anggaran</th>
                            <th>Nama Kategori Anggaran</th>
                            <th>Keterangan</th>
                            <th>Action</th>
                          </tr>
                        </thead>
                        <tbody>
                          @foreach($kategoriMataAnggarans as $data)
                          <tr>
                            <td>{{ $data['induk_kategori_anggaran'] }}</td>
                            <td>{{ $data['kode_kategori_anggaran'] }}</td>
                            <td>{{ $data['nama_kategori_anggaran'] }}</td>
                            <td>{{ $data['keterangan'] }}</td>
                            <td>
                              <a class="btn btn-warning" href="{{route('editKategoriMataAnggaran', $data['id_kategori_anggaran'])}}"><i class="bi bi-pencil-square"></i></a>
                              <form action="{{ route('deleteKategoriMataAnggaran', $data['id_kategori_anggaran']) }}" method="POST" style="display: inline" onsubmit="return confirmDelete()">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger delete-button"><i class="bi bi-trash3-fill"></i></button>
                              </form>
                            </td>
                          </tr>
                          @endforeach
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
        </div>
        <div class="row">
          <div class="col-12">
            <!-- <button type="button" class="btn btn-default float-right">Edit</button> -->
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
  $(document).ready(function () {
    $(document).on('submit', 'form', function (event) {
      event.preventDefault(); // Prevent the default form submission

      var form = $(this);
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
            success: function (response) {
              console.log(response);
              form.closest('tr').remove();

              Swal.fire(
                'Berhasil!',
                'Data telah dihapus.',
                'success'
              );
            },
            error: function (xhr) {
              console.log(xhr.responseText);
            }
          });
        }
      });
    });
  });

  // Check if success alert is present in the URL
  var urlParams = new URLSearchParams(window.location.search);
  var status = urlParams.get('status');
  if (status && status.toLowerCase() === 'success') {
    // Display success notification
    var successMessage = document.getElementById("successMessage");
    if (successMessage) {
      successMessage.style.display = "block";
    }
  }
</script>
