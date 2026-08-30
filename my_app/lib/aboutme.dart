import 'package:flutter/material.dart';
import 'aboutme.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          "About Me",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: Column(
                children: [

                  Container(
                    width: 120,
                    height: 120,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      border: Border.all(
                        color: Colors.amber,
                        width: 3,
                      ),

                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/image1.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Ankit Shukla",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "App Developer",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 35),

            sectionTitle(
              Icons.person,
              "Who Am I?",
            ),

            const SizedBox(height: 10),

            const Text(
                  "I am a Computer Science Engineering student at AKGEC."
                  "I am from Prayagraj "
                  "and an aspiring App Developer. I enjoy building "
                  "mobile applications and solving programming "
                  "problems. I am continuously learning new "
                  "technologies and improving my development skills.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 30),


            sectionTitle(
              Icons.school,
              "Education",
            ),

            const SizedBox(height: 15),
            infoCard(
              icon: Icons.school,
              title: "12th - PCM",
              subtitle: "Semstar Global School",
            ),
            const SizedBox(height: 15),

            infoCard(
              icon: Icons.school,
              title: "B.Tech - Computer Science",
              subtitle: "Ajay Kumar Garg Engineering College",
            ),



            const SizedBox(height: 30),


           

            sectionTitle(
              Icons.code,
              "My Skills",
            ),

            const SizedBox(height: 15),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                skillChip("Java"),
                skillChip("Flutter"),
                skillChip("Dart"),
                skillChip("Python"),
                skillChip("DSA"),
                skillChip("Git"),
                skillChip("GitHub"),
              ],
            ),

            const SizedBox(height: 30),


            sectionTitle(
              Icons.rocket_launch,
              "What I Do",
            ),

            const SizedBox(height: 15),

            infoCard(
              icon: Icons.phone_android,
              title: "App Development",
              subtitle:
              "Building modern and user-friendly mobile applications.",
            ),

            const SizedBox(height: 12),

            infoCard(
              icon: Icons.psychology,
              title: "Problem Solving",
              subtitle:
              "Practicing DSA and solving programming problems.",
            ),

            const SizedBox(height: 12),

            infoCard(
              icon: Icons.lightbulb,
              title: "Learning",
              subtitle:
              "Learning new technologies and improving my skills.",
            ),

            const SizedBox(height: 30),

           

            sectionTitle(
              Icons.link,
              "Connect With Me",
            ),

            const SizedBox(height: 15),

            Row(
              children: [

                socialButton(
                  Icons.code,
                ),

                const SizedBox(width: 15),

                socialButton(
                  Icons.business,
                ),

                const SizedBox(width: 15),

                socialButton(
                  Icons.email,
                ),
              ],
            ),

            const SizedBox(height: 40),

        

            const Center(
              child: Text(
                "Keep Learning • Keep Building 🚀",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 15,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  

  Widget sectionTitle(
      IconData icon,
      String title,
      ) {
    return Row(
      children: [

        Icon(
          icon,
          color: Colors.amber,
          size: 25,
        ),

        const SizedBox(width: 10),

        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

 

  Widget infoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: const Color(0xff1c1c1e),

        borderRadius: BorderRadius.circular(15),

        border: Border.all(
          color: Colors.white12,
        ),
      ),

      child: Row(
        children: [

          Icon(
            icon,
            color: Colors.amber,
            size: 30,
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

 

  Widget skillChip(String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),

      decoration: BoxDecoration(
        color: const Color(0xff1c1c1e),

        borderRadius: BorderRadius.circular(20),

        border: Border.all(
          color: Colors.amber,
        ),
      ),

      child: Text(
        skill,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }

  

  Widget socialButton(IconData icon) {
    return Container(
      width: 50,
      height: 50,

      decoration: BoxDecoration(
        color: const Color(0xff1c1c1e),

        shape: BoxShape.circle,

        border: Border.all(
          color: Colors.white12,
        ),
      ),

      child: Icon(
        icon,
        color: Colors.white,
        size: 23,
      ),
    );
  }
}