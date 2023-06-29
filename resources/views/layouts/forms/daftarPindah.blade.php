@include('layouts.forms.header')
@include('layouts.forms.navbar')
@include('layouts.forms.sidebar')
@include('layouts.forms.footer')

<!-- general form elements disabled -->
        <div class="content-wrapper"><br><br>
        <section class="content">
            <div class="card card-primary">
              <div class="card-header" style="height:6rem;">
                <h3 class="card-title" id="textHeader">Tambah Jemaat Pindah</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <form action="{{ route('createPindah') }}" method="post">
                  @csrf
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label>ID Registrasi Jemaat</label>
                        <input type="text" class="form-control" name="id_registrasi" placeholder="ID Registrasi Jemaat">
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>ID Jemaat</label>
                        <input type="text" class="form-control" name="id_jemaat" placeholder="ID Jemaat">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label>No Surat Pindah</label>
                        <input type="text" class="form-control" name="no_surat_pindah" placeholder="No Surat Pindah">
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>ID Gereja Tujuan</label>
                        <input type="text" class="form-control" name="id_gereja_tujuan" placeholder="ID Gereja Tujuan">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label>Tanggal Pindah</label>
                        <input type="date" class="form-control" name="tgl_pindah" placeholder="Tanggal Pindah">
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Nama Gereja Non-HKBP</label>
                        <input type="text" class="form-control" name="nama_gereja" placeholder="Nama Gereja Non-HKBP">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- textarea -->
                      <div class="form-group">
                        <label>Keterangan</label>
                        <textarea class="form-control" rows="3" name="keterangan" placeholder="keterangan"></textarea>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Tanggal Warta</label>
                        <input type="date" class="form-control" name="tgl_warta" placeholder="Tanggal Warta">
                      </div>
                    </div>
                  </div>
                  <div class="card-footer">
                    <a href="{{ route('pindah') }}" class="btn btn-outline-dark btn-lg ml-3 float-right">Cancel</a>
                    <button type="submit" class="btn btn-success btn-lg float-right">Create</button>
                    </div>
                </form>
              </div>
              <!-- /.card-body -->
            </div>
        </section>
    </div>
            <!-- /.card -->