<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Redis;

class Pegawai extends Controller
{
    //
    public function redirectdashboard()
    {
        return redirect()->to('/pegawai/produkbibit');
    }

 

    public function editProdukbibitStock($id, Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $session_role = $request->session()->get('role');
        if ($session_role == 1) {
            return redirect()->to('/admin');
        } elseif ($session_role == 3) {
            return redirect()->to('/pemilik');
        } elseif ($session_role == 4) {
            return redirect()->to('/');
        } elseif ($session_role == '') {
            return redirect()->to('/');
        }

        $tblProduk = DB::table('tb_produk')->where('id_produk', $id)->first();
        $getuserpemilik = DB::table('tb_user')->where('role_user', '3')->get();

        if (!$tblProduk) {
            return redirect()->to('/pegawai/produkbibit')->with('error', 'Produk bibit tidak ditemukan.');
        }

        $data = [
            'menu'              =>  'produkbibit',
            'submenu'           =>  'pegawai',
            'get_produk'        =>  $tblProduk,
            'getuserpemilik'    =>  $getuserpemilik,
        ];
        return view('pegawai/ubah_produkbibitstock', $data);
    }

    public function updateProdukbibitStock($id, Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $session_role = $request->session()->get('role');
        if ($session_role == 1) {
            return redirect()->to('/admin');
        } elseif ($session_role == 3) {
            return redirect()->to('/pemilik');
        } elseif ($session_role == 4) {
            return redirect()->to('/');
        } elseif ($session_role == '') {
            return redirect()->to('/');
        }

        $tblProduk = DB::table('tb_produk')->where('id_produk', $id)->first();

        if ($request->image1) {
            $imageName = rand(1000, 9999) . time() . '.' . $request->image1->extension();
            $request->image1->move(public_path('images'), $imageName);

            if ($tblProduk && $tblProduk->gambar_bibit) {
                unlink(public_path('images/') . $tblProduk->gambar_bibit);
            }



            DB::table('tb_produk')->where('id_produk', $id)->update([
                'nama_bibit'        =>  $tblProduk->nama_bibit,
                'detail_bibit'      =>  $tblProduk->detail_bibit,
                'harga_bibit'       =>  $tblProduk->harga_bibit,
                'harga_borong'      =>  $tblProduk->harga_borong,
                'gambar_bibit'      => $imageName,
                'stok_bibit'        => $request->stok,
                'status_bibit'      => '1',
                'updated_produk'    => now(),
            ]);
        } else {
            DB::table('tb_produk')->where('id_produk', $id)->update([
                'nama_bibit'        =>  $tblProduk->nama_bibit,
                'detail_bibit'      =>  $tblProduk->detail_bibit,
                'harga_bibit'       =>  $tblProduk->harga_bibit,
                'harga_borong'      =>  $tblProduk->harga_borong,
                'stok_bibit'        => $request->stok,
                'status_bibit'      => '1',
                'updated_produk'    => now(),
            ]);
        }
        return redirect()->to('/pegawai/produkbibit');
    }


    public function stokbibit(Request $request)
    {

        $tblProduk = DB::table('tb_produk')
            // ->rightJoin('tb_produk', 'tb_stok.stok_kode_barang', '=', 'tb_produk.kode_bibit')
            ->get();
        $data = [
            'menu'          =>  'stokbibit',
            'submenu'       =>  'pegawai',
            'dataproduk'    =>  $tblProduk,
        ];
        return view('pegawai/stokbibit', $data);
    }

