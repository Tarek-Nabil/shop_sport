import 'package:flutter/material.dart';
import 'package:sport_shop/core/theme/app_color.dart';

class Settingsscreen extends StatefulWidget {
  const Settingsscreen({super.key});

  @override
  State<Settingsscreen> createState() => _SettingsscreenState();
}

class _SettingsscreenState extends State<Settingsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarcolor,
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            sectionTitle("General"),
            SizedBox(height: 10),
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
                  settingTile(
                    icon: Icons.dark_mode_outlined,
                    title: "Dark Mode",
                    trailing: Switch(
                      value: false,
                      onChanged: (_) {},
                      activeColor: Colors.white,
                      activeTrackColor: const Color(0xff2563EB),
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: const Color(0xffE5E7EB),
                      trackOutlineColor: WidgetStatePropertyAll(
                        Colors.transparent,
                      ),
                    ),
                  ),

                  settingTile(
                    icon: Icons.notifications_none,
                    title: "Notifications",
                    trailing: Switch(
                      value: true,
                      onChanged: (_) {},
                      activeColor: Colors.white,
                      activeTrackColor: const Color(0xff2563EB),
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: const Color(0xffE5E7EB),
                      trackOutlineColor: WidgetStatePropertyAll(
                        Colors.transparent,
                      ),
                    ),
                  ),

                  settingTile(
                    icon: Icons.language,
                    title: "Language",
                    trailing: const Text("English"),
                    showDivider: false,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            sectionTitle("Account"),
            SizedBox(height: 10),
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
                  settingTile(
                    icon: Icons.lock_outline,
                    title: "Change Password",
                  ),

                  settingTile(
                    icon: Icons.shield_outlined,
                    title: "Privacy Policy",
                  ),

                  settingTile(
                    icon: Icons.description_outlined,
                    title: "Terms of Service",
                    showDivider: false,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            sectionTitle("ABOUT"),

            const SizedBox(height: 10),

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
              child: settingTile(
                icon: Icons.info_outline,
                title: "Version",
                trailing: const Text("1.0.0"),
                showDivider: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget sectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(left: 8, bottom: 10),
    child: Text(
      title,
      style: const TextStyle(
        color: Color(0xff2563EB),
        fontSize: 13,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    ),
  );
}

Widget settingTile({
  required IconData icon,
  required String title,
  Widget? trailing,
  VoidCallback? onTap,
  bool showDivider = true,
}) {
  return Column(
    children: [
      ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
        leading: Icon(icon, color: const Color(0xff98A2B3), size: 24),
        title: Text(
          title,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        trailing: trailing,
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
