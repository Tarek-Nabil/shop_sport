import 'package:flutter/material.dart';
import 'package:sport_shop/core/theme/app_color.dart';
import 'package:sport_shop/core/widgets/custom_button.dart';
import 'package:sport_shop/core/widgets/logo.dart';
import 'package:sport_shop/core/widgets/text_field.dart';
import 'package:sport_shop/feature/home/home.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              customLogo(),

              const SizedBox(height: 25),

              const Text(
                "Sport Shop",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text(
                "Get started",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),

              const SizedBox(height: 35),

              CustomTextField(hintText: "Full Name", icon: Icons.person),
              const SizedBox(height: 18),

              CustomTextField(
                hintText: "ُEmail Address",
                icon: Icons.mail_outline,
              ),
              const SizedBox(height: 18),

              const CustomTextField(
                hintText: "Password",
                icon: Icons.lock_outline,
                obscureText: true,
              ),
              const SizedBox(height: 18),

              const CustomTextField(
                hintText: "Confirm Password",
                icon: Icons.security,
                obscureText: true,
              ),

              const SizedBox(height: 30),

              CustomButton(
                text: "sign up",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
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
