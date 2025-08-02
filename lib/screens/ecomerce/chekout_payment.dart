import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/primary_button.dart';

class CheckoutPaymentScreen extends StatefulWidget {
  const CheckoutPaymentScreen({super.key});

  @override
  State<CheckoutPaymentScreen> createState() => _CheckoutPaymentScreenState();
}

class _CheckoutPaymentScreenState extends State<CheckoutPaymentScreen> {
  int selectedPaymentMethod = 0; // 0 = Credit Card, 1 = Apple Pay
  int selectedCardIndex = 0;
  bool useSameAddress = true;

  final List<String> cards = [
    'Mastercard\nxxxx xxxx xxxx 1234',
    'Visa\nxxxx xxxx xxxx 9876',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Center(
            child: Text(
              'Cancel',
              style: TextStyle(
                color: AppColors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w800,
            fontSize: 18,
            fontFamily: 'Inter',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Step-step
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStepCircle('1', isDone: true),
                _buildStepLine(),
                _buildStepCircle('2', isDone: true),
                _buildStepLine(),
                _buildStepCircle('3', isCurrent: true),
                _buildStepLine(),
                _buildStepCircle('4'),
              ],
            ),
            const SizedBox(height: 30),

            // Title
            const Text(
              'Choose a payment method',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "You won't be charged until you review the order on the next page",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black54,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 24),

            // Credit card section
            _buildPaymentOption(
              index: 0,
              title: 'Credit Card',
              child: Column(
                children: [
                  ...cards.asMap().entries.map((entry) {
                    final index = entry.key;
                    final card = entry.value;
                    return GestureDetector(
                      onTap: () => setState(() => selectedCardIndex = index),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: selectedCardIndex == index
                              ? AppColors.lightBlueBg
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: selectedCardIndex == index
                                ? AppColors.lightBlueBg
                                : AppColors.lightGrey,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                card,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  color: selectedCardIndex == index
                                      ? AppColors.black
                                      : Colors.black87,
                                ),
                              ),
                            ),
                            if (selectedCardIndex == index)
                              const Icon(Icons.check, color: AppColors.blue),
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      // nanti
                    },
                    child: const Text(
                      '+  Add new card',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: useSameAddress,
                        onChanged: (val) => setState(() => useSameAddress = val!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // ✅ radius 5
                        ),
                        side: const BorderSide(
                          color: AppColors.lightGrey, // outline warna abu saat kosong
                          width: 1.1,
                        ),
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return AppColors.blue; // biru saat dicentang
                            }
                            return Colors.white; // putih saat kosong
                          },
                        ),
                        checkColor: Colors.white, // warna centang
                      ),

                      const Expanded(
                        child: Text(
                          'My billing address is the same as my shipping address',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Apple Pay Option
            _buildPaymentOption(
              index: 1,
              title: 'Apple Pay',
            ),

            const Spacer(),

            // Continue button
            PrimaryButton(
              text: 'Continue',
              onPressed: () {
                // Navigasi ke Review page
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildStepCircle(String step, {bool isDone = false, bool isCurrent = false}) {
  return Container(
    width: 24,
    height: 24,
    decoration: BoxDecoration(
      color: isDone
          ? AppColors.lightestblue
          : isCurrent
              ? AppColors.blue
              : AppColors.lightBlueBg,
      shape: BoxShape.circle,
    ),
    child: Center(
      child: isDone
          ? const Icon(Icons.check, color: AppColors.blue, size: 16)
          : Text(
              step,
              style: TextStyle(
                color: isCurrent ? Colors.white : AppColors.lightGrey,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
    ),
  );
}

  Widget _buildStepLine() {
    return Container(
      width: 24,
      height: 2,
      color: AppColors.neutralblue,
    );
  }

  Widget _buildPaymentOption({required int index, required String title, Widget? child}) {
    final isSelected = selectedPaymentMethod == index;

    return GestureDetector(
      onTap: () => setState(() => selectedPaymentMethod = index),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.lightGrey: AppColors.neutralblue,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Radio(
                  value: index,
                  groupValue: selectedPaymentMethod,
                  onChanged: (val) => setState(() => selectedPaymentMethod = val!),
                  activeColor: AppColors.blue,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
            if (isSelected && child != null) ...[
              const SizedBox(height: 8),
              child,
            ]
          ],
        ),
      ),
    );
  }
}
