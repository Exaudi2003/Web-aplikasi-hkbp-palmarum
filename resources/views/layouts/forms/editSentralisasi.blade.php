@include('layouts.forms.header')
@include('layouts.forms.navbar')
@include('layouts.forms.sidebar')
@include('layouts.forms.footer')

<br>  
<div class="content-wrapper"> 
  <div class="col">
    <div class="card card-primary">
      <div class="card-header">
        <h2 style="font-weight: bold;">Edit Sentralisasi</h2>
      </div>
      
      <form action="{{ route('updateSentralisasi', $data->id_sentralisasi) }}" method="POST" onsubmit="return validateForm()">
        @csrf
        @method('PUT')
        <div class="card-body">
          <!-- Date -->
          <div class="form-group">
          <input type="hidden" name="id_sentralisasi" class="form-control" value="{{ $data->id_sentralisasi }}">    
            <label>Persentase Sentralisasi:</label>
            <input type="text" name="persentasi_sentralisasi" class="form-control" value="{{ $data->persentasi_sentralisasi }}" placeholder="Masukkan persentase sentralisasi">
            <br>
            <label>Keterangan:</label>
            <input type="text" name="keterangan" class="form-control" value="{{ $data->keterangan }}" placeholder="Masukkan keterangan">
            <br>  
          </div><br><br><br>
          
          <div class="row">
            <div class="col-12">      
              <a type="button" href="/admin/detailSentralisasi" class="btn btn-default float-right">Batal</a>
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
    $('form').submit(function(e) {
      e.preventDefault();
      var form = this;
      $.post($(this).attr('action'), $(this).serialize(), function() {
        // Redirect to the desired page after successful form submission
        window.location.href = '/admin/detailSentralisasi';
      });
    });

    function validateForm() {
        var persentasi = document.getElementById("persentasi_sentralisasi").value;
        var keterangan = document.getElementsByName("keterangan")[0].value;

        if (persentasi.trim() === "") {
            alert("Persentase Sentralisasi harus diisi");
            return false;
        }

        if (keterangan.trim() === "") {
            alert("Keterangan harus diisi");
            return false;
        }
    }
  });
</script>