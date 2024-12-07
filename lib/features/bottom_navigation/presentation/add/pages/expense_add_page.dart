import 'package:finwise_application/core/constants/asset_constants.dart';
import 'package:flutter/material.dart';

class ExpenseAddPage extends StatelessWidget {
  ExpenseAddPage({super.key});
  // List of asset paths for icons
  final List<String> iconPaths = [
    AssetConstants.dining,
    AssetConstants.entertainment,
    AssetConstants.gift,
    AssetConstants.groceries,
    AssetConstants.medicine,
    AssetConstants.rent,
    AssetConstants.travel,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid of Buttons'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 4 buttons per row
            crossAxisSpacing: 8.0, // spacing between columns
            mainAxisSpacing: 8.0, // spacing between rows
          ),
          itemCount: iconPaths.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                // Action for button
                print('Button $index pressed');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero, // Remove padding for icon
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Image.asset(
                iconPaths[index],
                fit: BoxFit.contain, // Fit icon within the button
              ),
            );
          },
        ),
      ),
    );
  }
}
