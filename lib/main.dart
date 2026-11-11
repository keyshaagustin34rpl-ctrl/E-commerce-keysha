import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini E-Commerce',
      home: const ECommercePage(),
    );
  }
}

class ECommercePage extends StatefulWidget {
  const ECommercePage({super.key});

  @override
  State<ECommercePage> createState() => _ECommercePageState();
}

class _ECommercePageState extends State<ECommercePage> {
  int jumlahKeranjang = 3;

  void tambahKeranjang() {
    setState(() {
      jumlahKeranjang++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini E-Commerce'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text(
                '🛒 ($jumlahKeranjang)',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner Flash Sale
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '⚡ FLASH SALE 9.9',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Berakhir dalam 02:15:40',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Daftar Produk',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // Dua kartu produk berdampingan
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ProductCard(
                      diskon: '50% OFF',
                      nama: 'Sepatu Olahraga',
                      hargaLama: 'Rp 550.000',
                      harga: 'Rp 300.000',
                      imageUrl:
                          'https://cdn.fynd.com/v2/falling-surf-7c8bb8/fyprod/wrkr/products/pictures/item/free/original/000000451020389001/1L2cOCnAtoO-STP21PI-PINK-1-%281%29.jpg',
                      warna: Colors.deepPurple,
                      onPressed: tambahKeranjang,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: ProductCard(
                      diskon: '30% OFF',
                      nama: 'Baju Olahraga',
                      hargaLama: 'Rp 300.000',
                      harga: 'Rp 210.000',
                      imageUrl:
                          'https://storegreen.pk/cdn/shop/files/PERFORMANCEDRIFITTEE-WHITE-02.webp?v=1705343191&width=2000',
                      warna: Colors.orange,
                      onPressed: tambahKeranjang,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String diskon;
  final String nama;
  final String hargaLama;
  final String harga;
  final String imageUrl;
  final Color warna;
  final VoidCallback onPressed;

  const ProductCard({
    super.key,
    required this.diskon,
    required this.nama,
    required this.hargaLama,
    required this.harga,
    required this.imageUrl,
    required this.warna,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            diskon,
            style: TextStyle(
              color: warna,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // Gambar produk
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 150,
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 50,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          Text(
            nama,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            hargaLama,
            style: const TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
            ),
          ),

          Text(
            harga,
            style: TextStyle(
              color: warna,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
              child: const Text('+ Keranjang'),
            ),
          ),
        ],
      ),
    );
  }
}