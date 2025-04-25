import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'AI Timetable Generator',
        'description': 'Intelligent timetable creation tool using AI.',
        'icon': FontAwesomeIcons.calendarCheck,
        'color': Colors.teal,
        'link': 'https://github.com/your-profile/ai-timetable',
        'tech': ['Flutter', 'Firebase', 'Python'],
        'type': 'Web App',
      },
      {
        'title': 'Food Delivery App',
        'description': 'Local delivery solution with Flutter & Firebase.',
        'icon': FontAwesomeIcons.utensils,
        'color': Colors.deepOrange,
        'link': 'https://github.com/your-profile/food-delivery',
        'tech': ['Flutter', 'Firebase'],
        'type': 'Mobile App',
      },
      {
        'title': 'Object Detection',
        'description': 'Real-time detection using OpenCV & Python.',
        'icon': FontAwesomeIcons.eye,
        'color': Colors.blueGrey,
        'link': 'https://github.com/your-profile/object-detection',
        'tech': ['Python', 'OpenCV'],
        'type': 'AI',
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.black12
          : const Color(0xFFEFF8FF), // Background color changes based on theme
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Projects',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black, // Text color changes based on theme
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: List.generate(projects.length, (index) {
              final project = projects[index];
              return TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: Duration(milliseconds: 400 + index * 200),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 50 * (1 - value)),
                      child: child,
                    ),
                  );
                },
                child: GestureDetector(
                  onTap: () => _launchURL(project['link'] as String),
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: (project['color'] as Color).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: project['color'] as Color,
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FaIcon(
                              project['icon'] as IconData,
                              color: project['color'] as Color,
                              size: 30,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                              decoration: BoxDecoration(
                                color: project['color'] as Color,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                project['type'] as String,
                                style: const TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          project['title'] as String,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(project['description'] as String),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          children: (project['tech'] as List<String>)
                              .map((tech) => Chip(label: Text(tech)))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
