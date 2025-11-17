import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_car_booking/core/theme/app_colors.dart';
import 'package:flutter_car_booking/bloc/locale/locale_bloc.dart';
import 'package:flutter_car_booking/bloc/locale/locale_state.dart';
import 'package:flutter_car_booking/bloc/locale/locale_event.dart';
import './widgets/profile_tile.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Language',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(LucideIcons.chevronLeft, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.backgroundPrimary,
      ),
      backgroundColor: AppColors.backgroundPrimary,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<LocaleBloc, LocaleState>(
          builder: (context, localeState) {
            return ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ProfileTile(
                  text: 'English',
                  onTap: () {
                    context.read<LocaleBloc>().add(
                      ChangeLocale(const Locale('en')),
                    );
                    Navigator.pop(context);
                  },
                ),
                ProfileTile(
                  text: 'ภาษาไทย',
                  onTap: () {
                    context.read<LocaleBloc>().add(
                      ChangeLocale(const Locale('th')),
                    );
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
