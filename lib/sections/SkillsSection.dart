import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      {
        'name': 'Flutter',
        'icon': FontAwesomeIcons.mobileScreenButton,
        'color': Colors.blue,
      },
      {
        'name': 'Dart',
        'icon': FontAwesomeIcons.code,
        'color': Colors.lightBlueAccent,
      },
      {
        'name': 'Firebase',
        'icon': FontAwesomeIcons.fire,
        'color': Colors.orange,
      },
      {
        'name': 'Git',
        'icon': FontAwesomeIcons.gitAlt,
        'color': Colors.deepOrange,
      },
      {
        'name': 'GitHub',
        'icon': FontAwesomeIcons.github,
        'color': const Color.fromARGB(255, 249, 247, 247),
      },
      {'name': 'Figma', 'icon': FontAwesomeIcons.figma, 'color': Colors.purple},
      {
        'name': 'HTML',
        'icon': FontAwesomeIcons.html5,
        'color': Colors.deepOrangeAccent,
      },
      {
        'name': 'CSS',
        'icon': FontAwesomeIcons.css3Alt,
        'color': Colors.blueAccent,
      },
      {
        'name': 'JavaScript',
        'icon': FontAwesomeIcons.js,
        'color': Colors.amber,
      },
      {
        'name': 'Python',
        'icon': FontAwesomeIcons.python,
        'color': Colors.green,
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color:
          Theme.of(context).brightness == Brightness.dark
              ? Colors.black12
              : const Color(
                0xFFF5F5F5,
              ), // Background color changes based on theme
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Skills',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black, // Text color changes based on theme
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children:
                skills.map((skill) {
                  Color skillColor = skill['color'] as Color;
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: skillColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: skillColor, width: 1.5),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FaIcon(
                          skill['icon'] as FaIconData,
                          color: skillColor,
                          size: 30,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          skill['name'] as String,
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors
                                        .black, // Text color changes based on theme
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
