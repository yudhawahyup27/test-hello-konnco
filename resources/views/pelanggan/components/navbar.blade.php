<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="<?= url('/') ?>">Tani Kini</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " id="navbarNavAltMarkup">
            <!-- ml-auto still works just fine-->
            <div class="navbar-nav ml-auto">
                <div>
                    @if (request()->is('pelanggan/bibitborongan/checkout'))
                    <a class="btn btn-primary mx-4" href="/">Beli Eceran</a>
                    @elseif (request()->is('pelanggan/tablemonitoring'))
                    <a class="btn btn-primary mx-4" href="/">Beranda</a>
                    @elseif (request()->is('pelanggan/statustransaksi'))
                    <a class="btn btn-primary mx-4" href="/">Beranda</a>
                    @else
                    <a class="btn btn-primary mx-4"  href="/pelanggan/bibitborongan/checkout">Beli Borongan</a>
                @endif
                </div>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle mx-2" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <?= isset($nama) ? $nama : ''; ?>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton1">
                        <?php if(isset($nama)): ?>
                            <li><a class="dropdown-item" href="<?= url('/') ?>/pelanggan/statustransaksi">Status Transaksi</a></li>
                            <li><a class="dropdown-item" href="<?= url('/') ?>/profil">Profil</a></li>
                            <li><a class="dropdown-item" href="<?= url('/') ?>/alamat-pengiriman">Alamat Pengiriman</a></li>
                            <li><a class="dropdown-item" href="<?= url('/') ?>/pelanggan/tablemonitoring">Monitor Bibit</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="<?= url('/') ?>/logout">Logout</a></li>
                        <?php else: ?>
                            <li><a class="dropdown-item" href="<?= url('/') ?>/login">Login</a></li>
                            <li><a class="dropdown-item" href="<?= url('/') ?>/register">Register</a></li>
                        <?php endif; ?>
                    </ul>
                </div>
                <div class="">
                    <a class="btn btn-secondary mr-2" href="<?= url('/') ?>/pelanggan/keranjang/">
                      Keranjang
                    </a>
                </div>

            </div>
        </div>
    </div>
</nav>
