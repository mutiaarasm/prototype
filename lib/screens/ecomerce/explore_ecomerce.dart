import 'package:flutter/material.dart';
import 'package:prototype/screens/ecomerce/cart.dart';
import 'package:prototype/screens/ecomerce/detail_product.dart';
import 'package:prototype/screens/ecomerce/search_produk.dart';
import 'package:prototype/widgets/bottomNavbarEcomerce.dart';
import '../../constants/app_colors.dart';

class ExploreEcomerce extends StatelessWidget {
  const ExploreEcomerce({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBarEcommerce(currentIndex: 0, onTap: (_) {}),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SearchProductPage()),
                      );
                    },
                    child: const Icon(Icons.search, color: AppColors.black),
                  ),
                  Row(
                    children: [
                      Image.asset('assets/icon/Heart Outlined.png', width: 24, height: 24, color: AppColors.black),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CartScreen()),
                          );
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset('assets/icon/ShoppingBag.png', width: 24, height: 24, color: AppColors.black),
                            Positioned(
                              top: -4,
                              right: -4,
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: const BoxDecoration(
                                  color: AppColors.blue,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Text('9', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // Banner
            Container(
              height: 200,
              color: AppColors.lightBlueBg,
              child: const Center(
                child: Icon(Icons.image, size: 50, color: AppColors.lightestblue),
              ),
            ),
            const SizedBox(height: 16),

            // Product Sections
            const ProductSection(title: 'Perfect for you'),
            const SizedBox(height: 24),
            const ProductSection(title: 'For this summer'),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class ProductSection extends StatelessWidget {
  final String title;
  const ProductSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                const Text('See more', style: TextStyle(color: AppColors.blue, fontWeight: FontWeight.w600, fontSize: 14)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Product list
          SizedBox(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                ProductCard(name: 'Amazing T-shirt', price: '€ 12.00'),
                SizedBox(width: 16),
                ProductCard(name: 'Fabulous Pants', price: '€ 15.00'),
                SizedBox(width: 16),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;

  const ProductCard({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProductPage(name: name, price: price),
          ),
        );
      },
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black12.withOpacity(0.05), blurRadius: 8)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.neutralblue,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: const Center(child: Icon(Icons.image, size: 40, color: AppColors.lightestblue)),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(price, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
