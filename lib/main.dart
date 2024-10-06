import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui';
import 'dart:math';

class Exoplanet {
  final String name;
  final String videoUrl;
  final String description;
  final String imageAsset;
  Exoplanet({
    required this.name,
    required this.videoUrl,
    required this.description,
    required this.imageAsset,
  });
}

final List<Exoplanet> exoplanets = [
  Exoplanet(
    name: "Proxima b",
    videoUrl: "assets/videos/Proxima.jpg",
    description: "•Proxima b is an exoplanet orbiting Proxima Centauri.\n"
        "•Closest Exoplanet: Proxima Centauri b is the closest known exoplanet to Earth, located about 4.2 light-years away.\n"
        "•It orbits within the habitable zone of its star, meaning it could have conditions suitable for liquid water.s\n",
    imageAsset: 'assets/images/Proxima.jpg',
  ),
  Exoplanet(
    name: "Kepler-452b",
    videoUrl: "assets/videos/Kepler452b.gif",
    description: "•Kepler-452b is a super-Earth exoplanet.\n"
        "•Kepler-452b is often referred to as Earth's twin because it is similar in size and is located in the habitable zone of its star\n"
        "•It is located about 1,400 light-years away from Earth in the constellation Cygnu \n"
        "•Orbit: Kepler-452b orbits its star in 385 Earth days \n"
        "•Kepler-452b is about 1.6 times the size of Earth and has a mean radius of 9,556.5 km\n"
        "•Coordinates: RA 19h 44m 1s | Dec +44° 16′ 39″ \n"
        "•Discovered by: Kepler Science team \n",
    imageAsset: 'assets/images/Kepler452b.gif',
  ),
  Exoplanet(
    name: "TRAPPIST-1d",
    videoUrl: "assets/videos/TRAPPIST-1d.png",
    description: "•TRAPPIST-1d is an exoplanet in the TRAPPIST-1 system.\n"
        "•RAPPIST-1d is one of the seven Earth-sized planets in the TRAPPIST-1 system\n"
        "•located about 40 light-years away from Earth in the constellation Aquarius\n",
    imageAsset: 'assets/images/TRAPPIST-1d.png',
  ),
  Exoplanet(
    name: "Gliese 667 Cc",
    videoUrl: "assets/videos/Gliese 667Cc.jpg",
    description: "•Gliese 667 Cc is a super-Earth exoplanet.\n"
        "•larger than Earth but smaller than Neptune, with a mass about 4.5 times that of Earth.\n"
        "•Gliese 667 Cc is located approximately 23.62 light-years away from Earth in the constellation Scorpius,\n",
    imageAsset: 'assets/images/Gliese 667Cc.jpg',
  ),
  Exoplanet(
    name: "Kepler-22b",
    videoUrl: "assets/videos/Kepler22b-.jpg",
    description:
        "•Kepler-22b is an exoplanet discovered by NASA's Kepler mission.\n"
        "•It is about 2.4 times the size of Earth, categorizing it as a super-Earth\n"
        "•Kepler-22b is located approximately 620 light-years away from Earth in the constellation Cygnus\n",
    imageAsset: 'assets/images/Kepler22b-.jpg',
  ),
  Exoplanet(
    name: "HD 40307g",
    videoUrl: "",
    description: "•HD 40307g is located in a multi-planet system.\n"
        "•It is about 2.7 times the size of Earth \n"
        "•This exoplanet orbits within the habitable zone of its host star, HD 40307, which is a K-dwarf star\n"
        "•HD 40307g is located approximately 42 light-years away from Earth in the constellation Pictor\n",
    imageAsset: 'assets/images/HD_40307.jpg',
  ),
];
final List<Map<String, dynamic>> quizQuestions = [
  {
    'question': 'Which exoplanet is closest to Earth?',
    'options': ['Proxima b', 'TRAPPIST-1d', 'Kepler-22b'],
    'answer': 'Proxima b',
  },
  {
    'question': 'What is Kepler-452b often referred to as?',
    'options': ['Super-Earth', 'Gas Giant', 'Ice Planet'],
    'answer': 'Super-Earth',
  },
  {
    'question': 'Which planet is discovered by NASA\'s Kepler mission?',
    'options': ['Proxima b', 'Kepler-22b', 'Gliese 667 Cc'],
    'answer': 'Kepler-22b',
  },
  {
    'question': 'What type of exoplanet is Gliese 667 Cc?',
    'options': ['Super-Earth', 'Rocky Planet', 'Gas Giant'],
    'answer': 'Super-Earth',
  },
];
void main() {
  runApp(const ExoplanetApp());
}

class ExoplanetApp extends StatelessWidget {
  const ExoplanetApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exoplanet Explorer',
      theme: ThemeData.dark(),
      home: const BootupScreen(),
    );
  }
}

class BootupScreen extends StatefulWidget {
  const BootupScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _BootupScreenState createState() => _BootupScreenState();
}

