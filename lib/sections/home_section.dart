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
    final url =
        'https://drive.google.com/file/d/1npCTNlj_nwXXZuegf_hVxOwFiu9BjdMs/view?usp=drive_link'; // replace with your actual CV URL
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
        title: const Text('Parth Chudasama'),
        actions: [
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: toggleTheme,
            tooltip: 'Toggle theme',
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 700;
          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isWide ? 28 : 16,
                    vertical: 28,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildHero(context, isWide),
                      const SizedBox(height: 36),
                      Text(
                        'About Me',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'I am a passionate Flutter developer who loves building beautiful, fast, and responsive applications. I enjoy solving problems and continuously learning new technologies. My goal is to create impactful digital experiences.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 12),
                      const SocialMediaSection(),
                      const SizedBox(height: 28),
                      const SkillsSection(),
                      const SizedBox(height: 32),
                      const ProjectsSection(),
                      const EducationSection(),
                      const SizedBox(height: 32),
                      const ContactSection(),
                      const SizedBox(height: 32),
                      const FooterSection(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHero(BuildContext context, bool isWide) {
    final theme = Theme.of(context);
    final roleStyle = theme.textTheme.titleLarge?.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.w600,
    );
    final intro = Column(
      crossAxisAlignment:
          isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          "Hi, I'm Parth Chudasama",
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: isWide ? TextAlign.start : TextAlign.center,
        ),
        const SizedBox(height: 10),
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Flutter Developer',
              textStyle: roleStyle,
              textAlign: isWide ? TextAlign.start : TextAlign.center,
            ),
            TypewriterAnimatedText(
              'Open Source Contributor',
              textStyle: roleStyle,
              textAlign: isWide ? TextAlign.start : TextAlign.center,
            ),
            TypewriterAnimatedText(
              'UI/UX Enthusiast',
              textStyle: roleStyle,
              textAlign: isWide ? TextAlign.start : TextAlign.center,
            ),
            TypewriterAnimatedText(
              'Problem Solver',
              textStyle: roleStyle,
              textAlign: isWide ? TextAlign.start : TextAlign.center,
            ),
          ],
          repeatForever: true,
          pause: const Duration(milliseconds: 1000),
          displayFullTextOnTap: true,
        ),
        const SizedBox(height: 20),
        FilledButton.icon(
          onPressed: _downloadCV,
          icon: const Icon(Icons.download),
          label: const Text('Download CV'),
        ),
      ],
    );

    return Container(
      padding: EdgeInsets.all(isWide ? 36 : 24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child:
          isWide
              ? Row(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                  const SizedBox(width: 32),
                  Expanded(child: intro),
                ],
              )
              : Column(
                children: [
                  const CircleAvatar(
                    radius: 56,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                  const SizedBox(height: 20),
                  intro,
                ],
              ),
    );
  }
}
