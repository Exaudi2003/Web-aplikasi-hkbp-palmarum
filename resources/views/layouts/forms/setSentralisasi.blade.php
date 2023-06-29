@include('layouts.forms.header')
@include('layouts.forms.navbar')
@include('layouts.forms.sidebar')
@include('layouts.forms.footer')

<div class="content-wrapper">
    <div class="col">
        <div class="card card-primary">
            <div class="card-header">
                <h2 style="font-weight: bold;">Set Sentralisasi</h2>
            </div>

            @if($sentralisasi && count($sentralisasi) < 2)
              <form action="{{ route('tambahSentralisasi') }}" method="POST" onsubmit="return validateForm()">
              @csrf

                <div class="card-body">
                  <!-- Date -->
                  <div class="form-group">    
                      <label>Persentase Sentralisasi:</label>
                      <input type="text" name="persentasi_sentralisasi" id="persentasi_sentralisasi" class="form-control" placeholder="Masukkan persentase sentralisasi">
                      <br>
                      <label>Keterangan:</label>
                      <select name="keterangan" class="form-control">
                          <option value="Sentralisasi Pusat">Sentralisasi Pusat</option>
                          <option value="Sentralisasi Gereja">Sentralisasi Gereja</option>
                      </select>
                      <br>  
                    </div><br><br><br>
                    
                    <div class="row">
                        <div class="col-12">      
                            <a type="button" href="/admin/detailSentralisasi" class="btn btn-default float-right">Cancel</a>
                            <button type="submit" class="btn btn-success float-right" style="margin-right: 5px;">Create</button>
                        </div>
                    </div>
                </div>
            </form>
            @else
            <div class="card-body">
                <h3>Detail sentralisasi sudah lengkap, tidak bisa menambah data lagi.</h3>
                <a type="button" href="/admin/detailSentralisasi" class="btn btn-default float-right">Kembali</a>
            </div>
            @endif

        </div>
    </div>
</div>

<script>
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
</script>
