<?php

namespace App\Http\Controllers\Product;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    
    public function produkbibit(Request $request)
    {
        $tblProduk = DB::table('tb_produk')
            ->join('tb_user', 'tb_produk.produk_id_user', '=', 'tb_user.id_user')
            ->get();
        $data = [
            'menu'          =>  'produkbibit',
            'submenu'       =>  'pegawai',
            'dataproduk'    =>  $tblProduk,
        ];

        return view('pegawai.product.produkbibit', $data);
    }

    public function add_produkbibit(Request $request)
    {
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

        $getuserpemilik = DB::table('tb_user')->where('role_user', '3')->get();

        $data = [
            'menu'              =>  'produkbibit',
            'submenu'           =>  'pegawai',
            'getuserpemilik'    =>  $getuserpemilik,
        ];
        return view('pegawai.product.tambah_produkbibit', $data);
    }

    public function create_produkbibit(Request $request)
    {
        // Redirect berdasarkan peran pengguna
        $session_role = $request->session()->get('role');
        if ($session_role == 1) {
            return redirect()->to('/admin');
        } elseif ($session_role == 3) {
            return redirect()->to('/pemilik');
        } elseif ($session_role == 4) {
            return redirect()->to('/');
        } elseif (empty($session_role)) {
            return redirect()->to('/');
        }
    
        // Validasi input
        $request->validate([
            'nama' => 'required|string|max:255',
            'detail' => 'nullable|string',
            'harga' => 'required|numeric|min:0',
            'harga_borongan' => 'required|numeric|min:0',
            'stok' => 'required|integer|min:0',
            'kategori' => 'required|string|max:255',
            'status' => 'nullable|boolean',
            'image1' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);
    
        try {
            // Generate kode bibit
            $getProdukById = DB::table('tb_produk')->orderBy('id_produk', 'DESC')->limit(1)->first();
            if ($getProdukById) {
                $urutan = (int) substr($getProdukById->kode_bibit, 3, 3);
                $urutan++;
                $huruf = "A";
                $kodeBarang = $huruf . sprintf("%03s", $urutan);
            } else {
                $kodeBarang = 'A001';
            }
    
            // Proses upload gambar jika ada
            if ($request->hasFile('image1')) {
                $imageName = time() . '_' . rand(1000, 9999) . '.' . $request->file('image1')->extension();
                $request->file('image1')->move(public_path('images'), $imageName);
            } else {
                $imageName = null;
            }
    
            // Cek apakah nama bibit sudah ada
            $getCount_fromNama = DB::table('tb_produk')->where('nama_bibit', $request->input('nama'))->count();
            if ($getCount_fromNama < 1) {
                // Insert data produk baru
                DB::table('tb_produk')->insert([
                    'kode_bibit' => $kodeBarang,
                    'produk_id_user' => $request->session()->get('id'), // Sesuaikan dengan logic Anda
                    'nama_bibit' => $request->input('nama'),
                    'detail_bibit' => $request->input('detail'),
                    'harga_bibit' => $request->input('harga'),
                    'harga_borong' => $request->input('harga_borongan'),
                    'stok_bibit' => $request->input('stok'),
                    'kategori' => $request->input('kategori'),
                    'gambar_bibit' => $imageName,
                    'status_bibit' => $request->has('status') ? 1 : 0,
                    'created_produk' => now(),
                ]);
    
                // Insert atau update stok
                DB::table('tb_stok')->updateOrInsert(
                    ['stok_kode_barang' => $kodeBarang],
                    [
                        'nama_bibit' => $request->input('nama'),
                        'stok_jumlah' => $request->input('stok'),
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]
                );
            } else {
                // Jika nama bibit sudah ada, update stok
                $getData_fromNama = DB::table('tb_produk')->where('nama_bibit', $request->input('nama'))->first();
                $getDataStok = DB::table('tb_stok')->where('stok_kode_barang', $getData_fromNama->kode_bibit)->first();
                DB::table('tb_produk')->where('nama_bibit', $request->input('nama'))->update([
                    'detail_bibit' => $request->input('detail'),
                    'harga_bibit' => $request->input('harga'),
                    'harga_borong' => $request->input('harga_borongan'),
                    'stok_bibit' => $request->input('stok'),
                    'kategori' => $request->input('kategori'),
                    'gambar_bibit' => $imageName,
                    'status_bibit' => $request->has('status') ? 1 : 0,
                    'created_produk' => now(),
                ]);
                DB::table('tb_stok')->where('stok_kode_barang', $getData_fromNama->kode_bibit)->update([
                    'stok_jumlah' => $getDataStok->stok_jumlah + $request->input('stok'),
                    'nama_bibit' => $getDataStok->nama_bibit . ' ' . $request->input('nama'),
                    'updated_at' => now(),
                ]);
            }
    
            return redirect()->to('/pegawai/produkbibit')->with('success', 'Produk berhasil ditambahkan!');
        } catch (\Exception $e) {
            // Tangkap dan tampilkan error jika terjadi
            return redirect()->back()->withErrors(['error' => 'Gagal menambahkan produk: ' . $e->getMessage()]);
        }
    }
    



    public function delete_produkbibit(Request $request)
    {
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

        $uri_one = request()->segment(4);
        $getProdukById = DB::table('tb_produk')->where('id_produk', $uri_one)->first();

        // Check if data is found
        if ($getProdukById) {
            $getStokByKode = DB::table('tb_stok')->where('stok_kode_barang', $getProdukById->kode_bibit)->first();
            $numProdukInProduk = DB::table('tb_produk')->where('kode_bibit', $getProdukById->kode_bibit)->count();
            $numProdukInStok = DB::table('tb_stok')->where('stok_kode_barang', $getProdukById->kode_bibit)->count();

            DB::table('tb_produk')->where('id_produk', $uri_one)->delete();
            if ($numProdukInProduk == 1) {
                DB::table('tb_stok')->where('stok_kode_barang', $getProdukById->kode_bibit)->delete();
            } else {
                DB::table('tb_stok')->where('stok_kode_barang', $getProdukById->kode_bibit)->update([
                    'stok_jumlah' => (int)$getStokByKode->stok_jumlah - (int)$getProdukById->stok_bibit,
                    'updated_at' => date('Y-m-d H:i:s'),
                    'nama_bibit' => $getProdukById->nama_bibit,
                ]);
            }
        } else {
            // Handle case when data is not found
            // Redirect or show error message
            return redirect()->back()->with('error', 'Data not found.');
        }

        return redirect()->to('/pegawai/produkbibit');
    }


    public function edit_produkbibit(Request $request)
    {
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

        $uri_one = request()->segment(4);
        $tblProduk = DB::table('tb_produk')->where('id_produk', $uri_one)->first();
        $getuserpemilik = DB::table('tb_user')->where('role_user', '3')->get();

        $data = [
            'menu'              =>  'produkbibit',
            'submenu'           =>  'pegawai',
            'get_produk'        =>  $tblProduk,
            'getuserpemilik'    =>  $getuserpemilik,
        ];
        return view('pegawai.product.ubah_produkbibit', $data);
    }
    public function update_produkbibit(Request $request)
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

        $uri_one = request()->segment(4);
        if ($request->image1) {
            $imageName = rand(1000, 9999) . time() . '.' . $request->image1->extension();
            $request->image1->move(public_path('images'), $imageName);

            $tblProduk = DB::table('tb_produk')->where('id_produk', $uri_one)->first();
            unlink(public_path('images/') . $tblProduk->gambar_bibit);
            DB::table('tb_produk')->where('id_produk', $uri_one)->update([
                'nama_bibit'        => $request->nama,
                'detail_bibit'      => $request->detail,
                'harga_bibit'       => $request->harga,
                // 'stok_bibit'        => $tblProduk->stok,
                'harga_borong'        => $request->harga_borongan,
                'gambar_bibit'      => $imageName,
                'kategori' => $request->kategori,
                'status_bibit' => $request->has('status') ? 1 : 0,
                'updated_produk'    => now(),
            ]);
        } else {
            $tblProduk = DB::table('tb_produk')->where('id_produk', $uri_one)->first();
            DB::table('tb_produk')->where('id_produk', $uri_one)->update([
                'nama_bibit'        => $request->nama,
                'detail_bibit'      => $request->detail,
                'harga_bibit'       => $request->harga,
                'harga_borong'        => $request->harga_borongan,
                'stok_bibit'        => $tblProduk->stok_bibit,
                'kategori' => $request->kategori,
                        'status_bibit' => $request->has('status') ? 1 : 0,
                'updated_produk'    =>now(),
            ]);
        }

        return redirect()->to('/pegawai/produkbibit');
    }
}