    public function pesanan(Request $request)
{
    $session_role = $request->session()->get('role');
    if ($session_role == 1) {
        return redirect()->to('/admin');
    } elseif ($session_role == 3) {
        return redirect()->to('/pemilik');
    } elseif ($session_role == 4 || $session_role == '') {
        return redirect()->to('/');
    }

    $pesen = DB::table('tb_transaksi')
        ->join('tb_user', 'tb_transaksi.id_user_transaksi', '=', 'tb_user.id_user')
        ->leftJoin('tb_kecamatan', 'tb_transaksi.pengiriman', '=', 'tb_kecamatan.kecamatan_id')
        ->join('tb_produk', 'tb_transaksi.id_produk', '=', 'tb_produk.id_produk')
        ->select(
            'tb_transaksi.*',
            'tb_user.nama_user',
            'tb_kecamatan.kecamatan_name',
            'tb_produk.nama_bibit'
        )
        ->orderBy('created_transaksi', 'desc')
        ->get();

    // Fetch city and province names from Raja Ongkir
    foreach ($pesen as $key) {
        $key->city_name = $this->getCityName($key->pengiriman); // Assume pengiriman contains the city ID
        $key->province_name = $this->getProvinceName($key->provinsi); // Assume provinsi contains the province ID
    }

    $data = [
        'menu' => 'pesanan',
        'submenu' => 'pegawai',
        'pesen' => $pesen,
    ];

    return view('pegawai.pesanan', $data);
}

private function getCityName($cityId)
{
    if ($cityId == 0) {
        return "Ambil di Toko";
    }

    $response = Http::withHeaders([
        'key' => '1365b0cb5a5a58e86a22df82f8084a94'
    ])->get('https://api.rajaongkir.com/starter/city', [
        'id' => $cityId
    ]);

    $city = $response->json();
    return $city['rajaongkir']['results']['city_name'];
}

private function getProvinceName($provinceId)
{
    $response = Http::withHeaders([
        'key' => '1365b0cb5a5a58e86a22df82f8084a94'
    ])->get('https://api.rajaongkir.com/starter/province', [
        'id' => $provinceId
    ]);

    $province = $response->json();
    return $province['rajaongkir']['results']['province'];
}



    public function pesanan_sudahbayar(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $uri_one = request()->segment(4);
        $tblTransaksi = DB::table('tb_transaksi')->where('id_transaksi', $uri_one)->first();
        DB::table('tb_transaksi')->where('id_transaksi', $uri_one)->update([
            'status_transaksi'          => '2',
            'created_transaksi'         => date('Y-m-d H:i:s'),
        ]);
        DB::table('tb_statuspengiriman')->insert([
            'statuspengiriman_id_status'        => '2',
            'statuspengiriman_kodetransaksi'    => $tblTransaksi->kode_transaksi,
            'statuspengiriman_created'          => date('Y-m-d H:i:s'),
        ]);
        return redirect()->to('/pegawai/pesanan');
    }



    public function pesanan_sudahdikirim(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $uri_one = request()->segment(4);
        $tblTransaksi = DB::table('tb_transaksi')->where('id_transaksi', $uri_one)->first();
        DB::table('tb_transaksi')->where('id_transaksi', $uri_one)->update([
            'status_transaksi'          => '3',
            'created_transaksi'         => date('Y-m-d H:i:s'),
        ]);
        DB::table('tb_statuspengiriman')->insert([
            'statuspengiriman_id_status'        => '3',
            'statuspengiriman_kodetransaksi'    => $tblTransaksi->kode_transaksi,
            'statuspengiriman_created'          => date('Y-m-d H:i:s'),
        ]);
        return redirect()->to('/pegawai/pesanan');
    }

    public function pesanan_sudahditerima(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $uri_one = request()->segment(4);
        $tblTransaksi = DB::table('tb_transaksi')->where('id_transaksi', $uri_one)->first();
        DB::table('tb_transaksi')->where('id_transaksi', $uri_one)->update([
            'status_transaksi'          => '4',
            'created_transaksi'         => date('Y-m-d H:i:s'),
        ]);
        DB::table('tb_statuspengiriman')->insert([
            'statuspengiriman_id_status'        => '4',
            'statuspengiriman_kodetransaksi'    => $tblTransaksi->kode_transaksi,
            'statuspengiriman_created'          => date('Y-m-d H:i:s'),
        ]);
        return redirect()->to('/pegawai/pesanan');
    }
    public function pesanan_sudahdiproses(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $uri_one = request()->segment(4);
        $tblTransaksi = DB::table('tb_transaksi')->where('id_transaksi', $uri_one)->first();
        DB::table('tb_transaksi')->where('id_transaksi', $uri_one)->update([
            'status_transaksi'          => '2',
            'created_transaksi'         => date('Y-m-d H:i:s'),
        ]);
        DB::table('tb_statuspengiriman')->insert([
            'statuspengiriman_id_status'        => '2',
            'statuspengiriman_kodetransaksi'    => $tblTransaksi->kode_transaksi,
            'statuspengiriman_created'          => date('Y-m-d H:i:s'),
        ]);
        return redirect()->to('/pegawai/pesanan');
    }

