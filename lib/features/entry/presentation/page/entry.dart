import 'package:flutter/material.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entry Page'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu), // Drawer icon
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today), // Calendar icon
            onPressed: () async {
              DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(), // Default date
                firstDate: DateTime(2000), // Earliest date
                lastDate: DateTime(2100), // Latest date
              );

              if (selectedDate != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected Date: $selectedDate')),
                );
              }
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Welcome to the Entry Page!'),
      ),
    );
  }
}
