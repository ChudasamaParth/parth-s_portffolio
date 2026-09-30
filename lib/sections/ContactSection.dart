import 'package:flutter/material.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(20),
      color: isDark ? Colors.indigo.shade900 : Colors.indigo.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: 'Contact'),
          const SizedBox(height: 20),
          const ContactTile(
            icon: Icons.email,
            title: 'Email',
            subtitle: 'pmchudasama.0210@gmail.com',
          ),
          const ContactTile(
            icon: Icons.phone,
            title: 'Phone',
            subtitle: '+91 9016938751',
          ),
          const ContactTile(
            icon: Icons.language,
            title: 'Portfolio',
            subtitle: 'www.yourportfolio.com',
          ),
          const ContactTile(
            icon: Icons.location_on,
            title: 'Location',
            subtitle: 'Botad , Gujarat',
          ),
        ],
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ContactTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 28, color: isDark ? Colors.white : Colors.indigo),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