    public function monitoringbibit(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $uri_one = request()->segment(4);

        $session_role = $request->session()->get('role');
        if ($session_role == 1) {
            return redirect()->to('/admin');
        } elseif ($session_role == 3) {
            return redirect()->to('/pemilik');
        } elseif ($session_role == 4) {
            return redirect()->to('/');
        } elseif ($session_role == '') {
            return redirect()->to('/');
        }

        $tblTransaksi = DB::table('tb_transaksi_borong')
            ->orderBy('id','desc')
            ->join('tb_user', 'tb_transaksi_borong.id_user_transaksi', '=', 'tb_user.id_user')
            ->join('tb_produk', 'tb_transaksi_borong.nama_bibit', '=', 'tb_produk.id_produk')
            ->join('tb_status','tb_transaksi_borong.status_transaksi','=','tb_status.status_id')
            ->leftJoin('tb_kecamatan','tb_transaksi_borong.pengiriman','=','tb_kecamatan.kecamatan_id')
            ->select(
                'tb_transaksi_borong.*',
                'tb_user.nama_user',
                'tb_kecamatan.kecamatan_name',
                'tb_produk.nama_bibit',
                'tb_status.status_name',
                DB::raw('IF(tb_transaksi_borong.pengiriman = 0, "Ambil di Toko", tb_transaksi_borong.detail_rumah) as detail_rumah')
            )
            ->get();

        $data = [
            'menu' => 'monitoringbibit',
            'submenu' => 'pegawai',
            'tblTransaksi' => $tblTransaksi,
        ];

           // Fetch city and province names from Raja Ongkir
    foreach ( $tblTransaksi as $key) {
        $key->city_name = $this->getCityName($key->pengiriman); // Assume pengiriman contains the city ID
        $key->province_name = $this->getProvinceName($key->provinsi); // Assume provinsi contains the province ID
    }

        return view('pegawai.monitoringbibit', $data);
    }



    public function monitoringbibit_detail(Request $request, $id)
    {
        date_default_timezone_set('Asia/Jakarta');

        $session_role = $request->session()->get('role');
        if ($session_role == 1) {
            return redirect()->to('/admin');
        } elseif ($session_role == 3) {
            return redirect()->to('/pemilik');
        } elseif ($session_role == 4 || $session_role == '') {
            return redirect()->to('/');
        }

        if ($request->isMethod('post')) {
            DB::table('tb_perkembangan')->insert([
                'perkembangan_kode_transaksi' => $id,
                'perkembangan_link' => $request->input('perkembangan_link'),
                'perkembangan_tanggal' => $request->input('perkembangan_tanggal'),
                'perkembangan_umur' => $request->input('perkembangan_umur'),
                'perkembangan_tinggi' => $request->input('perkembangan_tinggi'),
                'perkembangan_deskripsi' => $request->input('perkembangan_deskripsi'),
                'perkembangan_created' => now(),
                'perkembangan_updated' => now(),
            ]);
        }

        $tblTransaksi = DB::table('tb_perkembangan')
            ->where('perkembangan_kode_transaksi', $id)
            ->get();

            $hariini = now()->format('Y-m-d');
        $data = [
            'menu' => 'monitoringbibit',
            'submenu' => 'pegawai',
            'id' => $id,
            'hariini' => $hariini,
            'tblTransaksi' => $tblTransaksi,
        ];

        return view('pegawai/monitoringbibit_detail', $data);
    }




    // public function monitoringbibit_tambah(Request $request)
    // {
    //     date_default_timezone_set('Asia/Jakarta');

    //     $session_role = $request->session()->get('role');
    //     if ($session_role == 1) {
    //         return redirect()->to('/admin');
    //     } elseif ($session_role == 3) {
    //         return redirect()->to('/pemilik');
    //     } elseif ($session_role == 4) {
    //         return redirect()->to('/');
    //     } elseif ($session_role == '') {
    //         return redirect()->to('/');
    //     }
    //     $uri_one = request()->segment(4);

    //     $tblTransaksi = DB::table('tb_transaksi_borong')
    //         ->join('tb_user', 'tb_transaksi_borong.id_user_transaksi', '=', 'tb_user.id_user')
    //         ->join('tb_status', 'tb_transaksi_borong.status_transaksi', '=', 'tb_status.status_id')
    //         ->where('id_transaksi', $uri_one)
    //         ->first();

