import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import './core/theme/app_colors.dart';
import './routes/app_router.dart';
import './routes/app_routes.dart';
import './presentation/pages/home/home_page.dart';
import './presentation/pages/trips/trip_page.dart';
import './presentation/pages/messages/message_page.dart';
import './presentation/pages/profile/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRouter.generateRoute,
      home: MainLayout()
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    TripPage(),
    MessagePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: GlobalKey<NavigatorState>(),
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (_) => _pages[_selectedIndex],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.white,
        backgroundColor: AppColors.backgroundPrimary,
        items: const [
          BottomNavigationBarItem(icon: Icon(LucideIcons.house), label: "Home"),
          BottomNavigationBarItem(icon: Icon(LucideIcons.scrollText), label: "Trips"),
          BottomNavigationBarItem(icon: Icon(LucideIcons.messageCircle), label: "Messages"),
          BottomNavigationBarItem(icon: Icon(LucideIcons.user), label: "Profile"),
        ],
      ),
    );
  }
}