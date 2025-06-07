import 'package:flutter/material.dart';
// import 'package:finly/providers/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    // final isDarkMode = themeProvider.isDarkMode;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?img=3',
              ), // Dummy avatar image
            ),
            const SizedBox(height: 16),
            Text(
              'Niranjan Dahal',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'niranjan.dahal@example.com',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),

            // Theme toggle
            // ListTile(
            //   leading: const Icon(Icons.brightness_6),
            //   title: const Text('Dark Mode'),
            //   trailing: Switch(
            //     value: isDarkMode,
            //     onChanged: (val) => themeProvider.toggleTheme(val),
            //   ),
            // ),

            // Currency selection (dummy, no effect)
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text('Currency'),
              trailing: DropdownButton<String>(
                value: 'NPR',
                items: const [
                  DropdownMenuItem(value: 'NPR', child: Text('NPR')),
                  // DropdownMenuItem(value: 'USD', child: Text('USD')),
                  // DropdownMenuItem(value: 'EUR', child: Text('EUR')),
                  // DropdownMenuItem(value: 'INR', child: Text('INR')),
                ],
                onChanged: (value) {
                  // Dummy handler
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected currency:  $value')),
                  );
                },
              ),
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('App Version'),
              trailing: Text('1.0.0'),
            ),

            ListTile(
              leading: const Icon(Icons.feedback),
              title: const Text('Send Feedback'),
              onTap: () {
                // Dummy feedback action
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Feedback clicked!')),
                );
              },
            ),

            const Spacer(),

            ElevatedButton.icon(
              onPressed: () {
                // Non-functional logout
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logout clicked!')),
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