class _BootupScreenState extends State<BootupScreen> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;
  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/images/logo_animation.mp4')
          ..initialize().then((_) {
            setState(() {
              _isVideoInitialized = true;
            });
            _controller.play();
            Future.delayed(const Duration(seconds: 4), () {
              _navigateToGalaxyScreen();
            });
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToGalaxyScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const GalaxyScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isVideoInitialized
            ? SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}

class GalaxyScreen extends StatefulWidget {
  const GalaxyScreen({super.key});

  @override
  _GalaxyScreenState createState() => _GalaxyScreenState();
}

class _GalaxyScreenState extends State<GalaxyScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const GalaxyContent(),
    const QuizPage(),
    const AboutUsPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Y SPACE (beta)'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

class GalaxyContent extends StatelessWidget {
  const GalaxyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/53686360156_a0fd47ef72_o.png',
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Opacity(
                opacity: 0.7,
                child: Container(
                  height: 1000,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                      width: 1.5,
                    ),
                  ),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: exoplanets.length,
                    itemBuilder: (context, index) {
                      final exoplanet = exoplanets[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PlanetDetailsScreen(exoplanet: exoplanet),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(
                                exoplanet.imageAsset,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              exoplanet.name,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, dynamic>> _questions = [];
  final Random random = Random();
  int _currentQuestionIndex = 0;
  int _score = 0;
  @override
  void initState() {
    super.initState();
    _loadRandomQuestions();
  }

  void _loadRandomQuestions() {
    _questions.addAll(List.from(quizQuestions)..shuffle());
    _questions.removeRange(3, _questions.length);
  }

  void _checkAnswer(String selectedAnswer) {
    if (selectedAnswer == _questions[_currentQuestionIndex]['answer']) {
      setState(() {
        _score++;
      });
    }
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _showResultDialog();
    }
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Quiz Completed'),
          content: Text('Your score: $_score/${_questions.length}'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _currentQuestionIndex = 0;
                  _score = 0;
                  _questions.clear();
                  _loadRandomQuestions();
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _questions[_currentQuestionIndex]['question'],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ...(_questions[_currentQuestionIndex]['options'] as List<String>)
              .map((option) {
            return ElevatedButton(
              onPressed: () => _checkAnswer(option),
              child: Text(option),
            );
          }),
        ],
      ),
    );
  }
}

class PlanetDetailsScreen extends StatelessWidget {
  final Exoplanet exoplanet;
  const PlanetDetailsScreen({super.key, required this.exoplanet});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exoplanet.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              exoplanet.imageAsset,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              exoplanet.description,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerScreen({super.key, required this.videoUrl});
  @override
  // ignore: library_private_types_in_public_api
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
        });
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isVideoInitialized
        ? AspectRatio(
            aspectRatio: 16 / 9,
            child: VideoPlayer(_controller),
          )
        : const Center(child: CircularProgressIndicator());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _pages = <Widget>[
    ExoplanetListPage(),
    const DownloadPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exoplanet Explorer'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Download',
          ),
        ],
      ),
    );
  }
}

class ExoplanetListPage extends StatelessWidget {
  final List<String> exoplanets = [
    'Planet 1',
    'Planet 2',
    'Planet 3',
    'Planet 4',
    'Planet 5',
    'Planet 6',
  ];

  ExoplanetListPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: exoplanets.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(exoplanets[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlanetDetailPage(
                  planetName: exoplanets[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class PlanetDetailPage extends StatelessWidget {
  final String planetName;
  const PlanetDetailPage({super.key, required this.planetName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planetName),
      ),
      body: Center(
        child: Text(
          'Details of $planetName',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Download PDFs'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DownloadButton(
                planetName: 'PROXIMA CENTAURI B',
                pdfUrl: 'assets/images/PROXIMA CENTAURI B.pdf'),
            SizedBox(height: 10),
            DownloadButton(
                planetName: 'KEPLER-452b',
                pdfUrl: 'assets/images/KEPLER-452b.pdf'),
            SizedBox(height: 10),
            DownloadButton(
                planetName: 'TRAPPIST-1d',
                pdfUrl: 'assets/images/TRAPPIST-1d.pdf'),
            SizedBox(height: 10),
            DownloadButton(
                planetName: 'Gliese 667Cc',
                pdfUrl: 'assets/images/Gliese 667Cc.pdf'),
            SizedBox(height: 10),
            DownloadButton(
                planetName: 'KEPLER-22b',
                pdfUrl: 'assets/images/KEPLER-22b.pdf'),
            SizedBox(height: 10),
            DownloadButton(
                planetName: 'HD 40307 g.pdf',
                pdfUrl: 'assets/images/HD 40307 g.pdf'),
          ],
        ),
      ),
    );
  }
}

class DownloadButton extends StatelessWidget {
  final String planetName;
  final String pdfUrl;
  const DownloadButton(
      {super.key, required this.planetName, required this.pdfUrl});
  void downloadPdf(BuildContext context, String pdfUrl) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Downloading $planetName PDF...'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => downloadPdf(context, pdfUrl),
      child: Text('Download $planetName PDF'),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'About Us: \n\n\n'
        'Team Name : 8bit\n\n'
        'Team Members : \n'
        'Afeef Anversha\n'
        'Ayman Abbas Mundol\n'
        'Muhammed Ajsal\n'
        'Muhammed Rishad K\n'
        'Syed Afham K\n',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
