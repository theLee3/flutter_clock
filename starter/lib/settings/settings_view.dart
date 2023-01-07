import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clock/settings/cubit/settings_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) => states.contains(MaterialState.scrolledUnder)
                      ? const Color(0xff303030)
                      : Theme.of(context).scaffoldBackgroundColor,
                ),
                pinned: true,
                expandedHeight: 120,
                centerTitle: false,
                floating: true,
                snap: true,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text('Settings'),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 6000,
                  child: ColoredBox(color: Colors.red),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
