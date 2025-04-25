import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Education',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 20),

          _educationCard(
            context: context,
            title: 'B.Tech in Computer Science',
            institution: 'Quantum University',
            location: ' Roorkee, Uttarakhand 247167',
            duration: '2022 – 2026',
            description: 'Learned software development, data structures, and AI.',
            lightColor: Colors.blue.shade50,
            darkColor: Colors.blueGrey.shade800,
          ),

          const SizedBox(height: 20),

          _educationCard(
            context: context,
            title: '12th (Senior Secondary - PCM)',
            institution: 'Rajesh Pilot Inter College',
            location: 'SADHOLI BHOOD SAHARANPUR',
            duration: '2019 – 2021',
            description: 'Studied Physics, Chemistry, Mathematics .',
            lightColor: Colors.green.shade50,
            darkColor: Colors.green.shade800,
          ),

          const SizedBox(height: 40),

          Text(
            'Certificates',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 20),

          _certificateCard(
            context: context,
            title: 'Flutter Development Bootcamp',
            platform: 'Udemy',
            date: 'Jan 2024',
            url: 'https://example.com/flutter-cert',
            lightColor: Colors.purple.shade50,
            darkColor: Colors.purple.shade800,
          ),

          const SizedBox(height: 20),

          _certificateCard(
            context: context,
            title: 'Machine Learning by Stanford',
            platform: 'Coursera',
            date: 'Aug 2023',
            url: 'https://example.com/ml-cert',
            lightColor: Colors.orange.shade50,
            darkColor: Colors.orange.shade800,
          ),
        ],
      ),
    );
  }

  Widget _educationCard({
    required BuildContext context,
    required String title,
    required String institution,
    required String location,
    required String duration,
    required String description,
    required Color lightColor,
    required Color darkColor,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? darkColor : lightColor;
    final textColor = isDark ? Colors.white70 : Colors.black87;
    final subTextColor = isDark ? Colors.white60 : Colors.black54;

    return Card(
      color: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(LucideIcons.graduationCap, color: textColor),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '$institution • $location',
              style: TextStyle(fontSize: 14, color: subTextColor),
            ),
            const SizedBox(height: 4),
            Text(
              duration,
              style: TextStyle(fontSize: 13, color: subTextColor),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: textColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _certificateCard({
    required BuildContext context,
    required String title,
    required String platform,
    required String date,
    required String url,
    required Color lightColor,
    required Color darkColor,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? darkColor : lightColor;
    final textColor = isDark ? Colors.white70 : Colors.black87;

    return Card(
      color: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(LucideIcons.badgeCheck, color: textColor),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '$platform • $date',
              style: TextStyle(fontSize: 14, color: textColor),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => _launchURL(url),
              child: Text(
                'View Certificate',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
