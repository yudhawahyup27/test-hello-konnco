<?php

namespace App\Http\Controllers\Auths;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LoginController extends Controller
{

    public function login(Request $request)
    {
        if (!$request->session()->get('login')) {
            $data =
                [
                    'menu'      => 'login',
                    'submenu'   => 'pelanggan',
                ];
            return view('auth/login', $data);
        } else {
            return redirect()->to('/');
        }
    }

    public function process_login(Request $request)
    {
        $username = $request->input('username');
        $password = $request->input('password');

        // Fetch the user from the database
        $user = DB::table('tb_user')
                    ->where('username_user', $username)
                    ->where('password_user', $password)
                    ->first();

        // Check if the user exists
        if ($user) {
            // User exists, set session variables
            $request->session()->put('id', $user->id_user);
            $request->session()->put('username', $user->username_user);
            $request->session()->put('role', $user->role_user);
            $request->session()->put('login', TRUE);

            // Redirect based on user role
            switch ($user->role_user) {
                case 1:
                    return redirect('/admin/data-pelanggan');
                case 2:
                    return redirect('/pegawai/produkbibit');
                case 3:
                    return redirect('/pemilik/dashboard22');
                case 4:
                    return redirect('/');
                default:
                    return redirect('/');
            }
        } else {
            // User does not exist, redirect back with an error message
            return redirect()->back()->with('error', 'Invalid username or password');
        }
    }
}
