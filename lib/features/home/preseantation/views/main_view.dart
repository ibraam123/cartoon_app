import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/widgets/custom_bottom_navbar.dart';
import '../../../dashboard/presentation/views/dashboard_parent_view.dart';
import '../../../eduline/domain/entities/learning_item.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../../../rewards/presentation/views/rewards_view.dart';
import 'home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    RewardsView(),
    EdulineScreen(),
    DashboardParentView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class EdulineScreen extends StatefulWidget {
  const EdulineScreen({super.key});

  @override
  State<EdulineScreen>  createState() => _EdulineScreenState();
}

class _EdulineScreenState extends State<EdulineScreen> {
  final PageController _pageController = PageController();
  final List<LearningItem> items = [
    LearningItem(
      title: "Math – Fractions",
      description: "Short explainer lesson for primary students.",
      mediaUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4' ,
    ),
    LearningItem(
      title: "Science – The Solar System",
      description: "Quick learning card with visuals.",
      mediaUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    ),
    LearningItem(
      title: "Arabic Grammar",
      description: "Understanding الجملة الاسمية.",
      mediaUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    ),
  ];



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildPage(items[index]);
        },
      ),
    );
  }

  Widget _buildPage(LearningItem item) {
    return Stack(
      children: [
        // Main Content
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: VideoApp(videoUrl: item.mediaUrl),
              ),
              Container(
                color: Colors.black.withValues(alpha: 0.5),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      item.description,
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 6),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Floating Buttons (TikTok Style)
        Positioned(
          right: 16.w,
          bottom: 50.h,
          child: Column(
            children: [
              _roundIcon(Icons.favorite_border),
              SizedBox(height: 16),
              _roundIcon(Icons.bookmark_border),
              SizedBox(height: 16),
              _roundIcon(Icons.share_outlined),
            ],
          ),
        ),
      ],
    );
  }

  Widget _roundIcon(IconData icon) {
    return CircleAvatar(
      backgroundColor: Colors.white.withValues(alpha: 0.2),
      radius: 28,
      child: Icon(icon, color: Colors.white, size: 26),
    );
  }

}

class VideoApp extends StatefulWidget {
  final String videoUrl;
  const VideoApp({super.key, required this.videoUrl});

  @override
  State<VideoApp> createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl)
    )
      ..initialize().then((_) {
        setState(() {});
        _controller.play(); // autoplay
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    )
        : const Center(child: CircularProgressIndicator());
  }
}

