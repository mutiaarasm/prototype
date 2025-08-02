import 'package:flutter/material.dart';
import 'package:prototype/screens/ecomerce/cart.dart';
import '../../constants/app_colors.dart';
import '../../widgets/primary_button.dart';

class DetailProductPage extends StatefulWidget {
  final String name;
  final String price;

  const DetailProductPage({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  String selectedSize = 'S';
  int selectedColor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Gambar produk
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              color: AppColors.lightBlueBg,
              child: const Center(
                child: Icon(Icons.image, size: 60, color: AppColors.lightestblue),
              ),
            ),

            const SizedBox(height: 8),

            // Dot indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: _buildDot(isActive: index == 0),
                );
              }),
            ),

            const SizedBox(height: 16),

            // Konten scrollable
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView(
                  children: [
                    // Nama,harga
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const Icon(Icons.favorite_border),
                      ],
                    ),

                    const SizedBox(height: 4),

                    Text(
                      widget.price,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter',
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'The perfect T-shirt for when you want to feel comfortable but still stylish. Amazing for all occasions. Made of 100% cotton fabric in four colours. Its modern style gives a lighter look to the outfit. Perfect for the warmest days.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontFamily: 'Inter',
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Size
                    const Text(
                      'Size',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12,
                      children: ['XS', 'S', 'M', 'L', 'XL'].map((size) {
                        final isSelected = selectedSize == size;
                        return ChoiceChip(
                          label: Text(size),
                          selected: isSelected,
                          onSelected: (_) {
                            setState(() => selectedSize = size);
                          },
                          showCheckmark: false,
                          selectedColor: AppColors.blue,
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                          backgroundColor: AppColors.neutralblue,
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 24),

                    // pilih warna
                    const Text(
                      'Color',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 8),
                   Row(
                    children: List.generate(_colors.length, (index) {
                      final color = _colors[index];
                      final isSelected = selectedColor == index;

                      return GestureDetector(
                        onTap: () {
                          setState(() => selectedColor = index);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 16),
                          width: 40,
                          height: 40,
                          child: Stack(
                            clipBehavior:Clip.none,
                            children: [
                              // Lingkaran warna
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                ),
                              ),

                              // Centang biru di atas warna
                              if (isSelected)
                                Positioned(
                                  top: -2,
                                  right: 2,
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    decoration: const BoxDecoration(
                                      color: AppColors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),


                    const SizedBox(height: 32),

                    // button ke keranjang
                    PrimaryButton(
                      text: '+  Add to bag',
                      onPressed: () {
                        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartScreen()),
                        );
                      },
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dot builder
  static Widget _buildDot({bool isActive = false}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 16 : 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF007AFF) : const Color(0xFFE0E0E0),
        shape: BoxShape.circle,
      ),
    );
  }
}

const List<Color> _colors = [
  Colors.black,
  Colors.grey,
  Color(0xFFB0BEC5),
  Color(0xFFECEFF1),
];
