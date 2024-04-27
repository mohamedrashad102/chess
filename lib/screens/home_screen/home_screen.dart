import 'package:chess/screens/home_screen/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String id = 'home screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: HomeBody(),
    );
  }
}
