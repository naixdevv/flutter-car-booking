import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_car_booking/l10n/app_localizations.dart';
import 'package:flutter_car_booking/core/theme/app_colors.dart';
import 'package:flutter_car_booking/bloc/locale/locale_bloc.dart';
import 'package:flutter_car_booking/bloc/locale/locale_state.dart';
import 'package:flutter_car_booking/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:flutter_car_booking/data/datasources/remote/auth_api.dart';
import 'package:flutter_car_booking/routes/app_router.dart';
import 'package:flutter_car_booking/routes/app_routes.dart';
import 'package:flutter_car_booking/presentation/pages/home/home_page.dart';
import 'package:flutter_car_booking/presentation/pages/booking/booking_page.dart';
import 'package:flutter_car_booking/presentation/pages/trips/trip_page.dart';
import 'package:flutter_car_booking/presentation/pages/profile/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocaleBloc>(create: (_) => LocaleBloc()),
        BlocProvider<AuthBloc>(create: (_) => AuthBloc(AuthApi())),
      ],
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, localeState) {
          return MaterialApp(
            locale: localeState.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en'), Locale('th')],
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.login,
            onGenerateRoute: AppRouter.generateRoute,
            home: MainLayout(),
          );
        },
      ),
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
    BookingPage(),
    TripPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final i18n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Navigator(
        key: GlobalKey<NavigatorState>(),
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (_) => _pages[_selectedIndex]);
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.house),
            label: i18n.bottomBar_home,
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.search),
            label: i18n.bottomBar_booking,
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.scrollText),
            label: i18n.bottomBar_trips,
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.user),
            label: i18n.bottomBar_profile,
          ),
        ],
      ),
    );
  }
}
