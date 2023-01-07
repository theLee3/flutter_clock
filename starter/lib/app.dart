import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home.dart';
import 'settings/cubit/settings_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Clock',
      theme: ThemeData(
        brightness: Brightness.dark,
        // fontFamily: 'Courier',
        useMaterial3: true,
        backgroundColor: const Color(0xff303030),
        scaffoldBackgroundColor: const Color(0xff212121),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          backgroundColor: Color(0xff303030),
          unselectedItemColor: Colors.white70,
          selectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(color: Colors.blue),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      home: BlocProvider(
        create: (context) => SettingsCubit(),
        child: const HomePage(),
      ),
    );
  }
}
