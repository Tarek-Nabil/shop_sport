import 'package:flutter/material.dart';
import 'package:sport_shop/core/theme/app_color.dart';

class profilescreen extends StatefulWidget {
  const profilescreen({super.key});

  @override
  State<profilescreen> createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.appbarcolor,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 30),

                        CircleAvatar(
                          radius: 45,
                          backgroundColor: const Color(0xffE8F0FF),
                          child: const Text(
                            "JD",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff2563EB),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          "John Doe",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        const Text(
                          "john.doe@flutter.dev",
                          style: TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 20),

                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(140, 45),
                            side: const BorderSide(color: Color(0xff2563EB)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text("Edit Profile"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: cards.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final card = cards[index];

                        return buildCard(
                          icon: card['icon'],
                          value: card['value'],
                          title: card['title'],
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        profileItem(
                          icon: Icons.inventory_2_outlined,
                          title: "My Orders",
                        ),

                        profileItem(
                          icon: Icons.favorite_border,
                          title: "Favorites",
                        ),

                        profileItem(
                          icon: Icons.credit_card_outlined,
                          title: "Payment Methods",
                        ),

                        profileItem(
                          icon: Icons.help_outline,
                          title: "Help Center",
                          showDivider: false,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),

                    child: profileItem(
                      icon: Icons.logout,
                      title: "Logout",
                      iconColor: Colors.red,
                      textColor: Colors.red,
                      showDivider: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildCard({
  required IconData icon,
  required String value,
  required String title,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    height: 103,
    width: 113,
    decoration: BoxDecoration(
      color: AppColors.continerColor,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(icon), Text(value), Text(title)],
    ),
  );
}

final List<Map<String, dynamic>> cards = [
  {'icon': Icons.inventory, 'value': '12', 'title': 'Orders'},
  {'icon': Icons.favorite, 'value': '5', 'title': 'Wishlist'},
  {'icon': Icons.star_sharp, 'value': '3', 'title': 'Reviews'},
];

Widget profileItem({
  required IconData icon,
  required String title,
  VoidCallback? onTap,
  Color iconColor = const Color(0xff98A2B3),
  Color textColor = const Color(0xff0F172A),
  bool showDivider = true,
}) {
  return Column(
    children: [
      ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
        leading: Icon(icon, color: iconColor, size: 24),
        title: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Color(0xffD1D5DB)),
      ),

      if (showDivider)
        Divider(
          height: 1,
          thickness: 0.3,
          color: Colors.grey.shade200,
          indent: 60,
          endIndent: 20,
        ),
    ],
  );
}
