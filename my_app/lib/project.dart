import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProject extends StatefulWidget {
  const MyProject({super.key});

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  // ============================================================
  // PROJECT LIST
  // ============================================================

  final List<Map<String, dynamic>> projects = [
    {
      'technology': 'PYTHON',
      'name': 'Placement_Report',
      'description': 'A WebPage',
      'rating': '5',
      'github':
          'https://github.com/Ankoder-tech/Placement_Project',
    },

    {
      'technology': 'FLUTTER',
      'name': 'Portfolio App',
      'description': 'A Flutter Portfolio Application',
      'rating': '5',
      'github':
          'https://github.com/Ankoder-tech/Portfolio-App',
    },

    {
      'technology': 'FLUTTER',
      'name': 'My Second App',
      'description': 'Another Flutter Project',
      'rating': '5',
      'github':
          'https://github.com/yourusername/second-project',
    },

    {
      'technology': 'PYTHON',
      'name': 'Ankit Shukla',
      'description': 'A WebPage',
      'rating': '5',
      'github':
          'https://github.com/Ankoder-tech/Ankit',
    },
  ];

  // ============================================================
  // OPEN GITHUB
  // ============================================================

  Future<void> openGitHub(String githubUrl) async {
    final Uri url = Uri.parse(githubUrl);

    try {
      final bool launched = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        debugPrint('Could not open: $githubUrl');
      }
    } catch (e) {
      debugPrint('Error opening GitHub: $e');
    }
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // ========================================================
      // APP BAR
      // ========================================================

      appBar: AppBar(
        backgroundColor: const Color(0xff252525),

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 28,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          'Projects',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),

      // ========================================================
      // BODY
      // ========================================================

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Create a card for every project
              ...projects.map(
                (project) => projectCard(
                  technology: project['technology'],
                  name: project['name'],
                  description: project['description'],
                  rating: project['rating'],
                  githubUrl: project['github'],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // PROJECT CARD
  // ============================================================

  Widget projectCard({
    required String technology,
    required String name,
    required String description,
    required String rating,
    required String githubUrl,
  }) {
    return Container(
      height: 220,

      width: MediaQuery.of(context).size.width * 0.9,

      margin: const EdgeInsets.only(
        bottom: 15,
      ),

      child: Card(
        color: const Color(0xff262628),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),

        child: Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 30,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ==================================================
              // TECHNOLOGY
              // ==================================================

              Text(
                technology,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              // ==================================================
              // PROJECT NAME
              // ==================================================

              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 3,
              ),

              // ==================================================
              // DESCRIPTION
              // ==================================================

              Text(
                description,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              // ==================================================
              // BOTTOM ROW
              // ==================================================

              Row(
                children: [

                  // STAR ICON
                  const Icon(
                    Icons.star,
                    color: Colors.white70,
                    size: 20,
                  ),

                  const SizedBox(
                    width: 4,
                  ),

                  // RATING
                  Text(
                    rating,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                    ),
                  ),

                  // Push GitHub icon to the right
                  const Spacer(),

                  // ==================================================
                  // GITHUB BUTTON
                  // ==================================================

                  IconButton(
                    tooltip: 'Open GitHub',

                    onPressed: () {
                      openGitHub(githubUrl);
                    },

                    icon: const FaIcon(
                      FontAwesomeIcons.github,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}