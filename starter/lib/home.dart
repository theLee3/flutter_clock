import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clock/settings/settings_view.dart';

import 'settings/cubit/settings_cubit.dart';

const features = {
  'Alarm': Icons.access_alarm,
  'Clock': Icons.access_time,
  'Timer': Icons.hourglass_bottom,
  'Stopwatch': Icons.timer_outlined,
  'Bedtime': Icons.bedtime_outlined,
};

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Extend NavBar color under system UI
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xff303030),
    ));

    return BlocBuilder<SettingsCubit, SettingsState>(
        buildWhen: (previous, current) =>
            current.pageIndex != previous.pageIndex,
        builder: (context, settings) {
          return Scaffold(
            appBar: AppBar(
              title: Text(features.keys.toList()[settings.pageIndex]),
              actions: [
                PopupMenuButton(
                  icon: const Icon(Icons.more_vert),
                  position: PopupMenuPosition.under,
                  onSelected: (value) {
                    if (value == 'settings') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.read<SettingsCubit>(),
                            child: const SettingsView(),
                          ),
                        ),
                      );
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'settings',
                      child: Text('Settings'),
                    ),
                  ],
                ),
              ],
            ),
            body: IndexedStack(
              index: settings.pageIndex,
              children: [
                for (var label in features.keys) Center(child: Text(label))
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: settings.pageIndex,
              selectedFontSize: 12,
              onTap: (index) => context
                  .read<SettingsCubit>()
                  .update(settings.copyWith(pageIndex: index)),
              items: features.keys
                  .map((label) => BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.only(top: 2.0, bottom: 4.0),
                          child: Icon(features[label]),
                        ),
                        activeIcon: Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 2.0),
                              child: Icon(features[label]),
                            ),
                          ),
                        ),
                        label: label,
                      ))
                  .toList(),
            ),
          );
        });
  }
}
