import 'package:flutter/material.dart';
import 'package:sport_shop/core/theme/app_assets.dart';
import 'package:sport_shop/core/theme/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> products = [
    Product(image: AppAssets.ball, title: "Pro Soccer Ball", price: "\$29.99"),
    Product(image: AppAssets.runner, title: "Runner X1", price: "\$89.99"),
    Product(image: AppAssets.jercy, title: "Classic Jersey", price: "\$45.00"),
    Product(image: AppAssets.ball, title: "Training Ball", price: "\$39.99"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(20),
        backgroundColor: AppColors.appbarcolor,
        title: Text(
          "Discover",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: searchField(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    categoryItem(
                      title: "Shoes",
                      isSelected: true,
                      onTap: () {},
                    ),
                    const SizedBox(width: 20),
                    categoryItem(
                      title: "Jerseys",
                      isSelected: false,
                      onTap: () {},
                    ),
                    const SizedBox(width: 20),
                    categoryItem(
                      title: "Balls",
                      isSelected: false,
                      onTap: () {},
                    ),
                    const SizedBox(width: 20),
                    categoryItem(
                      title: "accessories",
                      isSelected: false,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Popular item',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.60,
                ),
                itemBuilder: (context, index) {
                  return productCard(
                    image: products[index].image,
                    title: products[index].title,
                    price: products[index].price,
                    onAdd: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

////////////custom widget//////////////////////
//////////////////////////////////////////////

//searchField
Widget searchField() {
  return Padding(
    padding: EdgeInsets.all(20),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Search products...",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
  );
}

//categoryItem

Widget categoryItem({
  required String title,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xff2563EB) : Color(0xffF3F4F6),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isSelected ? Colors.transparent : Color(0xffE5E7EB),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

class Product {
  final String image;
  final String title;
  final String price;

  const Product({
    required this.image,
    required this.title,
    required this.price,
  });
}

Widget productCard({
  required String image,
  required String title,
  required String price,
  VoidCallback? onFavorite,
  VoidCallback? onAdd,
}) {
  return Card(
    elevation: 3,
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
             
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),

              child: Image.asset(
                image,
                height: 170,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              top: 8,
              right: 8,
              child: InkWell(
                onTap: onFavorite,
                child: const CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.favorite_border,
                    size: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                price,
                style: TextStyle(
                  color: AppColors.appprice,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            width: double.infinity,
            height: 38,
            child: ElevatedButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.shopping_cart_outlined, size: 18),
              label: const Text("Add"),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Color(0xffEEF4FF),
                foregroundColor: Color(0xff2563EB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
