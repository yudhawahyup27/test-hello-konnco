<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Republik Bibit</title>

    <link rel="stylesheet" href="<?= url('/') ?>/css/bootstrap.min.css">

    <link href="<?= url('/') ?>/assetss/css/style.css" rel="stylesheet">

    <!-- SPECIFIC CSS -->
    <link href="<?= url('/') ?>/assetss/css/home_1.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="<?= url('/') ?>/assetss/css/custom.css" rel="stylesheet">

    <link href="<?= url('/') ?>/assets/plugins/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="<?= url('/') ?>/admin/assets/fontawesome/css/all.min.css" rel="stylesheet" />

    @yield('css')
</head>

<body>
    @include('pelanggan.components.navbar')
    
    @yield('content')
    
    @include('pelanggan.components.footer')

  
    <!--/footer-->

    <!--bootstrap 5 -->
    <!-- JavaScript and dependencies -->
    <script src="<?= url('/') ?>/js/bootstrap.min.js"></script>

    <!-- COMMON SCRIPTS -->
    <script src="<?= url('/') ?>/assetss/js/common_scripts.min.js"></script>
    <script src="<?= url('/') ?>/assetss/js/main.js"></script>

    <!-- SPECIFIC SCRIPTS -->
    <script src="<?= url('/') ?>/assetss/js/carousel-home.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

    <!-- SPECIFIC SCRIPTS -->
    <script  src="<?= url('/') ?>/assetss/js/carousel_with_thumbs.js"></script>
</body>

</html>
