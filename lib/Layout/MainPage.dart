import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/ChengPage.dart';
import '../cubit/shared_preferance_cubit.dart';
import '../global/dataGlobal.dart';
import 'P01_Login/P01_Login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();

  // void _saveText() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String text = _textController.text;
  //   await prefs.setString('myTextKey', text);
  // }

  // void _loadText() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String savedText = prefs.getString('myTextKey') ?? '';
  //   setState(() {
  //     _textController.text = savedText;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // _loadText();
    context.read<SharedPreferanceCubit>().LoadText();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SharedPreferanceCubit, String>(
      builder: (context, stateData) {
        Widget checkLogin() {
          if (stateData == "SomeThing Wrong") {
            return const LogInpage();
          } else {
            return const MainPage();
          }
        }

        return Scaffold(
          // appBar: AppBar(title: const Text('SharedPreferences Demo'), actions: [
          //   IconButton(
          //       onPressed: () {
          //         context.read<SharedPreferanceCubit>().SaveText_LogOUT();
          //       },
          //       icon: const Icon(Icons.logout))
          // ]),
          body: SafeArea(child: checkLogin()),
        );
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChengePage_Cubit(),
      child: BlocBuilder<ChengePage_Cubit, Widget>(
        builder: (context, page) {
          return page;
        },
      ),
    );
  }
}
