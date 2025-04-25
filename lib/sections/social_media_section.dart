import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaSection extends StatelessWidget {
  final double iconSize = 30.0;

  const SocialMediaSection({super.key});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch \$url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.github, color: Colors.black),
          iconSize: iconSize,
          onPressed: () => _launchURL('https://github.com/anit3734'),
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.linkedin,  color: Color(0xFF0A66C2)),
          iconSize: iconSize,
          onPressed: () => _launchURL('https://www.linkedin.com/in/anit-pal'),
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.x, color: Color(0xFF1DA1F2)),
          iconSize: iconSize,
          onPressed: () => _launchURL('https://x.com/AnitPal3734?t=S6oqtuYcAsQKX4a69jqcaw&s=09'),
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.instagram, color: Color(0xFFC13584)),
          iconSize: iconSize,
          onPressed: () => _launchURL('https://www.instagram.com/aniiitt_pal?igsh=OXA5OXZ6M3NodTA0'),
        ),
      ],
    );
  }
}
