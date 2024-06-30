import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_scaffold.dart';
import '../../activities/pages/activities_page.dart';
import 'settings_page.dart';
import '../bloc/home_bloc.dart';
import '../widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // context.read<MoneyBloc>().add(GetMoneysEvent());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeSettings) return const SettingsPage();

                if (state is HomeActivities) return const ActivitiesPage();

                return const _HomePage();
              },
            ),
            const NavBar(),
          ],
        ),
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        // BlocBuilder<MoneyBloc, MoneyState>(
        //   builder: (context, state) {
        //     if (state is MoneysLoadedState) {
        //       if (state.transports.isEmpty) return const EmptyData();

        //       return Padding(
        //         padding: const EdgeInsets.only(bottom: 75),
        //         child: ListView(
        //           children: [
        //             const SizedBox(height: 18),
        //             const Center(
        //               child: Text(
        //                 'List of your water transports',
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 15,
        //                   fontWeight: FontWeight.w500,
        //                 ),
        //               ),
        //             ),
        //             const FirstCard(),
        //             const SizedBox(height: 10),
        //             ...List.generate(
        //               state.transports.length,
        //               (index) {
        //                 return TransportCard(
        //                   transport: state.transports[index],
        //                   index: index,
        //                 );
        //               },
        //             ),
        //             const SizedBox(height: 106),
        //           ],
        //         ),
        //       );
        //     }

        //     return Container();
        //   },
        // ),
        // const AddNewButton(),
      ],
    );
  }
}