    //     $data = [
    //         'menu'          =>  'monitoringbibit',
    //         'submenu'       =>  'pegawai',
    //         'tblTransaksi'  =>  $tblTransaksi,
    //     ];

    //     return view('pegawai/monitoringbibit_tambah', $data);
    // }

    // public function monitoringbibit_create(Request $request)
    // {
    //     date_default_timezone_set('Asia/Jakarta');
    //     $uri_one = request()->segment(4);

    //     $imageName = rand(1000, 9999) . time() . '.' . $request->image1->extension();
    //     $request->image1->move(public_path('images'), $imageName);
    //     $getTblTransaksi = DB::table('tb_transaksi')->where('id_transaksi', $uri_one)->first();
    //     if ($request->image1) {
    //         DB::table('tb_perkembangan')->insert([
    //             'perkembangan_kode_transaksi'    => $getTblTransaksi->kode_transaksi,
    //             'perkembangan_gambar'        => $imageName,
    //             'perkembangan_umur'        => $request->umur,
    //             'perkembangan_tinggi'      => $request->tinggi,
    //             'perkembangan_deskripsi'       => $request->keterangan,
    //             'perkembangan_created'    => date('Y-m-d H:i:s'),
    //             'perkembangan_updated'    => date('Y-m-d H:i:s'),
    //         ]);
    //         return redirect()->to('/pegawai/monitoringbibit/detail/');
    //     }
    // }

    public function monitoringbibit_delete(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $uri_one = request()->segment(4);
        DB::table('tb_perkembangan')->where('id_pbk', $uri_one)->delete();

    }



    public function pesanan_sudahbayarborong(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $uri_one = request()->segment(4);
        $tblTransaksi = DB::table('tb_transaksi_borong')->where('id', $uri_one)->first();

        if ($tblTransaksi) {
            DB::table('tb_transaksi_borong')->where('id', $uri_one)->update([
                'status_transaksi' => '2',
                'updated_at' => date('Y-m-d H:i:s'),
            ]);
            return redirect()->to('/pegawai/monitoringbibit');
        } else {
            // Handle the case when no record is found
            return redirect()->to('/pegawai/monitoringbibit')->with('error', 'Transaction not found.');
        }
    }



    public function pesanan_sudahdikirimborong(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $uri_one = request()->segment(4);
        $tblTransaksi = DB::table('tb_transaksi_borong')->where('id', $uri_one)->first();

        if ($tblTransaksi) {
            DB::table('tb_transaksi_borong')->where('id', $uri_one)->update([
                'status_transaksi' => '3',
                'updated_at' => date('Y-m-d H:i:s'),
            ]);
            return redirect()->to('/pegawai/monitoringbibit');
        } else {
            // Handle the case when no record is found
            return redirect()->to('/pegawai/monitoringbibit')->with('error', 'Transaction not found.');
        }
    }
    public function pesanan_sudahdiprosesborong(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $uri_one = request()->segment(4);
        $tblTransaksi = DB::table('tb_transaksi_borong')->where('id', $uri_one)->first();

        if ($tblTransaksi) {
            DB::table('tb_transaksi_borong')->where('id', $uri_one)->update([
                'status_transaksi' => '2',
                'updated_at' => date('Y-m-d H:i:s'),
            ]);
            return redirect()->to('/pegawai/monitoringbibit');
        } else {
            // Handle the case when no record is found
            return redirect()->to('/pegawai/monitoringbibit')->with('error', 'Transaction not found.');
        }
    }


    public function pesanan_sudahditerimaborong(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $uri_one = request()->segment(4);
        $tblTransaksi = DB::table('tb_transaksi_borong')->where('id', $uri_one)->first();

        if ($tblTransaksi) {
            DB::table('tb_transaksi_borong')->where('id', $uri_one)->update([
                'status_transaksi' => '4',
                'updated_at' => date('Y-m-d H:i:s'),
            ]);
            return redirect()->to('/pegawai/monitoringbibit');
        } else {
            // Handle the case when no record is found
            return redirect()->to('/pegawai/monitoringbibit')->with('error', 'Transaction not found.');
        }
    }

}
