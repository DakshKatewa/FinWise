import 'package:finwise_application/core/constants/app_constants.dart';
import 'package:finwise_application/core/constants/asset_constants.dart';
import 'package:finwise_application/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class PreLoginPage extends StatelessWidget {
  const PreLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: AppConstants.screenHeight,
        width: AppConstants.screenWidth,
        decoration: const BoxDecoration(
          color: Color(0xFFF1FFF3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetConstants.lightlogoPath,
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 24),
            const Text(
              'FinWise',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: AppColors.mainGreen,
              ),
            ),
            const SizedBox(height: 26),
            ElevatedButton(
              onPressed: () {
                // Your onPressed function here
                Navigator.pushNamed(context, '/loginPage');
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(0), // Set to 0 for sharp corners
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 12), // Adjust padding as needed
              ),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
