import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'social_media_section.dart';
import 'SkillsSection.dart';
import 'ProjectsSection.dart';
import 'EducationSection.dart';
import 'ContactSection.dart';
import 'FooterSection.dart';

class HomeSection extends StatelessWidget {
  final ThemeMode themeMode;
  final VoidCallback toggleTheme;

  const HomeSection({
    super.key,
    required this.themeMode,
    required this.toggleTheme,
  });

  Future<void> _downloadCV() async {
    final url = 'https://drive.google.com/file/d/1H4maBJs19umdNlch9x0tF7I6FMHeOyan/view?usp=drive_link'; // replace with your actual CV URL
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.download_for_offline),
          onPressed: _downloadCV,
          tooltip: 'Download CV',
        ),
        title: const Text("My Portfolio"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color: Colors.white,
            ),
            onPressed: toggleTheme,
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                const SizedBox(height: 20),
                Text(
                  "Hi, I'm Anit Pal",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Flutter Developer'),
                    TypewriterAnimatedText('Open Source Contributor'),
                    TypewriterAnimatedText('UI/UX Enthusiast'),
                    TypewriterAnimatedText('Problem Solver'),
                  ],
                  repeatForever: true,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                ),
                const SizedBox(height: 40),
                Text(
                  'About Me',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'I am a passionate Flutter developer who loves building beautiful, fast, and responsive applications. I enjoy solving problems and continuously learning new technologies. My goal is to create impactful digital experiences.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SocialMediaSection(),
                const SizedBox(height: 30),
                const SkillsSection(),
                const SizedBox(height: 40),
                Divider(color: Colors.grey.withOpacity(0.5), thickness: 1),
                const SizedBox(height: 40),
                const ProjectsSection(),
                const EducationSection(),
                const SizedBox(height: 40),
                const ContactSection(),
                const SizedBox(height: 40),
                const FooterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
