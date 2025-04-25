import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      color: isDark ? Colors.grey.shade900 : Colors.blueGrey.shade50, // Background color based on theme
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.blueGrey.shade700, // Button text color based on theme
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'About',
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.blueGrey.shade700,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Projects',
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.blueGrey.shade700,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Contact',
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.blueGrey.shade700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '© Anit Pal $year. All rights reserved.',
            style: TextStyle(
              color: isDark ? Colors.white70 : Colors.black54, // Text color based on theme
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
