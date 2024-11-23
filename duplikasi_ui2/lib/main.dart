import 'package:flutter/material.dart'; 
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; 

void main () {
  runApp(const MyApp()); // Fungsi utama aplikasi yang menjalankan widget MyApp.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Fungsi build untuk membuat antarmuka aplikasi.
    return MaterialApp( //Digunakan untuk menginisialisasi aplikasi dengan tema dan konfigurasi dasar.
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug di sudut kanan atas.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Menentukan tema warna.
      ),
      home: Scaffold( //Membuat struktur dasar tampilan
        appBar: AppBar( //Digunakan untuk menampilkan header aplikasi dengan judul yang dipusatkan.
          title: const Text('Item Product Coffee'), // Judul yang ditampilkan di AppBar.
          centerTitle: true, // Membuat judul berada di tengah AppBar.
        ),
        body: ListView(
          padding: const EdgeInsets.all(16), // Memberikan padding di sekitar konten.
          children: [
            Center(
              child: Container( //Membungkus konten produk dengan latar belakang dan tata letak tertentu.
                padding: EdgeInsets.only(top: 5), // Memberikan padding di bagian atas kontainer.
                width: 220, // Lebar kontainer.
                decoration: BoxDecoration(
                  color: Colors.brown[50], // Warna latar belakang kontainer.
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ), // Membuat sudut gambar melengkung.
                      child: Image.network('https://images.pexels.com/photos/7362647/pexels-photo-7362647.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        height: 250, // Tinggi gambar.
                        width: 200, // Lebar gambar.
                        fit: BoxFit.cover, // Menyesuaikan gambar agar pas dalam kontainer.
                      ),
                    ),
                    const SizedBox(height: 10), // Memberikan jarak vertikal.
                    Padding(
                      padding: const EdgeInsets.all(16), // Memberikan padding di dalam kolom.
                      child: Column(
                        children: [
                          Text(
                            'Cappucino Coffee', // Nama produk.
                            style: TextStyle(
                              color: Colors.brown[700], // Warna teks.
                              fontSize: 18, // Ukuran teks.
                              fontWeight: FontWeight.bold, // Membuat teks menjadi tebal.
                            ),
                          ),
                          const SizedBox(height: 8), // Jarak antara teks dan elemen berikutnya.
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center, // Mengatur elemen berada di tengah.
                            children: [
                              Text(
                                'Rp. 30.000', // Harga produk sebelum diskon.
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough, // Memberikan efek coret pada teks.
                                  color: Colors.brown, // Warna teks.
                                  fontSize: 12, // Ukuran teks.
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8), // Jarak vertikal.
                          Row (
                            mainAxisAlignment: MainAxisAlignment.center, // Mengatur elemen berada di tengah.
                            children: [
                              RatingBar.builder(
                                initialRating: 3.5, // Nilai awal rating.
                                minRating: 1, // Nilai minimal rating.
                                direction: Axis.horizontal, // Arah rating (horizontal).
                                allowHalfRating: true, // Mengizinkan nilai setengah bintang.
                                itemCount: 5, // Jumlah bintang.
                                itemSize: 18, // Ukuran bintang.
                                itemBuilder: (context, _) => Icon(
                                  Icons.star, // Ikon bintang.
                                  color: Colors.yellow[600], // Warna bintang.
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating); // Menampilkan nilai rating di console.
                                },
                                ignoreGestures: true, // Membuat bintang tidak bisa diklik.
                              ),
                              const SizedBox(width: 8,), // Jarak horizontal.
                              const Text(
                                '3.2k reviews', // Jumlah ulasan produk.
                                style: TextStyle(
                                  color: Colors.brown, // Warna teks.
                                  fontSize: 12, // Ukuran teks.
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25), // Jarak vertikal.
                          TextButton(
                            onPressed: () {
                              print('Shop Now'); // Menampilkan pesan "Shop Now" di console saat tombol ditekan.
                            },
                            style: ButtonStyle(
                              padding: WidgetStateProperty.resolveWith((states) {
                                return const EdgeInsets.symmetric(horizontal: 30, vertical: 15); // Padding tombol.
                              }),
                              backgroundColor: WidgetStateProperty.resolveWith((states) {
                                return Colors.brown[700]; // Warna latar belakang tombol.
                              }),
                              foregroundColor: WidgetStateProperty.resolveWith((states) {
                                return Colors.white; // Warna teks tombol.
                              }),
                              shape: WidgetStateProperty.resolveWith((states) {
                                return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30), // Membuat tombol melengkung.
                                );
                              }),
                            ),
                            child: const Text('Shop Now'), // Teks pada tombol.
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
