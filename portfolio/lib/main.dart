import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subin Krishnan | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({Key? key}) : super(key: key);

  @override
  _PortfolioHomePageState createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = Colors.indigo.shade600;
    final accent = Colors.amber.shade600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          'Subin Krishnan',
          style: theme.textTheme.titleLarge!.copyWith(
            color: primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          NavButton(
            label: 'Home',
            onPressed: () => scrollToSection(homeKey),
            color: primary,
          ),
          NavButton(
            label: 'About',
            onPressed: () => scrollToSection(aboutKey),
            color: primary,
          ),
          NavButton(
            label: 'Skills',
            onPressed: () => scrollToSection(skillsKey),
            color: primary,
          ),
          NavButton(
            label: 'Projects',
            onPressed: () => scrollToSection(projectsKey),
            color: primary,
          ),
          NavButton(
            label: 'Contact',
            onPressed: () => scrollToSection(contactKey),
            color: primary,
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              key: homeKey,
              child: HomeSection(accentColor: accent),
            ),
            const SizedBox(height: 48),
            Container(
              key: aboutKey,
              child: AboutSection(primaryColor: primary),
            ),
            const SizedBox(height: 48),
            Container(
              key: skillsKey,
              child: SkillsSection(accentColor: accent),
            ),
            const SizedBox(height: 48),
            Container(
              key: projectsKey,
              child: ProjectsSection(accentColor: accent),
            ),
            const SizedBox(height: 48),
            Container(
              key: contactKey,
              child: ContactSection(primaryColor: primary),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;

  const NavButton({
    required this.label,
    required this.onPressed,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}

class HomeSection extends StatelessWidget {
  final Color accentColor;

  const HomeSection({required this.accentColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 60),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [accentColor.withOpacity(0.8), Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, I’m',
                  style: GoogleFonts.poppins(
                    color: Colors.grey[700],
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Subin Krishnan',
                  style: GoogleFonts.poppins(
                    color: Colors.indigo.shade900,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Passionate Software Developer specializing in Flutter, Dart, and modern mobile app development. Building engaging and efficient apps.',
                  style: GoogleFonts.openSans(
                    fontSize: 18,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo.shade700,
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 26,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // TODO: Add resume download or link here
                  },
                  icon: const Icon(Icons.download),
                  label: const Text('Download Resume'),
                ),
              ],
            ),
          ),
          const SizedBox(width: 40),
          // Your updated image widget as per your request
          Expanded(
            flex: 4,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/subin.jpeg',
                  fit: BoxFit.cover,
                  width: 200, // Circle diameter = 2 x radius
                  height: 200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  final Color primaryColor;

  const AboutSection({required this.primaryColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'About Me',
      titleColor: primaryColor,
      child: Text(
        'I am a passionate and driven software developer with strong academic background and hands-on experience in Flutter mobile development. Skilled in responsive UI, state management (Provider, GetX) and agile workflows.',
        style: GoogleFonts.openSans(fontSize: 16, height: 1.5),
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  final Color accentColor;

  const SkillsSection({required this.accentColor, Key? key}) : super(key: key);

  final List<String> skills = const [
    'Flutter',
    'Dart',
    'Firebase',
    'Java',
    'OOP Concepts',
    'MySQL',
    'Python',
  ];

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Skills',
      titleColor: accentColor,
      child: Wrap(
        spacing: 16,
        runSpacing: 12,
        children: skills
            .map(
              (skill) => Chip(
                label: Text(
                  skill,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.indigo.shade50,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  final Color accentColor;

  const ProjectsSection({required this.accentColor, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Projects',
      titleColor: accentColor,
      child: Column(
        children: const [
          ProjectCard(
            title: 'MEDICARE',
            description:
                'Integrates IoT patient monitoring into hospital management systems for real-time data and improved efficiency.',
          ),
          SizedBox(height: 20),
          ProjectCard(
            title: 'TRASH-2-TREASURE',
            description:
                'Transforms scrap industry by streamlining transactions through a unified digital platform.',
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;

  const ProjectCard({required this.title, required this.description, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.openSans(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  final Color primaryColor;

  const ContactSection({required this.primaryColor, Key? key})
    : super(key: key);

  final String email = 'subinkrishnana005@gmail.com';
  final String github = 'https://github.com/subin1511';
  final String phone = '7034924913';

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Contact',
      titleColor: primaryColor,
      child: Column(
        children: [
          ContactInfo(
            icon: Icons.email,
            label: email,
            onTap: () => _launchUrl('mailto:$email'),
          ),
          ContactInfo(
            icon: Icons.link,
            label: github,
            onTap: () => _launchUrl(github),
          ),
          ContactInfo(icon: Icons.phone, label: phone),
        ],
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const ContactInfo({
    required this.icon,
    required this.label,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    final content = Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 16),
        Text(
          label,
          style: GoogleFonts.openSans(
            fontSize: 16,
            color: onTap != null ? Colors.blue : Colors.black,
            decoration: onTap != null
                ? TextDecoration.underline
                : TextDecoration.none,
          ),
        ),
      ],
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: content,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: content,
      );
    }
  }
}

class SectionWrapper extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Widget child;

  const SectionWrapper({
    required this.title,
    required this.titleColor,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 52),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 24),
          child,
        ],
      ),
    );
  }
}
