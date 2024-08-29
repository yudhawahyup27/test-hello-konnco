@extends('pegawai.layout._layout')
@section('content')
<div class="container-fluid px-4">
    <h1 class="mt-4">Produk Bibit</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="/pegawai/produkbibit">Dashboard</a></li>
        <li class="breadcrumb-item "><a href="/pegawai/produkbibit">Produk Bibit</a></li>
        <li class="breadcrumb-item active">Ubah Produk Bibit</li>
    </ol>
    <div class="card mb-4">
        <div class="card-header">
            Ubah Data Produk Bibit
        </div>
        <div class="card-body">
            <form method="post" action="<?= url('/') ?>/pegawai/produkbibit/ubah/{{$get_produk->id_produk}}" enctype="multipart/form-data">
                {{@csrf_field()}}
                <div hidden class="mb-3">
                    <label>Nama User</label>
                    <select hidden name="user" class="form-select">
                        <option selected disabled>--- Pilih User ---</option>
                        @foreach($getuserpemilik as $key)
                        <option value="{{$key->id_user}}">{{$key->nama_user}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="mb-3">
                    <label>Nama Bibit</label>
                    <input class="form-control" type="text" name="nama" placeholder="Isikan Nama Bibit" value="{{$get_produk->nama_bibit}}" required />
                </div>
                <div class="mb-3">
                    <label>Detail</label>
                    <textarea class="form-control" type="text" name="detail" placeholder="Isikan Detail Bibit" required>{{$get_produk->detail_bibit}}</textarea>
                </div>
                <div class="mb-3">
                    <label>Harga</label>
                    <input class="form-control" type="number" name="harga" placeholder="Isikan Harga Bibit" value="{{$get_produk->harga_bibit}}" required />
                </div>
                <div class="mb-3">
                    <label>Harga Borongan</label>
                    <input class="form-control" type="text" name="harga_borongan" placeholder="Isikan Harga Bibit borongan" value="{{$get_produk->harga_borong}}" required />
                </div>
                <div class="mb-3">
                    <label>Kategori</label>
                    <input class="form-control" type="text" name="kategori" placeholder="Isikan Kategori Bibit" value="{{$get_produk->kategori}}" required />
                </div>
                <div class="mb-3">
                    <label>Status</label>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" name="status" {{ $get_produk->status_bibit == 1 ? 'checked' : '' }}>
                        <label class="form-check-label">Aktif</label>
                    </div>
                </div>

                <div class="mb-3">
                    <label>Gambar</label> <br>
                    <img src="<?= url('/') ?>/images/{{$get_produk->gambar_bibit}}" width="30%" alt="">
                    <input class="form-control" name="image1" type="file" id="formFile">
                </div>
                <div class="form-floating mb-3">
                    <button class="btn btn-primary" type="submit"><i class="fa-solid fa-plus"></i> Ubah Data</button>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection

@section('js')

@endSection
