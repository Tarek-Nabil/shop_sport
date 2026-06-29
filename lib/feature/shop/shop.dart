import 'package:flutter/material.dart';
import 'package:sport_shop/core/theme/app_assets.dart';
import 'package:sport_shop/core/theme/app_color.dart';

class shopscreen extends StatefulWidget {
  const shopscreen({super.key});

  @override
  State<shopscreen> createState() => _shopscreenState();
}

class _shopscreenState extends State<shopscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.appbarcolor,
        title: Text(
          "All Products",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.filter_alt_outlined,
                  color: Colors.black87,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
     
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 20),
              productListCard(
                image: AppAssets.ball,
                title: "Pro Soccer Ball",
                subtitle: "FIFA approved match ball",
                price: "\$29.99",
                onAdd: () {},
              ),
              SizedBox(height: 20),
              productListCard(
                image: AppAssets.runner,
                title: "Runner X1",
                subtitle: "Lightweight running shoes",
                price: "\$89.99",
                onAdd: () {},
              ),
              SizedBox(height: 20),
              productListCard(
                image: AppAssets.jercy,
                title: "Classic Jersey",
                subtitle: "Breathable fabric",
                price: "\$45.00",
                onAdd: () {},
              ),
              SizedBox(height: 20),
              productListCard(
                image: AppAssets.bag,
                title: "Gym Duffle Bag",
                subtitle: "Water-resistant with shoes",
                price: "\$35.50",
                onAdd: () {},
              ),
              SizedBox(height: 20),
              productListCard(
                image: AppAssets.racket,
                title: "Pro Tennis Racket",
                subtitle: "Carbon fiber frame",
                price: "\$120.00",
                onAdd: () {},
              ),
              SizedBox(height: 20),
              productListCard(
                image: AppAssets.ball,
                title: "Yoga Mat",
                subtitle: "Non-slip eco friendly",
                price: "\$22.00",
                onAdd: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget productListCard({
  required String image,
  required String title,
  required String subtitle,
  required String price,
  VoidCallback? onAdd,
}) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(image, width: 90, height: 90, fit: BoxFit.cover),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                subtitle,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),

              const SizedBox(height: 12),

              Text(
                price,
                style: TextStyle(
                  color: AppColors.appprice,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xff2563EB),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            onPressed: onAdd,
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    ),
  );
}
