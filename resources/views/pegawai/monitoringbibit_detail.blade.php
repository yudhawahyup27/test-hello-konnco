@extends('pegawai.layout._layout')
@section('content')
<div class="container-fluid px-4">
    <h1 class="mt-4">Monitoring Bibit Transaksi</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="/">Dashboard</a></li>
        <li class="breadcrumb-item active">Monitoring Bibit</li>
    </ol>
    <div class="card mb-4">
        <div class="card-header">
            List Data Monitoring Bibit
        </div>
        <div class="card-body">
            <form action="{{ url('/pegawai/monitoringbibit/detail', ['id' => $id ]) }}" method="post" enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="id" value="{{ $id }}">
                {{-- <div class="mb-3">
                    <label for="formFile" class="form-label">Masukan Gambar Bibit</label>
                    <input class="form-control" type="file" id="formFile" name="perkembangan_gambar" required>
                </div> --}}
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Tanggal</label>
                    <input type="date" class="form-control" id="exampleFormControlInput1" value="{{ $hariini }}" name="perkembangan_tanggal" required>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Umur</label>
                    <input type="number" class="form-control" id="exampleFormControlInput1" name="perkembangan_umur" required>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Tinggi</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1" name="perkembangan_tinggi" required>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Link Video</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1" name="perkembangan_link" required>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">Keterangan</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" name="perkembangan_deskripsi" rows="3" required></textarea>
                </div>

                <button type="submit" class="btn btn-primary w-100">Submit</button>
            </form>
        </div>
    </div>
    <div class="card mb-4">
        <div class="card-header">
            List Data Monitoring Bibit
        </div>
        <div class="card-body">
            <table class="table table-responsive" id="datatablesSimple">
                <thead>
                    <tr>
                        <th>Link Video</th>
                        <th>Tanggal</th>
                        <th>Umur</th>
                        <th>Tinggi</th>
                        <th>Keterangan</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Link Video</th>
                        <th>Tanggal</th>
                        <th>Umur</th>
                        <th>Tinggi</th>
                        <th>Keterangan</th>
                    </tr>
                </tfoot>
                <tbody>
                    @foreach($tblTransaksi as $key)
                        <tr>
                            {{-- <td><img src="{{ asset('image/' . $key->perkembangan_gambar) }}" alt="Gambar Perkembangan" width="100"></td> --}}
                            <td><a href="{{ $key->perkembangan_link }}">Link Video</a></td>
                            <td>{{ $key->perkembangan_tanggal }}</td>
                            <td>{{ $key->perkembangan_umur }} Hari</td>
                            <td>{{ $key->perkembangan_tinggi }} cm</td>
                            <td>{{ $key->perkembangan_deskripsi }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection

@section('js')
<script>
    $(document).ready(function() {
        $('#datatablesSimple').DataTable({
            "order": [
                [2, "desc"]
            ]
        });
    });
</script>
@endsection
