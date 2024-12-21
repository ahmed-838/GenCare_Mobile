import 'package:flutter/material.dart';
import '../blocs/main_blocks/upper_swiper.dart';
import '../blocs/main_blocks/baby_names.dart';
import '../blocs/main_blocks/ai_test.dart';
import '../blocs/main_blocks/diseases_bloc.dart';
import '../blocs/main_blocks/footer.dart';
import '../blocs/main_blocks/navbar.dart';
import '../blocs/main_blocks/pregnancy_weeks_bloc.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Navbar(),
            UpperSwiper(),
            PregnancyWeeksBloc(),
            BabyNames(key: GlobalKey(debugLabel: 'baby-names')),
            AiTest(key: GlobalKey(debugLabel: 'ai-test')),
            DiseasesBlock(key: GlobalKey(debugLabel: 'diseases')),
            Footer(),
          ],
        ),
      ),
    );
  }
}
