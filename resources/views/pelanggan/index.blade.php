@extends('pelanggan.layouts._layout')

@section('content')
<main>
    <div class="container">
        {{-- Hero --}}
        <div id="heroCarousel" class="carousel slide mb-3" data-bs-ride="carousel">
            <!-- The slideshow/carousel -->
            <div class="carousel-inner">
                <div class="carousel-item active rounded">
                    <img src="../images/banner-hero1.png" class="d-block w-100" style="height: 40%;">
                </div>
                <div class="carousel-item rounded">
                    <img src="../images/banner-hero2k.png" class="d-block w-100">
                </div>
            </div>
        </div>
        {{-- End Hero --}}

        <div class="container margin_60_35">
            <div class="main_title">
                <h2>Bibit Terlaris</h2>
                <span>Bibit</span>
                <p>Bibit Terlaris dan Kualitas Terbaik</p>
            </div>
            <div class="row row-cols-1 row-cols-lg-3 row-cols-md-2 g-1 g-lg-3 align-items-center justify-content-center mx-auto">
                @forelse($produk as $key)
                    <div class="col my-2">
                        <div class="card" style="width: 18rem;">
                            @php
                                $images = $key->gambar_bibit ? $key->gambar_bibit : 'images/noimage.png';
                            @endphp
                            <img style="height:250px;" class="card-img-top" src="{{ url('/images/'.$images) }}" alt="" data-was-processed="true">

                            <div class="card-body">
                                <h6 title="{{ $key->nama_bibit }}" class="card-title text-truncate">{{ $key->nama_bibit }}</h6>
                                <p class="card-text">Rp. {{ number_format($key->harga_bibit, 2, ',', '.') }}</p>

                                @if(session()->has('login'))
                                    <a href="/pelanggan/detail/{{ $key->id_produk }}" class="btn btn-success w-100">Detail Product</a>
                                @else
                                    <a href="{{ route('login') }}" class="btn btn-success w-100">Login to view details</a>
                                @endif
                            </div>
                        </div>
                    </div>
                @empty
                    <div class="col-12">
                        <p class="text-center">No active products found in this category.</p>
                    </div>
                @endforelse
            </div>

            <h3>Product All</h3>
            <div class="row row-cols-1 my-4 row-cols-lg-3 row-cols-md-2 g-1 g-lg-3 align-items-center justify-content-center mx-auto">
                @forelse($produkall as $key)
                    <div class="col my-2">
                        <div class="card" style="width: 18rem;">
                            @php
                                $images = $key->gambar_bibit ? $key->gambar_bibit : 'images/noimage.png';
                            @endphp
                            <img style="height:250px;" class="card-img-top" src="{{ url('/images/'.$images) }}" alt="" data-was-processed="true">

                            <div class="card-body">
                                <h6 title="{{ $key->nama_bibit }}" class="card-title text-truncate">{{ $key->nama_bibit }}</h6>
                                <p class="card-text">Rp. {{ number_format($key->harga_bibit, 2, ',', '.') }}</p>

                                @if(session()->has('login'))
                                    <a href="/pelanggan/detail/{{ $key->id_produk }}" class="btn btn-success w-100">Detail Product</a>
                                @else
                                    <a href="{{ route('login') }}" class="btn btn-success w-100">Login to view details</a>
                                @endif
                            </div>
                        </div>
                    </div>
                @empty
                    <div class="col-12">
                        <p class="text-center">No active products found in this category.</p>
                    </div>
                @endforelse
            </div>
            <!-- /row -->
        </div>
        <div id="icon_drag_mobile"></div>
    </div>
    <!--/carousel-->
</main>
@endSection
